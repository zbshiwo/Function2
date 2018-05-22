package com.zb.servlet;

import com.zb.dao.daoImpl.StudentInfoDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Properties;

public class AnswerServlet extends HttpServlet {
    private static final String[] functionModuleName = {"function_page_one",
            "function_page_two",
            "function_page_three",
            "function_page_four",
            "function_page_five",
            "function_page_six",
            "function_page_seven",
            "function_page_eight",
            "function_page_nine"};


    public char[] readSrcDirPropCfgFile(String key) throws IOException {
        String path = "/WEB-INF/classes/answer.properties";
        InputStream in = this.getServletContext().getResourceAsStream(path);
        Properties props = new Properties();
        props.load(in);
        String value = props.getProperty(key);

        return value.toCharArray();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/json; charset=UTF-8");
        String pageId = request.getParameter("pageId");
        int userId = (int)request.getAttribute("userId");
        String result = request.getParameter("result");
        String json1 = "{\"message\":\"error!\",\"success\":\"false\"}";
        PrintWriter out = response.getWriter();

        if (result == null || result.length() == 0 || pageId == null || pageId.length() == 0) {
            out.write(json1);
            out.close();
            return;
        }

        char[] correct = readSrcDirPropCfgFile("FUNCTION_MODULE_" + pageId);
        char[] results = result.toCharArray();
        int score = 0, s = 100 / correct.length;
        for (int i = 0; i < correct.length; i++) {
            if (correct[i] == results[i]) {
                score += s;
                results[i] = 49;
            }
            else results[i] = 48;
        }
        StudentInfoDaoImpl studentInfoDao = new StudentInfoDaoImpl();
        studentInfoDao.updateScoreBySidAndModuleName(userId, functionModuleName[Integer.parseInt(pageId) - 1], score);
        if (score >= 60) {
            studentInfoDao.updateLimitsBySidAndModuleName(userId, functionModuleName[Integer.parseInt(pageId)], (byte)0);
        }
        out.write("{\"score\":\""+ score +"\",\"success\":\"true\",\"info\":\""+ String.valueOf(results) +"\"}");
        out.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
