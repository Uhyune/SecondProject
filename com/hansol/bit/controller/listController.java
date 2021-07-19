package com.servlet.hansol.bit.controller;

import com.servlet.hansol.bit.common.Paging;
import com.servlet.hansol.bit.dao.DAO;
import com.servlet.hansol.bit.vo.BITVO;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/C_list")
public class listController extends HttpServlet {
		private static final long serialVersionUID = 1L;

		@Override
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			//페이징처리(n개씩 출력)
			//페이징 객체 생성
			//페이징 처리를 위한 Paging 객체 생성해서 값 읽고 설정
			Paging p = new Paging();
			
			//1. 전체 게시물의 수량 구하기
			p.setTotalRecord(DAO.getTotalCount());
			p.setTotalPage();
			System.out.println("> 전체 게시글 수 : "+p.getTotalRecord());
			System.out.println("> 전체 페이지 수 : "+p.getTotalPage());
			
			//2. 현재 페이지 구하기
			String cPage = request.getParameter("cPage");
			if(cPage != null){
				p.setNowPage(Integer.parseInt(cPage));
			}
			
			//3. 현재 페이지에 표시할 게시글 시작번호(begin)와 끝번호(end) 구하기
			p.setEnd(p.getNowPage() * p.getNumPerPage()); //현재페이지번호 * 페이지당 게시글 수
			p.setBegin(p.getEnd() - p.getNumPerPage() + 1 );
			
			if(p.getEnd() > p.getTotalRecord()){
				p.setEnd(p.getTotalRecord());
			}
			
			System.out.println(">> 현재페이지 : "+p.getNowPage());
			System.out.println(">> 시작번호(begin) : "+p.getBegin());
			System.out.println(">> 끝번호(end) : "+p.getEnd());

			//블록계산하기
			//블록 시작 페이지, 끝 페이지 구하기
			int nowPage = p.getNowPage();
			int beginPage = (nowPage - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1;
			p.setBeginPage(beginPage);
			p.setEndPage(p.getBeginPage() + p.getPagePerBlock() - 1);
			
			//4-1. 끝페이지(endPage)가 전체페이지 수(totalPage) 보다 크면 
			//	   끝페이지(endPage)를 전체페이지 수(totalPage) 로 변경처리
			if (p.getEndPage() > p.getTotalPage()){
				p.setEndPage(p.getTotalPage());
			}
			System.out.println(">> 시작번호(beginPage) : "+p.getBeginPage());
			System.out.println(">> 끝번호(endPage) : "+p.getEndPage());
			
			//=============================================
			//1. DB 연결하고 데이터 가져오기
			//현재 페이지 기준으로 DB 데이터 (게시글) 가져오기
			//시작번호(begin), 끝번호(end) 사용
			List<BITVO> list = DAO.getList(p.getBegin(), p.getEnd());
			System.out.println("> 현재페이지 글목록(list) : "+list);
			
			int totalCount = DAO.getTotalCount();
			System.out.println("totalCount: "+totalCount);
			
			//2. 응답페이지(list.jsp)에 전달(request 객체에 속성값으로 전달)
			request.setAttribute("list", list);
			request.setAttribute("pvo", p);
			
			//3. 응답페이지 전환(list.jsp 에게)
			request.getRequestDispatcher("/C_list/list.jsp").forward(request, response);
		}	
		
		@Override
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			doGet(request, response);
		}
}
