package com.zb.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.regex.Pattern;

public class limitFilter implements Filter {
    public void destroy() {
        System.out.println("limit filter destroy!");
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest httpServletRequest = (HttpServletRequest)req;
        HttpServletResponse httpServletResponse = (HttpServletResponse)resp;

        String pageID = httpServletRequest.getParameter("pageId");
        String p = "[1-9]";
        pageID = pageID == null || pageID.length() == 0 || !Pattern.matches(p, pageID)
                ? "1" : pageID;

        Boolean result = (Boolean) httpServletRequest.getAttribute("result");
        String servletPath = httpServletRequest.getServletPath();
        String url = httpServletRequest.getHeader("REFERER");

        if (servletPath.contains(".css") || servletPath.contains(".js")) {
            chain.doFilter(httpServletRequest, httpServletResponse);
        }
        else {
            String pattern = "/[a-zA-Z]+/[a-zA-Z]+";
            boolean isMatch = Pattern.matches(pattern, servletPath);
            if (!result && isMatch) {
                httpServletRequest.setAttribute("message", "请先登陆！");
                httpServletRequest.setAttribute("url", url);
                httpServletRequest.getRequestDispatcher("/WEB-INF/views/error/error.jsp")
                        .forward(httpServletRequest, httpServletResponse);
                return;
            } else {
                httpServletRequest.setAttribute("pageId", pageID);
                chain.doFilter(httpServletRequest, httpServletResponse);
            }
        }

    }

    public void init(FilterConfig config) throws ServletException {
        System.out.println("limit filter init!");
    }

}
