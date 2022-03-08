package com.pxx.collegecourseselectionsystem.dto.unit;

import cn.hutool.core.lang.tree.TreeNode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


/**
 * @author Gpxx
 * @Date 2022/3/8 10:25
 */
@Getter@Setter@ToString
public class UnitNode<T> extends TreeNode<T> {
    private String code;
    private Integer type;

    /**
     * 空构造
     */
    public UnitNode(String code, Integer type) {
        this.code = code;
        this.type = type;
    }

    /**
     * 构造
     *
     * @param id       ID
     * @param parentId 父节点ID
     * @param name     名称
     * @param weight   权重
     */
    public UnitNode(T id, T parentId, String name, Comparable<?> weight, String code, Integer type) {
        super(id, parentId, name, weight);
        this.code = code;
        this.type = type;
    }
}
