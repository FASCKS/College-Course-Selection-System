package com.pxx.collegecourseselectionsystem.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.pxx.collegecourseselectionsystem.entity.SysMenuEntity;
import com.pxx.collegecourseselectionsystem.entity.SysRoleEntity;
import com.pxx.collegecourseselectionsystem.entity.SysUserEntity;
import com.pxx.collegecourseselectionsystem.service.SysMenuService;
import com.pxx.collegecourseselectionsystem.service.SysRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.List;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pxx.collegecourseselectionsystem.mapper.SysUserMapper;
import com.pxx.collegecourseselectionsystem.service.SysUserService;

@Service
public class SysUserServiceImpl extends ServiceImpl<SysUserMapper, SysUserEntity> implements SysUserService, UserDetailsService {
    @Autowired
    private SysUserMapper sysUserMapper;
    @Autowired
    private SysRoleService sysRoleService;
    @Autowired
    private SysMenuService sysMenuService;

    @Override
    public int updateBatch(List<SysUserEntity> list) {
        return baseMapper.updateBatch(list);
    }

    @Override
    public int batchInsert(List<SysUserEntity> list) {
        return baseMapper.batchInsert(list);
    }

    @Override
    public int insertOrUpdate(SysUserEntity record) {
        return baseMapper.insertOrUpdate(record);
    }

    @Override
    public int insertOrUpdateSelective(SysUserEntity record) {
        return baseMapper.insertOrUpdateSelective(record);
    }

    /**
     * 添加一个用户
     *
     * @param sysUserEntity 用户实体
     * @return 是否添加成功
     */
    @Override
    public boolean insertOneUser(SysUserEntity sysUserEntity) {
        return false;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        SysUserEntity sysUserEntity = sysUserMapper.findOneByNumber(username);

        if (sysUserEntity == null) {
            throw new UsernameNotFoundException("账号不存在");
        }
        //如果是超级管理员
        if (sysUserEntity.getNumber().equals("admin")) {
            //所有角色
            List<SysRoleEntity> roleEntityList = sysRoleService.list();
            sysUserEntity.setRoleEntityList(roleEntityList);
            //菜单对应的权限
            QueryWrapper<SysMenuEntity> sysMenuEntityQueryWrapper=new QueryWrapper<>();
            sysMenuEntityQueryWrapper.select("perms");
            List<SysMenuEntity> sysMenuEntityList = sysMenuService.list(sysMenuEntityQueryWrapper);
            sysUserEntity.setMenuEntityList(sysMenuEntityList);
        }


        return sysUserEntity;
    }
}





