package com.westos.servlet.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;
import java.util.Map;

@WebFilter(filterName = "ParamterFilter")
public class ParamterFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        Map<String, String[]> map = req.getParameterMap();
        System.out.println("filter中的参数输出开始");
        System.out.println(map);
        System.out.println("filter中的参数输出结束");
        chain.doFilter(req, resp);

    }

    public void init(FilterConfig config) throws ServletException {

    }

}
