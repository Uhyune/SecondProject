<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script>
        function send_go1(frm) {
            frm.action = "controller?type=delete";
            frm.submit();
        }

        function passwordck() {
            if (document.delete.password.value !=${loginList.password}) {
                alert("비밀번호가 일치하지 않습니다.");
            } else {
                const target = document.getElementById('delete');
                target.disabled = false;
            }
        }
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
            position: absolute;
            left: 0;
            bottom: 0;
            width: 100%;
            padding: 15px 0;
            text-align: center;
        }

    </style>
    <meta charset="UTF-8">
    <title>탈퇴페이지</title>
</head>
<body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
        crossorigin="anonymous"></script>

<%--navbar--%>
<%@ include file="/WEB-INF/views/bit/html/navbar.jsp" %>

<div class="container">
    <div class="py-5 text-center">
        <h2>회원 탈퇴</h2>
    </div>
    <form name="delete" method="post">
        <table class="table table-hover" border="1">
            <thead align="center">
            <h2>${loginList.name}님의 개인 페이지</h2>
            </thead>
            <tbody>
            <tr class="table-active">
                <th scope="row">비밀번호를 입력하세요</th>
                <div class="form-group">
                    <fieldset>
                        <td><input class="form-control" type="password" name="password" id="password"
                                   onblur="passwordck()"></td>
                    </fieldset>
                </div>
            </tr>
            </tbody>
        </table>
        <div class="col">
            <input type="hidden" name="id" value="${loginList.id}">
            <button class="btn btn-danger btn-lg" type="button" disabled="disabled" id="delete"
                    onclick="send_go1(this.form)">탈퇴하기
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