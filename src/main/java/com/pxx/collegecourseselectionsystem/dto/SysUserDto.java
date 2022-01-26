package com.pxx.collegecourseselectionsystem.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.pxx.collegecourseselectionsystem.entity.SysUserEntity;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.NotNull;

@ToString@Getter@Setter
public class SysUserDto extends SysUserEntity {
    /**
     * 部门名称
     */
    @JsonProperty(access = JsonProperty.Access.READ_ONLY)
    private String unitName;
    /**
     * 单位id
     */
    @ApiModelProperty("部门id")
    @NotNull
    private Integer unitId;
    /**
     * 角色名称
     */
    @JsonProperty(access = JsonProperty.Access.READ_ONLY)
    private String roleName;
    /**
     * 角色id
     */
    @ApiModelProperty("角色id")
    @NotNull
    private Long roleId;
}
