<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>자료 게시판</title>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
            crossorigin="anonymous"></script>

    <style type="text/css">
        * {
            font-family: NanumGothic, 'Malgun Gothic';
        }

        .-text-highlight {
            color: #8832c4;
        }

        .hidden {
            display: none;
        }

        a:link {
            text-decoration: none;
        }

        a:visited {
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        .search-form {
            text-align: right;
            margin-top: 10px;
            display: flex;
            justify-content: space-around;
        }

        .page-form {
            text-align: center;
            font-size: 1.5em;
        }

        .write-button {
            text-align: right;
            margin-right: 50px;
        }

        ul li {
            list-style-type: none;
        }

        table {
            table-layout: fixed;
            word-break: break-all;
        }

        footer {
            position: relative;
            left: 0;
            bottom: 0;
            width: 100%;
            padding: 15px 0;
            text-align: center;
        }

    </style>
</head>

<body>

<%--navbar--%>
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
                    <a class="nav-link" href="list">자료 게시판</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="http://localhost:8080/attendance/list.jsp">출결 관리</a>
                </li>
                <c:choose>
                    <c:when test="${login != null }">
                        <li class="nav-item">
                            <a class="nav-link" href="http://localhost:8080/Calendar/calendar.jsp">캘린더</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="http://localhost:8080/u/controller?type=out"
                               onclick="return confirm('로그아웃 하시겠습니까?');">${login}님 로그아웃</a>
                        </li>
                        <li>
                            <a class="nav-link" href="http://localhost:8080/u/mypage.jsp">마이페이지</a>
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


<%--Search Form--%>
<div class="container-fluid search-form">
    <form class="d-flex">
        <div class="form-group">
            <legend class="hidden">공지사항 검색 필드</legend>
            <label class="hidden">검색분류</label>
            <select class="form-select" name="f">
                <option ${(param.f=="post_title")?"selected":""} value="post_title">제목</option>
                <option ${(param.f=="writer_name")?"selected":""} value="writer_name">작성자</option>
            </select>
        </div>
        <div class="form-group">
            <input class="form-control me-sm-2" type="text" name="k" value="${param.k}" placeholder="검색어 입력">
        </div>
        <div class="form-group">
            <button class="btn btn-outline-dark" type="submit">검색</button>
        </div>
    </form>
</div>

<%--페이징 처리를 위한 변수--%>
<c:set var="page" value="${(param.p == null)?1:param.p}"/>
<c:set var="startNum" value="${page-(page-1)%5}"/>
<c:set var="lastNum" value="${fn:substringBefore(Math.ceil(count/10), '.')}"/>

<%--Table--%>
<div class="content-container">
    <table border="1" class="table table-hover">
        <thead>
        <th scope="col">번호</th>
        <th scope="col">제목</th>
        <th scope="col">글쓴이</th>
        <th scope="col">작성일</th>
        <th scope="col">조회수</th>
        </thead>
        <tbody>
        <c:forEach var="item" items="${list}">
            <tr class="table-primary">
                <c:if test="${!empty param.p || !empty param.f}">
                    <td>
                        <a href="/data-board/detail?post_no=${item.post_no}&p=${param.p}&f=${param.f}&k=${param.k}">${item.post_no}</a>
                    </td>
                    <td>
                        <a href="/data-board/detail?post_no=${item.post_no}&p=${param.p}&f=${param.f}&k=${param.k}">${item.post_title}
                            [${item.reply_cnt}]</a></td>
                </c:if>
                <c:if test="${empty param.p && empty param.f}">
                    <td><a href="/data-board/detail?post_no=${item.post_no}">${item.post_no}</a></td>
                    <td><a href="/data-board/detail?post_no=${item.post_no}">${item.post_title} [${item.reply_cnt}]</a>
                    </td>
                </c:if>
                <td>${item.writer_name}</td>
                <td><fmt:formatDate pattern="yyyy.MM.dd" value="${item.reg_date}"></fmt:formatDate></td>
                <td><fmt:formatNumber value="${item.hit}"/></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<div class="write-button">
    <c:if test="${login != null}">
        <c:if test="${!empty param.p || !empty param.f}">
            <h2>
                <button onclick="location.href='write?p=${param.p}&f=${param.f}&k=${param.k}'" type="button"
                        class="btn btn-primary btn-lg">글 쓰기
                </button>
            </h2>
        </c:if>
        <c:if test="${empty param.p && empty param.f}">
            <h2>
                <button onclick="location.href='write'" type="button" class="btn btn-primary btn-lg">글 쓰기</button>
            </h2>
        </c:if>
    </c:if>
    <c:if test="${login == null}">
        <h2>
            <button onclick="alert('로그인 후 이용 가능합니다.');" type="button" class="btn btn-primary btn-lg">글 쓰기</button>
        </h2>
    </c:if>
</div>

<%--Page--%>
<div class="page-form">
    <c:if test="${startNum>1}">
        <button class="btn btn-outline-primary" onclick="location.href='?p=${startNum-1}&f=${param.f}&k=${param.k}'">
            이전
        </button>
    </c:if>
    <c:if test="${startNum<=1}">
        <button class="btn btn-outline-primary" onclick="alert('이전 페이지가 없습니다');">이전</button>
    </c:if>

    <c:forEach var="i" begin="0" end="4">
        <c:if test="${(startNum+i) <= lastNum}">
            <a class="-text-${(param.p==(startNum+i))?'highlight':''}"
               href="?p=${startNum+i}&f=${param.f}&k=${param.k}">${startNum+i}</a>
        </c:if>
    </c:forEach>

    <c:if test="${startNum+5<=lastNum}">
        <button class="btn btn-outline-primary" onclick="location.href='?p=${startNum+5}&f=${param.f}&k=${param.k}'">
            다음
        </button>
    </c:if>
    <c:if test="${startNum+5>lastNum}">
        <button class="btn btn-outline-primary" onclick="alert('다음 페이지가 없습니다');">다음</button>
    </c:if>
</div>

<div class="page-form" style="text-align: right; margin-right: 20px; font-weight: bold">
    <span>${(empty param.p)?1:param.p} / ${lastNum!=0?lastNum:1} 페이지</span>
</div>
<%--style="text-align: right; margin-right: 30px"--%>

<%--footer--%>
<footer>
    <%@ include file="../html/footer.jsp" %>
</footer>
</body>
</html>

<%--yaho--%>