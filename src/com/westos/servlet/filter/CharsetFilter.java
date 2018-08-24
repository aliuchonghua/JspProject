package com.westos.servlet.filter;

import org.apache.commons.lang3.StringUtils;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(filterName = "CharsetFilter")
public class CharsetFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=UTF-8");
        //检查用户是否登录
        if(((HttpServletRequest)req).getSession().getAttribute("username")!=null){
            //用户已经登录
            chain.doFilter(req,resp);
        }else{
            //用户未登录
            //但是login.jsp和helloworldServlet除外
            String url=((HttpServletRequest)req).getRequestURI();

            if(StringUtils.endsWith(url,"login.jsp")||StringUtils.endsWith(url,"helloworld")){
                //继续请求
                chain.doFilter(req,resp);
            }else{
                //转到登录
                ((HttpServletResponse)resp).sendRedirect(((HttpServletRequest) req).getContextPath()+"/login.jsp");
            }
        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
