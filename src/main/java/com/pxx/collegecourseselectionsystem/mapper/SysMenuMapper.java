package com.pxx.collegecourseselectionsystem.mapper;

import com.baomidou.mybatisplus.annotation.InterceptorIgnore;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.pxx.collegecourseselectionsystem.entity.SysMenuEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
@InterceptorIgnore(tenantLine = "1")
@Mapper
public interface SysMenuMapper extends BaseMapper<SysMenuEntity> {

    /**
     * 返回所有菜单
     *
     * @param type 1
     * @return
     */
    List<SysMenuEntity> findMenuByType(@Param("type") Integer[] type);

    /**
     * 返回所有菜单 和权限
     *
     * @param type 1
     * @return
     */
    List<SysMenuEntity> findAllMenuByType(@Param("type") Integer[] type);

    /**
     * 通过url查找
     *
     * @param url
     * @return
     */
    SysMenuEntity findMenuByUrl(@Param("url") String url);

    List<SysMenuEntity> findMenuById(@Param("menuIds") List<Integer> menuIds);
}