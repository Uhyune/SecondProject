package com.servlet.u.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.servlet.u.model.command.*;

@WebServlet("/u/controller")
public class FrontControllerCommand extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		System.out.print(type);
		Command command = null;
		if ("sign".equals(type)) {
			command = new signCommand();
		}else if("out".equals(type)) {
			command = new LogoutCommand();
		}else if("login".equals(type)) {
			command = new LoginCommand();
		}else if("signup".equals(type)) {
			command = new signupCommand();
		} else if("delete".equals(type)) {
			command = new DeleteCommand();
		} else if("update".equals(type)) {
			command = new UpdateCommand();
		}

		String path = command.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);

	}
}
