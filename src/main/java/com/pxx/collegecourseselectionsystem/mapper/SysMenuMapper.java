package com.pxx.collegecourseselectionsystem.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.pxx.collegecourseselectionsystem.entity.SysMenuEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface SysMenuMapper extends BaseMapper<SysMenuEntity> {
    int updateBatch(List<SysMenuEntity> list);

    int batchInsert(@Param("list") List<SysMenuEntity> list);

    int insertOrUpdate(SysMenuEntity record);

    int insertOrUpdateSelective(SysMenuEntity record);

    /**
     * 返回所有菜单
     *
     * @param type 1
     * @return
     */
    List<SysMenuEntity> findMenuByType(@Param("type") Integer [] type);
}