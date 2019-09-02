package com.kd.service;

import java.util.List;
import java.util.Map;

public interface MovieService {

    /**
     * 获取首页需要的数据
     * @return 数据集合
     */
    Map<String,List<Map<String, Object>>> getHomePageData();

    /**
     * 根据id获取播放的电影信息
     * @param videoId 影片id
     * @return 影片信息
     */
    Map<String, Object> getMovieInfoById(int videoId);
    /**
     * 搜索
     * @param type 搜索类型
     * @param value 搜索值
     * @return 电影信息列表
     */
    List<Map<String,Object>> searchResult(String type,String value);

    /**
     * 获取评论
     * @param videoId 影片id
     * @return 评论集合
     */
    List<Map<String,Object>> getComment(int videoId);

    int insertComment(int userid,int videoid,String comment);
}
