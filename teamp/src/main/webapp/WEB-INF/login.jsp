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
* {
  box-sizing: border-box;
}
	.div0{
		width:30%;
		border:10px solid green;
		margin-top:100px;
		margin-right: 500px;
		border-radius: 15px;
	}
<!--임시-->
.tempbtn{
width:500px;
height:500px;
border: 10px solid green;
}
	.div1 {
		width: 180px;
		height: 100px;
		font-size: 3em;
		text-align: center;
		border: 1px solid blue;
		padding: 10px;
		margin-right: 400px;
		font-weight: bold;
		margin-bottom: -50px;
	}
	.div2 {
		width: 500px;
		height: 280px;
		padding: 40px;
		margin-top: 0px;
		font-family: Fantasy;
		border: 2px solid gray;
	}

.span {
	margin: 0px 5px 0px 5px;
	
}

.footer {
	width: 400px;
	font-size: 10px;
	text-align: center;
	margin: 20px;
	padding: 5px;
	border: 1px solid black;
	
}

.radio {
	font-size: 12px;
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
	<!-- 타이틀 -->
  <div id="app"style="width:2483.02px; padding-top:120px;" align="center">
  	<div class="div0">
  		<div>
  			<button onClick="location.href='http://127.0.0.1:8080/paymentmy.do'">결제내역</button>
  			<button onClick="location.href='http://127.0.0.1:8080/reservemy.do'">예약내역</button>
  			<button onClick="location.href='http://127.0.0.1:8080/reviewwrite.do'">리뷰쓰기</button>
  			<button onClick="location.href='http://127.0.0.1:8080/searchid.do'">아이디찾기</button>
  			<button onClick="location.href='http://127.0.0.1:8080/searchpw.do'">비밀번호찾기</button>
  			<button onClick="location.href='http://127.0.0.1:8080/menumanagementbusiness.do'">메뉴관리</button>
  			<button onClick="location.href='http://127.0.0.1:8080/menuaddbusiness.do'">메뉴추가</button>
  			<button onClick="location.href='http://127.0.0.1:8080/menuaddbusiness2.do'">추가</button>
  		</div>
	<lavel class="div1" >
		로그인
	</lavel>
	<!-- 전체 div -->
	<div class="div2">
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
  		<!-- 아랫 div -->
  		<div >
    		<a href="http://127.0.0.1:8080/join.do"  class="asign">회원가입</a>
    		<a href="http://127.0.0.1:8080/searchid.do" class="afind">아이디 찾기</a>
    		<a href="http://127.0.0.1:8080/searchpw.do" class="afind">비밀번호 찾기</a>
  		</div>
	</div>
	<!-- 로그인 footer -->
	<div class="footer">
		<span class="span">이용약관</span> <span class="span">개인정보 처리방침</span> <span
			class="span">운영정책</span> <span class="span">고객센터</span> <span
			class="span">공지사항</span>
		<h4>Copyright © Safe Corp. All rights reserved.</h4>
	</div>
	<!-- 전체 footer -->
	<!--  
	<jsp:include page="/layout/footer.jsp"></jsp:include>
	-->
	</div>
	</div>  
	
	
	
</body>
</html>