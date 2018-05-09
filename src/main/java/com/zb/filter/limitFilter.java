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
        String servletPath = httpServletRequest.getServletPath();
        if (servletPath.contains(".css") || servletPath.contains(".js")) {
            chain.doFilter(req, resp);
            return;
        }

        Boolean result = (Boolean)httpServletRequest.getAttribute("result");
        String url = "http://" + httpServletRequest.getServerName()
                + ":" +httpServletRequest.getServerPort()
                + httpServletRequest.getContextPath();

        String pageId = httpServletRequest.getParameter("pageId");
        String p = "[1-9]";
        String pattern = "/[a-zA-Z]+/[a-zA-Z]+";
        boolean isMatch = Pattern.matches(pattern, servletPath);

        if (!result && isMatch) {
            httpServletRequest.setAttribute("message", "请先登陆！");
            httpServletRequest.setAttribute("url", url);
            httpServletRequest.getRequestDispatcher("/WEB-INF/views/error/error.jsp")
                    .forward(httpServletRequest, httpServletResponse);
            return;
        } else if (isMatch){
            //密码正确，正则也匹配，result = true, isMatch = true
            if (pageId == null || pageId.length() == 0 || !Pattern.matches(p, pageId)) {
                String path = "http://" + httpServletRequest.getServerName()
                        + ":" +httpServletRequest.getServerPort()
                        + httpServletRequest.getContextPath()
                        + httpServletRequest.getServletPath()
                        + "?pageId=1";
                httpServletResponse.sendRedirect(path);
                return;
            }
            httpServletRequest.setAttribute("isMatch", isMatch);
            httpServletRequest.setAttribute("pageId", pageId);
            chain.doFilter(httpServletRequest, httpServletResponse);
        }
        //不匹配的isMatch=false
        else {
            httpServletRequest.setAttribute("isMatch", isMatch);
            httpServletRequest.setAttribute("pageId", pageId);
            chain.doFilter(httpServletRequest, httpServletResponse);
        }
    }

    public void init(FilterConfig config) throws ServletException {
        System.out.println("limit filter init!");
    }

}
