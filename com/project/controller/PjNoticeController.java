package com.servlet.project.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

import com.servlet.project.model.DAO;
import com.servlet.project.paging.Paging;
import com.servlet.project.vo.PjNoticeVO;
import org.apache.ibatis.session.SqlSession;


@WebServlet("/pjnotice")
public class PjNoticeController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //페이징처리(n개씩 출력)
        //페이징 객체 생성
        Paging p = new Paging();

        //페이징
        //전체 게시물 수량
        p.setTotalRecord(DAO.getTotalCount());
        p.setTotalPage();
        System.out.println("> 전체 게시글 수: " + p.getTotalRecord());
        System.out.println("> 전체 페이지 수: " + p.getTotalPage());

        //현재 페이지
        String cPage = req.getParameter("cPage");
        if (cPage != null) {
            p.setNowPage(Integer.parseInt(cPage));
        }

        //시작번호 끝 번호 구하기
        p.setEnd(p.getNowPage() * p.getNumPerPage());
        p.setBegin(p.getEnd() - p.getNumPerPage() + 1);

        if (p.getEnd() > p.getTotalRecord()) {
            p.setEnd(p.getTotalRecord());
        }
        System.out.println("> 현재 페이지: " + p.getNowPage());
        System.out.println("> 시작 번호(begin): " + p.getBegin());
        System.out.println("> 끝 번호(end): " + p.getEnd());

        //블록계산하기
        //블록 시작 페이지, 끝 페이지 구하기
        int nowPage = p.getNowPage();
        int beginPage = (nowPage - 1) / p.getPagePerBlock() * p
                .getPagePerBlock() + 1;
        p.setBeginPage(beginPage);
        p.setEndPage(p.getBeginPage() + p.getPagePerBlock() - 1);

        //끝페이지가 전체페이지 수보다 크면 끝페이지를 전체 페이지수로 변경처리
        if (p.getEndPage() > p.getTotalPage()) {
            p.setEndPage(p.getTotalPage());
        }
        System.out.println("> 시작 페이지(beginPage): " + p.getBeginPage());
        System.out.println("> 끝 페이지(endPage): " + p.getEndPage());

        //===========================================
        //db연결 데이터 가져오기
        List<PjNoticeVO> list = DAO.getList(p.getBegin(), p.getEnd());
        //System.out.println("> 현재페이지 글 목록(list): "+list);

        int totalCount = DAO.getTotalCount();
        System.out.println("totalCount: " + totalCount);

        //응답페이지(pjnotice.jsp)에 전달
        req.setAttribute("list", list);
        req.setAttribute("pvo", p);

        //응답페이지 전환
        req.getRequestDispatcher("/pj_notice/pjnotice.jsp")
           .forward(req, resp);
//        resp.sendRedirect("/pj_notice/pjnotice.jsp");

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        doPost(req, resp);
    }

}
