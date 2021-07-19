package com.servlet.attendance.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.servlet.attendance.DAO.DAO;
import com.servlet.attendance.vo.AttVO;

public class TitleListCommand implements Command {
	
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//전달받은 파라미터 값으로 DB데이터 조회 후 페이지 이동
		//1. 파라미터 값 확인(추출)
		String a_title = request.getParameter("a_title");
		if (a_title == null) {
			return "list.jsp";
		}
		
		//1. DB 연결하고 데이터 가져오기
		List<AttVO> list = DAO.getListByTitle(a_title);
		
		//2. 응답페이지(list.jsp)에 전달(request 객체에 속성값으로 전달)
		request.setAttribute("list", list);
		
		return "list.jsp";
	}

}
