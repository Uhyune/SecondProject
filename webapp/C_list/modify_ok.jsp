<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page import="com.servlet.hansol.bit.mybatis.DBService" %>
<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//0.한글처리
	request.setCharacterEncoding("UTF-8");

	//1. 파라미터 값 추출해서 VO 에 저장
	
%>  
	<jsp:useBean id="vo" class="com.servlet.hansol.bit.vo.BITVO" />
	<jsp:setProperty property="*" name="vo" />
<%
	System.out.println("> local vo : "+vo);
	System.out.println("> pageContext vo : "+pageContext.getAttributesScope("vo"));
	
	//2. SqlSession 객체 생성
	SqlSession ss = DBService.getFactory().openSession(true); //자동 커밋상태(실행시 자동으로 커밋)
	
	try {
		//3. 화면전환 - 정상처리시
		ss.update("BIT.update", vo);
		response.sendRedirect("onelist.jsp?b_idx="+ vo.getB_idx()); //상세페이지 이동
	} catch (Exception e){
		e.printStackTrace();
		//3.화면전환 - 예외발생시

%>
	<script>
	alert("[예외발생] 수정 중 예외가 발생했습니다 \n"
			+ "관리자에게 연락하세요(02.123.4567) \n"
			+ "이전 페이지로 이동합니다. ");
	history.back();
	</script>
<%
	} finally {
		ss.close(); //작업 끝나고나면 close 처리
	}

%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정</title>
</head>
<body>

</body>
</html>