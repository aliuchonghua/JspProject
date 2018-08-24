package com.westos.servlet.bean;

import java.util.ArrayList;
import java.util.List;

public class ShengFen {
    private String name;
    private List<String> city;

    public void addCity(String... a) {
        if (this.city == null) {
            this.city = new ArrayList<>();
            for (String city : a) {
                this.city.add(city);
            }
        }

    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<String> getCity() {
        return city;
    }

    public void setCity(List<String> city) {
        this.city = city;
    }

    @Override
    public String toString() {
        return "ShengFen{" +
                "name='" + name + '\'' +
                ", city=" + city +
                '}';
    }
}
