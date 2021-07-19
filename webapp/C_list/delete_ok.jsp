<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page import="com.servlet.hansol.bit.vo.BITVO" %>
<%@ page import="com.servlet.hansol.bit.mybatis.DBService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//0. 한글처리를 위한 encoding 설정
	request.setCharacterEncoding("UTF-8");

	
	BITVO vo = (BITVO) session.getAttribute("BITVO");
	
	
	SqlSession ss = DBService.getFactory().openSession(true);
		try {
			ss.delete("BIT.delete", vo.getB_idx());
%>
			<script>
				alert("정상삭제 되었습니다. 목록페이지로 이동");
				location.href = "../C_list";
			</script>
<%	
		} catch (Exception e) { 
%>
			<script>
				alert("[예외발생] 삭제 실패!!! 목록페이지 이동");
				location.href = "../C_list";
			</script>
<%	
		} finally {
			ss.close();
			
		}
	
%>    
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>