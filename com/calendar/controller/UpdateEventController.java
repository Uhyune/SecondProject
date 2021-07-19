package com.servlet.calendar.controller;

import com.servlet.calendar.model.DAO;
import com.servlet.calendar.model.vo.CalendarVO;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Calendar/updateEvent")
public class UpdateEventController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		String id = request.getParameter("id");
		CalendarVO vo = DAO.getOneEvent(id);
		
		PrintWriter out = response.getWriter();
		String output = "{";
		output += "\"title\" : \"" + vo.getTitle() + "\", ";	
		output += "\"start\" : \"" + vo.getStart_date().substring(0, 10) + "\", ";
		output += "\"end\" : \"" + vo.getEnd_date().substring(0, 10)+ "\", ";
		output += "\"color\" : \"" + vo.getColor() + "\", ";
		output += "\"textColor\" : \"" + vo.getText_color() + "\", ";
		output += "\"detail\" : \"" + vo.getDetail() + "\" ";
		
		output += "}";
		
		
		out.print(output);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
}
