package com.kd.controller;

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
@WebServlet("/getsmscode")
public class GetSmsCodeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String phone = req.getParameter("phone");
        UserService us = new UserServiceImpl();
        String smsCode = us.sendSmsCode(phone);
        req.getSession().setAttribute("smsCode",smsCode);
        resp.getWriter().println("0");
    }
}
