package com.pxx.collegecourseselectionsystem.config;

/**
 * @author Gpxx
 * @Date 2022/2/23 13:25
 */

import com.baomidou.mybatisplus.extension.plugins.handler.TenantLineHandler;
import com.pxx.collegecourseselectionsystem.common.utils.RedisUtil;
import com.pxx.collegecourseselectionsystem.common.utils.SpringSecurityUtil;
import net.sf.jsqlparser.expression.Expression;
import net.sf.jsqlparser.expression.LongValue;
import net.sf.jsqlparser.util.cnfexpression.MultipleExpression;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * @author ：hzz
 * @description：TODO
 * @date ：2021/8/9 15:44
 */
@Component
public class MyTenantLineHandler implements TenantLineHandler {
    @Autowired
    private RedisUtil redisUtil;


    @Override
    public Expression getTenantId() {
        String username = SpringSecurityUtil.getUsername();
        Set<Integer> unit_ids = (Set<Integer>) redisUtil.hget(RedisKey.UserDetail + username, "unit_ids");

        List<LongValue> longValues = new ArrayList<>();
        List<Expression> childlist = new ArrayList<>(longValues);
        for (Integer unit_id : unit_ids) {
            childlist.add(new LongValue(unit_id));
        }
        MultipleExpression multipleExpression = new MultipleExpression(childlist) {
            @Override
            public String getStringExpression() {
                return ",";
            }
        };
        return multipleExpression;
    }

    @Override
    public String getTenantIdColumn() {
        return "unit_id";
    }

    /**
     * 这个地方需要排除没有这个权限字段的表,如果是嵌套或者连表,都会添加上这个多租户
     *
     * @param tableName
     * @return
     */
    @Override
    public boolean ignoreTable(String tableName) {
        return false;
    }
}

