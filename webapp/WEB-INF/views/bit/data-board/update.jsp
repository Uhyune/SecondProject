<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">

    <title>수정 페이지</title>
</head>
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

<%--body--%>
<body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
        crossorigin="anonymous"></script>

<%--navbar--%>
<%@ include file="../html/navbar.jsp" %>

<div class="container">
    <div class="py-5 text-center">
        <h2>글 수정</h2>
    </div>

    <%--    <h2 th:if="${param.status}" th:text="'저장 완료'"></h2>--%>
    <form name="updateForm" role="form" action="updateSave" method="post" enctype="multipart/form-data">
        <table class="table table-hover" border="1">
            <thead>
            </thead>
            <tbody>
            <tr class="table-active">
                <th scope="row">글 번호</th>
                <td>
                    <div class="form-group">
                        <fieldset>
                            <input class="form-control" id="post_no" name="post_no" type="text" value="${list.post_no}"
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
                            <input class="form-control" id="reg_date" name="reg_date" type="text"
                                   value="<fmt:formatDate pattern="yyyy.MM.dd  hh:mm:ss" value="${list.reg_date}"></fmt:formatDate>"
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
                            <input class="form-control" id="writer_name" name="writer_name" type="text"
                                   value="${list.writer_name}"
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
                            <input class="form-control" id="post_title" name="post_title" type="text"
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
                            <input class="form-control" id="post_content" name="post_content" type="text"
                                   placeholder="내용을 입력하세요">
                        </fieldset>
                    </div>
                </td>
            </tr>
            <tr class="table-active">
                <th>첨부파일</th>
                <td>
                    <div class="form-group">
                        <input class="form-control" type="file" name="attached_file" id="attached_file"
                               value="${list.attached_file}">
                    </div>
                </td>
            </tr>
            <tr class="table-active">
                <th>조회수</th>
                <td>
                    <div class="form-group">
                        <fieldset>
                            <input class="form-control" id="hit" name="hit" type="text" value="${list.hit}"
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
                        onclick="button_event();" formmethod="post"
                        type="button">완료
                </button>
                <button class="btn btn-danger btn-lg"
                        onclick="alert('입력한 내용을 삭제합니다. 다시 입력 해주세요.');"
                        type="reset">취소
                </button>
                <c:if test="${!empty param.p}">
                    <button class="btn btn-secondary btn-lg"
                            onclick="location.href='list?p=${param.p}&f=${param.f}&k=${param.k}'"
                            type="button">목록으로
                    </button>
                </c:if>
                <c:if test="${empty param.p}">
                    <button class="btn btn-secondary btn-lg"
                            onclick="location.href='list'"
                            type="button">목록으로
                    </button>
                </c:if>
            </div>
        </div>
    </form>
</div> <!-- /container -->

<%--footer--%>
<footer>
    <%@ include file="../html/footer.jsp" %>
</footer>

<script>
    function button_event() {
        if (document.updateForm.post_title.value == null || document.updateForm.post_title.value == '') {
            alert('제목을 입력하세요');
            return false;
        } else if (document.updateForm.post_content.value == null || document.updateForm.post_content.value == '') {
            alert('내용을 입력하세요');
            return false;
        } else {
            document.updateForm.submit();
        }
    }
</script>

</body>
</html>