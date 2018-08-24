package com.westos.servlet.bean;

import java.util.Objects;

public class Studentvue {
    private Integer id;
    private String name;
    private String username;
    private String pwd;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public Studentvue(Integer id, String name) {
        this.id = id;
        this.name = name;
    }

    public Studentvue(Integer id, String name, String username, String pwd) {
        this.id = id;
        this.name = name;
        this.username = username;
        this.pwd = pwd;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Studentvue that = (Studentvue) o;
        return Objects.equals(id, that.id) &&
                Objects.equals(name, that.name) &&
                Objects.equals(username, that.username) &&
                Objects.equals(pwd, that.pwd);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, name, username, pwd);
    }

    @Override
    public String toString() {
        return "Studentvue{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", username='" + username + '\'' +
                ", pwd='" + pwd + '\'' +
                '}';
    }
}
