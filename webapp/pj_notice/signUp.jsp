<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <link rel="stylesheet" href="css/bootstrap.css"> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/sandstone/bootstrap.min.css" 
integrity="undefined" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>회원가입</title>
<style type="text/css">
	.wrap{
	border:none;
	width: 430px;
	margin-top : 10px;
	font-size:14px;
	marginleft: 10px;
	height:30px;
	}
</style>
<script>
	//아이디 체크 정규식
	var idJ = /^[a-z0-9]{4,12}$/;
	
	//이메일 체크 정규식
	var exp = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	
	//핸드폰 번호 정규식
	var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
	
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
		}
		
		if(document.addjoin.password.value!=document.addjoin.repassword.value){
			alert("입력한 비밀번호가 일치하지 않습니다");
			document.addjoin.password.focus();
			exit;
		}
	}	
		
	
	$(document).ready(function(){

		//id 값이 들어오면 중복검사 시작
	    $("#id").blur(function() {
		var userID = $('#id').val();
		$.ajax({
			type: 'post',
			url:'controller2',
			data:{userID:userID},
			success: function(result){	//1 or 0
				if(result==1){	//중복일때
// 					$("#id_check").text("사용중인 아이디입니다");
//					$("#id_check").css("color", "red");
					$("#reg_submit").attr("disabled", true); 
					alert("사용중인 아이디입니다");
				}else { 
					if(idJ.test($('#id').val())){	//true면
//						$("#id_check").text("사용가능한 아이디입니다");
//						$("#id_check").css("color","blue");
						$("#reg_submit").attr("disabled", false); 
						alert("사용가능한 아이디입니다");
					}else if($('#id').val()==""){
//						$("#id_check").text("아이디를 입력해주세요");
	//					$("#id_check").css("color", "red");
						$("#reg_submit").attr("disabled", true);
						alert("아이디를 입력해주세요");
					}else{
			//			$("#id_check").text("아이디는 소문자+숫자 조합 (4자리부터12자리)만 가능합니다");
				//		$("#id_check").css("color", "red");
						$("#reg_submit").attr("disabled", true);
						alert("아이디는 소문자+숫자 조합 (4자리부터12자리)만 가능합니다");
						}
					
					}
				}
			});
		});
	});

</script>
</head>
<body>
<%@include file ="navbar.jsp" %>
	<div  style="position : absolute; top : 30%; left : 40% ; border : solid 1px gray;">
   <form name ="addjoin" method="post">
      <fieldset class="wrap">
      <legend>회원가입</legend>
    
      <div class="form-group">
      	<label class="form-label mt-4" for ="id">아이디</label>
      	<input class="form-control:focus" type="text" placeholder = "아이디를 입력하세요" name="id" id="id" >
      <div class="form-check" id="id_check"></div>
      </div>

	<div class="form-group">
      	<label class="form-label mt-4" for ="password">비밀번호</label>
      	<input class="form-control:focus" type="password" placeholder="비밀번호를 입력하세요" name="password" id="password">
      	<div class="form-check" id="password_check"></div>
      </div>
      <div class="form-group">
      	<label class="form-label mt-4" for ="repassword">비밀번호 확인</label>
      	<input class="form-control:focus" type="password" placeholder="비밀번호를 다시 한번 입력하세요" name="repassword" id="repassword">
      	<div class="form-check" id="repassword_check"></div>
      </div>
      <div class="form-group">
      	<label class="form-label mt-4" for ="name">이름</label>
      	<input class="form-control:focus" type="text" placeholder="이름을 입력하세요" name="name" id="name">
      	<div class="form-check" id="name_check"></div>
      </div>
      <div class="form-group">
      	<label class="form-label mt-4" for ="email">이메일</label>
      	<input class="form-control:focus"  type="email" placeholder="이메일을 입력하세요" name="email" id="email" ">
      	<div class="form-check" id="email_check"></div>
      </div>
      <div class="form-group">
      	<label class="form-label mt-4" for ="phone">핸드폰 번호</label>
      	<input class="form-control:focus" type="text" placeholder="핸드폰 번호를 입력하세요( - 제외)" name="phone" id="phone">
      	<div class="form-check" id="phone_check"></div>
      </div>
      <div class="dropdown-header">
      <button class="btn btn-outline-secondary" type="button" disabled="disabled" id="reg_submit" onclick="check(); send_go1(this.form);">회원가입</button>
      </div>
    
      </fieldset>
   </form>
   

</div> 
</body>
</html>