package com.westos.servlet.jdbc;

import java.sql.*;

public class PstTest {
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        //创建数据库驱动实例
        String driverName = "com.mysql.jdbc.Driver";
        Class.forName(driverName);
        // jdbc:mysql://<数据库服务器Ip>:<数据库服务器端口>/<数据库名>
        String url = "jdbc:mysql://localhost:3306/hero?useUnicode=true&characterEncoding=utf-8";
        String username = "root";
        String password = "123456";
        //使用DriverManager获取连接
        Connection conn = DriverManager.getConnection(url, username, password);

        //创建preparedStatment对象
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM student WHERE id<?");
        //设置参数绑定，参数名的序号从1开始
        ps.setInt(1, 3);
        //返回值
        ResultSet rs = ps.executeQuery();
        //输出查询结果
        while (rs.next()) {
            System.out.println(rs.getInt("id"));
            System.out.println(rs.getString("name"));
            System.out.println(rs.getString("username"));
            System.out.println(rs.getString("pwd"));
            System.out.println("----------------------");
        }

        //关闭ResultSet
        rs.close();


        //添加一条学生
        ps = conn.prepareCall("INSERT INTO student(id ,NAME ,username ,pwd ) VALUES(?,?,?,?)");
        //绑定参数
        ps.setInt(1, 4);
        ps.setString(2, "刘崇华");
        ps.setString(3, "liuchong");
        ps.setString(4, "123456");
        //执行插入
        int i = ps.executeUpdate();
        //返回值表示插入了多少行
        System.out.println("插入:" + i);
        //关闭PreparedStatement
        ps.close();
        //关闭数据库连接这一步非常重要
        conn.close();
    }
}
