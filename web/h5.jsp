<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/31
  Time: 9:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>H5上传下载</title>
    <script src="js/jquery.min.js"></script>
    <script type="text/javascript">
        //原生
        function upload() {
            //文件上传对象
            var data=new FormData(document.getElementById("form1"));
            //ajax对象
            var ajax=new XMLHttpRequest();
            //设置参数
            ajax.open("POST","upfile.jsp",true);
            //回调函数
            ajax.onload=function (ev) {
                console.log(ev);
                console.log(ajax);
                document.getElementById("resp").innerHTML=ajax.responseText;
            }
            //发送请求
            ajax.send(data);
        }
        //使用jquery上传
        function jqueryupload(){
            //构造formdata
            var data1=new FormData(jQuery("#form1")[0]);
            jQuery.ajax({
                type:'POST',
                url:'upfile.jsp',
                data:data1,
                processData:false,
                contentType:false,
                success:function(resp){
                    console.log(resp);
                    jQuery("#resp").html(resp);
                }
            });
        }
    </script>
</head>
<body>
<form method="post" action="upfile.jsp" id="form1" enctype="multipart/form-data">
    <input type="file" name="file1" id="file1"/>
    <button type="button" onclick="upload()" >原生文件上传</button>
    <button type="button" onclick="jqueryupload()" >jQuery文件上传</button>
</form>
<div id="resp">

</div>
</body>
</html>
