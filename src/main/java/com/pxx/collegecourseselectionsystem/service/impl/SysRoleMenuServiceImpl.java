package com.pxx.collegecourseselectionsystem.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
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

    /**
     * 通过菜单id删除数据
     *
     * @param menuIds
     * @return
     */
    @Override
    public boolean deleteByMenuId(List<Integer> menuIds) {
        return baseMapper.deleteByMenuId(menuIds);
    }

    /**
     * 通过角色id删除
     *
     * @param roleIds
     * @return
     */
    @Override
    public boolean deleteByBatchRoleId(List<Long> roleIds) {

        return baseMapper.deleteByBatchRoleId(roleIds);
    }

    /**
     * 通过菜单id获取角色id
     *
     * @param menuId
     * @return
     */
    @Override
    public List<Long> findRoleIdsByMenuId(Integer menuId) {
        QueryWrapper<SysRoleMenuEntity> sq=new QueryWrapper<>();
        sq.select(SysRoleMenuEntity.COL_ROLE_ID).eq(SysRoleMenuEntity.COL_MENU_ID,menuId);
        List<Long> roleIds = this.listObjs(sq,(object -> {
            if (object instanceof Long){
                return (Long) object;
            }
            return null;
        }));
        return roleIds;
    }
}
