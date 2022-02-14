package com.pxx.collegecourseselectionsystem.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pxx.collegecourseselectionsystem.common.utils.PageUtils;
import com.pxx.collegecourseselectionsystem.common.utils.Pagination;
import com.pxx.collegecourseselectionsystem.entity.SecondCoursePlanEntity;
import com.pxx.collegecourseselectionsystem.mapper.SecondCoursePlanGroupMapper;
import com.pxx.collegecourseselectionsystem.service.SecondCoursePlanGroupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author Gpxx
 * @Date 2022/2/14 10:25
 */
@Service
public class SecondCoursePlanGroupServiceImpl extends ServiceImpl<SecondCoursePlanGroupMapper, SecondCoursePlanEntity> implements SecondCoursePlanGroupService {
    @Autowired
    private SecondCoursePlanGroupMapper secondCoursePlanMapper;

    /**
     * 所有分组
     *
     * @param pagination
     * @return
     */
    @Override
    public PageUtils findAllGroupPlan(Pagination pagination) {
        IPage<SecondCoursePlanEntity> secondCoursePlanEntityIPage = secondCoursePlanMapper.findAllGroupPlan(
                new Page<SecondCoursePlanEntity>(pagination.getPage(), pagination.getLimit())
        );
        return new PageUtils(secondCoursePlanEntityIPage);
    }
}
