package com.pxx.collegecourseselectionsystem.service;

import java.util.List;
import com.pxx.collegecourseselectionsystem.entity.SysLogEntity;
import com.baomidou.mybatisplus.extension.service.IService;
public interface SysLogService extends IService<SysLogEntity>{


    int updateBatch(List<SysLogEntity> list);

    int batchInsert(List<SysLogEntity> list);

    int insertOrUpdate(SysLogEntity record);

    int insertOrUpdateSelective(SysLogEntity record);

}
