package com.zb.dao.daoImpl;

import com.zb.dao.StudentInfoDao;
import com.zb.db.DBUtil;
import com.zb.model.StudentInfo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class StudentInfoDaoImpl implements StudentInfoDao {
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    @Override
    public void addStudentInfo(StudentInfo[] studentInfo) {
        String sql = "INSERT INTO studentInfo (sid, module_name, score) VALUES (?, ?, ?)";

        try{
            connection = DBUtil.getConnection();
            preparedStatement = connection.prepareStatement(sql);

            for (int i = 0; i < studentInfo.length; i++) {
                preparedStatement.setInt(1, studentInfo[i].getSid());
                preparedStatement.setString(2, studentInfo[i].getModule_name());
                preparedStatement.setInt(3, studentInfo[i].getScore());

                preparedStatement.executeUpdate();
            }

        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            DBUtil.closeAll(resultSet, preparedStatement, connection);
        }
    }

    @Override
    public StudentInfo queryBySidAndModuleName(int sid, String moduleName) {
        String sql = "SELECT * FROM studentInfo WHERE sid = ? AND module_name = ?";
        StudentInfo studentInfo = null;

        try {
            connection = DBUtil.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, sid);
            preparedStatement.setString(2, moduleName);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()){
                studentInfo = new StudentInfo();
                studentInfo.setId(resultSet.getInt("id"));
                studentInfo.setSid(resultSet.getInt("sid"));
                studentInfo.setModule_name(resultSet.getString("module_name"));
                studentInfo.setScore(resultSet.getInt("score"));
            }
        } catch (SQLException e) {
            DBUtil.closeAll(resultSet, preparedStatement, connection);
        }
        return studentInfo;
    }

    @Override
    public void updateScoreBySidAndModuleName(int sid, String moduleName) {

    }
}
