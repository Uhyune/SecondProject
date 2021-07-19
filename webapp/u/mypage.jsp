<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>마이페이지</title>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">

<%--    <script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>--%>
<%--    <script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>--%>

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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
        crossorigin="anonymous"></script>

<%--navbar--%>
<%@ include file="/WEB-INF/views/bit/html/navbar.jsp" %>

<%--<h4 class="alert-heading" align="center" style="margin-top: 200px">반갑습니다!</h4>--%>
<%--<p class="mb-0" style="text-align: center; font-size: 2em;">어서오세요 ${login}님.</p>--%>

<div class="container">
    <div class="py-5 text-center">
        <h2>마이 페이지</h2>
    </div>

    <form method="post">
        <table class="table table-hover" border="1">
            <thead>

            </thead>
            <tbody>
            <tr class="table-active">
                <th scope="row">아이디</th>
                <td>
                    <div class="form-group">
                        <fieldset>
                            <input class="form-control" type="text" name="id" id="id" value="${loginList.id}" readonly>
                        </fieldset>
                    </div>
                </td>
            </tr>
            <tr class="table-active">
                <th scope="row">이름</th>
                <td>
                    <div class="form-group">
                        <fieldset>
                            <input class="form-control" type="text" name="name" id="name" value="${loginList.name}" readonly>
                        </fieldset>
                    </div>
                </td>
            </tr>
            <tr class="table-active">
                <th scope="row">이메일</th>
                <td>
                    <div class="form-group">
                        <fieldset>
                            <input class="form-control" type="email" name="email" id="email" value="${loginList.email}"
                                   readonly>
                        </fieldset>
                    </div>
                </td>
            </tr>
            <tr class="table-active">
                <th scope="row">핸드폰번호</th>
                <td>
                    <div class="form-group">
                        <fieldset>
                            <input class="form-control" type="phone" name="phone" id="phone" value="${loginList.phone}"
                                   readonly>
                        </fieldset>
                    </div>
                </td>
            </tr>
            </tbody>
        </table>

        <div class="col">
            <button class="btn btn-primary btn-lg" type="button" onclick="location.href='update.jsp'">수정</button>
            <button class="btn btn-danger btn-lg" type="button" onclick="location.href='delete.jsp'">삭제</button>
        </div>
    </form>
</div>

<%--footer--%>
<footer>
    <%@ include file="/WEB-INF/views/bit/html/footer.jsp" %>
</footer>
</body>
</html>