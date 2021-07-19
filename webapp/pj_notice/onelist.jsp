<%@page import="java.util.List" %>
<%@page import="org.apache.ibatis.session.SqlSession" %>
<%@ page import="com.servlet.project.vo.PjNoticeVO" %>
<%@ page import="com.servlet.project.vo.PjCommentVO" %>
<%@ page import="com.servlet.project.model.DAO" %>
<%@ page import="com.servlet.project.mybatis.DBService" %>
<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 줄바꿈 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
    //내용 줄바꿈 
    pageContext.setAttribute("br", "<br/>");
    pageContext.setAttribute("cn", "\n");
%>

<%
    int pj_idx = Integer.parseInt(request.getParameter("pj_idx"));
    String cPage = request.getParameter("cPage");
    System.out.println("pj_idx: " + pj_idx);
    System.out.println("cPage: " + cPage);

    SqlSession ss = DBService.getFactory().openSession(true);
    PjNoticeVO vo = ss.selectOne("pjnotice.one", pj_idx);
    ss.close();

    session.setAttribute("pnVO", vo);
    System.out.println(">session pnVO: " + session.getAttribute("pnVO"));
%>

<%
    //댓글
    List<PjCommentVO> commlist = DAO.getCommList(pj_idx);
    System.out.println("댓글 리스트: " + commlist);

    pageContext.setAttribute("commlist", commlist);

    //댓글 개수
    //int c_idx = Integer.parseInt(request.getParameter("pj_idx"));
    int comcount = DAO.update_com_count(pj_idx);
    System.out.println("comcount: " + comcount);

    //조회수(상세 페이지에 들어오면 +1)
    int hitup = DAO.getUpdateHit(pj_idx);
    System.out.println("hitup: " + hitup);
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>작성글 상세화면</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
            crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script>
        //게시글 수정
        function update_go(frm) {
            frm.action = "update_notice.jsp";
            frm.submit();
        }

        //게시글 삭제
        function delete_go(frm) {
            frm.action = "delete_notice_ok.jsp";
            frm.submit();
        }

        <%--댓글 입력 함수--%>
        $(document).ready(function () {
            $("#getDataBtn").click(getPcVO);
        });
    </script>
    <style>
        * {
            font-family: NanumGothic, 'Malgun Gothic';
        }

        .col {
            display: flex;
            flex-direction: row;
            justify-content: center;
            padding: 10px;
            align-items: center;
        }

        .col button {
            padding: 10px;
            margin: 2px;
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

<div class="container">
    <div class="py-5 text-center">
        <h2>공지사항 상세</h2>
    </div>

    <form method="post">
        <table class="table table-hover" border="1">
            <thead>

            </thead>
            <tbody>
            <tr class="table-active">
                <th scope="row">글번호</th>
                <td colspan="2">
                    <div class="form-group">
                        <fieldset>
                            <input class="form-control" type="text" id="pj_idx" name="pj_idx"
                                   value="${pnVO.pj_idx}" readonly>
                        </fieldset>
                    </div>
                </td>
            </tr>
            <tr class="table-active">
                <th scope="row">작성일</th>
                <td>
                    <div class="form-group">
                        <fieldset>
                            <input class="form-control" type="text" id="regdate" name="regdate"
                                   value="<fmt:formatDate pattern="yyyy.MM.dd  hh:mm:ss" value="${pnVO.regdate}" />"
                                   readonly>
                        </fieldset>
                    </div>
                </td>
            </tr>
            <tr class="table-active">
                <th scope="row">수정일</th>
                <td>
                    <div class="form-group">
                        <fieldset>
                            <input class="form-control" type="text" id="editdate" name="editdate"
                                   value="<fmt:formatDate pattern="yyyy.MM.dd  hh:mm:ss" value="${pnVO.editdate}" />"
                                   readonly>
                        </fieldset>
                    </div>
                </td>
            </tr>
            <tr class="table-active">
                <th scope="row">글쓴이</th>
                <td>
                    <div class="form-group">
                        <fieldset>
                            <input class="form-control" type="text" id="writer" name="writer" value="${pnVO.writer}"
                                   readonly>
                        </fieldset>
                    </div>
                </td>
            </tr>
            <tr class="table-active">
                <th scope="row">제목</th>
                <td>
                    <div class="form-group">
                        <fieldset>
                            <input class="form-control" type="text" id="title" name="title" value="${pnVO.title}"
                                   readonly>
                        </fieldset>
                    </div>
                </td>
            </tr>
            <tr class="table-active">
                <th scope="row">내용</th>
                <td colspan="2">
                    <div class="form-group">
                        <fieldset>
                            <input class="form-control" type="text" id="content" name="content"
                                   value="${pnVO.content} ${fn:replace(pnVO.content, cn, br)}" readonly>
                        </fieldset>
                    </div>
                </td>
            </tr>
            </tbody>
        </table>

        <div class="col">
            <c:if test="${login == pnVO.writer}">
                <button class="btn btn-primary btn-lg" type="button" onclick="update_go(this.form)">수정</button>
                <button class="btn btn-danger btn-lg" type="button" onclick="delete_go(this.form)">삭제</button>
            </c:if>
            <c:if test="${login == null || login != pnVO.writer}">
                <button class="btn btn-danger btn-lg" onclick="alert('본인이 작성한 글만 수정할 수 있습니다.');" type="button">수정
                </button>
                <button class="btn btn-danger btn-lg" onclick="alert('본인이 작성한 글만 삭제할 수 있습니다.');" type="button">삭제
                </button>
            </c:if>
            <button class="btn btn-secondary btn-lg"
                    onclick="location.href='http://localhost:8080/pjnotice'"
                    type="button">목록으로
            </button>
        </div>
    </form>
</div>

<%--footer--%>
<footer>
    <%@ include file="/WEB-INF/views/bit/html/footer.jsp" %>
</footer>
</body>
</html>