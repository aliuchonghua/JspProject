package com.westos.servlet.Service;

import com.westos.servlet.bean.Student;
import org.apache.commons.lang3.StringUtils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class StudentService {
    private static List<Student> list = null;

    public static List<Student> getList() {
        list = new ArrayList<>();
        return list;
    }

    //添加
    public static List<Student> addList(String name, String num) {
        //判断是否包含
        if (!judge(name, num)){
            list.add(new Student(name, num));
        }
        return list;
    }

    //批量添加
    public static void addLists() {
        list= StudentAdd.add(list);
    }

    //清空
    public static void clear() {
        list.clear();
    }

    //判断是否包含
    public static boolean judge(String name, String number) {

        return list.contains(new Student(name, number));
    }

    //删除
    public static void remove(String name, String number) throws Exception {
        list.remove(new Student(name, number));
    }

    //修改
    public static Student revise(String name, String number) throws Exception {
        list.remove(new Student(name, number));
        return new Student(name, number);

    }
    //查找
    public static boolean find(String name, String number){
        if (list!=null){
            for (Student s:list){
                if (StringUtils.equals(name,s.getName())||StringUtils.equals(number,s.getNum())){
                    return true;
                }
            }
        }
        return false;
    }

    //排序
    public static void sort() {
        Collections.sort(list, new Comparator<Student>() {
            @Override
            public int compare(Student s1, Student s2) {
                int num1 = Integer.parseInt(s1.getNum()) - Integer.parseInt(s2.getNum());
                int num2 = num1 == 0 ? s1.getName().compareTo(s2.getName()) : num1;
                return num2;
            }
        });
    }

}
