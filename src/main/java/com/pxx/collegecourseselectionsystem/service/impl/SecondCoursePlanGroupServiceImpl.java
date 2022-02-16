package com.pxx.collegecourseselectionsystem.service.impl;

import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pxx.collegecourseselectionsystem.common.utils.PageUtils;
import com.pxx.collegecourseselectionsystem.common.utils.Pagination;
import com.pxx.collegecourseselectionsystem.dto.SecondCoursePlanGroupEntityDto;
import com.pxx.collegecourseselectionsystem.entity.SecondCoursePlanGroupEntity;
import com.pxx.collegecourseselectionsystem.entity.SysUnitEntity;
import com.pxx.collegecourseselectionsystem.mapper.SecondCoursePlanGroupMapper;
import com.pxx.collegecourseselectionsystem.service.SecondCoursePlanGroupService;
import com.pxx.collegecourseselectionsystem.service.SysUnitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author Gpxx
 * @Date 2022/2/14 10:25
 */
@Service
public class SecondCoursePlanGroupServiceImpl extends ServiceImpl<SecondCoursePlanGroupMapper, SecondCoursePlanGroupEntity> implements SecondCoursePlanGroupService {
    @Autowired
    private SecondCoursePlanGroupMapper secondCoursePlanMapper;
    @Autowired
    private SysUnitService sysUnitService;

    /**
     * 所有分组
     *
     * @param pagination
     * @return
     */
    @Override
    public PageUtils findAllGroupPlan(Pagination pagination) {
        Page<SecondCoursePlanGroupEntityDto> page = new Page<>(pagination.getPage(), pagination.getLimit());
        //先查询一次总数
        page.setTotal(secondCoursePlanMapper.findAllGroupPlanCount());//总数
        Long current = page.getCurrent();//当前页
        Long size = page.getSize();//每页大小
        Long index = (current-1)*size;//数据库分布下标


        List<SecondCoursePlanGroupEntityDto> allGroupPlan = secondCoursePlanMapper.findAllGroupPlan(index, size);
        page.setRecords(allGroupPlan);
        return new PageUtils(page);
    }

    /**
     * 查询一条通过id
     *
     * @param id
     * @return
     */
    @Override
    public SecondCoursePlanGroupEntityDto findOneById(Integer id) {
        return secondCoursePlanMapper.findOneById(id);
    }

    /**
     * 获取最后一条数据
     *
     * @param year
     * @param code
     * @return
     */
    @Override
    public Integer findEndDataSum(Integer year, Integer code) {

        return secondCoursePlanMapper.findEndDataSum(year, code);
    }

    @Transactional
    @Override
    public boolean saveOne(SecondCoursePlanGroupEntityDto secondCoursePlanGroupEntity) {
        List<Integer> myUnitId = new ArrayList<>();
        getUnitIdSonDtId(secondCoursePlanGroupEntity, myUnitId);

        List<Integer> collectUnitIds = myUnitId.stream().distinct().collect(Collectors.toList());
        secondCoursePlanGroupEntity.setUnitIds(collectUnitIds);
        boolean save = this.save(secondCoursePlanGroupEntity);
        return save;
    }

    @Override
    public boolean updateOne(SecondCoursePlanGroupEntityDto secondCoursePlanGroupEntity) {
        List<Integer> myUnitId = new ArrayList<>();
        getUnitIdSonDtId(secondCoursePlanGroupEntity, myUnitId);
        List<Integer> collectUnitIds = myUnitId.stream().distinct().collect(Collectors.toList());
        secondCoursePlanGroupEntity.setUnitIds(collectUnitIds);

        UpdateWrapper<SecondCoursePlanGroupEntity> secondCoursePlanGroupEntityDtoUpdateWrapper = new UpdateWrapper<>();
        secondCoursePlanGroupEntityDtoUpdateWrapper.eq("state", 0);
        int update = secondCoursePlanMapper.update( secondCoursePlanGroupEntity, secondCoursePlanGroupEntityDtoUpdateWrapper);
        return update > 0;
    }

    private void getUnitIdSonDtId(SecondCoursePlanGroupEntityDto secondCoursePlanGroupEntity, List<Integer> myUnitId) {
        List<SysUnitEntity> sysUnitEntityList = sysUnitService.list();
        List<Integer> unitIds = secondCoursePlanGroupEntity.getUnitIds();
        for (Integer unitId : unitIds) {
            sysUnitService.getSonDtId(sysUnitEntityList, unitId, myUnitId);
        }
    }
}
