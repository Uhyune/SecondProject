<%@page import="com.servlet.u.model.MemberVO" %>
<%@page import="com.servlet.attendance.DAO.DAO" %>
<%@page import="java.io.PrintWriter" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="com.servlet.attendance.vo.AttVO" %>
<%@page import="com.servlet.attendance.mybatis.DBService" %>
<%@page import="org.apache.ibatis.session.SqlSession" %>
<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<%
    String a_idx = request.getParameter("a_idx");
    System.out.println("a_idx : " + a_idx);
    // 	int a_index = Integer.parseInt(a_idx);

    SqlSession ss = DBService.getFactory().openSession();

    AttVO vo = ss.selectOne("attendance.one", a_idx);
    ss.close();
    System.out.println(" > vo : " + vo);

    session.setAttribute("AttVO", vo);
    System.out.println("> session AttVO : " + session.getAttribute("AttVO"));

    //줄바꿈 + taglib prefix="fn"도 해줘야함
    pageContext.setAttribute("br", "<br>");
    pageContext.setAttribute("cn", "\n");

%>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
            crossorigin="anonymous"></script>
    <title>상세 페이지 화면</title>
    <script>
        function update_go(frm) {
            frm.action = "update.jsp";
            frm.submit();
        }

        function delete_go(frm) {
            confirm("정말로 삭제하시겠습니까?")
            if (true) {
                frm.action = "deleteAction.jsp?a_idx=${a_idx }";
                frm.submit();
            } else {
                history.back();
            }
        }

        $(function () {
            $(".chk").on("click", function () {
                console.log("클릭");
                $(this).val("O");
            })
        })

    </script>

    <style>
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
        <h2>글 상세보기</h2>
    </div>
    <form method="post" action="download.jsp">
        <table class="table table-hover" border="1">
            <thead>
            <tr>
                <th colspan="3" style="background-color: #325d88; color:white; text-align: center;">게시판 글 보기</th>
            </tr>
            </thead>
            <tbody>
            <tr class="table-active">
                <th scope="row">글 제목</th>
                <td>
                    <div class="form-group">
                        <fieldset>
                            <input class="form-control" name="a_title" id="a_title" type="text"
                                   value="${AttVO.a_title }"
                                   readonly="">
                        </fieldset>
                    </div>
                </td>
            </tr>
            <tr class="table-active">
                <th scope="row">분류</th>
                <td>
                    <div class="form-group">
                        <fieldset>
                            <input class="form-control" name="a_type" id="a_type" type="text" value="${AttVO.a_type}"
                                   readonly="">
                        </fieldset>
                    </div>
                </td>
            </tr>
            <tr class="table-active">
                <th scope="row">글쓴이</th>
                <td>
                    <div class="form-group">
                        <fieldset>
                            <input class="form-control" name="a_writer" id="a_writer" type="text"
                                   value="${AttVO.a_writer }"
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
                                   value="${AttVO.write_date }"
                                   readonly="">
                        </fieldset>
                    </div>
                </td>
            </tr>
            <tr class="table-active">
                <th scope="row">글 내용</th>
                <td>
                    <div class="form-group" style="height:200px">
                        <fieldset>
                            <input class="form-control" name="write_content" id="write_content" type="text"
                                   value="${fn:replace(AttVO.a_content, cn, br)}"
                                   readonly="" style="height:200px">
                        </fieldset>
                    </div>
                </td>
            </tr>
            <tr class="table-active">
                <th>첨부 파일</th>
                <td>
                    <div align="center">
                        <a style="text-align:left; ">업로드된 파일.jpg</a>
                    </div>
                </td>
            </tr>
            <tr class="table-active">
                <th>확인 여부</th>
                <td>
                    <div class="form-group">
                        <fieldset>
                            <input type="button" class="btn btn-outline-primary form-control chk" id="status0"
                                   name="status" value='${(AttVO.status==0)?"X":"O" }'/>
                        </fieldset>
                    </div>
                </td>
            </tr>
            </tbody>
        </table>

        <div class="col" align="center">
            <button class="btn btn-primary btn-lg" onclick="update_go(this.form)" type="button">
                수정
            </button>
            <button class="btn btn-danger btn-lg" onclick="delete_go(this.form)" type="button">
                삭제
            </button>
            <button class="btn btn-secondary btn-lg" onclick="location.href='list.jsp'" type="button">
                목록
            </button>
        </div>
    </form>
</div>

<footer>
    <%@ include file="/WEB-INF/views/bit/html/footer.jsp" %>
</footer>

</body>
</html>