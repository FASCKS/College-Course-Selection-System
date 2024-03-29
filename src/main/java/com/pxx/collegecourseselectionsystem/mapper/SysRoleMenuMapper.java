package com.pxx.collegecourseselectionsystem.mapper;

import com.baomidou.mybatisplus.annotation.InterceptorIgnore;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.pxx.collegecourseselectionsystem.entity.SysRoleMenuEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@InterceptorIgnore(tenantLine = "1")
@Mapper
public interface SysRoleMenuMapper extends BaseMapper<SysRoleMenuEntity> {
    int updateBatch(List<SysRoleMenuEntity> list);

    int batchInsert(@Param("list") List<SysRoleMenuEntity> list);

    int insertOrUpdate(SysRoleMenuEntity record);

    int insertOrUpdateSelective(SysRoleMenuEntity record);


    int deleteByRoleId(@Param("roleId") Long roleId);

    List<Integer> findMenuIdByRoleId(@Param("roleId") Long roleId);

    boolean deleteByMenuId(@Param("menuIds") List<Integer> menuIds);

    /**
     * 通过角色id删除
     *
     * @param roleIds
     * @return
     */
    boolean deleteByBatchRoleId(@Param("roleIds") List<Long> roleIds);
}