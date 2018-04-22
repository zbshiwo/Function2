package com.zb.dao;

import com.zb.model.StudentInfo;

public interface StudentInfoDao {
    //增加学生成绩
    public void addStudentInfo(StudentInfo[] studentInfo);
    //通过sid和module_name查询学生成绩
    public StudentInfo queryBySidAndModuleName(int sid, String moduleName);
    //通过sid和module_name查询学生成绩
    public void updateScoreBySidAndModuleName(int sid, String moduleName);
}
