package com.ppcxy.cyfm.experi.repository.jpa.info;

import com.ppcxy.common.repository.jpa.BaseRepository;
import com.ppcxy.cyfm.experi.entity.info.Course;

/**
 * course dao
 */
public interface CourseDao extends BaseRepository<Course, Long> {
    Course findByCourseNameAndCourseNumber(String courseName, String courseNumber);
}
