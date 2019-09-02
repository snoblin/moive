package com.kd.controller;

import com.kd.service.MovieService;
import com.kd.service.impl.MovieServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * @author Hatsune Miku
 */
@WebServlet("/player")
public class PlayerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int  videoId = Integer.parseInt(req.getParameter("videoId"));
        MovieService ms = new MovieServiceImpl();
        Map<String, Object> minfo = ms.getMovieInfoById(videoId);
        List<Map<String, Object>> comment = ms.getComment(videoId);
        req.setAttribute("minfo", minfo);
        req.setAttribute("comment", comment);
        req.getRequestDispatcher("Player.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
