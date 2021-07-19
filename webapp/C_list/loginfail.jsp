  
<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- <link rel="stylesheet" href="css/bootstrap.css">  -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/sandstone/bootstrap.min.css" 
integrity="undefined" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <meta http-equiv="Refresh" content="1.5; url=login.jsp">
    <title>로그인 실패</title>
</head>
<body>

<%--navbar--%>
<%@include file ="navbar.jsp" %>

<div  style="position : absolute; top : 30%; left : 40% ; border : solid 1px gray;">
<p>로그인에 실패하였습니다. 아이디 또는 비밀번호를 다시 확인하십시오.<br>
잠시 후 로그인 화면으로 이동됩니다.</p>
</div>
</body>
</html>