package com.pxx.collegecourseselectionsystem.config;


import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.core.toolkit.ExceptionUtils;
import com.baomidou.mybatisplus.extension.plugins.handler.TenantLineHandler;
import com.baomidou.mybatisplus.extension.plugins.inner.TenantLineInnerInterceptor;
import net.sf.jsqlparser.expression.Expression;
import net.sf.jsqlparser.expression.Parenthesis;
import net.sf.jsqlparser.expression.StringValue;
import net.sf.jsqlparser.expression.operators.conditional.AndExpression;
import net.sf.jsqlparser.expression.operators.conditional.OrExpression;
import net.sf.jsqlparser.expression.operators.relational.*;
import net.sf.jsqlparser.schema.Column;
import net.sf.jsqlparser.schema.Table;
import net.sf.jsqlparser.statement.delete.Delete;
import net.sf.jsqlparser.statement.insert.Insert;
import net.sf.jsqlparser.statement.select.Select;
import net.sf.jsqlparser.statement.select.SelectBody;
import net.sf.jsqlparser.statement.update.Update;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @author Gpxx
 * @Date 2022/2/23 13:24
 */
public class MyTenantLineInnerInterceptor extends TenantLineInnerInterceptor {

    public MyTenantLineInnerInterceptor(TenantLineHandler tenantLineHandler) {
        super(tenantLineHandler);
    }


    /**
     * 重构mybatispuls的多租户改为支持in
     *
     * @param currentExpression
     * @param table
     * @return
     */

    @Override
    protected Expression builderExpression(Expression currentExpression, List<Table> tables) {
        // 没有表需要处理直接返回
        if (CollectionUtils.isEmpty(tables)) {
            return currentExpression;
        }
        // 租户
        Expression tenantId = this.getTenantLineHandler().getTenantId();

        // 构造每张表的条件
        List<InExpression> equalsTos = tables.stream()
                .map(item -> {
                            InExpression inExpression = new InExpression();
                            inExpression.setLeftExpression(getAliasColumn(item));
                            inExpression.setRightExpression(tenantId);
                            return inExpression;
                        }
                )
                .collect(Collectors.toList());
        // 注入的表达式
        Expression injectExpression = equalsTos.get(0);
        // 如果有多表，则用 and 连接
        if (equalsTos.size() > 1) {
            for (int i = 1; i < equalsTos.size(); i++) {
                injectExpression = new AndExpression(injectExpression, equalsTos.get(i));
            }
        }

        if (currentExpression == null) {
            return injectExpression;
        }
        if (currentExpression instanceof OrExpression) {
            return new AndExpression(new Parenthesis(currentExpression), injectExpression);
        }  else {
            return new AndExpression(currentExpression, injectExpression);
        }

    }


    @Override
    protected void processInsert(Insert insert, int index, String sql, Object obj) {
        if (getTenantLineHandler().ignoreTable(insert.getTable().getName())) {
            // 过滤退出执行
            return;
        }
        List<Column> columns = insert.getColumns();
        if (CollectionUtils.isEmpty(columns)) {
            // 针对不给列名的insert 不处理
            return;
        }
        String tenantIdColumn = getTenantLineHandler().getTenantIdColumn();
        if (getTenantLineHandler().ignoreInsert(columns, tenantIdColumn)) {
            // 针对已给出租户列的insert 不处理
            return;
        }
        columns.add(new Column(tenantIdColumn));

        // fixed gitee pulls/141 duplicate update
        List<Expression> duplicateUpdateColumns = insert.getDuplicateUpdateExpressionList();
        if (CollectionUtils.isNotEmpty(duplicateUpdateColumns)) {
            EqualsTo equalsTo = new EqualsTo();
            equalsTo.setLeftExpression(new StringValue(tenantIdColumn));
            equalsTo.setRightExpression(getTenantLineHandler().getTenantId());
            duplicateUpdateColumns.add(equalsTo);
        }

        Select select = insert.getSelect();
        if (select != null) {
            this.processInsertSelect(select.getSelectBody());
        } else if (insert.getItemsList() != null) {
            // fixed github pull/295
            ItemsList itemsList = insert.getItemsList();
            if (itemsList instanceof MultiExpressionList) {
                ((MultiExpressionList) itemsList).getExpressionLists().forEach(el -> el.getExpressions().add(getTenantLineHandler().getTenantId()));
            } else {
                ((ExpressionList) itemsList).getExpressions().add(getTenantLineHandler().getTenantId());
            }
        } else {
            throw ExceptionUtils.mpe("Failed to process multiple-table update, please exclude the tableName or statementId");
        }
    }

    @Override
    protected void processUpdate(Update update, int index, String sql, Object obj) {

    }

    @Override
    protected void processDelete(Delete delete, int index, String sql, Object obj) {

    }

    @Override
    protected void processInsertSelect(SelectBody selectBody) {

    }

}


