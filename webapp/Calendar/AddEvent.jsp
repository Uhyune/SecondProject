<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
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
                // url: "/Project/addEvent",
                url: "http://localhost:8080/Calendar/addEvent",
                type: "post",
                data: queryString,
                //dataType : "json",
                success: function () {
                    alert("성공");
                    opener.document.location.reload();
                    window.close();
                },
                error: function (request, status, error) {
                    alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
                }
            });


        }
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
    <title>이벤트 추가</title>
</head>
<body>
<div>
    <form method="post" name="event">
        <p>일정 : <input type="text" name="title" value="event" id="title"></p>
        <p>시작 날짜 : <input type="date" name="start_date" value="<%= sf.format(date) %>"></p>
        <p>종료 날짜 : <input type="date" name="end_date" value="<%= sf.format(date) %>"></p>
        <p>배경 색상 : <input type="color" name="color" value="#3788d8"></p>
        <p>제목 색상 : <input type="color" name="text_color" value="#ffffff"></p>
        <p>설명</P>
        <p id="center"><textarea name="detail" cols="35" rows="8"></textarea></p>
        <input type="button" value="추가" onclick="logic_close(this.form)">
        <input type="button" value="취소" onclick="cancle()">

        <input type="reset" value="초기화">
    </form>
</div>
</body>
</html>



