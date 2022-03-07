package com.pxx.collegecourseselectionsystem.mapper;

import com.baomidou.mybatisplus.annotation.InterceptorIgnore;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.pxx.collegecourseselectionsystem.dto.SysUserDto;
import com.pxx.collegecourseselectionsystem.entity.SysUserEntity;
import com.pxx.collegecourseselectionsystem.vo.sys.SysUserUnitVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@InterceptorIgnore(tenantLine = "true")
@Mapper
public interface SysUserMapper extends BaseMapper<SysUserEntity> {

    /**
     * 查找用户和用户对应的权限
     *
     * @return
     */
    List<SysUserEntity> findUserAndRoleMap();

    /**
     * 通过用户名查询用户
     *
     * @param username
     * @return
     */

    SysUserEntity findOneByNumber(@Param("number") String username);

    /**
     * 查询所有用户
     *
     * @return
     */
    @InterceptorIgnore(tenantLine = "false")
    IPage<SysUserDto> findAllUser(@Param("iPage") IPage<SysUserDto> iPage,
                                  @Param("type") Integer type,
                                  @Param("name") String name,
                                  @Param("unitId") Integer unitId);

    /**
     * 查询一个用户
     *
     * @param userId
     * @return
     */
    SysUserDto findOneByUserId(@Param("userId") Long userId);

    /**
     * 通过部门查询学生
     *
     * @param unitId
     * @return
     */
    List<SysUserEntity> findUserByUnitId(@Param("unitId") List<Integer> unitId);

    /**
     * 统计部门下有几个用户
     *
     * @param unitIds
     */
    Integer CountUserByUnitId(@Param("unitIds") List<Integer> unitIds);

    @InterceptorIgnore(tenantLine = "false")
    List<String> findUserByUserIds(@Param("userId") List<Long> userId);

    /**
     * 获取学生id 通过部门
     *
     * @param unitIds
     * @return
     */
    List<SysUserUnitVo> findUserIdByUnitId(@Param("unitIds") List<Integer> unitIds);
}