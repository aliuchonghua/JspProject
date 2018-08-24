<%@ page import="java.util.List" %>
<%@ page import="com.westos.servlet.bean.Student" %>
<%@ page import="com.westos.servlet.Service.StudentService" %>
<%@ page import="org.apache.commons.lang3.StringUtils" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/25
  Time: 10:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //设置编码格式
    response.setCharacterEncoding("utf-8");
    request.setCharacterEncoding("utf-8");
%>
<%!
    //获取服务器java文件中的集合
    List<Student> list = StudentService.getList();
    //输入框默认显示的内容
    String name1 = "";
    String number1 = "";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>排行榜</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
</head>
<body>
<%
    //获取输入框中的内容
    String name = request.getParameter("name");
    String number = request.getParameter("number");
    //获取查询输入框的内容
    String findname = request.getParameter("findname");
    String findnumber = request.getParameter("findnumber");
    //获取指令
    String txt = request.getParameter("txt");
%>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h3>排行榜</h3>
            <table class="table table-hover">
                <tr>
                    <th>姓名</th>
                    <th>学号</th>
                    <th>删除</th>
                    <th>修改</th>
                </tr>
                <%
                    //添加
                    if (name != "" && name != null) {
                        if (number != "" && number != null) {
                            if (list != null) {
                                //添加
                                StudentService.addList(name, number);
                                name1 = "";
                                number1 = "";
                            }
                        }
                    }

                    //批量添加
                    if (StringUtils.equals(txt, "adds")) {
                        StudentService.addLists();
                        name1 = "";
                        number1 = "";
                    }

                    //排序
                    if (list != null) {
                        if (StringUtils.equals(txt, "sort")) {
                            StudentService.sort();
                            name1 = "";
                            number1 = "";
                        }
                    }

                    //清空
                    if (StringUtils.equals(txt, "clear")) {
                        StudentService.clear();
                        name1 = "";
                        number1 = "";
                    }

                    //删除
                    try {
                        String[] arr = txt.split("=");
                        if (StringUtils.equals(arr[0], "remove")) {
                            StudentService.remove(arr[1], arr[2]);
                            name1 = "";
                            number1 = "";
                        }
                    } catch (Exception e) {
                        System.err.println("删除错误:当前无法分割,txt=" + txt);
                    }

                    //修改
                    try {
                        String[] arr = txt.split("=");
                        if (StringUtils.equals(arr[0], "revise")) {
                            Student revise = StudentService.revise(arr[1], arr[2]);
                            name1 = revise.getName();
                            number1 = revise.getNum();
                        }
                    } catch (Exception e) {
                        System.err.println("修改错误:当前无法分割,txt=" + txt);
                    }
                %>
                <%
                    //遍历表格
                    if (list != null) {
                        for (Student s : list) {
                            out.print("<tr");
                            //查找功能
                            if (StudentService.find(findname, findnumber)) {
                                if (StringUtils.equals(findname, s.getName()) && StringUtils.equals(findnumber, s.getNum())) {
                                    out.print(" class='info' ");
                                    findname="";
                                    findnumber="";
                                } else {
                                    if (StringUtils.equals(findname, s.getName()) || StringUtils.equals(findnumber, s.getNum())) {
                                        out.print(" class='info' ");
                                    }
                                }
                            }
                            out.println(">");
                            out.println("<td>" + s.getName() + "</td>");
                            out.println("<td>" + s.getNum() + "</td>");
                            //style='cursor:pointer'鼠标形状变为手性
                            out.println("<td onclick='remove(this)' style='cursor:pointer'>删除</td>");
                            out.println("<td onclick='revise(this)' style='cursor:pointer'>修改</td>");
                            out.println("</tr>");
                        }
                    }
                %>
            </table>
            <form action="" method="post" class="form-inline" name="form1">
                <div class="form-group">
                    <label>姓名:</label>
                    <input type="text" id="name" value="<%=name1%>" class="form-control" placeholder="请输入姓名"
                           name="name"/>
                </div>
                <div class="form-group">
                    <label>学号:</label>
                    <input type="text" id="number" value="<%=number1%>" class="form-control" placeholder="请输入学号"
                           name="number" onkeyup="this.value=this.value.replace(/\D/g, '')"/>
                </div>
                <button type="button" class="btn btn-default" onclick="add()">添加</button>
                <button type="button" class="btn btn-default" onclick="adds()">批量添加</button>
                <button type="button" class="btn btn-default" onclick="clearStudent()">清空</button>
                <button type="button" class="btn btn-default" onclick="sort()">排序</button>

                <%--指令输入框--%>
                <input type="text" id="txt" name="txt" style="display: none"/>
            </form>
            <span id="helpBlock" class="help-block">学号只能输入中文</span>

            <%--查找--%>
            <div id="finddiv">
                <h3>查找:</h3>
                <form action="" method="post" class="form-inline" name="form2">
                    <div class="form-group">
                        <label>姓名:</label>
                        <input type="text" class="form-control" placeholder="请输入姓名"
                               name="findname"/>
                    </div>
                    <div class="form-group">
                        <label>学号:</label>
                        <input type="text" class="form-control" placeholder="请输入学号"
                               name="findnumber" onkeyup="this.value=this.value.replace(/\D/g, '')"/>
                    </div>
                    <button type="submit" class="btn btn-default">查找</button>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    // 添加
    function add() {
        document.getElementById("txt").value = "";
        form1.submit();
    }

    // 批量添加
    function adds() {
        //发送添加指令
        document.getElementById("txt").value = "adds";
        form1.submit();

    }

    //清空
    function clearStudent() {
        //发送清空指令
        document.getElementById("txt").value = "clear";
        form1.submit();
    }

    //删除
    function remove(elm) {
        var name = elm.parentElement.cells[0].innerText;
        var num = elm.parentElement.cells[1].innerText;
        document.getElementById("txt").value = "remove=" + name + "=" + num;
        form1.submit();
    }

    //修改
    function revise(elm) {
        //parentElement获取父类元素
        //cells[0]获取当前元素中的第一个子类元素
        var name = elm.parentElement.cells[0].innerText;
        var num = elm.parentElement.cells[1].innerText;
        document.getElementById("txt").value = "revise=" + name + "=" + num;
        form1.submit();
    }

    //排序
    function sort() {
        document.getElementById("txt").value = "sort";
        form1.submit();
    }


</script>
</html>
