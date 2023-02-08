<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title>JS Bin</title>
<jsp:include page="/layout/header.jsp"></jsp:include>
</head>
<style>
.title {
	font-size: 30px;
	text-align: center;
}

.span {
	margin: 0px 5px 0px 5px;
}

.footer {
	font-size: 10px;
	text-align: center;
	margin: 20px;
	padding: 5px;
}

.radio {
	font-size: 12px;
}

.div1 {
	position: relative;
	border: 1px solid black;
	box-sizing: border-box;
	width: 400px;
	height: 280px;
	border: 2px solid gray;
	padding: 40px;
	margin: auto;
	font-family: Fantasy;
}

.btn1 {
	margin: 5px 10px 10px 10px;
	width: 100px;
	text-align: center;
}

.btn2 {
	margin: 15px 0px 5px 0px;
	font-size: 16px;
	width: 300px;
	height: 35px;
	text-align: center;
}

.btn_icon {
	/* background: url(/images/pc/ico_comm.png) */
	background-size: 300px auto;
}

.afind {
	text-decoration: none;
	font-size: 10px;
	margin-right: 20px;
}

.asign {
	text-decoration: none;
	margin-right: 100px;
	margin-left: 5px;
	font-size: 10px;
}

input {
	width: 200px;
	height: 50px;
	margin: 3px;
	border: solid #ccc;
	border-width: 0 0 2px;
	padding-right: 90px;
}
</style>
<body>
	<div class="title">
		<h1>세잎</h1>
	</div>
	<div class="div1">
<<<<<<< HEAD
		<div>
			<input type="text" name="loginKey" placeholder="아이디">
		</div>
		<div>
			<input type="password" name="password" placeholder="비밀번호">
		</div>
		<div class="radio">
			<input type="radio" style="width: 15px; height: 10px; border: 1px;"
				" value="" /> <span>로그인 상태 유지</span>
		</div>
		<div>
			<button class="login > btn2">로그인</button>
		</div>
		<div>
			<a href="http://localhost:8080/join.do" class="asign">회원가입</a> <a
				href="" class="afind">아이디 찾기</a> <a href="" class="afind">비밀번호
				찾기</a>
		</div>
=======
  		<div>
    		<input type="text" name="loginKey" placeholder="아이디">
  		</div>
  		<div>
    		<input type="password" name="password" placeholder="비밀번호" >
  		</div>
  		<div class="radio">
     		<input type="radio" style="width:15px;height:10px;border:1px; name="" value="" />
     		<span>로그인 상태 유지</span>
  		</div>
  		<div>
     		<button class="login > btn2">로그인</button>
  		</div>
  		<div >
    		<a href="http://localhost:8080/join.do"  class="asign">회원가입</a>
    		<a href="http://localhost:8080/searchid.do" class="afind">아이디 찾기</a>
    		<a href="http://localhost:8080/searchpw.do" class="afind">비밀번호 찾기</a>
  		</div>
>>>>>>> branch 'main' of https://github.com/yeggse/team.git
	</div>
	<div class="footer">
<<<<<<< HEAD
		<span class="span">이용약관</span> <span class="span">개인정보 처리방침</span> <span
			class="span">운영정책</span> <span class="span">고객센터</span> <span
			class="span">공지사항</span>
		<h4>Copyright © Safe Corp. All rights reserved.</h4>
	</div>
=======
  		<span class="span">이용약관</span>
  		<span class="span">개인정보 처리방침</span>
  		<span class="span">운영정책</span>
  		<span class="span">고객센터</span>
  		<span class="span">공지사항</span>
  		<h4>Copyright © Safe. All rights reserved.</h4>                
	</div>                            
>>>>>>> branch 'main' of https://github.com/yeggse/team.git
</body>
</html>