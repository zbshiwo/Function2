package com.zb.dao;

import com.zb.model.StudentInfo;

import java.util.ArrayList;

public interface StudentInfoDao {
    //增加学生成绩
    public void addStudentInfo(StudentInfo[] studentInfo);
    //通过sid和module_name查询学生成绩
    public ArrayList<StudentInfo> queryBySidAndModuleName(int sid);
    //通过sid和module_name修改学生成绩
    public void updateScoreBySidAndModuleName(int sid, String moduleName, int score);
    //通过sid和module_name修改学生limit
    public void updateLimitsBySidAndModuleName(int sid, String moduleName, byte limits);
}
