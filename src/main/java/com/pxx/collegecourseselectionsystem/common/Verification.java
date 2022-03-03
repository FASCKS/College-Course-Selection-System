package com.pxx.collegecourseselectionsystem.common;

/**
 * @author Gpxx
 * @Date 2022/3/3 10:26
 */
public interface Verification<T> {
    /**
     * 进行校验
     * @param t
     */
    default void check(T t) {

    }

    /**
     *
     * @param t
     */
    default void parameter(T t) {

    }
}
