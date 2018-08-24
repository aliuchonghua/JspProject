package com.westos.servlet.javawebservlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class javawebServlet extends javax.servlet.http.HttpServlet {
    @Override
    public void destroy() {
        System.out.println("server被销毁");
        super.destroy();
    }

    @Override
    public void init() throws ServletException {
        System.out.println("server初始化");
        super.init();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("dopost");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding("utf-8");
        response.setContentType("utf-8");
        response.getWriter().print("<!DOCTYPE html> <html lang=\"zh-CN\"> <head> <meta charset=\"utf-8\"> <meta http-equiv=\"X-UA-Compatible\" content=\"IE-edge\"> <meta name=\"viewport\" content=\"width=device-width,initial-scale=1\"> <title>vue01</title>  </head> <body>");
        response.getWriter().print("<h1>你好</h1>");
        response.getWriter().print("</body></html>");
    }
}
