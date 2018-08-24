package com.westos.servlet.Service;


import com.westos.servlet.bean.ShengFen;

import java.util.ArrayList;
import java.util.List;

public class CityService {
    public List<ShengFen> initShengfen() {
        List<ShengFen> list = new ArrayList<>();
        ShengFen s1 = new ShengFen();
        s1.setName("陕西");
        s1.addCity("西安", "咸阳", "铜川", "延安");
        list.add(s1);
        ShengFen s2 = new ShengFen();
        s2.setName("河南");
        s2.addCity("郑州", "洛阳", "三门峡");
        list.add(s2);
        ShengFen s3 = new ShengFen();
        s3.setName("山西");
        s3.addCity("太原", "运城", "临汾");
        list.add(s3);
        ShengFen s4 = new ShengFen();
        s4.setName("四川");
        s4.addCity("成都", "峨眉", "乐山");
        list.add(s4);
        return list;
    }

}
