package com.kd.dao.impl;

import com.kd.dao.UserDao;
import com.kd.entity.User;

import com.kd.util.JDBCUtil;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class UserDaoImpl implements UserDao {
    QueryRunner qr=JDBCUtil.getRunner();
    @Override
    public int addUser(User u) {
        String sql="insert into user values(?,?,?,?,?,?,?,?)";
        int i = 0;
        try {
            i = qr.update(sql,u.getUserid(),u.getUsername(),u.getPassword(),u.getVip(),u.getStarttime(),u.getEndtime(),u.getPhone(),u.getUserimg_url());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i;
    }

    @Override
    public String selectUserbyphone(String phone) throws SQLException {
       String sql="select phone from user where phone = ?";
        Object query = qr.query(sql, new ScalarHandler<>(), phone);
        return (String) query;
    }

    @Override
    public User findUserByAccount(String phone) {
        String sql="select * from user where phone=?";
        User user = null;
        try {
            user = qr.query(sql, new BeanHandler<>(User.class),phone);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public Integer updateUserVip(String phone, int money, Date start, Date end) {
        String sql = "update user set vip=?,starttime=?,endtime=? where phone=?";
        int i = -1;
        try {
            i = qr.update(sql, "vip", start, end, phone);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i;
    }

    @Override
    public Integer insertEarning(int money) {
        String sql = "insert into earning values(?,?,?)";
        int i = -1;
        try {
            i = qr.update(sql, null, money, new Date());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i;
    }

    @Override
    public Integer updatePasswordByPhone(String phone, String password) {
        String sql="update user set password=? where phone=?";
        int update=-1;
        try {
            update = qr.update(sql,password, phone);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return update;
    }

    @Override
    public int updateUserInfoById(Integer userId, String username, String password, String imgUrl) {
        String sql="update user set username=?,password=?,userimg_url=? where userid=?";
        int update=-1;
        try {
            update = qr.update(sql,username,password,imgUrl,userId);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return update;
    }
}
