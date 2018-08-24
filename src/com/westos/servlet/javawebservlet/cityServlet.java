package com.westos.servlet.javawebservlet;


import com.westos.servlet.Service.CityService;
import com.westos.servlet.bean.ShengFen;
import org.apache.commons.lang3.StringUtils;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


public class cityServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");

        //获取下拉列表中选取的内容
        String sheng = request.getParameter("sheng");
        String shi = request.getParameter("shi");
        //添加城市
        List<ShengFen> list = new CityService().initShengfen();
        //html部分
        response.getWriter().print("<!DOCTYPE html> <html lang=\"zh-CN\"> <head> <meta charset=\"utf-8\"> <meta http-equiv=\"X-UA-Compatible\" content=\"IE-edge\"> <meta name=\"viewport\" content=\"width=device-width,initial-scale=1\"> <title>城市联动</title>  </head> <body>");
        response.getWriter().print("<form action=\"\" method=\"post\" name=\"form1\" >");
        response.getWriter().print("省份:");
        response.getWriter().print("<select name=\"sheng\" onchange=\"dosubmit()\">");
        response.getWriter().print("<option value=\"\">请选择省</option>");
        ////循环添加省份的option
        ShengFen selectedshengfen = null;
        for (ShengFen sf : list) {
            String selected = "";
            if (StringUtils.equals(sf.getName(), sheng)) {
                selected = "selected";
                selectedshengfen = sf;
            }
            response.getWriter().print("<option value='" + sf.getName() + "' " + selected + ">" + sf.getName() + "</option>");
        }
        response.getWriter().print("</select>");

        //如果省份有选择,则循环添加城市的option
        if (sheng != null) {
            response.getWriter().print("城市:");
            response.getWriter().print("<select name=\"shi\" onchange=\"dosubmit()\">");
            response.getWriter().print("<option value =\"\">请选择城市</option>");
            for (String city : selectedshengfen.getCity()) {
                String selected = "";
                if (StringUtils.equals(city, shi)) {
                    selected = "selected";
                }
                response.getWriter().print("<option value='" + city + "' " + selected + ">" + city + "</option>");
            }
            response.getWriter().print("</select>");
        }
        //展示部分
        if (sheng != null) {
            response.getWriter().print("<h3 id=\"hh3\">你选择的是:" + sheng);
            if (shi != null) {
                response.getWriter().print(shi);
            }
            response.getWriter().print("</h3>");
        }
        response.getWriter().print("</form>");
        response.getWriter().print("<script type=\"text/javascript\">");
        response.getWriter().print("function dosubmit(){form1.submit();}");
        response.getWriter().print("</script>");
        response.getWriter().print("</body></html>");

        //一些常用的方法
        System.out.println("request.getRequestURL=" + request.getRequestURL());
        //request.getRequestURL=http://localhost:8089/city

        System.out.println("request.getRequestURI=" + request.getRequestURI());
        //request.getRequestURI=/city,获取除过http://localhost:8089之后的路径

        System.out.println("request.getServletPath=" + request.getServletPath());
        //request.getServletPath=/city,获取最后一个文件

        System.out.println("request.getRemoteAddr=" + request.getRemoteAddr());
        //request.getRemoteAddr=0:0:0:0:0:0:0:1,返回ip地址,如果发生不定项则发生0:0:0:0:0:0:0:1

        //response.sendRedirect("/logServlet");
        //网页加载时候跳转到指定页面

//        Collection<String> headers = response.getHeaderNames();
//        for(String h:headers){
//            System.out.println(h+"="+response.getHeader(h));
//        }
        //获取所有响应头文件地点集合

    }
}
