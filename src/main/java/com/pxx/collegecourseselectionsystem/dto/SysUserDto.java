package com.pxx.collegecourseselectionsystem.dto;

import com.pxx.collegecourseselectionsystem.entity.SysUserEntity;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@ToString@Getter@Setter
public class SysUserDto extends SysUserEntity {
    /**
     * 部门名称
     */
    @NotBlank
    private String unitName;
    /**
     * 单位id
     */
    @NotNull
    private Integer unitId;
    /**
     * 角色名称
     */
    @NotBlank
    private String roleName;
    /**
     * 角色id
     */
    @NotNull
    private Long roleId;
}
