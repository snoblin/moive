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
import java.sql.SQLException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String number = req.getParameter("phone");
        String smscode = req.getParameter("smscode");
        String password = req.getParameter("password");
        String username = req.getParameter("username");
        UserService us = new UserServiceImpl();
        System.out.println(password);
        User u = new User(null,username,password,null,null,null,number,null);
        int status = -1;
        try {
          status = us.saveUser(u, smscode, (String) req.getSession().getAttribute("smsCode"));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        resp.getWriter().println(status);
    }
}
