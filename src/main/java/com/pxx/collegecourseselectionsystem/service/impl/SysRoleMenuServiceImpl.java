package com.pxx.collegecourseselectionsystem.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pxx.collegecourseselectionsystem.entity.SysRoleMenuEntity;
import com.pxx.collegecourseselectionsystem.mapper.SysRoleMenuMapper;
import com.pxx.collegecourseselectionsystem.service.SysRoleMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class SysRoleMenuServiceImpl extends ServiceImpl<SysRoleMenuMapper, SysRoleMenuEntity> implements SysRoleMenuService{
@Autowired
private SysRoleMenuMapper sysRoleMenuMapper;
    @Override
    public int updateBatch(List<SysRoleMenuEntity> list) {
        return baseMapper.updateBatch(list);
    }
    @Override
    public int batchInsert(List<SysRoleMenuEntity> list) {
        return baseMapper.batchInsert(list);
    }
    @Override
    public int insertOrUpdate(SysRoleMenuEntity record) {
        return baseMapper.insertOrUpdate(record);
    }
    @Override
    public int insertOrUpdateSelective(SysRoleMenuEntity record) {
        return baseMapper.insertOrUpdateSelective(record);
    }

    /**
     * 删除角色绑定菜单
     *
     * @param roleId
     * @return
     */
    @Override
    public boolean deleteByRoleId(Long roleId) {
        int delete = sysRoleMenuMapper.deleteByRoleId(roleId);
        return delete>0;
    }

    /**
     * 获取菜单id数组
     *
     * @param roleId
     * @return
     */
    @Override
    public List<Integer> findMenuIdByRoleId(Long roleId) {

        return  sysRoleMenuMapper.findMenuIdByRoleId(roleId);
    }
}
