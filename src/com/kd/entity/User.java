package com.kd.entity;

import java.sql.Timestamp;
import java.util.Date;

public class User {
   private Integer userid;
   private String username;
   private String password;
   private String vip;
   private Date starttime;
   private Date endtime;
   private String phone;
   private String userimg_url;

    public User(Integer userid, String username, String password, String vip, Date starttime, Date endtime, String phone, String userimg_url) {
        this.userid = userid;
        this.username = username;
        this.password = password;
        this.vip = vip;
        this.starttime = starttime;
        this.endtime = endtime;
        this.phone = phone;
        this.userimg_url = userimg_url;
    }

    public User() {
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getVip() {
        return vip;
    }

    public void setVip(String vip) {
        this.vip = vip;
    }

    public Date getStarttime() {
        return starttime;
    }

    public void setStarttime(Date starttime) {
        this.starttime = starttime;
    }

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getUserimg_url() {
        return userimg_url;
    }

    public void setUserimg_url(String userimg_url) {
        this.userimg_url = userimg_url;
    }

    @Override
    public String toString() {
        return "User{" +
                "userid=" + userid +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", vip='" + vip + '\'' +
                ", starttime=" + starttime +
                ", endtime=" + endtime +
                ", phone='" + phone + '\'' +
                ", userimg_url='" + userimg_url + '\'' +
                '}';
    }
}
