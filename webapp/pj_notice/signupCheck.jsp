<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  <link rel="stylesheet" href="css/bootstrap.css"> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/sandstone/bootstrap.min.css" 
integrity="undefined" crossorigin="anonymous">
<meta charset="UTF-8">
<title>회원가입완료화면</title>
<script>
	alert("회원가입이 정상 처리 되었습니다.");
</script>
</head>
<body>
<%@include file ="navbar.jsp" %>
	
    <div class="">
        <h3>회원가입</h3>
        <p class="">회원가입이 완료 되었습니다.</p>
        <div class="">
            <ul>
                <li><strong>아이디</strong><span>${vo.id}</span></li>
                <li><strong>이름</strong><span>${vo.name}</span></li>
                <li><strong>이메일</strong><span>${vo.email}</span></li>
            </ul>
        </div>
       
        <p class="btn-group">
            <button onclick="location.href='login.jsp' ">로그인</button>
            <button >메인 페이지로 이동</button>
        </p>
    </div>

</body>
</html>