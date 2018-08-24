<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.alibaba.fastjson.JSONObject" %>
<%@ page import="com.alibaba.fastjson.serializer.SerializerFeature" %>
<%@ page import="com.alibaba.fastjson.JSON" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="org.apache.commons.io.IOUtils" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/28
  Time: 16:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //键值对方式接收用户名和密码
    String username=request.getParameter("username");
    String pwd=request.getParameter("pwd");

    //检查是键值对方式提交还是json格式提交
    if(username==null){
        //JSON数据的接收
        //按照流的方式接收
        //获取输入流
        InputStream in = request.getInputStream();
        //将输入流转换为字符串
        String jsonstr = IOUtils.toString(in, "utf-8");
        //将json字符串转换为json对象

        JSONObject jsonobj = JSON.parseObject(jsonstr);

        //从jsonobj中获取需要的参数,注意jsonobj的npe问题
        // username: 客户端提交的json串的key
        username=jsonobj.getString("username");
        pwd=jsonobj.getString("pwd");
    }

    Map users = (Map) application.getAttribute("users");

    JSONObject json=new JSONObject();
    if(users==null){
        users=new HashMap();
        users.put(username,pwd);
        application.setAttribute("users",users);
        json.put("msg","用户名不存在,注册成功");
    }else{
        if(users.containsKey(username)){
            json.put("msg","用户名已存在");
        }else{
            //注册用户
            users.put(username,pwd);
            json.put("msg","用户名不存在");
        }
    }
    json.put("users",users);
    out.println(JSON.toJSONString(json, SerializerFeature.WriteSlashAsSpecial));
%>