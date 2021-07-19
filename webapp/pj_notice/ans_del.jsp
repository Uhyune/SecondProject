<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page import="com.servlet.project.vo.PjCommentVO" %>
<%@ page import="com.servlet.project.mybatis.DBService" %>
<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	PjCommentVO vo = (PjCommentVO)session.getAttribute("pcVO");
	
	SqlSession ss = DBService.getFactory().openSession(true);
	try {
		ss.delete("pjnotice.ans_delete", vo.getC_idx());
%>		
	<script>
        alert("댓글이 삭제 되었습니다.");
        location.href = "onelist.jsp";
    </script>
<%
	} catch (Exception e) {
%>
	 <script>
         alert("[예외 발생]\n목록페이지로 이동합니다.");
         location.href = "http://localhost:8080/pjnotice";
     </script>	
<% 	} finally {
		ss.close();
	}

%>