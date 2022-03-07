package com.pxx.collegecourseselectionsystem.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.pxx.collegecourseselectionsystem.common.exception.RRException;
import com.pxx.collegecourseselectionsystem.common.utils.PageUtils;
import com.pxx.collegecourseselectionsystem.common.utils.RedisUtil;
import com.pxx.collegecourseselectionsystem.common.utils.SpringSecurityUtil;
import com.pxx.collegecourseselectionsystem.dto.SysUserDto;
import com.pxx.collegecourseselectionsystem.entity.*;
import com.pxx.collegecourseselectionsystem.mapper.SysUserMapper;
import com.pxx.collegecourseselectionsystem.service.*;
import com.pxx.collegecourseselectionsystem.util.Global;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collection;
import java.util.List;

@Service
public class SysUserServiceImpl extends ServiceImpl<SysUserMapper, SysUserEntity> implements SysUserService, UserDetailsService {
    @Autowired
    private SysUserMapper sysUserMapper;
    @Autowired
    private SysRoleService sysRoleService;
    @Autowired
    private SysUserRoleService sysUserRoleService;
    @Autowired
    private SysMenuService sysMenuService;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;
    @Autowired
    private RedisUtil redisUtil;
    @Autowired
    private SysLogService sysLogService;
    @Autowired
    private SecondCourseService secondCourseService;

    /**
     * 添加一个用户
     *
     * @param sysUserEntity 用户实体
     * @return 是否添加成功
     */
    @Transactional
    @Override
    public boolean insertOneUser(SysUserDto sysUserEntity) {
        boolean saveUser = this.save(sysUserEntity);
        SysUserRoleEntity sysUserRole = new SysUserRoleEntity();
        sysUserRole.setUserId(sysUserEntity.getUserId());
        sysUserRole.setRoleId(sysUserEntity.getRoleId());
        boolean saveUserRole = sysUserRoleService.save(sysUserRole);
        if (!saveUser && !saveUserRole) {
            throw new RRException("用户添加失败");
        }

        return saveUser && saveUserRole;
    }

    /**
     * 查询所有用户
     *
     * @param iPage
     * @return
     */
    @Override
    public PageUtils findAllUser(IPage<SysUserDto> iPage, Integer type, String name, Integer unitId) {
        IPage<SysUserDto> allUser = sysUserMapper.findAllUser(iPage, type, name, unitId);
        PageUtils pageUtils = new PageUtils(allUser);
        return pageUtils;
    }

    /**
     * 通过用户名查找用户
     *
     * @param username 用户名
     * @return
     */
    @Override
    public SysUserEntity findOneByUserName(String username) {
        SysUserEntity oneByNumber = sysUserMapper.findOneByNumber(username);
        return oneByNumber;
    }

    /**
     * 更新密码
     *
     * @param userId      用户id
     * @param password    旧密码
     * @param newPassword 新密码
     */
    @Override
    public boolean updateOneUserPassword(Long userId, String password, String newPassword) {
        if (password != null && password.equals(newPassword)) {
            throw new RRException("原密码和新密码不能相同");
        }
        if (userId == null) {
            userId = SpringSecurityUtil.getUserId();
        }
        SysUserEntity sysUserEntity;
        if (userId != null) {
            //指定用户
            sysUserEntity = this.getById(userId);
        } else {
            //只能自己
            String username = SpringSecurityUtil.getUsername();
            sysUserEntity = this.findOneByUserName(username);
        }

        if (password != null) {
            boolean matches = bCryptPasswordEncoder.matches(password, sysUserEntity.getPassword());
            if (!matches) {
                throw new RRException("原密码错误");
            }
        }

        sysUserEntity.setPassword(bCryptPasswordEncoder.encode(newPassword));
        boolean updateById = this.updateById(sysUserEntity);
        if (updateById) {
            String username = SpringSecurityUtil.getUsername();
            SysLogEntity sysLogEntity = new SysLogEntity();
            sysLogEntity.setTime(0L);
            sysLogEntity.setOperation(StrUtil.format("用户 {} 修改了 用户 {} 的密码", username, sysUserEntity.getUsername()));
            sysLogEntity.setUsername(username);
            sysLogService.save(sysLogEntity);


            //密码更新成功需要重新验证授权
            redisUtil.del(Global.REDIS_USER_DETAIL + sysUserEntity.getUsername());
        }

        return updateById;
    }

    /**
     * 更新一个用户
     *
     * @param sysUserEntity
     * @return
     */
    @Transactional
    @Override
    public boolean updateOneUser(SysUserDto sysUserEntity) {
        boolean updateUser = this.updateById(sysUserEntity);
        Long userId = sysUserEntity.getUserId();
        Long roleId = sysUserEntity.getRoleId();
        boolean updateRole = sysUserRoleService.updateOneByUserId(userId, roleId);
        if (!updateUser || !updateRole) {
            throw new RRException("用户更新失败");
        }
        return true;
    }

    /**
     * 查询一个用户
     *
     * @param userId
     * @return
     */
    @Override
    public SysUserDto findOneByUserId(Long userId) {
        SysUserDto sysUserDto = baseMapper.findOneByUserId(userId);
        return sysUserDto;
    }

    /**
     * 获取这些部门下得学生
     *
     * @param unitId
     * @return
     */
    @Override
    public List<SysUserEntity> findUserByUnitId(List<Integer> unitId) {

        return baseMapper.findUserByUnitId(unitId);
    }

    /**
     * 统计部门下有几个用户
     *
     * @param unitIds
     */
    @Override
    public Integer CountUserByUnitId(List<Integer> unitIds) {
        return baseMapper.CountUserByUnitId(unitIds);
    }

    /**
     * 通过用户
     * id获取实体
     *
     * @param userId
     * @return
     */
    @Override
    public List<String> findUserByUserIds(List<Long> userId) {

        return baseMapper.findUserByUserIds(userId);
    }

    /**
     * 获取学生id通过部门
     *
     * @param unitIds
     * @return
     */
    @Override
    public List<Long> findUserIdByUnitId(List<Integer> unitIds) {

        return baseMapper.findUserIdByUnitId(unitIds);
    }

    /**
     * 批量删除(jdbc批量提交)
     *
     * @param list 主键ID或实体列表(主键ID类型必须与实体类型字段保持一致)
     * @return 删除结果
     * @since 3.5.0
     */
    @Override@Transactional
    public boolean removeBatchByIds(Collection<?> list) {
        int deleteBatchIds = baseMapper.deleteBatchIds(list);
        check((Collection<Long>) list);
        return deleteBatchIds==list.size();
    }

    /**
     * 检查其它表的关联性
     */
    private void check(Collection<Long> list) {
       Integer userCount= secondCourseService.findCountByUserId(list);
       if (userCount!=null){
           throw new RRException("该老师被授课课程关联");
       }
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        SysUserEntity sysUserEntity = sysUserMapper.findOneByNumber(username);

        if (sysUserEntity == null) {
            throw new UsernameNotFoundException("密码或用户名错误.");
        }
        //如果是超级管理员
        if (Global.SUPER_ADMINISTRATOR_NAME.equals(sysUserEntity.getNumber())) {
            //所有角色

            List<SysRoleEntity> roleEntityList = sysRoleService.list();
            sysUserEntity.setRoleEntityList(roleEntityList);
            //菜单对应的权限
            QueryWrapper<SysMenuEntity> sysMenuEntityQueryWrapper = new QueryWrapper<>();
            sysMenuEntityQueryWrapper.select("perms").isNotNull(SysMenuEntity.COL_PERMS);
            List<SysMenuEntity> sysMenuEntityList = sysMenuService.list(sysMenuEntityQueryWrapper);
            sysUserEntity.setMenuEntityList(sysMenuEntityList);
        }


        return sysUserEntity;
    }
}





