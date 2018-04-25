package com.zb.servlet;

import com.zb.dao.StudentDao;
import com.zb.dao.StudentInfoDao;
import com.zb.dao.daoImpl.StudentDaoImpl;
import com.zb.dao.daoImpl.StudentInfoDaoImpl;
import com.zb.model.Student;
import com.zb.model.StudentInfo;
import com.zb.util.CookiesUtil;
import com.zb.util.StringUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class RegisterAndLoginServlet extends HttpServlet {
    private static final String[] functionModuleName = {"function_page_one","function_page_two","function_page_three",
            "function_page_four","function_page_five","function_page_six",
            "function_page_seven","function_page_eight","function_page_nine"};

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String loginName = request.getParameter("loginName");
        String trueName = request.getParameter("trueName");
        String password = request.getParameter("password");
        String rePassword = request.getParameter("repassword");
        String json1 = "{\"message\":\"error!\",\"success\":\"false\"}";
        String json2 = "{\"message\":\"correct!\",\"success\":\"true\"}";
        String json3 = "{\"message\":\"用户名已注册！\",\"success\":\"false\"}";
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/json; charset=utf-8");
        PrintWriter out = response.getWriter();

        if (loginName == null || password  == null || rePassword == null || trueName == null) {
            out.write(json1);
            out.close();
            return;
        }

        StudentDao studentDao = new StudentDaoImpl();
        if (studentDao.isRegisterByLogin_Name(loginName)) {
            out.write(json3);
            out.close();
            return;
        }
        Student student = new Student();
        student.setLogin_name(loginName);
        student.setStudent_name(trueName);
        String result = StringUtil.getMD5Str(password, "UTF-8");
        student.setPassword(result);
        studentDao.addStudent(student);

        int studentId = studentDao.queryByName(loginName).getId();
        StudentInfo[] studentInfos = new StudentInfo[functionModuleName.length];
        for (int i = 0; i < 9; i++) {
            StudentInfo studentInfo = new StudentInfo();
            studentInfo.setSid(studentId);
            studentInfo.setModule_name(functionModuleName[i]);
            studentInfo.setScore(0);
            if (i == 0)
                studentInfo.setLimits((byte)0);
            else studentInfo.setLimits((byte)-1);
            studentInfos[i] = studentInfo;
        }
        StudentInfoDao studentInfoDao = new StudentInfoDaoImpl();
        studentInfoDao.addStudentInfo(studentInfos);

        String md5Result = StringUtil.getMD5Str(loginName + result, "UTF-8");
        String base64Result = StringUtil.getBase64(loginName + ":" + md5Result);
        response = CookiesUtil.setCookie(response,"userInfo", base64Result, 24*60*60);
        out.write(json2);
        out.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
