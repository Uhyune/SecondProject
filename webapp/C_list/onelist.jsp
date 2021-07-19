<%@page import="org.apache.ibatis.session.SqlSession" %>
<%@ page import="com.servlet.hansol.bit.vo.BITVO" %>
<%@ page import="com.servlet.hansol.bit.mybatis.DBService" %>
<%@ page import="com.servlet.hansol.bit.dao.DAO" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>

<%-- 전달받은 데이터(idx)로 DB데이터 조회 후 화면 출력 --%>
<%
    //1. 전달받은 데이터 확인
    int b_idx = Integer.parseInt(request.getParameter("b_idx"));
    String cPage = request.getParameter("cPage"); //게시글 조회수 1증가 처리
    System.out.println("b_idx : " + b_idx);
    System.out.println("cPage : " + cPage);

    //2. DB관련작업 - SqlSession 객체 생성
    SqlSession ss = DBService.getFactory().openSession(true);

    //조회수
    int plusReadCount = DAO.getUpdateHit(b_idx);
    System.out.println("plusReadCount : " + plusReadCount);

    //3. DB관련작업 - 데이터 가져오기
    BITVO vo = ss.selectOne("BIT.one", b_idx);
    ss.close();
    //System.out.println(">> vo : "+vo);

    //EL, JSTL 사용 + 검색데이터 계속 사용을 위해 session에 등록
    session.setAttribute("BITVO", vo);
    System.out.println(">session BITBVO : " + session.getAttribute("BITVO"));

    //내용부분에 빈칸 넣기
    pageContext.setAttribute("br", "<br/>");
    pageContext.setAttribute("cn", "\n");
%>

<html>
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
            crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>상세 페이지</title>

    <style>
        @import "/WEB-INF/views/bit/css/reset.css";

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
        <h2>공지사항 상세화면</h2>
    </div>
    <form method="post">
        <table class="table table-hover" border="1">
            <thead>

            </thead>
            <tbody>
            <tr class="table-active">
                <th scope="row">글 번호</th>
                <td>
                    <div class="form-group">
                        <fieldset>
                            <input class="form-control" name="b_idx" id="b_idx" type="text" value="${BITVO.b_idx}"
                                   readonly="">
                        </fieldset>
                    </div>
                </td>
            </tr>
            <tr class="table-active">
                <th scope="row">작성일</th>
                <td>
                    <div class="form-group">
                        <fieldset>
                            <input class="form-control" name="write_date" id="write_date" type="text"
                                   value="${BITVO.write_date }" readonly="">
                        </fieldset>
                    </div>
                </td>
            </tr>
            <tr class="table-active">
                <th scope="row">글쓴이</th>
                <td>
                    <div class="form-group">
                        <fieldset>
                            <input class="form-control" name="writer" id="writer" type="text"
                                   value="${BITVO.writer }"
                                   readonly="">
                        </fieldset>
                    </div>
                </td>
            </tr>
            <tr class="table-active">
                <th scope="row">제목</th>
                <td>
                    <div class="form-group">
                        <fieldset>
                            <input class="form-control" name="subject" id="subject" type="text"
                                   value="${BITVO.subject }"
                                   readonly="">
                        </fieldset>
                    </div>
                </td>
            </tr>
            <tr class="table-active">
                <th>내용</th>
                <td>
                    <div class="form-group">
                        <fieldset>
                            <input class="form-control" id="content" name="content"
                                   type="text" value="${fn:replace(BITVO.content, cn, br) }"
                                   readonly="">
                        </fieldset>
                    </div>
                </td>
            </tr>
            <tr class="table-active">
                <th>조회수</th>
                <td>
                    <div class="form-group">
                        <fieldset>
                            <input class="form-control" id="hit" name="hit" type="text" value="${BITVO.hit }"
                                   readonly="">
                        </fieldset>
                    </div>
                </td>
            </tr>
            </tbody>
        </table>

        <div class="col">
            <c:if test="${login == BITVO.writer}">
                <button class="btn btn-primary btn-lg" onclick="update_go(this.form)">수정</button>
                <button class="btn btn-danger btn-lg" onclick="delete_go(this.form)">삭제</button>
                <button class="btn btn-secondary btn-lg" onclick="list_go(this.form)">목록</button>
            </c:if>
            <c:if test="${login != BITVO.writer}">
                <button class="btn btn-primary btn-lg" onclick="alert('본인이 작성한 글만 수정할 수 있습니다.');">수정</button>
                <button class="btn btn-danger btn-lg" onclick="alert('본인이 작성한 글만 삭제할 수 있습니다');">삭제</button>
                <button class="btn btn-secondary btn-lg" onclick="list_go(this.form)">목록</button>
            </c:if>
        </div>
    </form>
</div>

<%--footer--%>
<footer>
    <%@ include file="/WEB-INF/views/bit/html/footer.jsp" %>
</footer>

<script>
    function update_go(frm) {
        frm.action = "modify.jsp"; //수정 페이지
        frm.submit();
    }

    function delete_go(frm) {
        frm.action = "delete_ok.jsp"; //삭제 페이지
        frm.submit();
    }

    function list_go(frm) {
        frm.action = "../C_list"; //목록 페이지
        frm.submit();
    }
</script>
</body>
</html>
