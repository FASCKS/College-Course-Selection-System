package com.pxx.collegecourseselectionsystem.config;


import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.extension.plugins.handler.TenantLineHandler;
import com.baomidou.mybatisplus.extension.plugins.inner.TenantLineInnerInterceptor;
import net.sf.jsqlparser.expression.Expression;
import net.sf.jsqlparser.expression.Parenthesis;
import net.sf.jsqlparser.expression.operators.conditional.AndExpression;
import net.sf.jsqlparser.expression.operators.conditional.OrExpression;
import net.sf.jsqlparser.expression.operators.relational.InExpression;
import net.sf.jsqlparser.schema.Table;
import net.sf.jsqlparser.statement.delete.Delete;
import net.sf.jsqlparser.statement.insert.Insert;
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


