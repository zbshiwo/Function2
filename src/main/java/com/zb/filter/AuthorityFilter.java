package com.zb.filter;

import javax.servlet.*;
import java.io.IOException;

public class AuthorityFilter implements Filter {
    public void destroy() {
        System.out.println("Authority filter destroy!");
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {
        System.out.println("Authority filter init!");
    }

}
