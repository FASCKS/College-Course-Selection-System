package com.pxx.collegecourseselectionsystem.controller;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.convert.Convert;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.lang.Validator;
import cn.hutool.core.text.StrBuilder;
import cn.hutool.core.util.IdcardUtil;
import cn.hutool.http.HttpRequest;
import cn.hutool.http.HttpResponse;
import cn.hutool.http.HttpUtil;
import cn.hutool.json.JSONArray;
import cn.hutool.json.JSONObject;
import cn.hutool.poi.excel.ExcelReader;
import cn.hutool.poi.excel.ExcelUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.pxx.collegecourseselectionsystem.common.exception.RRException;
import com.pxx.collegecourseselectionsystem.common.utils.*;
import com.pxx.collegecourseselectionsystem.common.validator.group.Update;
import com.pxx.collegecourseselectionsystem.config.RedisKey;
import com.pxx.collegecourseselectionsystem.dto.SysUserDto;
import com.pxx.collegecourseselectionsystem.entity.SysUnitEntity;
import com.pxx.collegecourseselectionsystem.entity.SysUserEntity;
import com.pxx.collegecourseselectionsystem.entity.enums.SexEnum;
import com.pxx.collegecourseselectionsystem.service.SysUnitService;
import com.pxx.collegecourseselectionsystem.service.SysUserService;
import com.pxx.collegecourseselectionsystem.util.Global;
import com.pxx.collegecourseselectionsystem.vo.sys.SysUserUnitVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Positive;
import java.io.IOException;
import java.util.*;

@Validated
@RequestMapping("/sys/users")
@RestController
@Api(tags = "用户模块", value = "用户UserController")
public class SysUserController {
    @Autowired
    private SysUserService sysUserService;
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;
    @Autowired
    private RedisUtil redisUtil;
    @Autowired
    private SysUnitService sysUnitService;

    /**
     * 查询所有学生
     *
     * @param pagination 分页对象
     * @return
     */
    @ApiImplicitParams({
            @ApiImplicitParam(name = "type", value = "账号类型 1 学生 2 老师 3主任 3其它人员", required = true, example = "1"),
            @ApiImplicitParam(name = "name", value = "人员名字", required = false, example = "张三"),
            @ApiImplicitParam(name = "unitId", value = "所属部门id", required = false, example = "1"),
    })
    @ApiOperation("分页用户列表")
    @PreAuthorize("(" +
            "hasAnyAuthority('sys:student:list') and #type==1) " +
            "or" +
            " (hasAnyAuthority('sys:teacher:list') and #type==2) " +
            "or " +
            "(hasAnyAuthority('sys:director:list') and #type==3)")
    @GetMapping("/list")
    public R list(Pagination pagination,
                  @NotNull @RequestParam("type") Integer type,
                  @RequestParam(value = "name", required = false) String name,
                  @RequestParam(value = "unitId", required = false) Integer unitId) {
        PageUtils allUser = sysUserService.findAllUser(
                new Page<>(pagination.getPage(), pagination.getLimit()),
                type,
                name,
                unitId);
        return R.ok().put("data", allUser);
    }

    /**
     * 添加用户
     *
     * @param sysUserEntity 用户实体
     * @return true 成功 false 失败
     */
    @PreAuthorize("(" +
            "hasAnyAuthority('sys:student:insert') and #sysUserEntity.getType()==1) " +
            "or" +
            " (hasAnyAuthority('sys:teacher:insert') and #sysUserEntity.getType()==2) " +
            "or " +
            "(hasAnyAuthority('sys:director:insert') and #sysUserEntity.getType()==3)")
    @ApiOperation("用户新增")
    @PostMapping("/insert")
    public R insertUser(@Validated @RequestBody SysUserDto sysUserEntity) {
        String password = sysUserEntity.getPassword();
        sysUserEntity.setPassword(passwordEncoder.encode(password));
        sysUserEntity.setUserId(null);
        sysUserEntity.setEnable(1);
        sysUserEntity.setState(1);
        sysUserEntity.setLockTime(new Date());
        sysUserEntity.setLastLoginTime(new Date());
        boolean save = sysUserService.insertOneUser(sysUserEntity);
        return R.ok().put("data", save);
    }

    /**
     * 删除用户
     *
     * @param userIds 多个用户id
     * @return
     */
    @PreAuthorize("(" +
            "hasAnyAuthority('sys:student:delete') and #type==1) " +
            "or" +
            " (hasAnyAuthority('sys:teacher:delete') and #type==2) " +
            "or " +
            "(hasAnyAuthority('sys:director:delete') and #type==3)")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "userIds", value = "用户id", required = true),
            @ApiImplicitParam(name = "type", value = "账号类型", dataTypeClass = Integer.class, required = true, paramType = "path")
    })
    @ApiOperation("用户删除")
    @PostMapping("/delete/{type}")
    public R delete(@NotEmpty @RequestBody List<Long> userIds, @NotNull @PathVariable("type") Integer type) {
        if (userIds.contains(Global.SUPER_ADMINISTRATOR_USER_ID)) {
            return R.error("不能删除超级管理员");
        }
        boolean removeById = sysUserService.removeBatchByIds(userIds);
        return R.ok().put("data", removeById);
    }

    /**
     * 更新用户
     *
     * @param sysUserEntity 用户实体
     * @return
     */
    @ApiOperation("用户编辑")
    @PreAuthorize("(" +
            "hasAnyAuthority('sys:student:update') and #sysUserEntity.getType()==1) " +
            "or" +
            " (hasAnyAuthority('sys:teacher:update') and #sysUserEntity.getType()==2) " +
            "or " +
            "(hasAnyAuthority('sys:director:update') and #sysUserEntity.getType()==3)")
    @PostMapping("/update")
    public R update(@RequestBody @Validated(Update.class) SysUserDto sysUserEntity) {
        sysUserEntity.setPassword(null);
        sysUserEntity.setNumber(null);
        boolean updateById = sysUserService.updateOneUser(sysUserEntity);
        return R.ok().put("data", updateById);
    }

    /**
     * 用户详情
     *
     * @param userId 用户id
     * @return
     */
    @ApiImplicitParams({
            @ApiImplicitParam(name = "userId", value = "用户id", dataTypeClass = Long.class, required = true, paramType = "path"),
            @ApiImplicitParam(name = "type", value = "账号类型", dataTypeClass = Integer.class, required = true, paramType = "path")
    })
    @ApiOperation("用户详情")
    @PreAuthorize("(" +
            "hasAnyAuthority('sys:student:info') and #type==1) " +
            "or" +
            " (hasAnyAuthority('sys:teacher:info') and #type==2) " +
            "or " +
            "(hasAnyAuthority('sys:director:info') and #type==3)")
    @PostMapping("/info/{userId}/{type}")
    public R info(@PathVariable("userId") @Positive Long userId, @PathVariable("type") Integer type) {
        SysUserDto sysUserEntity = sysUserService.findOneByUserId(userId);
        return R.ok().put("data", sysUserEntity);
    }

    /**
     * 获得当前登录用户信息
     *
     * @return
     */
    @ApiOperation("当前登录用户信息")
    @GetMapping("/my")
    public R my() {
        SysUserEntity sysUserEntity = SpringSecurityUtil.getEntity();
        sysUserEntity.setPassword(null);
        return R.ok().put("data", sysUserEntity);
    }

    /**
     * 更新密码
     * 可更新选定用户
     */
    @PreAuthorize("hasAnyAuthority('sys:user:password')")
    @ApiOperation("更新密码")
    @PostMapping("/password")
    public R password(
            @Positive @NotNull(message = "用户名不能为空") @RequestParam("userId") Long userId,
            @NotEmpty(message = "旧密码不能为空") @RequestParam("password") String password,
            @NotEmpty(message = "新密码不能为空") @RequestParam("newPassword") String newPassword) {

        boolean updateById = sysUserService.updateOneUserPassword(userId, password, newPassword);

        return R.ok().put("data", updateById);
    }

    /**
     * 只能更新自己密码
     */
    @PreAuthorize("hasAnyAuthority('sys:my:password')")
    @ApiOperation("更新密码")
    @PostMapping("/my/password")
    public R password(
            @NotEmpty(message = "旧密码不能为空") @RequestParam("password") String password,
            @NotEmpty(message = "新密码不能为空") @RequestParam("newPassword") String newPassword) {

        boolean updateById = sysUserService.updateOneUserPassword(null, password, newPassword);

        return R.ok().put("data", updateById);
    }

    /**
     * 管理员重置密码
     */
    @PreAuthorize("hasAnyAuthority('sys:user:reset')")
    @ApiOperation("重置密码为固定值")
    @PostMapping("/reset/password")
    public R resetPassword(@Positive @NotNull(message = "用户名不能为空") @RequestParam("userId") Long userId) {
        boolean resetPassword = sysUserService.updateOneUserPassword(userId, null, "123456");
        return R.ok().put("data", resetPassword);
    }

    /**
     * 踢人下线
     */
    @ApiOperation("踢人下线")
    @PreAuthorize("hasAnyAuthority('sys:user:kick')")
    @PostMapping("/kick")
    public R kick(@NotNull @RequestBody List<Long> userId) {
        List<String> sysUserEntityList = sysUserService.findUserByUserIds(userId);
        for (String s : sysUserEntityList) {
            redisUtil.del(RedisKey.UserDetail + s);
        }
        return R.ok();
    }

    /**
     * 通过部门id获取部门下的学生
     */
    @ApiOperation("学生所属部门")
    @PreAuthorize("hasAnyAuthority('sys:user:unit')")
    @PostMapping("/user/unit")
    public R userUnit(@RequestBody @NotEmpty List<Integer> unitIds) {
        List<SysUserUnitVo> userByUnitId = sysUserService.findUserIdByUnitId(unitIds);
        return R.ok().put("data", userByUnitId);
    }

    /**
     * 随机信息
     */
    @PostMapping("/test/{roleId}")
    public void test(@RequestParam("name") String unitName,@PathVariable("roleId") Long roleId) {
        List<SysUnitEntity> sysUnitEntities = sysUnitService.list();
        Map<Integer, Integer> integerMap = new HashMap<>();
        List<SysUserEntity> sysUserEntityList = new ArrayList<>();
        for (int i = 0; i < 3; i++) {
            HttpRequest body = HttpUtil.createPost("https://api2.suijidaquan.com/api/v2/random-id-card").body("{\"count\": \"25\", \"method\": \"random_id_card\"}\n");
            HttpResponse execute = body.execute();
            JSONObject jsonObject = new JSONObject(execute.body());
            JSONArray jsonArray = (JSONArray) jsonObject.get("data");
            //获得当前年级段 19
            String year = DateUtil.format(new Date(), "yyyy").substring(2);
            StrBuilder number = StrBuilder.create();
            for (Object o : jsonArray) {
                String id_card = BeanUtil.getProperty(o, "id_card");
                String name = BeanUtil.getProperty(o, "f");
                String province = BeanUtil.getProperty(o, "province");
                String shi = BeanUtil.getProperty(o, "shi");
                String xian = BeanUtil.getProperty(o, "xian");
                String adds = province + shi + xian;
                String phone = Convert.toStr(BeanUtil.getProperty(o, "phone")).substring(4);
                SysUserEntity sysUserEntity = new SysUserEntity();

                //通过部门名字确认部门参数
                for (SysUnitEntity sysUnitEntity : sysUnitEntities) {
                    //班级名称比较
                    boolean equals = sysUnitEntity.getName().equals(unitName);
                    if (equals) {
                        //获取专业编号
                        for (SysUnitEntity sysUnit : sysUnitEntities) {
                            //判断找到这个班级上面的专业
                            //专业名称比较
                            boolean pidEquales = sysUnit.getUnitId().equals(sysUnitEntity.getPid());
                            if (pidEquales) {
                                Integer sum = integerMap.computeIfAbsent(sysUnitEntity.getUnitId(), k -> 1);
                                //保存年份
                                number.append(year);
                                //保存专业编号
                                number.append(sysUnit.getCode());
                                //保存班级编号
                                number.append(sysUnitEntity.getCode());
                                //保存序号
                                if (sum < 10) {
                                    number.append("0").append(sum);
                                } else {
                                    number.append(sum);
                                }
                                //递增操作
                                integerMap.put(sysUnitEntity.getUnitId(), ++sum);
                                //设置账号
                                sysUserEntity.setNumber(number.toString());
                                //设置部门编号
                                sysUserEntity.setUnitId(sysUnitEntity.getUnitId());
                                number.reset();
                                //读取名字
                                sysUserEntity.setName(name);
                                //读取手机号
                                sysUserEntity.setTel(phone);
                                //读取身份证
                                String identity = Convert.toStr(id_card);
                                sysUserEntity.setIdentity(identity);
                                //读取地址
                                String address = Convert.toStr(adds);
                                sysUserEntity.setAddress(address);
                                //性别从身份证中读取
                                int genderByIdCard = IdcardUtil.getGenderByIdCard(identity);
                                if (genderByIdCard == 0) {
                                    sysUserEntity.setSex(SexEnum.Female);
                                } else {
                                    sysUserEntity.setSex(SexEnum.MAN);
                                }
                                //读取锁定状态
                                Integer state = Convert.toInt(1);
                                sysUserEntity.setState(state);
                                //默认初始化参数
                                sysUserEntity.setEnable(1);
                                //密码默认身份证后8位
                                sysUserEntity.setPassword(passwordEncoder.encode(identity.substring(10)));
                                //默认学生身份
                                sysUserEntity.setType(1);
                                //锁定时间
                                sysUserEntity.setLockTime(new Date());
                                //年龄从身份证中读取
                                int age = IdcardUtil.getAgeByIdCard(identity);
                                sysUserEntity.setAge(age);
                                sysUserEntityList.add(sysUserEntity);
                                break;
                            }
                        }

                    }
                }


            }
        }
        boolean saveBatch = sysUserService.saveBatch(sysUserEntityList,roleId);
        System.out.println(saveBatch);
    }

    /**
     * 批量导入
     */
    @ApiOperation("批量导入")
    @PreAuthorize("hasAnyAuthority('sys:user:import')")
    @PostMapping("/import/{roleId}")
    public R importUser(@RequestParam("file") MultipartFile multipartFile,@PathVariable("roleId") Long roleId) {
        //190320129
        //获得当前年级段 19
        String year = DateUtil.format(new Date(), "yyyy").substring(2);
        //获得当前专业编号 032
        //班级 01
        //计数器 29
        Map<Integer, Integer> integerMap = new HashMap<>();
        StrBuilder number = StrBuilder.create();
        //保存数据集合
        List<SysUserEntity> sysUserEntityList = new ArrayList<>();
        List<SysUnitEntity> sysUnitEntities = sysUnitService.list();
        //数据格式   名字，手机号 ， 身份证 ， 地址 ，部门名称 ， 性别 女 男 保密,锁定标记 1正常 0关闭
        try {
            ExcelReader reader = ExcelUtil.getReader(multipartFile.getInputStream());
            //读取Excel中所有行和列，都用列表表示
            List<List<Object>> readAll = reader.read();
            //开始迭代
            int jumpOver = 0;
            for (List<Object> objects : readAll) {
                //跳过第一行
                if (jumpOver == 0) {
                    jumpOver++;
                    continue;
                }
                SysUserEntity sysUserEntity = new SysUserEntity();
                //字段验证
                {
                    boolean citizenId = Validator.isCitizenId((String) objects.get(2));
                    if (!citizenId) {
                        throw new RRException("身份证不合法--->" + objects);
                    }
                    boolean mobile = Validator.isMobile(Convert.toStr(objects.get(1)));
                    if (!mobile) {
                        throw new RRException("手机号不合法--->" + objects);
                    }
                    String unitName = Convert.toStr(objects.get(4)).trim();
                    //校验部门名字是否存在
                    boolean isEquals = false;
                    for (SysUnitEntity sysUnitEntity : sysUnitEntities) {
                        boolean equals = sysUnitEntity.getName().equals(unitName);
                        if (equals) {
                            isEquals = true;
                            break;
                        }
                    }
                    if (!isEquals) {
                        throw new RRException("部门名称不存在");
                    }
                }
                //通过部门名字确认部门参数
                String unitName = Convert.toStr(objects.get(4)).trim();
                for (SysUnitEntity sysUnitEntity : sysUnitEntities) {
                    //班级名称比较
                    boolean equals = sysUnitEntity.getName().equals(unitName);
                    if (equals) {
                        //获取专业编号
                        for (SysUnitEntity sysUnit : sysUnitEntities) {
                            //判断找到这个班级上面的专业
                            //专业名称比较
                            boolean pidEquales = sysUnit.getUnitId().equals(sysUnitEntity.getPid());
                            if (pidEquales) {
                                Integer sum = integerMap.computeIfAbsent(sysUnitEntity.getUnitId(), k -> 1);
                                //保存年份
                                number.append(year);
                                //保存专业编号
                                number.append(sysUnit.getCode());
                                //保存班级编号
                                number.append(sysUnitEntity.getCode());
                                //保存序号
                                if (sum < 10) {
                                    number.append("0").append(sum);
                                } else {
                                    number.append(sum);
                                }
                                //递增操作
                                integerMap.put(sysUnitEntity.getUnitId(), ++sum);
                                //设置账号
                                sysUserEntity.setNumber(number.toString());
                                //设置部门编号
                                sysUserEntity.setUnitId(sysUnitEntity.getUnitId());
                                number.reset();
                                //读取名字
                                String name = Convert.toStr(objects.get(0));
                                sysUserEntity.setName(name);
                                //读取手机号
                                String tel = Convert.toStr(objects.get(1));
                                sysUserEntity.setTel(tel);
                                //读取身份证
                                String identity = Convert.toStr(objects.get(2));
                                sysUserEntity.setIdentity(identity);
                                //读取地址
                                String address = Convert.toStr(objects.get(3));
                                sysUserEntity.setAddress(address);
                                //性别从身份证中读取
                                int genderByIdCard = IdcardUtil.getGenderByIdCard(identity);
                                if (genderByIdCard == 0) {
                                    sysUserEntity.setSex(SexEnum.Female);
                                } else {
                                    sysUserEntity.setSex(SexEnum.MAN);
                                }
                                //读取锁定状态
                                Integer state = Convert.toInt(objects.get(5));
                                sysUserEntity.setState(state);
                                //默认初始化参数
                                sysUserEntity.setEnable(1);
                                //密码默认身份证后8位
                                sysUserEntity.setPassword(passwordEncoder.encode(identity.substring(10)));
                                //默认学生身份
                                sysUserEntity.setType(1);
                                //锁定时间
                                sysUserEntity.setLockTime(new Date());
                                //年龄从身份证中读取
                                int age = IdcardUtil.getAgeByIdCard(identity);
                                sysUserEntity.setAge(age);
                                sysUserEntityList.add(sysUserEntity);
                                break;
                            }
                        }

                    }
                }

            }
            boolean saveBatch = sysUserService.saveBatch(sysUserEntityList,roleId);

            return R.ok("保存用户数据成功").put("data", saveBatch);
        } catch (IOException e) {
            return R.error("导入用户失败");
        }
    }

}
