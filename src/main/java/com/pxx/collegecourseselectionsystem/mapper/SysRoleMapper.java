package com.pxx.collegecourseselectionsystem.mapper;

import com.baomidou.mybatisplus.annotation.InterceptorIgnore;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pxx.collegecourseselectionsystem.dto.SysRoleDto;
import com.pxx.collegecourseselectionsystem.entity.SysRoleEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@InterceptorIgnore(tenantLine = "1")
@Mapper
public interface SysRoleMapper extends BaseMapper<SysRoleEntity> {

    /**
     * 通过用户id查找角色
     */
    List<SysRoleDto> findRoleByUserId(@Param("userId") Long userId);

    /**
     * 通过角色id查询角色详情
     *
     * @param roleId 角色id
     * @return
     */
    SysRoleDto findRoleInfoByRoleId(@Param("roleId") Long roleId);

    /**
     * 所有角色
     * @param page
     * @return
     */
    IPage<SysRoleEntity> findAllRole(Page<SysRoleEntity> page);
}