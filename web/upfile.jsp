<%--cout导报--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="java.util.List" %>
<%@ page import="org.apache.commons.fileupload.FileItem" %>
<%@ page import="java.io.OutputStream" %>
<%@ page import="java.io.FileOutputStream" %>
<%@ page import="java.io.File" %>
<%@ page import="org.apache.commons.io.IOUtils" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/29
  Time: 16:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%


    //创建上传文件操作工厂
    DiskFileItemFactory factory=new DiskFileItemFactory();
    //设置缓冲区大小
    factory.setSizeThreshold(8*1024);
    //创建上传组建
    ServletFileUpload servletFileUpload=new ServletFileUpload(factory);
    //总大小
    //servletFileUpload.setSizeMax();
    //设置单文件大小
    servletFileUpload.setFileSizeMax(1024*1024*40);
    //解析请求
    List<FileItem> items = servletFileUpload.parseRequest(request);
    //遍历输出items
    for(FileItem item:items){
        // isFormField 是否普通输入框(除type=file以外的输入框)
        if(item.isFormField()){
            //如果是普通输入框
            System.out.println(item.getFieldName());
            System.out.println(item.getString());
        }else{
            //文件上传
            System.out.println("获得文件上传的值");
            System.out.println(item.getFieldName());
            System.out.println(item.getName());
            pageContext.setAttribute("filename",item.getName());
            //建立白名单或黑名单机制
            //黑名单
            if(item.getName().endsWith(".jsp")){
                response.getWriter().println("<h1>上传文件格式非法!</h1>");
                return;
            }
            //创建白名单机制
            //TODO:保证文件名的唯一性
            //获取输入流并保存到文件
            //获取项目的真实路径
            String realpath=request.getServletContext().getRealPath("/");
            String filename=realpath+File.separator+item.getName();
            OutputStream os=new FileOutputStream(new File(filename));
            IOUtils.copy(item.getInputStream(),os);

        }
    }
%>
<img src="<c:out value="${filename}"/>" />