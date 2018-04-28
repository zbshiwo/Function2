package com.zb.servlet;

import com.zb.dao.StudentDao;
import com.zb.dao.daoImpl.StudentDaoImpl;
import com.zb.util.CookiesUtil;
import com.zb.util.StringUtil;

import javax.servlet.http.Cookie;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

public class LoginServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        response.setContentType("text/json; charset=UTF-8");

        String username = null, password = null;
        String userInfo = request.getParameter("userInfo");
        String json1 = "{\"message\":\"error!\",\"success\":\"false\"}";
        String json2 = "{\"message\":\"correct!\",\"success\":\"true\"}";
        PrintWriter out = response.getWriter();

        if (userInfo == null || userInfo.split(",").length < 2) {
            out.write(json1);
            out.close();
        }
        username = userInfo.split(",")[0];
        password = userInfo.split(",")[1];

        StudentDao studentDao = new StudentDaoImpl();
        boolean result = studentDao.isCorrect(username, password);

        if (result){
            String md5Result = StringUtil.getMD5Str(username + password, "UTF-8");
            String base64Result = StringUtil.getBase64(username + ":" + md5Result);

            response = CookiesUtil.setCookie(response,"userInfo", base64Result, 24*60*60);

            out.write(json2);
        }else {
            out.write(json1);
        }
        out.close();
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        doPost(request, response);
    }
}
