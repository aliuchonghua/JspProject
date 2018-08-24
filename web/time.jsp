<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/24
  Time: 10:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    response.setCharacterEncoding("utf-8");
    request.setCharacterEncoding("utf-8");
%>
<html>
<head>
    <title>时间显示</title>
</head>
<body>
<h3>你好今天是:
    <%
        Date today = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("dd日,星期W ");
        String day = sdf.format(today);
    %>
    <%=today.getDate()%>号,星期<%=today.getDay()%>
</h3>
<%=day%>

//引用外部网页
<%@include file="hello.html" %>
</body>
</html>
