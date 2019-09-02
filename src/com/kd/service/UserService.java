package com.kd.service;

import com.kd.entity.User;
import com.kd.util.SendMessageCode;

import java.sql.SQLException;

public interface UserService {

  /**
   * 获取验证码
   * @param number 手机号
   * @return 验证码
   */
  String sendSmsCode(String number);

    /**
     * 注册
     * @param user 用户对象
     * @param smscode 用户填写的验证码
     * @param code 网易云信返回的验证码
     * @return 受影响的行数
     */
  int saveUser(User user, String smscode, String code) throws SQLException;

  /**
   * 登录验证
   * @param phone 手机号
   * @param password 密码
   * @param code 验证码
   * @param checkCode 应用生成的验证码
   * @return 状态码
   */
   User Login(String phone,String password,String code,String checkCode);

  /**
   * 充值
   * @param phone 手机号
   * @param money 金钱
   * @return 1表示成功  0表示失败
   */
  int charegVip(String phone,int money);

  /**
   * 忘记密码
   * @param phone 手机号
   * @param password 密码
   * @param code 短信验证码
   * @param checkCode  session中的短信验证码
   * @return 状态码  0成功 1验证码错误 2该手机号未注册 3服务器错误
   */
  int updateUserInfo(String phone, String password,String code,String checkCode);

  /**
   * 个人中心修改密码
   * @param userId id
   * @param username 用户名
   * @param password 密码
   * @param imgUrl 用户头像
   * @return  状态码  0成功 1失败
   */
  int updateUserInfo(int userId,String username,String password,String imgUrl);
}
