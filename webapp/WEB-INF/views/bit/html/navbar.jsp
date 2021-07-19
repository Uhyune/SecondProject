<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
        crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">


<nav class="navbar navbar-expand-lg navbar-dark bg-dark" id="navbarResponsive">
    <div class="container-fluid">
        <c:if test="${!empty login}">
        <a href="http://localhost:8080/u/main.jsp"><img src="/u/Blogo.svg" alt="로고" height="30" width="40"></a>
        </c:if>
        <c:if test="${empty login}">
            <img src="/u/Blogo.svg" alt="로고" height="30" width="40">
        </c:if>
        <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor02"
                aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>


        <div class="navbar-collapse collapse" id="navbarColor02">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="http://localhost:8080/C_list">공지사항 게시판</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="http://localhost:8080/pjnotice">프로젝트 게시판</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="http://localhost:8080/data-board/list">자료 게시판</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="http://localhost:8080/attendance/list.jsp">출결 관리</a>
                </li>
                <c:choose>
                    <c:when test="${!empty login}">
                        <li class="nav-item">
                            <a class="nav-link" href="http://localhost:8080/Calendar/calendar.jsp">캘린더</a>
                        </li>
                        <li class="nav-item" style="align-content: center">
                            <a class="nav-link" href="http://localhost:8080/u/controller?type=out"
                               onclick="return confirm('로그아웃 하시겠습니까??');">${login}님 로그아웃</a>
                        </li>
                        <li style="float: right">
                            <a class="nav-link" href="http://localhost:8080/u/mypage.jsp">마이페이지</a>
                        </li>
                    </c:when>
                    <c:when test="${empty login}">
                        <li class="nav-item" style="float: right">
                            <a class="nav-link" href="http://localhost:8080/u/login.jsp">로그인</a>
                        </li>
                    </c:when>
                </c:choose>
            </ul>
        </div>
    </div>
</nav>
