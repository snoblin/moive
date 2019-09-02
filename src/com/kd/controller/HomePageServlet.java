package com.kd.controller;

import com.alibaba.fastjson.JSON;
import com.kd.service.MovieService;
import com.kd.service.impl.MovieServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;


@WebServlet("/homepageinfo")
public class HomePageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        MovieService ms = new MovieServiceImpl();
        Map<String, List<Map<String, Object>>> homePageData = ms.getHomePageData();
        resp.setCharacterEncoding("utf-8");
        resp.getWriter().write(JSON.toJSONString(homePageData));
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
