package com.westos.servlet.Service;

import com.westos.servlet.bean.Student;

import java.util.List;

public class StudentAdd {
    public static List<Student> add(List<Student> list){
        StudentService.addList("张三","132001");
        StudentService.addList("李四","132034");
        StudentService.addList("王五","132002");
        StudentService.addList("赵六","132004");
        StudentService.addList("刘一","132056");
        StudentService.addList("井杰","132067");
        StudentService.addList("李璐","132012");
        StudentService.addList("田伟","132023");
        StudentService.addList("马与超","132003");
        StudentService.addList("宋晓波","132004");
        StudentService.addList("刘崇华","132668");
        return list;
    }
}
