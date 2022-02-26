package com.pxx.collegecourseselectionsystem.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.pxx.collegecourseselectionsystem.dto.classroom.FloorDto;
import com.pxx.collegecourseselectionsystem.entity.ClassroomRoof;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

/**
 * @author Gpxx
 * @Date 2022/2/26 13:14
 */
@Getter@Setter@ToString
public class ClassroomRoofDto extends ClassroomRoof {
    /**
     * 层
     */
    @JsonProperty(access = JsonProperty.Access.READ_ONLY)
    private List<FloorDto> floorDtoList;
}
