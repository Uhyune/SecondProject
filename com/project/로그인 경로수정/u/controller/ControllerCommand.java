package com.servlet.u.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.servlet.u.model.MemberDAO;
import com.servlet.u.model.command.Command;
import com.servlet.u.model.command.LoginCommand;
import com.servlet.u.model.command.signCommand;
import com.servlet.u.model.command.signupCommand;


@WebServlet("/pj_notice/controller2")
public class ControllerCommand extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String userID = request.getParameter("userID");
		System.out.print(userID);
		response.getWriter().write(new MemberDAO().checkId(userID)+"");

	}
}
