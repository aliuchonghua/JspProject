<%@ page import="com.alibaba.fastjson.JSONObject" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/28
  Time: 15:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>表单验证</title>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript">
        jQuery(function () {
            jQuery("#submitbtn").click(function () {
                jQuery.get('doreg.jsp?username=' + $("#username").val() + '&pwd=' + $("#pwd").val(), function (result) {
                    if (result.indexOf("用户名已存在") >= 0) {
                        alert('用户名已存在');
                    } else {
                        alert('注册成功');
                    }
                });
            });
        });
    </script>
</head>
<body>
<form method="post" name="form1" action="">
    用户名:
    <input name="username" id="username" type="text"/>
    密码:
    <input name="pwd" id="pwd" type="password"/>
    <button type="submit" id="submitbtn">提交</button>
</form>

</body>
</html>
