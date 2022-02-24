package com.pxx.collegecourseselectionsystem.service.impl;

import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pxx.collegecourseselectionsystem.common.utils.PageUtils;
import com.pxx.collegecourseselectionsystem.common.utils.Pagination;
import com.pxx.collegecourseselectionsystem.dto.SecondCoursePlanGroupEntityDto;
import com.pxx.collegecourseselectionsystem.entity.SecondCoursePlanGroupAndUnit;
import com.pxx.collegecourseselectionsystem.entity.SecondCoursePlanGroupEntity;
import com.pxx.collegecourseselectionsystem.entity.SysUnitEntity;
import com.pxx.collegecourseselectionsystem.mapper.SecondCoursePlanGroupMapper;
import com.pxx.collegecourseselectionsystem.service.SecondCoursePlanGroupAndUnitService;
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
    private SecondCoursePlanGroupAndUnitService secondCoursePlanGroupAndUnitService;
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

/*        //先查询一次总数
        page.setTotal(secondCoursePlanMapper.findAllGroupPlanCount());//总数
        Long current = page.getCurrent();//当前页
        Long size = page.getSize();//每页大小
        Long index = (current - 1) * size;//数据库分布下标*/

        IPage<SecondCoursePlanGroupEntity> allGroupPlan =
                secondCoursePlanMapper.findAllGroupPlan(new Page<>(pagination.getPage(), pagination.getLimit()));
        return new PageUtils(allGroupPlan);
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
        boolean save = this.save(secondCoursePlanGroupEntity);
        List<Integer> myUnitId = new ArrayList<>();
        getUnitIdSonDtId(secondCoursePlanGroupEntity, myUnitId);
        List<Integer> collectUnitIds = myUnitId.stream().distinct().collect(Collectors.toList());
        List<SecondCoursePlanGroupAndUnit> secondCoursePlanGroupEntityList = new ArrayList<>();
        for (Integer collectUnitId : collectUnitIds) {
            SecondCoursePlanGroupAndUnit secondCoursePlanGroupAndUnit = new SecondCoursePlanGroupAndUnit();
            secondCoursePlanGroupAndUnit.setUnitId(collectUnitId);
            secondCoursePlanGroupAndUnit.setScpgId(secondCoursePlanGroupEntity.getId());
            secondCoursePlanGroupEntityList.add(secondCoursePlanGroupAndUnit);
        }
        secondCoursePlanGroupAndUnitService.saveBatch(secondCoursePlanGroupEntityList);

        return save;
    }

    @Transactional
    @Override
    public boolean updateOne(SecondCoursePlanGroupEntityDto secondCoursePlanGroupEntity) {
        List<Integer> myUnitId = new ArrayList<>();
        //先删除所有
        Integer removeByScpgId = secondCoursePlanGroupAndUnitService.removeByScpgId(secondCoursePlanGroupEntity.getId());
        //添加关系
        getUnitIdSonDtId(secondCoursePlanGroupEntity, myUnitId);
        List<Integer> collectUnitIds = myUnitId.stream().distinct().collect(Collectors.toList());
        List<SecondCoursePlanGroupAndUnit> secondCoursePlanGroupEntityList = new ArrayList<>();

        for (Integer collectUnitId : collectUnitIds) {
            SecondCoursePlanGroupAndUnit secondCoursePlanGroupAndUnit = new SecondCoursePlanGroupAndUnit();
            secondCoursePlanGroupAndUnit.setUnitId(collectUnitId);
            secondCoursePlanGroupAndUnit.setScpgId(secondCoursePlanGroupEntity.getId());
            secondCoursePlanGroupEntityList.add(secondCoursePlanGroupAndUnit);
        }
        secondCoursePlanGroupAndUnitService.saveBatch(secondCoursePlanGroupEntityList);


        UpdateWrapper<SecondCoursePlanGroupEntity> secondCoursePlanGroupEntityDtoUpdateWrapper = new UpdateWrapper<>();
        secondCoursePlanGroupEntityDtoUpdateWrapper.eq("state", 0).eq(SecondCoursePlanGroupEntity.COL_ID,secondCoursePlanGroupEntity.getId());
        int update = secondCoursePlanMapper.update(secondCoursePlanGroupEntity, secondCoursePlanGroupEntityDtoUpdateWrapper);
        return update > 0;
    }

    /**
     * 查询该分组下得部门id
     *
     * @param planGroupId
     * @return
     */
    @Override
    public List<Integer> findUnitIdByPlanGroupId(Integer planGroupId) {

        return secondCoursePlanMapper.findUnitIdByPlanGroupId(planGroupId);
    }

    /**
     * 查询一条并且包含用户id
     *
     * @param id
     * @return
     */
    @Override
    public SecondCoursePlanGroupEntityDto findOneAndUnitById(Integer id) {
        return baseMapper.findOneAndUnitById(id);
    }

    /**
     * 查询状态
     *
     * @param id
     */
    @Override
    public Integer getOneByState(Integer id) {

        return baseMapper.getOneByState(id);
    }

    private void getUnitIdSonDtId(SecondCoursePlanGroupEntityDto secondCoursePlanGroupEntity, List<Integer> myUnitId) {
        List<SysUnitEntity> sysUnitEntityList = sysUnitService.list();
        List<Integer> unitIds = secondCoursePlanGroupEntity.getUnitIds();
        for (Integer unitId : unitIds) {
            myUnitId.add(unitId);
            sysUnitService.getSonDtId(sysUnitEntityList, unitId, myUnitId);
        }
    }
}
