package com.zb.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class AnswerServlet extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/json; charset=UTF-8");

        String result = request.getParameter("result");
        String json1 = "{\"message\":\"error!\",\"success\":\"false\"}";
        String json2 = "{\"message\":\"correct!\",\"success\":\"true\"}";
        PrintWriter out = response.getWriter();

        if (result == null || result.length() == 0) {
            out.write(json1);
            out.close();
            return;
        }
        String str = request.getHeader("REFERER");
        String pattern = "(function\\/question\\?pageId\\=)(\\d)";
        Pattern p = Pattern.compile(pattern);
        Matcher m = p.matcher(str);
        if (m.find()) {

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
