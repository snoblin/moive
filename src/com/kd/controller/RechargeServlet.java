package com.kd.controller;

import com.kd.dao.UserDao;
import com.kd.dao.impl.UserDaoImpl;
import com.kd.service.UserService;
import com.kd.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author Hatsune Miku
 */
@WebServlet("/recharge")
public class RechargeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int money = Integer.parseInt(req.getParameter("money").split("\\.")[0]);
        String phone = req.getParameter("phone");
        UserService us = new UserServiceImpl();
        int i = us.charegVip(phone, money);
        resp.getWriter().println(i);
    }
}
