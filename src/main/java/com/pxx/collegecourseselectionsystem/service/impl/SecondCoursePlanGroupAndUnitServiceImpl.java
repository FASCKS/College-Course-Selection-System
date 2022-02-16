package com.pxx.collegecourseselectionsystem.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pxx.collegecourseselectionsystem.entity.SecondCoursePlanGroupAndUnit;
import com.pxx.collegecourseselectionsystem.mapper.SecondCoursePlanGroupAndUnitMapper;
import com.pxx.collegecourseselectionsystem.service.SecondCoursePlanGroupAndUnitService;
import org.springframework.stereotype.Service;
/**
 *  @author Gpxx
 *  @Date 2022/2/15 15:14
 */
@Service
public class SecondCoursePlanGroupAndUnitServiceImpl extends ServiceImpl<SecondCoursePlanGroupAndUnitMapper, SecondCoursePlanGroupAndUnit> implements SecondCoursePlanGroupAndUnitService{

    /**
     * 删除所有通过 scpgid
     *
     * @param scpgId
     */
    @Override
    public Integer removeByScpgId(Integer scpgId) {
       return baseMapper.removeByScpgId(scpgId);
    }
}
