<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
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
        position: absolute;
        left: 0;
        bottom: 0;
        width: 100%;
        padding: 15px 0;
        text-align: center;
    }
</style>

<script>
    /*
        function insert_go(frm){
            frm.action = "write_ok.jsp";
            frm.submit();
        }
    */
    function list_go(frm) {
        frm.action = "../C_list"; //목록 페이지
        frm.submit();
    }
</script>

<%--body--%>
<body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
        crossorigin="anonymous"></script>

<%--navbar--%>
<%@ include file="/WEB-INF/views/bit/html/navbar.jsp" %>

<div class="container">
    <div class="py-5 text-center">
        <h2>글 작성</h2>
    </div>

    <form name="writeForm" action="write_ok.jsp" action="save" method="post">
        <table class="table table-hover" border="1">
            <thead>

            </thead>
            <tbody>
            <tr class="table-active">
                <th scope="row">제목</th>
                <td>
                    <div class="form-group">
                        <fieldset>
                            <input class="form-control" id="subject" name="subject" type="text">
                        </fieldset>
                    </div>
                </td>
            </tr>
            <tr class="table-active" size="2">
                <th>내용</th>
                <td>
                    <div class="form-group">
                        <fieldset>
                            <input class="form-control" id="content" name="content" type="text">
                        </fieldset>
                    </div>
                </td>
            </tr>
            <tr class="table-active">
                <th>글쓴이</th>
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
                <button class="btn btn-primary btn-lg"
                        formmethod="post"
                        onclick="button_event();"
                        type="button">작성완료
                </button>
                <button class="btn btn-danger btn-lg"
                        onclick="alert('입력 내용은 저장되지 않습니다. 다시 입력하시겠습니까?')"
                        type="reset">다시 입력
                </button>
                <button class="btn btn-secondary btn-lg" onclick="list_go(this.form)">목록</button>
            </div>
        </div>
    </form>
</div>

<%--footer--%>
<footer>
    <%@ include file="/WEB-INF/views/bit/html/footer.jsp" %>
</footer>

<script>
    function button_event() {
        if (document.writeForm.subject.value == null || document.writeForm.subject.value == '') {
            alert('제목을 입력하세요');
            return false;
        } else if (document.writeForm.content.value == null || document.writeForm.content.value == '') {
            alert('내용을 입력하세요');
            return false;
        } else {
            document.writeForm.submit();
        }
    }
</script>

</body>
</html>