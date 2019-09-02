package com.kd.test;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.kd.dao.MovieDao;
import com.kd.dao.UserDao;
import com.kd.dao.impl.MovieDaoImpl;
import com.kd.dao.impl.UserDaoImpl;
import com.kd.entity.User;
import com.kd.util.ResPrefix;
import com.kd.util.SendMessageCode;
import org.junit.Test;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

public class SendTest {

    @Test
    public void send(){
        try {
            String code = "{\"code\":200,\"msg\":\"2\",\"obj\":\"961114\"}";
            JSONObject jsonObject = JSON.parseObject(code);
            String resMsg = jsonObject.getString("obj");
            System.out.println(resMsg);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    @Test
    public void splitY(){
        String yuan = "10.00元";
        String[] split = yuan.split("\\.");
        System.out.println(Arrays.toString(split));
    }
    @Test
    public void select2(){
        MovieDao md = new MovieDaoImpl();
        List<Map<String, Object>> mapList = md.getAreaMovieInfo(1, 8, "大陆");
        System.out.println(mapList);
    }
    @Test
    public void select(){
        MovieDao md = new MovieDaoImpl();
//        Map<String, Object> stringObjectMap = md.selectMovieById(1);
//        System.out.println(stringObjectMap);
        List<Map<String, Object>> maps = md.selectCommentById(1);
        System.out.println(maps);
    }

    @Test
    public void testP(){
        String prefix = new ResPrefix().getPrefix();
        System.out.println(prefix);
    }


}
