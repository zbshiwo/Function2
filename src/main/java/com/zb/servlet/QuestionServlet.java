package com.zb.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class QuestionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pageId = (String) request.getAttribute("pageId");
        request.setAttribute("pageId", pageId);
        request.getRequestDispatcher("/WEB-INF/views/function/question_" + pageId + ".jsp").forward(request, response);
    }
}
