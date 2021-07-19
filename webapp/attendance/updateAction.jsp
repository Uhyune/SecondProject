<%@page import="com.servlet.attendance.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	//0. 한글처리
	request.setCharacterEncoding("utf-8");

	//1. 파라미터 값 추출해서 VO에 저장
%>
	<jsp:useBean id="AttVO" class="com.servlet.attendance.vo.AttVO" />
	<jsp:setProperty property="*" name="AttVO" />
<% 
	System.out.println("> local vo : " + AttVO);
	
	//2. SqlSession 객체 생성
	SqlSession ss = DBService.getFactory().openSession(true);
	
		//빈 칸일 경우 오류
%>
		<c:if test="${AttVO.a_type == null || AttVO.a_title == null || AttVO.a_writer == null || AttVO.a_content == null || AttVO.a_title.equals(' ') || AttVO.a_writer.equals(' ') ||  AttVO.a_content.equals(' ')}">
 		<script>
			alert("입력 안 된 사항이 있습니다.");
 			history.back();
 		</script>
		</c:if>
<%

	//3. 매퍼의 update SQL 실행
	try {
		ss.insert("attendance.update", AttVO);
	
		//4. 페이지 이동 처리 (정상처리)
%>
		<script>
			alert("정상 수정되었습니다. \n 목록페이지로 이동합니다.");
			location.href="list.jsp";
		</script>
		
<%

	} catch (Exception e) {
		e.printStackTrace();
%>
	
	<script>
		alert("[예외 발생] 수정 중 예외가 발생했습니다.\n "
				+ "담당자에게 연락하세요.\n" 
				+ "상세 페이지로 이동합니다.");
		history.back();
	
	</script>
<%
	}
	ss.close();
%>

