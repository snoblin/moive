package com.kd.controller;

import com.kd.service.UserService;
import com.kd.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/updateinfo")
public class UpdateInfoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String phone = req.getParameter("phone");
        String smscode = req.getParameter("smscode");
        String password = req.getParameter("password");
        String username = req.getParameter("username");
        String imgUrl = req.getParameter("imgurl");
        Integer userId = Integer.valueOf(req.getParameter("userid"));
        UserService us = new UserServiceImpl();
        int status = -1;
        if(userId==null){
            status = us.updateUserInfo(phone, password, smscode, (String) req.getSession().getAttribute("smsCode"));
        }else{
            status = us.updateUserInfo(userId,username,password,imgUrl);
        }
        req.getSession().setAttribute("user",null);
        resp.getWriter().println(status);
    }
}
