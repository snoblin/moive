package com.kd.dao.impl;

import com.kd.dao.MovieDao;
import com.kd.util.JDBCUtil;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;


public class MovieDaoImpl implements MovieDao {
    QueryRunner qr = JDBCUtil.getRunner();

    @Override
    public  List<Map<String, Object>> getHotMovieInfo(int pageIndex,int pageSize){
        String sql = "select video_id,img_url,video_name from video order by video_count limit " + (pageIndex-1)*pageSize + "," + pageSize;
        List<Map<String, Object>> mapList = null;
        try {
            mapList = qr.query(sql, new MapListHandler());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return mapList;
    }

    @Override
    public List<Map<String, Object>> getAreaMovieInfo(int pageIndex, int pageSize, String area) {
        String sql = "select  v.video_id,img_url,video_name " +
                "from video as v " +
                "inner join video_actor_type_area as vata on vata.video_id = v.video_id " +
                "inner join area as a on a.area_id  = vata.area_id " +
                "where a.area_name =  ? " +
                "limit " + (pageIndex-1)*pageSize + "," + pageSize;
        List<Map<String, Object>> mapList = null;
        try {
            mapList = qr.query(sql, new MapListHandler(),area);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return mapList;
    }

    @Override
    public Map<String, Object> selectMovieById(int videoId) {
        String sql = "SELECT\n" +
                "\tv.video_id,\n" +
                "\tv.video_name,\n" +
                "\tv.video_url,\n" +
                "\tv.video_score,\n" +
                "\tv.video_count,\n" +
                "\tv.video_time,\n" +
                "\ta.area_name,\n" +
                "\tt.type_type,\n" +
                "\tv.video_count,\n" +
                "\tac.actor_name,\n" +
                "\tac.directors,\n" +
                "\tv.video_details,\n" +
                "\tv.vipcansee\n" +
                "FROM\n" +
                "\tvideo v\n" +
                "\tINNER JOIN video_actor_type_area vata ON vata.video_id = v.video_id\n" +
                "\tINNER JOIN area a ON a.area_id = vata.area_id\n" +
                "\tINNER JOIN type t ON t.type_id = vata.type_id\n" +
                "\tINNER JOIN actor ac ON ac.actor_id = vata.actor_id \n" +
                "WHERE\n" +
                "\tv.video_id = ?";
        Map<String, Object> query = null;
        try {
            query = qr.query(sql, new MapHandler(), videoId);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return query;
    }

    @Override
    public List<Map<String, Object>> searchByArea(String area) {
        String sql = "select  v.video_id,img_url,video_name " +
                "from video as v " +
                "inner join video_actor_type_area as vata on vata.video_id = v.video_id " +
                "inner join area as a on a.area_id  = vata.area_id " +
                "where a.area_name =  ? ";
        List<Map<String, Object>> query = null;
        try {
            query = qr.query(sql, new MapListHandler(), area);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return  query;
    }

    @Override
    public List<Map<String, Object>> searchByName(String name) {
        String sql = "select  v.video_id,img_url,video_name " +
                "from video as v " +
                "where video_name like ?";
        List<Map<String, Object>> query = null;
        try {
            query = qr.query(sql, new MapListHandler(), "%" + name + "%");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return  query;
    }

    @Override
    public List<Map<String, Object>> selectCommentById(int videoId) {
        String sql = "select comment,username\n" +
                "from comment c\n" +
                "inner join user u on u.userid = c.user_id\n" +
                "where c.video_id = ?\n" +
                "order by comment_id desc";
        List<Map<String, Object>> query = null;
        try {
             query = qr.query(sql, new MapListHandler(), videoId);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return query;
    }

    @Override
    public int insertComment(int userid, int videoid, String comment) {
        String sql = "insert into comment values(?,?,?,?,?)";
        int update = 0;
        try {
            update = qr.update(sql, userid, videoid, null, comment, new Date());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return update;
    }
}
