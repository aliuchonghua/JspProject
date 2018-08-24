package com.westos.servlet.Service;

import com.westos.servlet.bean.Studentvue;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentVueServiceImpl implements IStudentVueService {
    private static List<Studentvue> list = new ArrayList<>();

    /**
     * 根据序号查找
     *
     * @param id
     * @return
     */
    @Override
    public Studentvue find(Integer id) {
        return null;
    }

    /**
     * 显示所有学生
     *
     * @return
     */
    @Override
    public List<Studentvue> getList() {


        return null;
    }

    /**
     * 添加
     *
     * @param s
     * @return
     */
    @Override
    public Studentvue add(Studentvue s) {
        Connection conn=null;
        PreparedStatement ps=null;
        try {
            //获取数据库连接
            conn = ConnectionUtil.getConnection();
            //执行添加
            ps = conn.prepareStatement("INSERT INTO student(id,name) VALUES (?,?)");
            //设置数据
            ps.setInt(1, s.getId());
            ps.setString(2, s.getName());
            //提交数据库
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println("数据库连接异常");
        }finally {
            ConnectionUtil.finallyclose(conn, ps);
        }

        return s;
    }




    /**
     * 修改
     *
     * @param s
     * @return
     */
    @Override
    public Studentvue updata(Studentvue s) {
        Studentvue student = find(s.getId());
        student.setName(s.getName());
        return student;
    }

    /**
     * 删除
     *
     * @param id
     * @return
     */
    @Override
    public Studentvue remove(Integer id) {
        Connection conn=null;
        PreparedStatement ps=null;
        try {
            //获取数据库连接
             conn = ConnectionUtil.getConnection();
            //执行删除
             ps = conn.prepareStatement("DELETE FROM student WHERE id=?");
            //设置数据
            ps.setInt(1, id);
            //提交
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("删除:数据库连接异常");
        }finally {
            ConnectionUtil.finallyclose(conn,ps);
        }
        return find(id);
    }
}
