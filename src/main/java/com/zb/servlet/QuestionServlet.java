package com.zb.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Properties;

public class QuestionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pageId = (String) request.getAttribute("pageId");

        int length = Integer.parseInt(readSrcDirPropCfgFile("FUNCTION_QUESTION_PAGE_" + pageId + "_LENGTH", pageId));
        ArrayList<ArrayList> arrayList = new ArrayList<>();
        for (int i = 1; i <= length; i++) {
            int length1 = Integer.parseInt(readSrcDirPropCfgFile("FUNCTION_QUESTION_" + i + "_LENGTH", pageId));
            ArrayList<String> arrayList1 = new ArrayList<>();
            arrayList1.add(readSrcDirPropCfgFile("FUNCTION_QUESTION_" + i, pageId));
            for (int j = 1; j <= length1; j++) {
                arrayList1.add(readSrcDirPropCfgFile("FUNCTION_QUESTION_" + i + "_ANSWER_" + j, pageId));
            }
            arrayList.add(arrayList1);
        }

        request.setAttribute("pageId", pageId);
        request.setAttribute("arrayList", arrayList);
        request.getRequestDispatcher("/WEB-INF/views/function/question_1.jsp").forward(request, response);
    }
    public String readSrcDirPropCfgFile(String key, String pageId) throws IOException {
        String path = "/WEB-INF/classes/question" + pageId + ".properties";
        InputStreamReader in = new InputStreamReader(this.getServletContext().getResourceAsStream(path), "UTF-8");
        Properties props = new Properties();
        props.load(in);
        String value = props.getProperty(key);

        return value;
    }
}
