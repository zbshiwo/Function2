package com.zb.filter;

import com.zb.dao.StudentDao;
import com.zb.dao.daoImpl.StudentDaoImpl;
import com.zb.model.Student;
import com.zb.util.CookiesUtil;
import com.zb.util.StringUtil;

import javax.servlet.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import java.util.regex.Pattern;

public class TestFilter implements Filter {
    public void destroy() {
        System.out.println("TestFilter destroy");
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest httpServletRequest = (HttpServletRequest)req;
        HttpServletResponse httpServletResponse = (HttpServletResponse)resp;

        boolean result = false;
        String username = null;
        String pageID = httpServletRequest.getParameter("pageId");
        String p = "[1-9]";
        pageID = pageID == null || pageID.length() == 0 || !Pattern.matches(p, pageID)
                ? "1" : pageID;
        Cookie cookie = CookiesUtil.getCookieByName(httpServletRequest, "userInfo");
        if (cookie != null) {
            StudentDao studentDao = new StudentDaoImpl();
            String formatRase64 = StringUtil.getFormatBase64(cookie.getValue());
            username = formatRase64.split(":")[0];

            Student student = studentDao.queryByName(formatRase64.split(":")[0]);
            String str = StringUtil.getMD5Str(student.getLogin_name() + student.getPassword(), "UTF-8");
            result = str.equals(formatRase64.split(":")[1]);
        }
        String servletPath = httpServletRequest.getServletPath();
        String url = httpServletRequest.getRequestURI();
        if (servletPath.contains(".jsp")) {
            httpServletRequest.setAttribute("result", result);
            httpServletRequest.setAttribute("username", username);

            chain.doFilter(httpServletRequest, httpServletResponse);
        }
        else if (servletPath.contains(".css") || servletPath.contains(".js")) {
            chain.doFilter(httpServletRequest, httpServletResponse);
        }
        else {
            String pattern = "/[a-zA-Z]+/[a-zA-Z]+";
            boolean isMatch = Pattern.matches(pattern, servletPath);
            if (!result && isMatch) {
                httpServletRequest.getRequestDispatcher("/WEB-INF/views/error/error.html")
                        .forward(httpServletRequest, httpServletResponse);
                return;
            }
            else {
                httpServletRequest.setAttribute("result", result);
                httpServletRequest.setAttribute("username", username);
                httpServletRequest.setAttribute("pageId", pageID);
                chain.doFilter(httpServletRequest, httpServletResponse);
            }
        }
    }

    public void init(FilterConfig config) throws ServletException {
        System.out.println("TestFilter first init");
    }

}
