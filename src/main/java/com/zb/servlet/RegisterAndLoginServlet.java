package com.zb.servlet;

import com.zb.dao.StudentDao;
import com.zb.dao.daoImpl.StudentDaoImpl;
import com.zb.model.Student;
import com.zb.util.CookiesUtil;
import com.zb.util.StringUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class RegisterAndLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String loginName = request.getParameter("loginName");
        String trueName = request.getParameter("trueName");
        String password = request.getParameter("password");
        String rePassword = request.getParameter("rePassword");

        if (loginName == null || password  == null || rePassword == null || trueName == null) {
            request.getRequestDispatcher("/WEB-INF/views/error/error.html").forward(request, response);
        }

        StudentDao studentDao = new StudentDaoImpl();
        Student student = new Student();
        student.setLogin_name(loginName);
        student.setStudent_name(trueName);
        String md5Result = StringUtil.getMD5Str(password, "UTF-8");
        student.setPassword(md5Result);
        studentDao.addStudent(student);
        String base64Result = StringUtil.getBase64(loginName + ":" + md5Result);
        response = CookiesUtil.setCookie(response,"userInfo", base64Result, 24*60*60);
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
