package com.zb.dao;

import com.zb.model.Student;

public interface StudentDao {
    //增加学生
    public void addStudent(Student student);
    //学生修改密码
    public void updateStudent(Student student);
    //根据登录名查询学生信息
    public Student queryByName(String LoginName);
    //学生注册时,查询登录名是否已经被注册
    public boolean isRegisterByLogin_Name(String login_name);
    //学生登录时,判断用户名密码是否正确
    public boolean isCorrect(String username, String password);
}
