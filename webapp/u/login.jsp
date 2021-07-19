<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인화면</title>

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
            position: absolute;
            left: 0;
            bottom: 0;
            width: 100%;
            padding: 15px 0;
            text-align: center;
        }

    </style>
</head>
<script>
    function send_go1(frm) {
        frm.action = "controller?type=sign";
        frm.submit();
    }

    function send_go2(frm) {
        frm.action = "controller?type=login";
        frm.submit();
    }


</script>
<body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
        crossorigin="anonymous"></script>

<%--navbar--%>
<%@ include file="/WEB-INF/views/bit/html/navbar.jsp" %>

<c:if test="${!empty request.getParameter('vo')}">
    <script language="javascript">
        alert('회원가입이 완료되었습니다.');
    </script>
</c:if>

<div class="container">
    <div class="py-5 text-center">
        <h2>로그인</h2>
    </div>

    <form name="writeForm" method="post">
        <table class="table table-hover" border="1">
            <thead>

            </thead>
            <tbody>
            <tr class="table-active">
                <th scope="row">아이디</th>
                <td>
                    <div class="form-group">
                        <fieldset>
                            <input class="form-control" type="text" name="id" id="id" placeholder="아이디를 입력하세요.">
                        </fieldset>
                    </div>
                </td>
            </tr>
            <tr class="table-active">
                <th scope="row">비밀번호</th>
                <td>
                    <div class="form-group">
                        <fieldset>
                            <input class="form-control" type="password" name="password" id="password"
                                   placeholder="비밀번호를 입력하세요.">
                        </fieldset>
                    </div>
                </td>
            </tr>
            </tbody>
        </table>

        <div class="row">
            <div class="col">
                <button class="btn btn-primary btn-lg" type="button" onclick="send_go2(this.form);">로그인
                </button>
                <button class="btn btn-primary btn-lg" type="button" onclick="send_go1(this.form)">회원가입
                </button>
            </div>
        </div>
    </form>
</div>

<%--footer--%>
<footer>
    <%@ include file="/WEB-INF/views/bit/html/footer.jsp" %>
</footer>

</body>
</html>