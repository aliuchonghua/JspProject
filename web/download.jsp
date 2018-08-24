<%@ page import="java.io.File" %>
<%@ page import="java.io.OutputStream" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="org.apache.commons.io.IOUtils" %>
<%@ page import="java.io.FileInputStream" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/31
  Time: 11:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //读文件
    File fi=new File("f:\\a.JPG");
    //重置输出
    response.reset();
    OutputStream os=response.getOutputStream();
    //指定文件名
    response.setHeader("Content-disposition","filename="+ URLEncoder.encode("图片.JPG","utf-8"));
    //写文件
    IOUtils.copy(new FileInputStream(fi),os);
    os.flush();
    os.close();
%>
