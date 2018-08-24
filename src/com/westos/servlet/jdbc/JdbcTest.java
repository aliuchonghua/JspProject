package com.westos.servlet.jdbc;

import java.sql.*;

public class JdbcTest {
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        //创建数据库驱动实例
        String driverName="com.mysql.jdbc.Driver";
        Class.forName(driverName);
        // jdbc:mysql://<数据库服务器Ip>:<数据库服务器端口>/<数据库名>
        String url="jdbc:mysql://localhost:3306/hero?useUnicode=true&characterEncoding=utf-8";
        String username="root";
        String password="123456";

        //设置连接超时时间，一般情况下不用设置，仅在网络条件比较差的时候使用
        //DriverManager.setLoginTimeout(100);

        //使用DriverManager获取连接
        Connection conn= DriverManager.getConnection(url,username,password);

        //创建一个statment对象,这种方式不推荐
        Statement st=conn.createStatement();
        //执行sql语句
        ResultSet rs=st.executeQuery("SELECT * FROM student");
        //输出查询结果
        while (rs.next()){
            System.out.println(rs.getInt("id"));
            System.out.println(rs.getString("name"));
            System.out.println(rs.getString("username"));
            System.out.println(rs.getString("pwd"));
            System.out.println("----------------------------------");
        }
        //关闭数据库连接这一步非常重要
        conn.close();
        System.out.println("conn.isClosed():"+conn.isClosed());

    }
}
