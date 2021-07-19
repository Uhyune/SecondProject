package com.servlet.u.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.servlet.u.model.MemberDAO;
import com.servlet.u.model.MemberVO;


public class signupCommand implements Command {

		
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1 파라미터 값 받기 (VO에 담기 저장 )
		MemberVO vo = new MemberVO();
		vo.setId(request.getParameter("id"));
		vo.setPassword(request.getParameter("password"));
		vo.setName(request.getParameter("name"));
		vo.setEmail(request.getParameter("email"));
		vo.setPhone(request.getParameter("phone"));
		System.out.println(vo);
		//2 DB 입력 
		MemberDAO memberDAO = new MemberDAO();
		memberDAO.insert(vo);
		
		
		//vo 값 보내기
		request.setAttribute("vo", vo);
		
		return "signupCheck.jsp";
	}


}