package com.servlet.attendance.frontcontroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("/updateAction")
public class UpdateAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String a_type_ = request.getParameter("a_type");
		
		String a_type = "병결";
		
		if (!a_type.equals("")) {
			a_type = a_type_;
		}
				
		response.getWriter().println("a_type : " +a_type); 
	}

}
