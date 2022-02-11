package com.pxx.collegecourseselectionsystem.dto;

import cn.hutool.core.lang.tree.Tree;
import com.baomidou.mybatisplus.annotation.TableField;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.pxx.collegecourseselectionsystem.common.validator.group.Insert;
import com.pxx.collegecourseselectionsystem.entity.SysRoleEntity;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.NotEmpty;
import java.util.List;

@Getter@Setter@ToString
public class SysRoleDto  extends SysRoleEntity {
    /**
     * 权限集合树
     */
    @JsonProperty(access = JsonProperty.Access.READ_ONLY)
    @TableField(exist = false)
    private List<Tree<Integer>> sysMenuTreeNode;

    /**
     * 新增得菜单id数组
     */
    @NotEmpty(groups = Insert.class)
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    @TableField(exist = false)
    @ApiModelProperty("新增权限需要得菜单id")
    private List<Integer> menuAuthorityIds;
}
