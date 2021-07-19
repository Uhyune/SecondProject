package com.servlet.calendar.controller;

import com.servlet.calendar.model.DAO;
import com.servlet.calendar.util.Util;

import java.io.IOException;
//import java.io.PrintWriter;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Calendar/updateInsert")
public class UpdateInsertController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        System.out.println("IN");
        String start_date = request.getParameter("start_date");
        String end_date = request.getParameter("end_date");
        if (Util.overLastDay(end_date)) {
            return;
        }
        try {
            if (Util.FirstSecond(start_date, end_date)) {

                return;
            }
        } catch (ParseException e) {
            e.printStackTrace();
        }
        String title = request.getParameter("title");
        String color = request.getParameter("color");
        if (color == null) { color = "#3788d8"; }
        String text_color = request.getParameter("text_color");
        if (text_color == null) { text_color = "#ffffff"; }
        String detail = request.getParameter("detail");
        if (detail == null || detail.isBlank()) {
            detail = "없음";
        }

        String id = request.getParameter("id");
        DAO.updateEvent(title, start_date, end_date, detail, color, text_color, id);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        doGet(request, response);
    }
}
