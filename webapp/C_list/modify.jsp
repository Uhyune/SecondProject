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

    <title>수정 페이지</title>

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
        <h2>글 수정</h2>
    </div>

    <form name="updateForm" role="form" action="updateSave" method="post">
        <table class="table table-hover" border="1">
            <thead>
            </thead>
            <tbody>
            <tr class="table-active">
                <th scope="row">글 번호</th>
                <td>
                    <div class="form-group">
                        <fieldset>
                            <input class="form-control" id="b_idx" name="b_idx" type="text" value="${BITVO.b_idx}"
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
                            <input class="form-control" id="write_date" name="write_date" type="text"
                                   value="${BITVO.write_date}"
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
                            <input class="form-control" id="writer" name="writer" type="text"
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
                            <input class="form-control" id="subject" name="subject" type="text"
                                   value="${BITVO.subject }"
                                   placeholder="제목을 입력하세요">
                        </fieldset>
                    </div>
                </td>
            </tr>
            <tr class="table-active">
                <th>내용</th>
                <td>
                    <div class="form-group">
                        <fieldset>
                            <input class="form-control" id="content" name="content" type="text"
                                   value="${BITVO.content }"
                                   placeholder="내용을 입력하세요">
                        </fieldset>
                    </div>
                </td>
            </tr>
            <tr class="table-active">
                <th>조회수</th>
                <td>
                    <div class="form-group">
                        <fieldset>
                            <input class="form-control" id="hit" name="hit" type="text" value="${BITVO.hit}"
                                   readonly="">
                        </fieldset>
                    </div>
                </td>
            </tr>
            </tbody>
        </table>
        <div class="row">
            <div class="col">
                <button class="btn btn-primary btn-lg"
                        onclick="save_go(this.form)" formmethod="post"
                        type="button">완료
                </button>
                <button class="btn btn-danger btn-lg"
                        onclick="alert('입력한 내용을 삭제합니다. 다시 입력 해주세요.');"
                        type="reset">취소
                </button>
                <button class="btn btn-secondary btn-lg" onclick="list_go(this.form)">목록</button>
            </div>
        </div>
    </form>
</div>

<footer>
    <%@ include file="/WEB-INF/views/bit/html/footer.jsp" %>
</footer>

<script>
    function save_go(frm) {
        //DB 수정 작업 요청
        frm.action = "modify_ok.jsp";
        frm.submit();
    }

    function list_go(frm) {
        frm.action = "../C_list"; //목록 페이지
        frm.submit();
    }
</script>

</body>
</html>