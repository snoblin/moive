package com.kd.controller;

import com.kd.entity.User;
import com.kd.service.UserService;
import com.kd.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String phone = req.getParameter("username");
        String password = req.getParameter("password");
        String code = req.getParameter("code");
        UserService us = new UserServiceImpl();
        User user = us.Login(phone, password, code, (String) req.getSession().getAttribute("CHECKCODE_SERVER"));
        PrintWriter writer = resp.getWriter();
        if(user!=null){
            req.getSession().setAttribute("user",user);
            writer.println(0);
        }else {
            writer.println(1);
        }
    }
}
