package com.kd.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Properties;

public class ResPrefix {
    public String getPrefix(){
        try {
            //1.加载配置文件
            Properties pro = new Properties();
            pro.load(this.getClass().getClassLoader().getResourceAsStream("setting.properties"));
            String profix = (String) pro.get("prefix");
            return profix;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
