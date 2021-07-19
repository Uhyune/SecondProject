<%@page import="com.servlet.attendance.mybatis.DBService" %>
<%@page import="org.apache.ibatis.session.SqlSession" %>
<%@page import="com.servlet.attendance.DAO.DAO" %>
<%@page import="java.io.PrintWriter" %>
<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
            crossorigin="anonymous"></script>

    <title>글쓰기 action</title>
</head>

<body onload="add()">

<%
    //0. 한글처리
    request.setCharacterEncoding("utf-8");

    //1. 파라미터 값 추출해서 VO에 저장
    String a_title = request.getParameter("a_title");
    System.out.println("a_title = "+ a_title);

%>
<jsp:useBean id="AttVO" class="com.servlet.attendance.vo.AttVO"/>
<jsp:setProperty property="*" name="AttVO"/>
<%


    System.out.println("> AttVO : " + AttVO);

    //2. SqlSession 객체 생성
    SqlSession ss = DBService.getFactory().openSession(true);

    //2-2 제목이나 내용이 빈 칸 이면
%>
<c:if test="${AttVO.a_type == null || AttVO.a_title == null || AttVO.a_writer == null || AttVO.a_content == null
		|| AttVO.a_title.equals(' ') || AttVO.a_writer.equals(' ') ||  AttVO.a_content.equals(' ')}">
    <script>
        alert("입력 안 된 사항이 있습니다. \n 빈 칸을 확인해 주세요.");
        history.back();
    </script>
</c:if>

<!-- 2-3 분류 받아주기 -->
<c:if test="${AttVO.a_type == 'sick' }">

</c:if>

<%
    //3. 매퍼의 insert SQL 실행
    try {
        ss.insert("attendance.insert", AttVO);
        //4. 페이지 이동 처리 (정상)
%>
<script>
    alert("정상 입력되었습니다. \n 목록페이지로 이동합니다.");
    location.href = "list.jsp";
</script>
<%

} catch (Exception e) {
    e.printStackTrace();
%>
<script>
    alert("[예외발생] 입력 중 예외가 발생했습니다.\n"
        + "담당자(8282)에게 연락하세요.\n"
        + "이전 페이지로 이동합니다.");
    history.back();
</script>
<%
    }
    ss.close();
%>

</body>
</html>
