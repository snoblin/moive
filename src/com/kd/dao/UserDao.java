package com.kd.dao;

import com.kd.entity.User;

import java.sql.SQLException;
import java.util.Date;


public interface UserDao {
    /**
     * 插入用户
     * @param user 插入的用户
     * @return 影响的行数
     */
    int addUser(User user);

    /**
     *  用手机号查询用户
     * @param phone 手机号
     * @return 查出的手机号
     * @throws SQLException 数据库异常
     */
    String selectUserbyphone(String phone) throws SQLException;

    /**
     * 通过用户的手机号查看用户的信息
     * @param phone  要查看的用户的手机号
     * @return  该账号对应的用户信息
     */
    User findUserByAccount(String phone);

    /**
     * 充值
     * @param phone 手机号
     * @param money 金钱
     * @return 行数
     */
     Integer updateUserVip(String phone, int money, Date start, Date end);

    /**
     * 插入收益表
     * @param money 插入金额
     * @return 影响的行数
     */
    Integer insertEarning(int money);

    /**
     *  根据手机号修改密码
     * @param phone 手机号
     * @param password 新密码
     * @return 受影响的行数
     */
    Integer updatePasswordByPhone(String phone,String password);

    /**
     *  根据用户id修改用户信息
     * @param userId id
     * @param username 用户名
     * @param password 密码
     * @param imgUrl 头像地址
     * @return 受影响的行数
     */
    int updateUserInfoById(Integer userId,String username,String password,String imgUrl);
}
