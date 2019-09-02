package com.kd.service.impl;

import com.kd.dao.MovieDao;
import com.kd.dao.impl.MovieDaoImpl;
import com.kd.service.MovieService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MovieServiceImpl implements MovieService {
    private MovieDao md = new MovieDaoImpl();

    @Override
    public Map<String,List<Map<String, Object>>> getHomePageData() {
        List<Map<String, Object>> hotMovieInfo = md.getHotMovieInfo(1, 8);
        List<Map<String, Object>> areaInfo1 = md.getAreaMovieInfo(1, 8, "中国");
        List<Map<String, Object>> areaInfo2 = md.getAreaMovieInfo(1, 8, "欧美");
        List<Map<String, Object>> areaInfo3 = md.getAreaMovieInfo(1, 8, "韩国");
        List<Map<String, Object>> areaInfo4 = md.getAreaMovieInfo(1, 8, "日本");
        Map<String,List<Map<String, Object>>> homepageinfo = new HashMap<>();
        homepageinfo.put("hot", hotMovieInfo);
        homepageinfo.put("cn", areaInfo1);
        homepageinfo.put("ea", areaInfo2);
        homepageinfo.put("kr", areaInfo3);
        homepageinfo.put("ja", areaInfo4);
        return homepageinfo;
    }

    @Override
    public Map<String, Object> getMovieInfoById(int videoId) {
        Map<String, Object> stringObjectMap = md.selectMovieById(videoId);
        return stringObjectMap;
    }

    @Override
    public List<Map<String, Object>> searchResult(String type, String value) {
        List<Map<String, Object>> search = null;
        if(type.equals("na")){
            search = md.searchByName(value);
        }else if(type.equals("area")){
            search = md.searchByArea(value);
        }
        return search;
    }

    @Override
    public List<Map<String, Object>> getComment(int videoId) {
        List<Map<String, Object>> maps = md.selectCommentById(videoId);
        return maps;
    }

    @Override
    public int insertComment(int userid, int videoid, String comment) {
        int i = md.insertComment(userid, videoid, comment);
        if(i==1){
            return 0;
        }
        return 0;
    }


}
