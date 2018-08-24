package com.westos.servlet.javawebservlet;
import org.apache.commons.lang3.RandomUtils;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;

public class YanzhengmaServlet extends HttpServlet {
    private static final int WIDTH = 100;
    private static final int HEIGHT = 40;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //产生图片
        BufferedImage img=new BufferedImage(WIDTH,HEIGHT,BufferedImage.TYPE_INT_RGB);
        //创建绘图对象,Graphics,java的绘图工具类
        Graphics g=img.getGraphics();
        //设置背景颜色
        g.setColor(Color.white);
        //填充元素的位置
        g.fillRect(0,0,WIDTH,HEIGHT);
        //设置填充色
        g.setColor(Color.RED);
        //设置字体
        Font font=new Font("微软雅黑",Font.BOLD,20);
        g.setFont(font);
        //随机生成字符串的方法
        String str=genRandomString(4);
        //绘制文字
        g.drawString(str,20,30);
        //随机生成线条
        for(int i=0;i<20;i++){
            //随机产生两个坐标的数值
            int x1=RandomUtils.nextInt(0,WIDTH);
            int x2=RandomUtils.nextInt(0,WIDTH);
            int y1=RandomUtils.nextInt(0,HEIGHT);
            int y2=RandomUtils.nextInt(0,HEIGHT);
            //随机线条颜色使用RGB形式创建颜色类
            Color color=new Color(RandomUtils.nextInt(0,255),RandomUtils.nextInt(0,255),RandomUtils.nextInt(0,255));
            //设置颜色类
            g.setColor(color);
            //绘制线条
            g.drawLine(x1,y1,x2,y2);
        }

        //cookie的操作
        //写cookie
        Cookie cookie=new Cookie("yzm",str);
        //过期时间
        cookie.setMaxAge(10000);
        //只允许服务端读取
        cookie.setHttpOnly(true);
        response.addCookie(cookie);



        ImageIO.write(img,"jpg",response.getOutputStream());
        //输出图片
    }
    //随机生成字符串的方法
    private String genRandomString(int len){
        String result="";
        for (int i = 0; i < len; i++) {
            char c=(char) RandomUtils.nextInt(65,91);
            result=result+c;
        }
        return result;
    }
}
