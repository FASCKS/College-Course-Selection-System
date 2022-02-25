package com.pxx.collegecourseselectionsystem.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pxx.collegecourseselectionsystem.common.exception.RRException;
import com.pxx.collegecourseselectionsystem.common.utils.PageUtils;
import com.pxx.collegecourseselectionsystem.dto.SysRoleDto;
import com.pxx.collegecourseselectionsystem.entity.SysRoleEntity;
import com.pxx.collegecourseselectionsystem.entity.SysRoleMenuEntity;
import com.pxx.collegecourseselectionsystem.mapper.SysRoleMapper;
import com.pxx.collegecourseselectionsystem.service.SysRoleMenuService;
import com.pxx.collegecourseselectionsystem.service.SysRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class SysRoleServiceImpl extends ServiceImpl<SysRoleMapper, SysRoleEntity> implements SysRoleService {
    @Autowired
    private SysRoleMapper sysRoleMapper;

    @Autowired
    private SysRoleMenuService sysRoleMenuService;


    /**
     * 通过角色id查询角色详情
     *
     * @param roleId 角色id
     * @return
     */
    @Override
    public SysRoleEntity findRoleInfoByRoleId(Long roleId) {
        SysRoleDto sysRoleEntity = sysRoleMapper.findRoleInfoByRoleId(roleId);
        List<Integer> integerList=sysRoleMenuService.findMenuIdByRoleId(roleId);
        sysRoleEntity.setMenuAuthorityIds(integerList);


        return sysRoleEntity;
    }

    @Transactional
    @Override
    public boolean updateOneRole(SysRoleDto sysRoleEntity) {
        boolean updateById = this.updateById(sysRoleEntity);
        boolean insertRoleIdAndMenuId = this.insertRoleIdAndMenuId(sysRoleEntity.getMenuAuthorityIds(), sysRoleEntity.getRoleId());
        return updateById;
    }

    /**
     * 新增角色 和 角色权限
     *
     * @param sysRoleEntity
     * @return
     */
    @Transactional
    @Override
    public boolean insertOneRole(SysRoleDto sysRoleEntity) {
        int insert = sysRoleMapper.insert(sysRoleEntity);
        List<Integer> menuAuthorityIds = sysRoleEntity.getMenuAuthorityIds();

            boolean insertRoleIdAndMenuId = this.insertRoleIdAndMenuId(menuAuthorityIds, sysRoleEntity.getRoleId());
            if (!insertRoleIdAndMenuId) {
                throw new RRException("");
            }

        return insert > 0;
    }

    /**
     * 获取所有角色
     *
     * @param page
     * @return
     */
    @Override
    public PageUtils findAllRole(Page<SysRoleEntity> page) {
        IPage<SysRoleEntity> entityIPage=sysRoleMapper.findAllRole(page);
        return new PageUtils(entityIPage);
    }

    /**
     * 批量删除
     *
     * @param roleIds
     * @return
     */
    @Override@Transactional
    public boolean deleteRoleById(List<Long> roleIds) {
        boolean removeBatchByIds = this.removeBatchByIds(roleIds);
        if (!roleIds.isEmpty()){
            boolean deleteByBatchRoleId =sysRoleMenuService.deleteByBatchRoleId(roleIds);
        }

        return removeBatchByIds;
    }

    /**
     * 添加角色和菜单绑定关系
     *
     * @param menuIds
     * @param roleId
     * @return
     */
    private boolean insertRoleIdAndMenuId(List<Integer> menuIds, Long roleId) {
        QueryWrapper<SysRoleMenuEntity> sysRoleMenuEntityQueryWrapper = new QueryWrapper<>();
        sysRoleMenuEntityQueryWrapper.eq(SysRoleMenuEntity.COL_ROLE_ID, roleId);
        boolean remove = sysRoleMenuService.remove(sysRoleMenuEntityQueryWrapper);
        List<SysRoleMenuEntity> sysRoleMenuEntityList = new ArrayList<>();
        for (Integer menuAuthorityId : menuIds) {
            SysRoleMenuEntity sysRoleMenuEntity = new SysRoleMenuEntity();
            sysRoleMenuEntity.setMenuId(menuAuthorityId);
            sysRoleMenuEntity.setRoleId(roleId);
            sysRoleMenuEntity.setId(null);
            sysRoleMenuEntityList.add(sysRoleMenuEntity);
        }
        boolean batchInsert = sysRoleMenuService.saveBatch(sysRoleMenuEntityList);

        return batchInsert;
    }

}
