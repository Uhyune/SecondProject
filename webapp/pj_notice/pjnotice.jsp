<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>

    <title>프로젝트 게시판</title>
    <style>
        * {
            font-family: NanumGothic, 'Malgun Gothic';
        }

        .paging {
            list-style: none;
        }

        .paging li {
            float: left;
            margin-right: 8px;
        }

        .paging .disable {
            padding: 3px 7px;
            color: silver;
        }

        .now {
            color: #8832c4;
            text-decoration: none;
        }

        .paging li a:hover {
            background-color: #00B3DC;
            color: white;
        }

        .search-form {
            text-align: right;
            margin-top: 10px;
            display: flex;
            justify-content: space-around;
        }

        footer {
            position: relative;
            left: 0;
            bottom: 0;
            width: 100%;
            padding: 15px 0;
            text-align: center;
        }

        tfoot {
            text-align: center;
            font-size: 1.5em;
        }

        .page-form {
            text-align: center;
            font-size: 1.5em;
        }

        table {
            table-layout: fixed;
            word-break: break-all;
        }

        .write-button {
            text-align: right;
            margin-right: 50px;
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
    </style>

</head>
<body>

<%--navbar--%>
<%@ include file="/WEB-INF/views/bit/html/navbar.jsp" %>

<div class="container-fluid search-form">
    <%--    <h1 class="text-center">프로젝트 공지사항</h1>--%>
    <form class="d-flex" action="pj_notice/search" method="get">
        <%--검색 --%>
        <div class="input-group">
            <div class="form-group navbar-left">
                <select name="f" class="form-control">
                    <option ${(param.f=="title")?"selected":""} value="title">제목</option>
                    <option ${(param.f=="content")?"selected":""} value="content">내용</option>
                    <option ${(param.f=="writer")?"selected":""} value="writer">작성자</option>
                </select>
            </div>
            <!-- 검색 버튼-->
            <input class="form-control me-sm-2" type="text" placeholder="검색어 입력" name="q">
            <%--            <input type="hidden" name="type" value="writerList">--%>
            <button class="btn btn-secondary my-2 my-sm-0" type="submit">검색</button>
        </div>
    </form>
</div>

<div class="content-container">
    <table border="1" class="table table-hover">
        <thead>
        <tr>
            <th scope="col">글번호</th>
            <th scope="col">제목</th>
            <th scope="col">작성자</th>
            <th scope="col">작성일</th>
            <th scope="col">조회수</th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${not empty list }">
            <c:forEach var="vo" items="${list }">
                <tr class="table-primary">
                    <td>${vo.getPj_idx() }</td>
                    <td>
                        <a href="pj_notice/onelist.jsp?pj_idx=${vo.pj_idx}&cPage=${pvo.nowPage}">${vo.title }
                            <c:if test="${vo.com_count != 0 }">
                                <small><b>[&nbsp;<c:out value="${vo.com_count}"/>&nbsp;]</b></small>
                            </c:if>
                        </a>
                    </td>
                    <td>${vo.getWriter() }</td>
                    <td><fmt:formatDate pattern="yyyy.MM.dd" value="${vo.regdate}" /></td>
                    <td>${vo.hit }</td>
                </tr>
            </c:forEach>
        </c:if>
        <c:if test="${empty list}">
            <tr class="table-primary">
                <td colspan="6">
                    <h2>현재 등록된 게시글이 없습니다.</h2>
                </td>
            </tr>
        </c:if>
        </tbody>
    </table>
</div>

<div class="write-button">
    <c:if test="${login != null}">
        <c:if test="${!empty param.p || !empty param.f}">
            <h2>
                <button onclick="location.href='write?p=${param.p}&f=${param.f}&q=${param.q}'" type="button"
                        class="btn btn-primary btn-lg">공지사항 작성
                </button>
            </h2>
        </c:if>
        <c:if test="${empty param.p && empty param.f}">
            <h2>
                <button onclick="location.href='pj_notice/write_notice.jsp'" type="button"
                        class="btn btn-primary btn-lg">공지사항 작성
                </button>
            </h2>
        </c:if>
    </c:if>
    <c:if test="${login == null}">
        <h2>
            <button onclick="alert('로그인 후 이용 가능합니다.');" type="button" class="btn btn-primary btn-lg">공지사항 작성</button>
        </h2>
    </c:if>
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

    <c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
        <c:choose>
            <c:when test="${pageNo == pvo.nowPage  }"> <%--현재 페이지랑 누른 페이지 같으면 링크처리x --%>
                <a class="now">${pageNo }</a>
            </c:when>
            <c:otherwise>
                <a href="pjnotice?cPage=${pageNo}">${pageNo}</a> <%--현재 페이지랑 누른 페이지 다르면 링크처리 --%>
            </c:otherwise>
        </c:choose>
    </c:forEach>

    <c:if test="${pvo.endPage < pvo.totalPage }">
        <button class="btn btn-outline-primary" onclick="location.href='pjnotice?cPage=${pvo.endPage+1}'">
            다음
        </button>
    </c:if>
    <c:if test="${pvo.endPage >= pvo.totalPage }">
        <button class="btn btn-outline-primary" onclick="alert('다음 페이지가 없습니다');">다음</button>
    </c:if>
</div>

<%--footer--%>
<footer id="footer">
    <%@ include file="/WEB-INF/views/bit/html/footer.jsp" %>
</footer>
</body>
</html>