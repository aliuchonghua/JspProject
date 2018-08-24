<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/29
  Time: 16:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>
<html>
<head>
    <title>文件上传</title>

</head>
<body>
<form method="post" action="upfile.jsp" name="form1" enctype="multipart/form-data">
    <input type="file" name="file1"/>
    <input type="submit" value="上传"/>
</form>
</body>
</html>
