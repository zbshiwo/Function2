package com.zb.dao.daoImpl;

import com.zb.model.Student;
import org.junit.Test;


public class StudentDaoImplTest {
    @Test
    public void addStudent() throws Exception {
        Student student = new Student();
        student.setId(0);
        student.setLogin_name("123");
        student.setStudent_name("zb");
        student.setPassword("123");
        new StudentDaoImpl().addStudent(student);
    }

    @Test
    public void isRegisterByLogin_Name() throws Exception {
        System.out.println(new StudentDaoImpl().isRegisterByLogin_Name("123"));
        System.out.println(new StudentDaoImpl().isRegisterByLogin_Name("234"));
    }

    @Test
    public void isCorret() throws Exception{

        boolean a = new StudentDaoImpl().isCorrect("123", "123");
        System.out.println(a);
    }

    @Test
    public void queryName() throws Exception{
        System.out.println(new StudentDaoImpl().queryByName("admin").getPassword());
    }
}