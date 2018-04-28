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

        String pageId = httpServletRequest.getParameter("pageId");
        String p = "[1-9]";
        pageId = pageId == null
                || pageId.length() == 0
                || !Pattern.matches(p, pageId)
                ? "1" : pageId;

/*
DNS规定，域名中的标号都由英文字母和数字组成，每一个标号不超过63个字符，也不区分大小写字母。标号中除连字符（-）外
不能使用其他的标点符号。级别最低的域名写在最左边，而级别最高的域名写在最右边。由多个标号组成的完整域名总共不超过255个字符。
由此匹配完整域名的正则表达式：
   ^(?=^.{3,255}$)[a-zA-Z0-9][-a-zA-Z0-9]{0,62}(\.[a-zA-Z0-9][-a-zA-Z0-9]{0,62})+$
    例如：baidu.com
    匹配网址：
    ^(?=^.{3,255}$)(http(s)?:\/\/)?(www\.)?[a-zA-Z0-9][-a-zA-Z0-9]{0,62}(\.[a-zA-Z0-9][-a-zA-Z0-9]{0,62})+(:\d+)*(\/\w+\.\w+)*$
    例如： http://www.baidu.com
    匹配http url：
    ^(?=^.{3,255}$)(http(s)?:\/\/)?(www\.)?[a-zA-Z0-9][-a-zA-Z0-9]{0,62}(\.[a-zA-Z0-9][-a-zA-Z0-9]{0,62})+(:\d+)*(\/\w+\.\w+)*([\?&]\w+=\w*)*$
    例如： http://www.tetet.com/index.html?q=1&m=test
*/
        Boolean result = (Boolean)httpServletRequest.getAttribute("result");
        String servletPath = httpServletRequest.getServletPath();
        String url = "http://" + httpServletRequest.getServerName()
                + ":" +httpServletRequest.getServerPort()
                + httpServletRequest.getContextPath();
        //getServerName()  得到的是localhost
        //getServletPath() 得到的是/learnC/function
        //getContextPath() 得到的是/learnC
        //getServerPort() 得到的是80
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
                httpServletRequest.setAttribute("isMatch", isMatch);
                httpServletRequest.setAttribute("pageId", pageId);
                chain.doFilter(httpServletRequest, httpServletResponse);
            }
        }
    }

    public void init(FilterConfig config) throws ServletException {
        System.out.println("limit filter init!");
    }

}
