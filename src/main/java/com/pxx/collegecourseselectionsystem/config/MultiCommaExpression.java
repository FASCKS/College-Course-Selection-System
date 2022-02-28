package com.pxx.collegecourseselectionsystem.config;

import net.sf.jsqlparser.expression.Expression;
import net.sf.jsqlparser.util.cnfexpression.MultipleExpression;

import java.util.List;

/**
 * @author Gpxx
 * @Date 2022/2/28 14:41
 */
public class MultiCommaExpression extends MultipleExpression {
    public MultiCommaExpression(List<Expression> childlist) {
        super(childlist);
    }

    @Override
    public String getStringExpression() {
        return ",";
    }
}
