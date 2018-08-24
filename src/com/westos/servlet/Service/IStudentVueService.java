package com.westos.servlet.Service;

import com.westos.servlet.bean.Studentvue;

import java.util.List;

public interface IStudentVueService {
    /**
     * 根据序号查找一个学生
     * @param id
     */
    public Studentvue find(Integer id);

    /**
     * 获取所有学生信息
     */
    public List<Studentvue> getList();

    /**
     * 添加
     * @param s
     */
    public Studentvue add(Studentvue s);

    /**
     * 修改
     * @param s
     */
    public Studentvue updata(Studentvue s);

    /**
     * 删除
     * @param id
     */
    public Studentvue remove(Integer id);
}
