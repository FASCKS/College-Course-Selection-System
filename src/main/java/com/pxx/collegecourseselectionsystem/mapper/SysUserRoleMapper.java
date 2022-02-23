package com.pxx.collegecourseselectionsystem.mapper;

import com.baomidou.mybatisplus.annotation.InterceptorIgnore;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.pxx.collegecourseselectionsystem.entity.SysUserRoleEntity;
import org.apache.ibatis.annotations.Mapper;
@InterceptorIgnore(tenantLine = "1")
@Mapper
public interface SysUserRoleMapper extends BaseMapper<SysUserRoleEntity> {

}

