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
        //如果等号左右都有租户字段，则跳过
/*        if (currentExpression != null) {
            String sqlStr = currentExpression.toString();
            int eq = sqlStr.indexOf('=');
            TenantLineHandler tenantLineHandler = this.getTenantLineHandler();
            String tenantIdColumn = tenantLineHandler.getTenantIdColumn();
            if (eq == -1 || sqlStr.substring(eq).contains(tenantIdColumn) ||
                    sqlStr.substring(eq + 1, sqlStr.length()).contains(tenantIdColumn)) {
                return currentExpression;
            }
        }*/
        //只需要构造一张表的表达式
        Column aliasColumn = this.getAliasColumn(tables.get(0));
        boolean presenceOfField = true;

        if (presenceOfField) {
            InExpression inExpression = new InExpression();
            inExpression.setLeftExpression(aliasColumn);
            inExpression.setRightExpression(getTenantLineHandler().getTenantId());
            if (currentExpression == null) {
                return inExpression;
            } else {
                return currentExpression instanceof OrExpression ?
                        new AndExpression(new Parenthesis(currentExpression), inExpression)
                        : new AndExpression(currentExpression, inExpression);
            }
        } else {
            return currentExpression;
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


