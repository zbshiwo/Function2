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

        int userId = 0;
        boolean result = false;
        String username = null;
        Cookie cookie = CookiesUtil.getCookieByName(httpServletRequest, "userInfo");

        if (cookie != null) {
            StudentDao studentDao = new StudentDaoImpl();
            String formatRase64 = StringUtil.getFormatBase64(cookie.getValue());
            username = formatRase64.split(":")[0];

            Student student = studentDao.queryByName(formatRase64.split(":")[0]);
            if (student == null) {
                result = false;
            }
            else {
                String str = StringUtil.getMD5Str(student.getLogin_name() + student.getPassword(), "UTF-8");
                result = str.equals(formatRase64.split(":")[1]);
                userId = student.getId();
            }
        }
        httpServletRequest.setAttribute("result", result);
        httpServletRequest.setAttribute("username", username);
        httpServletRequest.setAttribute("userId", userId);
        chain.doFilter(httpServletRequest, httpServletResponse);
    }

    public void init(FilterConfig config) throws ServletException {
        System.out.println("TestFilter first init");
    }

}
