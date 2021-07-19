package com.servlet.u.model.command;

import com.servlet.u.model.MemberDAO;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class DeleteCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		MemberDAO dao = new MemberDAO();
		String id = (String) session.getAttribute("login");

		dao.deletemember(id);
		
		session.removeAttribute("id");
		session.invalidate();
		
		return "deleteok.jsp";
	}

	
}