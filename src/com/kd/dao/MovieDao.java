package com.kd.dao;

import java.util.List;
import java.util.Map;

public interface MovieDao {
    /**
     *
     * 分页获取热门电影数据
     * @return 热门电影数据
     */
    List<Map<String, Object>> getHotMovieInfo(int pageIndex,int pageSize);

    /**
     * 分页获取特定地区的电影数据
     * @return 特定地区的电影数据
     */
    List<Map<String, Object>> getAreaMovieInfo(int pageIndex, int pageSize, String area);

    /**
     * 根据id获取播放的电影信息
     * @param videoId 影片id
     * @return 影片信息
     */
    Map<String, Object> selectMovieById(int videoId);
    /**
     * 获取地区所有影片信息
     * @param area 地区
     * @return 影片信息
     */
    List<Map<String,Object>> searchByArea(String area);

    /**
     *
     * @param name 名称
     * @return
     */
    List<Map<String,Object>> searchByName(String name);

    /**
     * 获取评论
     * @param videoId 影片id
     * @return 影片评论
     */
    List<Map<String, Object>> selectCommentById(int videoId);

    int insertComment(int userid,int videoid,String comment);
}
