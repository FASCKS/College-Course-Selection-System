package com.pxx.collegecourseselectionsystem.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.pxx.collegecourseselectionsystem.common.utils.PageUtils;
import com.pxx.collegecourseselectionsystem.dto.SysUserDto;
import com.pxx.collegecourseselectionsystem.entity.SysUserEntity;

public interface SysUserService extends IService<SysUserEntity> {


    /**
     * 添加一个用户
     *
     * @param sysUserEntity 用户实体
     * @return 是否添加成功
     */
    boolean insertOneUser(SysUserDto sysUserEntity);
    /**
     * 查询所有用户
     * @return
     */
    PageUtils findAllUser(IPage<SysUserDto> iPage, Integer type,String name,Integer unitId);

    /**
     * 通过用户名查找用户
     * @param username 用户名
     * @return
     */
    SysUserEntity findOneByUserName(String username);
    /**
     * 更新密码
     */
    boolean updateOneUserPassword(Long userId,String password,String newPassword);

    /**
     * 更新一个用户
     * @param sysUserEntity
     * @return
     */
    boolean updateOneUser(SysUserDto sysUserEntity);

    /**
     * 查询一个用户
     * @param userId
     * @return
     */
    SysUserDto findOneByUserId(Long userId);
}





