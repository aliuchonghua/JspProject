<%@ page import="java.io.InputStream" %>
<%@ page import="org.apache.commons.io.IOUtils" %>
<%@ page import="com.alibaba.fastjson.JSON" %>
<%@ page import="com.alibaba.fastjson.JSONObject" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.alibaba.fastjson.serializer.SerializerFeature" %>
<%@ page import="com.westos.servlet.Service.StudentVueService" %>
<%@ page import="com.westos.servlet.Service.StudentVueServiceImpl" %>
<%@ page import="com.westos.servlet.bean.Studentvue" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/30
  Time: 9:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //添加的方法
    String name = request.getParameter("name");
    String number = request.getParameter("number");

    if (name == null) {
        //JSON按流方式接受
        InputStream in = request.getInputStream();
        //输入流转换为字符串
        String s = IOUtils.toString(in, "utf-8");
        //字符串转换为JSON
        JSONObject jsonObject = JSON.parseObject(s);
        //获取参数
        name = jsonObject.getString("name");
        number = jsonObject.getString("number");
    }
//    从application中获取users
    Map users = (Map) application.getAttribute("users");
    //创建JSON
    JSONObject json = new JSONObject();
    //如果为空初始化MAP

    //服务器数据库
    StudentVueServiceImpl svs=new StudentVueServiceImpl();


    if (users == null) {
        users = new HashMap();
        //如果不为空就添加
        if (!name.isEmpty() && !number.isEmpty()) {
            users.put(number, name);

            //向数据库添加
            svs.add(new Studentvue(Integer.parseInt(number),name));

        }
        //集合写入application
        application.setAttribute("users", users);
        //回执信息写入json
        json.put("msg", "初始化并添加成功");
        //如果姓名和学号有一个为空则不添加只返回信息
    } else if (name.isEmpty() || number.isEmpty()) {
        json.put("msg", "姓名或学号不能为空");
    } else if (users.containsKey(number)) {
        json.put("msg", "学号重复无法添加");
    } else {
        //初始化完成后只添加
        users.put(number, name);
        json.put("msg", "添加成功");

        //向数据库添加
        svs.add(new Studentvue(Integer.parseInt(number),name));

    }
    //集合写入json
    json.put("users", users);
    //传回json
    out.println(JSON.toJSONString(json, SerializerFeature.WriteSlashAsSpecial));


%>