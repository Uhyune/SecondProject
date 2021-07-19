package com.servlet.calendar.controller;

import com.servlet.calendar.model.DAO;
import com.servlet.calendar.model.vo.CalendarVO;
import com.servlet.calendar.util.Util;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Calendar/getEvent")
public class GetEventController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        List<CalendarVO> list = DAO.getEvent();

        PrintWriter out = response.getWriter();

        List<String> eventArray = new ArrayList<String>();
        for (CalendarVO vo : list) {
            String output = "{";
            output += "\"title\" : \"" + vo.getTitle() + "\", ";
            String end_date = Util.plusDate(vo.getEnd_date());

            output += "\"start\" : \"" + vo.getStart_date()
                                           .substring(0, 10) + "\", ";
            output += "\"end\" : \"" + vo.getEnd_date()
                                         .substring(0, 8) + end_date + "\", ";
            output += "\"color\" : \"" + vo.getColor() + "\", ";
            output += "\"textColor\" : \"" + vo.getText_color() + "\", ";
            output += "\"id\" : \"" + vo.getId() + "\" ";

            output += "}";
            eventArray.add(output);
        }

        out.print(eventArray);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        doGet(request, response);
    }

}
