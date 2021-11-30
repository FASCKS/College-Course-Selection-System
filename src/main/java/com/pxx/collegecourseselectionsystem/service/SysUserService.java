package com.pxx.collegecourseselectionsystem.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.pxx.collegecourseselectionsystem.common.utils.PageUtils;
import com.pxx.collegecourseselectionsystem.entity.SysUserEntity;

import java.util.List;

public interface SysUserService extends IService<SysUserEntity> {


    int updateBatch(List<SysUserEntity> list);

    int batchInsert(List<SysUserEntity> list);

    int insertOrUpdate(SysUserEntity record);

    int insertOrUpdateSelective(SysUserEntity record);

    /**
     * 添加一个用户
     *
     * @param sysUserEntity 用户实体
     * @return 是否添加成功
     */
    @Deprecated
    boolean insertOneUser(SysUserEntity sysUserEntity);
    /**
     * 查询所有用户
     * @return
     */
    PageUtils findAllUser(IPage<SysUserEntity> iPage);
}





