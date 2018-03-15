package com.zb.db;

import java.sql.*;

public class DBUtil {

    public static final String URL = "jdbc:mysql://localhost:3306/function";
    public static final String USER = "root";
    public static final String PASSWORD = "asdfghjkl";

    public static Connection getConnection(){
        Connection connection = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public static void closeAll(ResultSet resultSet, PreparedStatement preparedStatement, Connection connection){
        try {
            if (resultSet != null) {
                resultSet.close();
            }

            if (preparedStatement != null) {
                preparedStatement.close();
            }

            if (connection != null){
                connection.close();
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

//    public static void main(String[] args) {
//        Connection connection = null;
//        PreparedStatement preparedStatement = null;
//
//        Statement statement = null;
//        ResultSet resultSet = null;
//        try {
//            int a = Integer.parseInt("123x");
//        }catch (NumberFormatException e){
//            e.printStackTrace();
//        }
//        try {
//            Class.forName("com.mysql.jdbc.Driver");
//            connection = DriverManager.getConnection(URL, USER, PASSWORD);
//            statement = connection.createStatement();
//
//            resultSet = statement.executeQuery("SELECT * FROM student");
//            while (resultSet.next()){
//                System.out.println(resultSet.getString("student_name"));
//                System.out.println(resultSet.getString("login_name"));
//                System.out.println(resultSet.getString("password"));
//            }
//        } catch (ClassNotFoundException e) {
//            e.printStackTrace();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } finally {
//            try {
//                if (resultSet != null) {
//                    resultSet.close();
//                }
//                if (statement != null){
//                    statement.close();
//                }
//                if (connection != null) {
//                    connection.close();
//                }
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }
//        }
//    }
}
