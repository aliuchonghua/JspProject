<%@ page import="com.westos.servlet.bean.ShengFen" %>
<%@ page import="java.util.List" %>
<%@ page import="com.westos.servlet.Service.CityService" %>
<%@ page import="org.apache.commons.lang3.StringUtils" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/24
  Time: 13:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    response.setCharacterEncoding("utf-8");
    request.setCharacterEncoding("utf-8");
%>
<%!
    List<ShengFen> city = new CityService().initShengfen();
%>
<html>
<head>
    <title>省市联动jsp</title>
</head>
<body>
<%
    String shengfen = request.getParameter("sheng");
    String shi = request.getParameter("city");
    //el表达式,优先级依次降低
    //这四个的作用范围依次增大
    pageContext.setAttribute("sheng", shengfen);
    request.setAttribute("sheng2", shengfen);
    session.setAttribute("sheng3",shengfen);
    application.setAttribute("sheng4", shengfen);
%>
<form action="" method="post" name="from1">
    省份:
    <select name="sheng" onchange="dosubmit()">
        <option>请选择省份</option>
        <%
            ShengFen selectedshengfen = null;
            for (ShengFen sheng : this.city) {
                String selected = "";
                if (StringUtils.equals(shengfen, sheng.getName())) {
                    selected = "selected";
                    selectedshengfen = sheng;
                }
                out.println("<option value='" + sheng.getName() + "' " + selected + ">" + sheng.getName() + "</option>");
            }
        %>
    </select>


    <%
        if (shengfen != null) {
            out.println(" 城市:<select name=\"city\" onchange=\"dosubmit()\">");
            out.println("<option >请选择城市</option>");
            for (String city : selectedshengfen.getCity()) {
                String selected = "";
                if (StringUtils.equals(shi, city)) {
                    selected = "selected";
                }
                out.println("<option value='" + city + "' " + selected + ">" + city + "</option>");
            }
        }
        out.println("</select>");
    %>

    <h3>
        你选择的是:
        <%
            if (shengfen != null) {
                out.print(shengfen);
            }
            if (shi != null) {
                out.print(shi);
            }
        %>

    </h3>
    <h4>pageContext:${sheng}</h4>
    <h4>request:${sheng2}</h4>
    <h4>session:${sheng3}</h4>
    <h4>application:${sheng4}</h4>



</form>
</body>
<script type="text/javascript">
    function dosubmit() {
        from1.submit()
    }
</script>
</html>
