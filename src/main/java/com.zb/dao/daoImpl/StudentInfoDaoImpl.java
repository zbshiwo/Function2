package com.zb.dao.daoImpl;

import com.zb.dao.StudentInfoDao;
import com.zb.db.DBUtil;
import com.zb.model.StudentInfo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class StudentInfoDaoImpl implements StudentInfoDao {
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    @Override
    public void addStudentInfo(StudentInfo[] studentInfo) {
        String sql = "INSERT INTO studentInfo (sid, module_name, score, limits) VALUES (?, ?, ?, ?)";

        try{
            connection = DBUtil.getConnection();
            preparedStatement = connection.prepareStatement(sql);

            for (int i = 0; i < studentInfo.length; i++) {
                preparedStatement.setInt(1, studentInfo[i].getSid());
                preparedStatement.setString(2, studentInfo[i].getModule_name());
                preparedStatement.setInt(3, studentInfo[i].getScore());
                preparedStatement.setByte(4, studentInfo[i].getLimits());
                preparedStatement.executeUpdate();
            }

        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            DBUtil.closeAll(resultSet, preparedStatement, connection);
        }
    }

    @Override
    public ArrayList<StudentInfo> queryBySidAndModuleName(int sid) {
        String sql = "SELECT * FROM studentInfo WHERE sid = ?";
        ArrayList<StudentInfo> arrayList = new ArrayList<>();
        StudentInfo studentInfo = null;
        try {
            connection = DBUtil.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, sid);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()){
                studentInfo = new StudentInfo();
                studentInfo.setId(resultSet.getInt("id"));
                studentInfo.setSid(resultSet.getInt("sid"));
                studentInfo.setModule_name(resultSet.getString("module_name"));
                studentInfo.setScore(resultSet.getInt("score"));
                studentInfo.setLimits(resultSet.getByte("limits"));
                arrayList.add(studentInfo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeAll(resultSet, preparedStatement, connection);
        }
        return arrayList;
    }

    @Override
    public void updateScoreBySidAndModuleName(int sid, String moduleName, int score) {
        String sql = "UPDATE studentinfo SET score = ? WHERE sid = ? AND module_name = ?";
        try {
            connection = DBUtil.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, score);
            preparedStatement.setInt(2, sid);
            preparedStatement.setString(3, moduleName);
            resultSet = preparedStatement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeAll(resultSet, preparedStatement, connection);
        }
    }
}
