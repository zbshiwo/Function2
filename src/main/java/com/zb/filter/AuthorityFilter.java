package com.zb.filter;

import com.zb.dao.StudentInfoDao;
import com.zb.dao.daoImpl.StudentInfoDaoImpl;
import com.zb.model.StudentInfo;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class AuthorityFilter implements Filter {
    public void destroy() {
        System.out.println("Authority filter destroy!");
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest httpServletRequest = (HttpServletRequest)req;
        HttpServletResponse httpServletResponse = (HttpServletResponse)resp;
        String servletPath = httpServletRequest.getServletPath();
        if (servletPath.contains(".css") || servletPath.contains(".js")) {
            chain.doFilter(req, resp);
            return;
        }

        int userId = (int)httpServletRequest.getAttribute("userId");
        String pageId = (String)httpServletRequest.getAttribute("pageId");
        boolean isMatch = (boolean)httpServletRequest.getAttribute("isMatch");
        if (!isMatch) {
            chain.doFilter(httpServletRequest, httpServletResponse);
        }
        else {
            StudentInfoDao studentInfoDao = new StudentInfoDaoImpl();
            ArrayList<StudentInfo> arrayList = studentInfoDao.queryBySidAndModuleName(userId);
            //这里给nav.jsp发送一个标记，从数据库中查出这个pageId的所有score放在ArrayList里面，根据这个ArrayList加载nav

            //这里拦截没有被允许的请求
            if (arrayList.get(Integer.parseInt(pageId) - 1).getLimits() != -1){
                chain.doFilter(req, resp);
            }
            else {
                httpServletRequest.setAttribute("pageId", "1");
                chain.doFilter(httpServletRequest, httpServletResponse);
            }
        }
    }

    public void init(FilterConfig config) throws ServletException {
        System.out.println("Authority filter init!");
    }

}
