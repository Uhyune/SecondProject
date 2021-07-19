package com.servlet.attendance.frontcontroller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/controller")
public class FrontController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> FrontController.deGet() 실행~~");
		String type = request.getParameter("type");
		
//		if ("all".equals(type)) {
//			//1. DB 연결하고 데이터 가져오기
//			List<AttVO> list = DAO.getListByTitle();
//			
//			//2. 응답페이지(list.jsp)에 전달(request 객체에 속성값으로 전달)
//			request.setAttribute("list", list);
//			
//			//3. 응답페이지 전환(list.jsp 에게)
//			request.getRequestDispatcher("list.jsp").forward(request, response);
//		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
