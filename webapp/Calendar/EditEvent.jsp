<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html;charset=UTF-8"); %>
<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <%
        Date date = new Date();
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");

    %>
    <script>
        function cancle() {
            self.close();
        }

        function logic_close(frm) {
            var title = document.getElementById("title");
            if (title.value == "") {
                alert("이벤트 이름은 비워둘 수 없습니다.")
                return;
            }

            var queryString = $("form[name=event]").serialize();

            $.ajax({
                // url: "/Project/updateInsert",
                url: "http://localhost:8080/Calendar/updateInsert",
                type: "post",
                data: queryString,
                success: function () {
                    alert("성공");
                    opener.document.location.reload();
                    window.close();
                },
                error: function (request, status, error) {
                    alert("code = " + request.status + " message = " + request.responseText + " error = " + error);
                    alert(" error = " + error); // 실패 시 처리
                }

            });
        }

        $(function () {
            $.ajax({
                // url: "/Project/updateEvent",
                url: "http://localhost:8080/Calendar/updateEvent",
                type: "get",
                data: "id=<%=id %>",
                contentType: "application/json; charset:UTF-8",
                success: function (data) {
                    var obj = JSON.parse(data);
                    var output = '<p>일정 : <input type="text" name="title" id="title" value="' + obj.title + '" ></p>'
                    output += '<p>시작 날짜 : <input type="date" name="start_date" id="start_date" value="' + obj.start + '" ></p>'
                    output += '<p>종료 날짜 : <input type="date" name="end_date" value="' + obj.end + '" ></p>'
                    output += '<p>배경 색상 : <input type="color" name="color" value="' + obj.color + '" ></p>'
                    output += '<p>제목 색상 : <input type="color" name="text_color" value="' + obj.textColor + '" ></p>'
                    output += '<p>설명</P>'
                    output += '<p id="center"><textarea name="detail" cols="35" rows="8">' + obj.detail + '</textarea></p>'

                    $("#ajax").html(output);

                },
                error: function (request, status, error) {
                    alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
                }
            });
        })

    </script>
    <style>
        div {
            width: 300px;
            margin: auto;
            border: 1px solid black;
        }

        #center {
            text-align: center;
        }

    </style>
    <title>이벤트 수정</title>
</head>
<body>
<div>
    <form method="post" name="event">

        <div id="ajax">
        </div>

        <input type="button" value="수정" onclick="logic_close(this.form)">
        <input type="button" value="취소" onclick="cancle()">

        <input type="reset" value="초기화">
        <input type="hidden" name="id" value="<%=id%>">
    </form>
</div>
</body>
</html>