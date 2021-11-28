package com.pxx.collegecourseselectionsystem.service;

import java.util.List;
import com.pxx.collegecourseselectionsystem.entity.SysMenuEntity;
import com.baomidou.mybatisplus.extension.service.IService;
public interface SysMenuService extends IService<SysMenuEntity>{


    int updateBatch(List<SysMenuEntity> list);

    int batchInsert(List<SysMenuEntity> list);

    int insertOrUpdate(SysMenuEntity record);

    int insertOrUpdateSelective(SysMenuEntity record);

    /**
     * 返回所有菜单
     * @return
     */
    List<SysMenuEntity> findMenuByType();
}
