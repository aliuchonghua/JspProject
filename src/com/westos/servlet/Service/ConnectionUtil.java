package com.westos.servlet.Service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ConnectionUtil {
    /**
     * 获取数据库连接conn
     *
     * @return Connection conn
     */
    public static Connection getConnection() {
        String driverName = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/herostu?useUnicode=true&characterEncoding=utf-8";
        String username = "root";
        String password = "123456";

        Connection conn = null;
        try {
            Class.forName(driverName);
            //DriverManager获取连接
            conn = DriverManager.getConnection(url, username, password);
        } catch (Exception e) {
            System.out.println("数据库连接异常");
        }
        return conn;

    }
    /**
     * 释放资源
     * @param conn
     * @param ps
     * @throws SQLException
     */
    public static void finallyclose(Connection conn, PreparedStatement ps)  {
        try {
            if (ps!=null){
                //关闭连接
                ps.close();
            }
            if (conn!=null){
                //释放资源
                conn.close();
            }
        } catch (SQLException e) {
            System.out.println("资源释放失败");
        }
    }
}
