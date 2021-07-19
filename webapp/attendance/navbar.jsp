<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        <a class="navbar-brand" href="">BIIT</a>
        <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor02"
                aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="navbar-collapse collapse" id="navbarColor02">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="">HOME
                        <span class="visually-hidden">(current)</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="">공지사항 게시판</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="list.jsp">프로젝트 게시판</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="list">자료 게시판</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="">일정 관리</a>
                </li>
                <c:choose>
                    <c:when test="${login != null }">
                        <li class="nav-item">
                            <a class="nav-link" href="http://localhost:8080/u/controller?type=out" onclick="return confirm('로그아웃?');">${login}님 로그아웃</a>
                        </li>
                    </c:when>
                    <c:when test="${login == null }">
                        <li class="nav-item">
                            <a class="nav-link" href="http://localhost:8080/u/login.jsp">로그인</a>
                        </li>
                    </c:when>
                </c:choose>
            </ul>
        </div>
    </div>
</nav>
