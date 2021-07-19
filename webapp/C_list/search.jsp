<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
            crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <title>검색</title>
</head>
<style>
    * {
        font-family: NanumGothic, 'Malgun Gothic';
    }

    .-text-highlight {
        color: #0f0f0f;
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
        position: absolute;
        left: 0;
        bottom: 0;
        width: 100%;
        padding: 15px 0;
        text-align: center;
    }
</style>

<body>

<%--navbar--%>
<%@ include file="/WEB-INF/views/bit/html/navbar.jsp" %>

<div class="content-container">
    <div class="py-5 text-center">
        <h2>검색 결과</h2>
    </div>

    <table border="1" class="table table-hover">
        <thead>
        <tr>
            <th scope="col">글 번호</th>
            <th scope="col">제목</th>
            <th scope="col">글쓴이</th>
            <th scope="col">작성일</th>
            <th scope="col">조회수</th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${!empty list }">
            <c:forEach var="vo" items="${list }">
                <tr class="table-primary">
                    <td>${vo.getB_idx() }</td>
                    <td>
                        <a href="C_list/onelist.jsp?b_idx=${vo.b_idx}">${vo.subject }</a></td>
                    <td>${login }</td>
                    <td>${vo.write_date }</td>
                    <td>${vo.hit }</td>
                </tr>
            </c:forEach>
        </c:if>
        <c:if test="${empty list}">
            <tr class="table-primary">
                <td colspan="5">검색된 데이터가 없습니다</td>
            </tr>
        </c:if>
        </tbody>
    </table>
    <div class="row">
        <div class="col">
            <button class="btn btn-secondary btn-lg" onclick="location.href='../C_list'">목록으로</button>
        </div>
    </div>
</div>
<%--검색 게시판 내에서 글쓰기 눌렀을 때 --%>
<form method="post">
    <div class="write-button">
        <c:if test="${login == null}">
            <h2>
                <button onclick="alert('로그인 후 이용 가능합니다.');" type="button" class="btn btn-primary btn-lg">공지사항 작성
                </button>
            </h2>
        </c:if>
        <c:if test="${login != null}">
            <a type="button" class="btn btn-primary" href="write.jsp">공지사항 작성</a>
        </c:if>
    </div>
</form>

<%--footer--%>
<footer>
    <%@ include file="/WEB-INF/views/bit/html/footer.jsp" %>
</footer>
</body>
</html>