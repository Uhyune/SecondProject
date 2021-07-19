<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
            crossorigin="anonymous"></script>

    <title>공지사항 게시판</title>

    <style type="text/css">
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

        .now {
            color: #8832c4;
            text-decoration: none;
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
<%@ include file="/WEB-INF/views/bit/html/navbar.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
        crossorigin="anonymous"></script>

<%-- 검색 --%>
<div class="container-fluid search-form">
    <form action="C_list/search.jsp" method="get" class="d-flex">
        <div class="form-group">
            <legend class="hidden">공지사항 검색 필드</legend>
            <label class="hidden">검색분류</label>
            <select class="form-select" name="f">
                <option ${(param.f=="subject")?"selected":""} value="subject">제목</option>
                <option ${(param.f=="content")?"selected":""} value="content">내용</option>
                <option ${(param.f=="writer")?"selected":""} value="writer">작성자</option>
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

<%-- Table --%>
<div class="content-container">
    <table border="1" class="table table-hover">
        <thead>
        <tr>
            <th scope="col">번호</th>
            <th scope="col">제목</th>
            <th scope="col">작성자</th>
            <th scope="col">작성일</th>
            <th scope="col">조회수</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="vo" items="${list }">
            <tr class="table-primary">
                <c:if test="${not empty list }">
                    <td>${vo.getB_idx() }</td>
                    <td>
                        <a href="http://localhost:8080/C_list/onelist.jsp?b_idx=${vo.b_idx}&cPage=${pvo.nowPage}">${vo.subject }</a>
                    </td>
                    <td>${vo.getWriter() }</td>
                    <td>${vo.write_date }</td>
                    <td>${vo.hit }</td>
                </c:if>
            </tr>
            <c:if test="${empty list}">
                <tr>
                    <td colspan="5">
                        <h2>현재 등록된 게시글이 없습니다.</h2>
                    </td>
                </tr>
            </c:if>
        </c:forEach>
        </tbody>
    </table>

    <%--공지사항 작성--%>
    <div class="write-button">
        <c:if test="${login == null}">
            <h2>
                <button onclick="alert('로그인 후 이용 가능합니다.');" type="button"
                        class="btn btn-primary btn-lg">공지사항 작성
                </button>
            </h2>
        </c:if>
        <c:if test="${login != null}">
            <h2>
                <a type="button" class="btn btn-primary" href="C_list/write.jsp">공지사항 작성</a>
            </h2>
        </c:if>
    </div>
</div>

<div class="page-form">
    <c:if test="${pvo.beginPage != 1 }">
        <button class="btn btn-outline-primary" onclick="location.href='pjnotice?cPage=${pvo.beginPage - 1}'">
            이전
        </button>
    </c:if>
    <c:if test="${pvo.beginPage == 1}">
        <button class="btn btn-outline-primary" onclick="alert('이전 페이지가 없습니다');">이전</button>
    </c:if>

    <c:forEach var="pageNo" begin="${pvo.beginPage}" end="${pvo.endPage}">
        <c:choose>
            <c:when test="${pageNo == pvo.nowPage  }"> <%--현재 페이지랑 누른 페이지 같으면 링크처리x --%>
                <a class="now">${pageNo }</a>
            </c:when>
            <c:otherwise>
                <a href="C_list?cPage=${pageNo}">${pageNo}</a> <%--현재 페이지랑 누른 페이지 다르면 링크처리 --%>
            </c:otherwise>
        </c:choose>
    </c:forEach>

    <c:if test="${pvo.endPage < pvo.totalPage }">
        <button class="btn btn-outline-primary" onclick="location.href='C_list?cPage=${pvo.endPage+1}'">
            다음
        </button>
    </c:if>
    <c:if test="${pvo.endPage >= pvo.totalPage }">
        <button class="btn btn-outline-primary" onclick="alert('다음 페이지가 없습니다');">다음</button>
    </c:if>
</div>

<%--footer--%>
<footer>
    <%@ include file="/WEB-INF/views/bit/html/footer.jsp" %>
</footer>

</body>
</html>







