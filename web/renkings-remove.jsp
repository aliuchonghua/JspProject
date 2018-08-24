<%@ page import="java.io.InputStream" %>
<%@ page import="org.apache.commons.io.IOUtils" %>
<%@ page import="com.alibaba.fastjson.JSONObject" %>
<%@ page import="com.alibaba.fastjson.JSON" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.alibaba.fastjson.serializer.SerializerFeature" %>
<%@ page import="com.westos.servlet.Service.StudentVueService" %>
<%@ page import="com.westos.servlet.Service.StudentVueServiceImpl" %><%--
  Created by IntelliJ IDEA.
  User: aliuc
  Date: 2018/7/30
  Time: 23:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //删除的方法
    //JSON按流方式接受
    InputStream in = request.getInputStream();
    //输入流转换为字符串
    String s = IOUtils.toString(in, "utf-8");
    //字符串转换为JSON
    JSONObject jsonObject = JSON.parseObject(s);
    //获取参数
    String number = jsonObject.getString("number");
    //获取map
    Map users = (Map) application.getAttribute("users");
    //创建json
    JSONObject json = new JSONObject();
    //通过键删除
    users.remove(number);

    //数据库删除
    StudentVueServiceImpl svs=new StudentVueServiceImpl();
    svs.remove(Integer.parseInt(number));

    json.put("users", users);
    //返回
    out.println(JSON.toJSONString(json, SerializerFeature.WriteSlashAsSpecial));
%>
