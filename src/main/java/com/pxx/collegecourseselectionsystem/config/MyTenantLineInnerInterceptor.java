package com.pxx.collegecourseselectionsystem.config;


import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.extension.plugins.handler.TenantLineHandler;
import com.baomidou.mybatisplus.extension.plugins.inner.TenantLineInnerInterceptor;
import net.sf.jsqlparser.expression.Expression;
import net.sf.jsqlparser.expression.Parenthesis;
import net.sf.jsqlparser.expression.operators.conditional.AndExpression;
import net.sf.jsqlparser.expression.operators.conditional.OrExpression;
import net.sf.jsqlparser.expression.operators.relational.InExpression;
import net.sf.jsqlparser.schema.Column;
import net.sf.jsqlparser.schema.Table;
import net.sf.jsqlparser.statement.delete.Delete;
import net.sf.jsqlparser.statement.insert.Insert;
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
        //只需要构造一张表的表达式
        Column aliasColumn = this.getAliasColumn(tables.get(0));
        boolean presenceOfField=true;

        if(presenceOfField) {
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
        }else{
            return currentExpression;
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


