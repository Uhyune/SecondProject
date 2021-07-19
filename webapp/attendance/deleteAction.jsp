<%@page import="com.servlet.attendance.mybatis.DBService" %>
<%@page import="org.apache.ibatis.session.SqlSession" %>
<%@page import="com.servlet.attendance.DAO.DAO" %>
<%@page import="com.servlet.attendance.vo.AttVO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%
    //0. 한글처리
    request.setCharacterEncoding("utf-8");
    AttVO vo = (AttVO) session.getAttribute("AttVO");

    SqlSession ss = DBService.getFactory().openSession(true);

    try {
        ss.delete("attendance.fakeDelete", vo.getA_idx());
%>
<script>
    alert("정상 삭제 되었습니다. 목록페이지 이동");
    location.href = "list.jsp";
</script>
<%
} catch (Exception e) {
%>
<script>
    alert("[예외발생] 삭제실패!!! 이전 페이지 이동");
    history.back();
</script>
<%
    } finally {
        ss.close();
    }
%>
<script>
    alert("정상삭제 되었습니다. 목록페이지 이동");
    location.href = "list.jsp";
</script>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>삭제</title>
</head>
<body>

</body>
</html>