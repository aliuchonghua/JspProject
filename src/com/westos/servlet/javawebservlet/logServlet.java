package com.westos.servlet.javawebservlet;

import org.apache.commons.lang3.StringUtils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class logServlet extends HttpServlet {
    //用户名和密码
    private static final String username = "liuchonghua";
    private static final String password = "123456";


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding("utf-8");
        response.setContentType("utf-8");
        request.setCharacterEncoding("utf-8");
        //获取界面元素的返回值
        String use = request.getParameter("use");
        String pass = request.getParameter("pass");
        String yzm = request.getParameter("yzm");
//        前端界面
        response.getWriter().print("<!DOCTYPE html>");
        response.getWriter().print("<html><head><meta charset=\"utf-8\" />");
        response.getWriter().print("<title>登录</title><meta name=\"viewport\" content=\"width=device-width, initial-scale=1\"></head>");
        //css
        response.getWriter().print("<style type=\"text/css\"> .tst {width: 150px; } #tj {margin-left: 160px; } #bod {margin: 0; padding: 0; } #log {margin: 100px auto; width: 390px; height: 223px; border: 1px solid #000000; } .ts{width: 120px; } span{color: #f33;} .tr{color: #0f0;} </style>");
        //body
        response.getWriter().print("<body> <div id=\"bod\"> <div id=\"log\"> <form action=\"\" method=\"post\"> <table border=\"0\" cellspacing=\"10\" cellpadding=\"0\">");
        //登录
        response.getWriter().print("<tr> <th colspan=\"3\">登录</th> </tr>\n");
        //用户名
        response.getWriter().print("<tr> <td>用户名:</td> <td>");
        if (use != null) {
            response.getWriter().print("<input style=\"width:160px;\" type=\"text\" placeholder=\"请输入用户名\" name=\"use\" value='" + use + "'class=\"tst\" onclick=\"clearuser()\"/> </td> <td class=\"ts\" id=\"user\">");
        } else {
            response.getWriter().print("<input style=\"width:160px;\" type=\"text\" placeholder=\"请输入用户名\" name=\"use\" class=\"tst\" onclick=\"clearuser()\"/> </td> <td class=\"ts\" id=\"user\">");
        }
        //验证用户名是否正确
        if (use != null) {
            if (!StringUtils.equals(username, use)) {
                response.getWriter().print("<span>用户名不存在</span>");
            } else {
                response.getWriter().print("<span class=\"tr\">√</span>");

            }
        }

        response.getWriter().print("</td> </tr>\n");
        //密码
        if (pass != null) {
            response.getWriter().print("<tr> <td>密&emsp;码:</td> <td> <input style=\"width:160px;\" placeholder=\"请输入密码\" type=\"password\" name=\"pass\" class=\"tst\"  value='" + pass + "' onclick=\"clearpass()\"/> </td> <td class=\"ts\" id=\"pass\">");

        } else {
            response.getWriter().print("<tr> <td>密&emsp;码:</td> <td> <input style=\"width:160px;\" placeholder=\"请输入密码\" type=\"password\" name=\"pass\" class=\"tst\" onclick=\"clearpass()\"/> </td> <td class=\"ts\" id=\"pass\">");
        }
        if (pass != null) {
            if (StringUtils.equals(pass, password)) {
                response.getWriter().print("<span class=\"tr\">√</span>");
            } else if (pass == "") {
                response.getWriter().print("<span>密码未填写</span>");
            } else {
                response.getWriter().print("<span>密码错误</span>");
            }
        }
        //读cookie
        Cookie[] cookies = request.getCookies();

        response.getWriter().print("</td> </tr>\n");
        //验证码图片
        response.getWriter().print("<tr> <td>验证码:</td> <td> <img src=\"/yanzhengma\"> </td> </tr>\n");
        //验证码校验
        response.getWriter().print("<tr> <td colspan=\"2\"> <input style=\"width:228px ;\" type=\"text\" placeholder=\"请输入验证码\" name=\"yzm\" class=\"tst\" onclick=\"clearyzm()\"/> </td> <td class=\"ts\" id=\"yzm\">");
        //获取cookie中的验证码
        String yzmcook = cookies[cookies.length - 1].getValue();
        //判断验证码是否正确
        if (yzm != null) {
            if (StringUtils.equals(yzm, yzmcook)) {
                response.getWriter().print("<span class=\"tr\">√</span>");
            } else if (yzm == "") {
                response.getWriter().print("<span>验证码未填写</span>");
            } else {
                response.getWriter().print("<span>验证码错误</span>");
            }
        }
        response.getWriter().print("</td> </tr>\n");
        //提交
        response.getWriter().print("<tr> <td colspan=\"3\"> <input type=\"submit\" value=\"提交\" id=\"tj\" /> </td> </tr>\n");
        response.getWriter().print("</table> </form> </div> </div> </body>\n");
        response.getWriter().print("<script type=\"text/javascript\">");
        if (StringUtils.equals(username, use) && StringUtils.equals(pass, password)&&StringUtils.equals(yzm, yzmcook)) {
            response.getWriter().print("alert(\"恭喜你登录成功\");");
        }
        response.getWriter().print("function clearuser(){document.getElementById(\"user\").innerHTML=\"\"; } function clearpass(){document.getElementById(\"pass\").innerHTML=\"\"; } function clearyzm(){document.getElementById(\"yzm\").innerHTML=\"\"; }</script>");
        response.getWriter().print("</html>\n");
    }

}
