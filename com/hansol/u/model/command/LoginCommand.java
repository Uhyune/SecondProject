package com.servlet.u.model.command;
//package com.servlet.u.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.servlet.u.model.MemberDAO;
import com.servlet.u.model.MemberVO;



public class LoginCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//파라미터값 vo에 저장 id값 받아옴
		MemberDAO dao = new MemberDAO();	
		MemberVO vo = new MemberVO();
		
		vo.setId(request.getParameter("id"));
		vo.setPassword(request.getParameter("password"));
		System.out.print(vo);
		System.out.print(dao.login(vo));
		MemberVO vvo = dao.login(vo);
		
		if(vvo != null) {	//성공
			HttpSession session = request.getSession();
			session.setAttribute("login", request.getParameter("id"));
			session.setAttribute("loginList",vvo);
			return "main.jsp";
		}else {
			return"loginfail.jsp";
		}
		
		
		
		
	}
}
