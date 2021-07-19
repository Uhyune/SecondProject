<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <title>작성 페이지</title>
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
        <h2>글 작성</h2>
    </div>

    <form name="writeForm" action="save" method="post" enctype="multipart/form-data">
        <table class="table table-hover" border="1">
            <thead>
            <%--            <tr>--%>
            <%--                <th scope="col"><h2>글 쓰기</h2></th>--%>
            <%--            </tr>--%>
            </thead>
            <tbody>
            <tr class="table-active">
                <th scope="row">제목</th>
                <td>
                    <div class="form-group">
                        <fieldset>
                            <input class="form-control" id="post_title" name="post_title" type="text">
                        </fieldset>
                    </div>
                </td>
            </tr>
            <tr class="table-active" size="2">
                <th>내용</th>
                <td>
                    <div class="form-group">
                        <fieldset>
                            <input class="form-control" id="post_content" name="post_content" type="text">
                        </fieldset>
                    </div>
                </td>
                <%--                <td><input type="text" size="100" name="post_content"></td>--%>
            </tr>
            <tr class="table-active">
                <th>글쓴이</th>
                <td>
                    <div class="form-group">
                        <fieldset>
                            <input class="form-control" name="writer_name" id="writer_name" value="${login}" readonly
                                   type="text">
                        </fieldset>
                    </div>
                </td>
            </tr>
            <tr class="table-active">
                <th>첨부파일</th>
                <td>
                    <div class="form-group">
                        <input class="form-control" type="file" name="attached_file" id="attached_file">
                    </div>
                </td>
            </tr>
            </tbody>
        </table>
        <div class="row">
            <div class="col">
                <%--                <c:if test="${!(empty post_title) && !(empty post_content)}">--%>
                <button class="btn btn-primary btn-lg"
                <%--                        onclick="location.href='save?post_no=${list.post_no}'" --%>
                        onclick="button_event();"
                        formmethod="post"
                        type="button">작성 완료
                </button>
                <%--                </c:if>--%>
                <%--                <c:if test="${empty post_title || empty post_content}">--%>
                <%--                    <button class="btn btn-primary btn-lg"--%>
                <%--                                                onclick="location.href='save?post_no=${list.post_no}'" --%>
                <%--                            onclick="alert('제목 또는 내용이 입력되지 않았습니다.\n다시 입력해주세요.')"--%>
                <%--                            type="button">작성 완료--%>
                <%--                    </button>--%>
                <%--                </c:if>--%>
                <button class="btn btn-danger btn-lg"
                        onclick="alert('입력 내용은 저장되지 않습니다. 다시 입력하시겠습니까?')"
                        type="reset">다시 입력
                </button>
                <c:if test="${!empty param.p || !empty param.f}">

                    <button class="btn btn-secondary btn-lg"
                            onclick="location.href='list?p=${param.p}&f=${param.f}&k=${param.k}'"
                            type="button">목록으로
                    </button>
                </c:if>
                <c:if test="${empty param.p && empty param.f}">
                    <button class="btn btn-secondary btn-lg"
                            onclick="location.href='list'"
                            type="button">목록으로
                    </button>
                </c:if>
            </div>
        </div>
    </form>
</div>

<%--footer--%>
<footer>
    <%@ include file="../html/footer.jsp" %>
</footer>

<script>
    function button_event() {
        if (document.writeForm.post_title.value == null || document.writeForm.post_title.value == '') {
            alert('제목을 입력하세요');
            return false;
        } else if (document.writeForm.post_content.value == null || document.writeForm.post_content.value == '') {
            alert('내용을 입력하세요');
            return false;
        } else {
            document.writeForm.submit();
        }
    }
</script>

</body>
</html>
