<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
            crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
        * {
            font-family: NanumGothic, 'Malgun Gothic';
        }

        ul li {
            list-style-type: none;
        }

        .col {
            display: flex;
            flex-direction: row;
            justify-content: center;
            padding: 3px;
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

        .hidden {
            visibility: hidden;
        }

    </style>
    <script>
        //아이디 체크 정규식
        var idJ = /^[a-z0-9]{4,12}$/;

        //이메일 체크 정규식
        var exp = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

        //핸드폰 번호 정규식
        var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;

        //비밀번호 정규식 최소 8자 하나의 숫자
        var passwordj = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;

        function send_go1(frm) {
            frm.action = "controller?type=signup";
            frm.submit();
        }

        function check(){
            if(document.addjoin.password.value==""){
                alert("비밀번호를 입력하세요");
                document.addjoin.password.focus();
                exit;
            }else if(document.addjoin.repassword.value==""){
                alert("비밀번호를 다시 입력하세요");
                document.addjoin.repassword.focus();
                exit;
            }else if(document.addjoin.name.value==""){
                alert("이름을 입력하세요");
                document.addjoin.name.focus();
                exit;
            }else if(document.addjoin.email.value==""){
                alert("이메일을 입력하세요");
                document.addjoin.email.focus();
                exit;
            }else if(exp.test(document.addjoin.email.value)==false){
                alert("올바른 이메일 형식이 아닙니다");
                document.addjoin.email.focus();
                exit;
            }else if(document.addjoin.phone.value==""){
                alert("핸드폰 번호를 입력하세요")
                document.addjoin.phone.focus();
                exit;
            }else if(phoneJ.test(document.addjoin.phone.value)==false){
                alert("올바른 핸드폰 번호 형식이 아닙니다 ");
                document.addjoin.phone.focus();
                exit;
            }else if (passwordj.test(document.addjoin.password.value)==false){
                alert("올바른 비밀번호 형식이 아닙니다.\n최소 8자 이상 소문자+숫자 조합만 가능합니다")
                document.addjoin.password.focus();
                exit;
            }

            if(document.addjoin.password.value!=document.addjoin.repassword.value){
                alert("입력한 비밀번호가 일치하지 않습니다");
                document.addjoin.password.focus();
                exit;
            }
        }


        $(document).ready(function () {

            //id 값이 들어오면 중복검사 시작
            $("#id").blur(function () {
                var userID = $('#id').val();
                $.ajax({
                    type: 'post',
                    url: './controller2',
                    data: {userID: userID},
                    success: function (result) {	//1 or 0
                        if (result == 1) {	//중복일때
                            alert("사용중인 아이디입니다");
                        } else if ($('#id').val() == "") {
//						$("#id_check").text("아이디를 입력해주세요");
                            //					$("#id_check").css("color", "red");
                            $("#reg_submit").attr("disabled", true);
                            alert("아이디를 입력해주세요");
                        } else if (!idJ.test($('#id').val())) {
                            //			$("#id_check").text("아이디는 소문자+숫자 조합 (4자리부터12자리)만 가능합니다");
                            //		$("#id_check").css("color", "red");
                            $("#reg_submit").attr("disabled", true);
                            alert("아이디는 소문자+숫자 조합 (4자리부터12자리)만 가능합니다");
                        } else if (idJ.test($('#id').val())) {
                            confirm('사용 가능한 아이디입니다.');
                            $("#reg_submit").attr("disabled", false);
                        }
                    }
                });
            });
        });

    </script>
</head>
<body>

<%--navbar--%>
<%@ include file="/WEB-INF/views/bit/html/navbar.jsp" %>

<div class="container">
    <div class="py-5 text-center">
        <h2>회원가입</h2>
    </div>

    <form name="addjoin" method="post">
        <table class="table table-hover" border="1">
            <thead>

            </thead>
            <tbody>
            <tr class="table-active">
                <th scope="row">아이디</th>
                <td>
                    <div class="form-group">
                        <fieldset>
                            <input class="form-control" type="text" placeholder="아이디를 입력하세요" name="id" id="id">
                            <div class="form-check hidden" id="id_check"></div>
                        </fieldset>
                    </div>
                </td>
            </tr>
            <tr class="table-active">
                <th scope="row">비밀번호</th>
                <td>
                    <div class="form-group">
                        <fieldset>
                            <input class="form-control" type="password" placeholder="비밀번호를 입력하세요" name="password"
                                   id="password">
                            <div class="form-check hidden" id="password_check"></div>
                        </fieldset>
                    </div>
                </td>
            </tr>
            <tr class="table-active">
                <th scope="row">비밀번호 확인</th>
                <td>
                    <div class="form-group">
                        <fieldset>
                            <input class="form-control" type="password" placeholder="비밀번호를 다시 한번 입력하세요"
                                   name="repassword" id="repassword">
                            <div class="form-check hidden" id="repassword_check"></div>
                        </fieldset>
                    </div>
                </td>
            </tr>
            <tr class="table-active">
                <th scope="row">이름</th>
                <td>
                    <div class="form-group">
                        <fieldset>
                            <input class="form-control" type="text" placeholder="이름을 입력하세요" name="name" id="name">
                            <div class="form-check hidden" id="name_check"></div>
                        </fieldset>
                    </div>
                </td>
            </tr>
            <tr class="table-active">
                <th scope="row">이메일</th>
                <td>
                    <div class="form-group">
                        <fieldset>
                            <input class="form-control" type="email" placeholder="이메일을 입력하세요" name="email"
                                   id="email">
                            <div class="form-check hidden" id="email_check"></div>
                        </fieldset>
                    </div>
                </td>
            </tr>
            <tr class="table-active">
                <th scope="row">핸드폰 번호</th>
                <td>
                    <div class="form-group">
                        <fieldset>
                            <input class="form-control" type="text" placeholder="핸드폰 번호를 입력하세요( - 제외)"
                                   name="phone" id="phone">
                            <div class="form-check hidden" id="phone_check"></div>
                        </fieldset>
                    </div>
                </td>
            </tr>
            </tbody>
        </table>

        <div class="col">
            <button class="btn btn-outline-secondary" type="button" disabled="disabled" id="reg_submit"
                    onclick="check(); send_go1(this.form);">회원가입
            </button>
        </div>
    </form>
</div>

<%--footer--%>
<footer>
    <%@ include file="/WEB-INF/views/bit/html/footer.jsp" %>
</footer>

</body>
</html>