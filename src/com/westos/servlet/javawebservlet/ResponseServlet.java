package com.westos.servlet.javawebservlet;



import org.apache.commons.io.IOUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.Collection;

public class ResponseServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //response发送给用户的信息
        response.setCharacterEncoding("utf-8");
        response.setContentType("utf-8");
        //request接收到客服端的信息
        request.setCharacterEncoding("utf-8");

        //获取头文件的集合response.getHeaderNames()
        Collection<String> headers=response.getHeaderNames();
        for(String h:headers){
            System.out.println(h+"="+response.getHeader(h));
        }
        //读取一个文件
        response.setContentType("image/png");//设置浏览器输出的文件的类型
        String filename=request.getParameter("filename");//通过一个变量可以通过浏览器地址栏来设置文件地址

        //读取文件
        //创建文件对象
        File file=new File(filename);
        //使用输入流读文件
        InputStream in=new FileInputStream(file);

        //response.getOutputStream()获取输出流
        OutputStream os=response.getOutputStream();
        //拷贝文件,向输出流中写文件后文件就会输出到浏览器
        IOUtils.copy(in,os);

        in.close();
        os.flush();
        os.close();


    }
}
