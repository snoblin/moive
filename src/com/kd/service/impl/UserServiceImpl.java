package com.kd.service.impl;

import com.kd.dao.UserDao;
import com.kd.dao.impl.UserDaoImpl;
import com.kd.entity.User;
import com.kd.service.UserService;
import com.kd.util.SendMessageCode;

import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;

public class UserServiceImpl implements UserService {
    private UserDao ud = new UserDaoImpl();
    @Override
    public String sendSmsCode(String number) {
        String code = null;
        try {
            code = SendMessageCode.sendMesssage(number);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return code;
    }

    @Override
    public int saveUser(User user, String smscode,String code) throws SQLException {
        if (smscode.equals(code)) {
            if(ud.selectUserbyphone(user.getPhone())==null){
                try {
                    ud.addUser(user);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                return 0;
            }else{
                return 2;
            }
        }else {
            return 1;
        }
    }

    @Override
    public User Login(String phone, String password, String code, String checkCode) {
        User user = ud.findUserByAccount(phone);
        // 验证码比较
        if (code.equalsIgnoreCase(checkCode)) {
            //账号是否一致
            if (user.getPhone().equals(phone)) {
                //密码一致登录成功
                if (user.getPassword().equals(password)) {
                    return user;
                }
            }
        }
        return null;
    }

    @Override
    public int charegVip(String phone, int money) {
        User user = ud.findUserByAccount(phone);
        System.out.println(user);
        Date endtime = user.getEndtime();
        Date now = new Date();
        int month = 0;
        if(money==10){
            month=1;
        }else if(money==30){
            month=3;
        }else if(money==110){
            month = 12;
        }
        int i= -1;
        Integer integer = -1;
        if(endtime==null || endtime.compareTo(now)<0){
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(now);
            //加月份
            calendar.add(Calendar.MONTH, month);
            i = ud.updateUserVip(phone,money,now,calendar.getTime());
            integer = ud.insertEarning(money);
        }else{
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(user.getEndtime());
            //加月份
            calendar.add(Calendar.MONTH, month);
            i = ud.updateUserVip(phone,money,user.getStarttime(),calendar.getTime());
            integer = ud.insertEarning(money);
        }
        return i==1&&integer==1?1:0;
    }

    @Override
    public int updateUserInfo(String phone, String password, String code, String checkCode) {
        if(code.equals(checkCode)){
            User user = ud.findUserByAccount(phone);
            if(user!=null){
                Integer integer = ud.updatePasswordByPhone(phone, password);
                if (integer==1) {
                    return 0;
                }else{
                    return 3;
                }
            }
            return 2;
        }
        return 1;
    }

    @Override
    public int updateUserInfo(int userId, String username, String password, String imgUrl) {
        int integer = ud.updateUserInfoById(userId, username, password, imgUrl);
        System.out.println(integer);
        if(integer==1){
            return 0;
        }
        return 1;
    }

}
