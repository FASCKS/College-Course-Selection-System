package com.pxx.collegecourseselectionsystem.vo.course;

import cn.hutool.core.lang.tree.TreeNode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * 自定义菜单节点
 *
 * @param <T>
 */
@Getter
@Setter
@ToString
public class MenuTreeNode<T> extends TreeNode<T> {
    private String url;
    private Integer status;
    private Integer type;

    /**
     * 构造
     *
     * @param id       ID
     * @param parentId 父节点ID
     * @param name     名称
     * @param weight   权重
     */
    public MenuTreeNode(T id, T parentId, String name, Comparable weight, String url, Integer status, Integer type) {
        super(id, parentId, name, weight);
        this.url = url;
        this.status = status;
        this.type = type;
    }
}
