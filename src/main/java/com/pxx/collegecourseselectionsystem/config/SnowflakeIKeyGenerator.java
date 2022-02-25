package com.pxx.collegecourseselectionsystem.config;

import cn.hutool.core.util.IdUtil;
import com.baomidou.mybatisplus.core.incrementer.IdentifierGenerator;
import org.springframework.stereotype.Component;

/**
 * @author Gpxx
 * @Date 2022/2/24 17:00
 * mybatis 自定义主键生成策略
 */
@Component
public class SnowflakeIKeyGenerator implements IdentifierGenerator {
    /**
     * 生成Id
     *
     * @param entity 实体
     * @return id
     */
    @Override
    public Number nextId(Object entity) {
        return IdUtil.getSnowflake().nextId();
    }


}
