package com.zb.dao.daoImpl;

import com.zb.dao.StudentDao;
import com.zb.db.DBUtil;
import com.zb.model.Student;

import java.sql.*;

public class StudentDaoImpl implements StudentDao {
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    @Override
    public void addStudent(Student student) {
        String sql = "insert into student (student_name, login_name, password) values (?, ?, ?)";

        try{
            connection = DBUtil.getConnection();
            preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, student.getStudent_name());
            preparedStatement.setString(2, student.getLogin_name());
            preparedStatement.setString(3, student.getPassword());

            preparedStatement.executeUpdate();
            System.out.println("添加学生成功!");

        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            DBUtil.closeAll(resultSet, preparedStatement, connection);
        }
    }

    @Override
    public void updateStudent(Student student) {

    }

    @Override
    public Student queryByName(String name) {
        String sql = "SELECT * FROM student WHERE login_name = ?";
        Student student = null;

        try {
            connection = DBUtil.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, name);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()){
                student = new Student();
                student.setId(resultSet.getInt("id"));
                student.setStudent_name(resultSet.getString("student_name"));
                student.setLogin_name(resultSet.getString("login_name"));
                student.setPassword(resultSet.getString("password"));
            }
        } catch (SQLException e) {
            DBUtil.closeAll(resultSet, preparedStatement, connection);
        }

        return student;
    }

    @Override
    public boolean isRegisterByLogin_Name(String login_name) {
        String sql = "SELECT * FROM student WHERE login_name = ?";
        boolean result = false;
        try {
            connection = DBUtil.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, login_name);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()){
                result = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeAll(resultSet, preparedStatement, connection);
        }

        return result;
    }

    @Override
    public boolean isCorrect(String username, String password) {
        String sql = "SELECT * FROM student WHERE login_name = ?";
        boolean result = false;

        try {
            connection = DBUtil.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, username);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next() && resultSet.getString("password").equals(password)) {
                result = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeAll(resultSet, preparedStatement, connection);
        }
        return result;
    }
}
