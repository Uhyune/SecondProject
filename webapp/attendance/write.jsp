<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
            crossorigin="anonymous"></script>
    <title>글쓰기</title>
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
        <h2>글 작성</h2>
    </div>
    <form method="post" action="writeAction.jsp">
        <!-- 		post를 해줘야 화면에 안 보이고 보내진다..? -->
        <table class="table table-hover" border="1">
            <thead>
            <tr>
                <!-- 				<th colspan="2" style="background-color: #eee; text-align: center;">글쓰기 </th> -->
            </tr>
            </thead>
            <tbody>
            <tr class="table-active">
                <th scope="row">분류</th>
                <td>
                    <div class="form-group" style="text-align: center; margin: 0 auto;">
                        <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                            <label class="btn btn-outline-primary" for="sick">병결</label>
                            <input type="radio" class="btn-check" name="a_type" id="sick" value="sick" autocomplete="off" checked>
                            <label class="btn btn-outline-primary" for="half">조퇴</label>
                            <input type="radio" class="btn-check" name="a_type" id="half" value="half" autocomplete="off">
                            <label class="btn btn-outline-primary" for="job">취업활동</label>
                            <input type="radio" class="btn-check" name="a_type" id="job" value="job" autocomplete="off">
                            <label class="btn btn-outline-primary" for="untact">비대면</label>
                            <input type="radio" class="btn-check" name="a_type" id="untact" value="untact" autocomplete="off">
                        </div>
                    </div>
                <td>
            </tr>
            <tr class="table-active">
                <th scope="row">제목</th>
                <td colspan="2">
                    <div class="form-group">
                        <fieldset>
                            <input class="form-control" id="a_title" name="a_title" type="text">
                        </fieldset>
                    </div>
                </td>
            </tr>
            <tr class="table-active">
                <th scope="row">글쓴이</th>
                <td colspan="2">
                    <div class="form-group">
                        <fieldset>
                            <input class="form-control" name="a_writer" id="a_writer" value="${login}"
                                   type="text" readonly="">
                        </fieldset>
                    </div>
                </td>
            </tr>
            <tr class="table-active">
                <th scope="row">내용</th>
                <td>
                    <div class="form-group">
                        <fieldset>
                            <input class="form-control" id="a_content" name="a_content" type="text"
                                   maxlength="2048" style="height : 200px">
                        </fieldset>
                    </div>
                </td>
                <td>
            </tr>
            <tr class="table-active">
                <th scope="row">첨부파일</th>
                <td colspan="2">
                    <div class="form-group">
                        <input class="form-control" type="file" id="file" name="file_name">
                    </div>
                </td>
            </tr>
            </tbody>
        </table>
        <div class="row">
            <div class="col">
                <button type="submit"  class="btn btn-info btn-lg" value="글쓰기">
                    글쓰기 완료
                </button>
                <button class="btn btn-danger btn-lg"
                        onclick="alert('입력 내용은 저장되지 않습니다. 다시 입력하시겠습니까?')"
                        type="reset">다시 입력
                </button>
                <button class="btn btn-secondary btn-lg"
                        onclick="location.href='list.jsp'"
                        type="button">목록으로
                </button>
            </div>
        </div>
    </form>
</div>

<footer>
    <%@ include file="/WEB-INF/views/bit/html/footer.jsp" %>
</footer>
</body>
</html>