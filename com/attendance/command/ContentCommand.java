package com.servlet.attendance.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ContentCommand implements Command {
	
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return "list.jsp";
	}

}
