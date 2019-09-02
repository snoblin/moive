package com.kd.controller;

import com.kd.service.MovieService;
import com.kd.service.impl.MovieServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/comment")
public class CommentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int userid = Integer.parseInt(req.getParameter("userid"));
        int videoid = Integer.parseInt(req.getParameter("videoid"));
        String comment = req.getParameter("comment");
//        System.out.println(comment);
        int status = -1;
        MovieService ms = new MovieServiceImpl();
        status = ms.insertComment(userid, videoid, comment);
        resp.getWriter().println(status);
    }
}
