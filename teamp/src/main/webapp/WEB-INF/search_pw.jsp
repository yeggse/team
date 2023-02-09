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
input{
  width:200px;
  height: 50px;
  margin: 20px 5px 5px 5px ;
  border: solid #ccc;
  border-width: 0 0 2px;
  padding-right: 90px;
}
.title{
  font-size: 30px;
  text-align: center;
}
.btn1{
  font-size: 16px;
  width: 100px;
  height: 35px;
  text-align: center;
  color: white;
  background: gray;
  border:none;
}
.btn2{
  font-size: 16px;
  width: 100px;
  height: 35px;
  text-align: center;
  color: white;
  background: green;
  border:none;
}
.div2{
  width: 500px;
  height: 700px;
  padding: 40px;
  margin: auto;
}
.div1{
  position: relative;
  border: 1px solid black;
  box-sizing: border-box;
  width: 500px;
  height: 470px;
  border: 2px solid gray;
  padding: 40px;
  margin: auto;
  font-family: Fantasy;
}
.text1{
  margin: auto;
  font-family: Fantasy;
   text-align: center;
   font-size: 20px;
}
.text2{
  margin: 5px;
  padding: 3px;
  font-family: Fantasy;
   font-size: 12px;
   text-align: center;
}
.text3{
  margin-right: 45px;
}
.text4{
  margin-right: 10px;
}
.btn3{
  margin: 15px 0px 5px 50px;
  font-size: 16px;
  width: 300px;
  height: 35px;
  text-align: center;
  color: white;
  background: green;
  border:none;
}
.text5{
  text-align: center;
  margin-top:15px;
}
.text6{
  margin: 20px;
}
.footer{
  font-size: 10px;
  text-align: center;
  margin: 20px;
  padding: 5px;
}
</style>
<body>
  <div class="div2">
	<div class="title">
  		<h3>비밀번호 찾기</h3>
	</div>
    <div>
        <button class="btn1"ID onClick="location.href='http://localhost:8080/searchid.do'">아이디</button>
        <button class="btn2"PW>비밀번호</button>
    </div>
	<div class="div1">
  		<div class="text1">비밀번호가 생각나지 않으세요?</div>
        <div class="text2">비밀번호를 재 설정 해주세요.</div>
        <div class="text2">회원 정보에 등록한 정보와 일치해야, 비밀번호를 변경할 수 있습니다.</div>
        <div>
            <span class="text3">아이디</span>
    		<input type="text" name="loginKey" placeholder="아이디를 입력해주세요">
  		</div>
  		<div>
            <span class="text4">새 비밀번호</span>
    		<input type="password" name="password" placeholder="새로운 비밀번호를 입력해주세요" >
  		</div>
      	<div>
            <span class="text4">새 비밀번호</span>
    		<input type="password" name="password" placeholder="새로운 비밀번호를 다시 입력해주세요" >
  		</div>
  		<div>
     		<button class="btn3">비밀번호 변경</button>
  		</div>
	</div>
    <div class="text5">
      <a class="text6" href="http://localhost:8080/searchid.do">아이디를 잊으셨나요?</a>
      <a  class="text6" href="http://localhost:8080/login.do">로그인</a>
    </div>
	<div class="footer">
  		<span class="span">이용약관</span>
  		<span class="span">개인정보 처리방침</span>
  		<span class="span">운영정책</span>
  		<span class="span">고객센터</span>
  		<span class="span">공지사항</span>
  		<h4>Copyright © Safe Corp. All rights reserved.</h4>                
	</div>   
    </div>
</body>
</html>