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


    <title>공지사항 입력화면</title>
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
        <h2>공지사항 작성</h2>
    </div>

    <form name="writeForm" action="write_notice_ok.jsp" method="post">
        <table class="table table-hover" border="1">
            <thead></thead>

            <tbody>
            <tr class="table-active">
                <th scope="row">제목</th>
                <td>
                    <div class="form-group">
                        <fieldset>
                            <input class="form-control" id="title" name="title" type="text" placeholder="제목을 입력하세요">
                        </fieldset>
                    </div>
                </td>
            </tr>
            <tr class="table-active">
                <th>글쓴이</th>
                <td>
                    <div class="form-group">
                        <fieldset>
                            <input class="form-control" name="content" id="content" placeholder="내용을 입력하세요"
                                   type="text">
                        </fieldset>
                    </div>
                </td>
            </tr>
            <tr class="table-active">
                <th scope="row">글쓴이</th>
                <td>
                    <div class="form-group">
                        <fieldset>
                            <input class="form-control" name="writer" id="writer" value="${login}" readonly
                                   type="text">
                        </fieldset>
                    </div>
                </td>
            </tr>
            </tbody>
        </table>
        <div class="row">
            <div class="col">
                <button class="btn btn-primary btn-lg" type="submit" value="작성 완료">작성 완료</button>
                <button class="btn btn-danger btn-lg" type="reset">취소</button>
                <input class="btn btn-secondary btn-lg" type="button" value="목록으로"
                       onclick="location.href='../pjnotice'">
            </div>
        </div>
    </form>
</div>


<footer>
    <%@ include file="/WEB-INF/views/bit/html/footer.jsp" %>
</footer>

</body>
</html>