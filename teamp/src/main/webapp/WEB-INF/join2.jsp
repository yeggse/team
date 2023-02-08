<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="js/jquery.js"></script>
		<script src="js/vue.js"></script>
		<jsp:include page="/layout/header.jsp"></jsp:include>
		<title>테스트</title>
		<style>
		      @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
	
	        * {
	            font-family: 'Noto Sans KR', sans-serif;
	        }
	
	        body {
	            background-color: #1BBC9B;
	        }
	
	        .div3 {
	            margin: auto;
	            margin-top: 200px;
	            margin-bottom: 200px;
	            width: 400px;
	            height:1050px;
	            background-color: #EEEFF1;
	            border-radius: 5px;
	            text-align: center;
	            padding: 20px;
	            
	        }
	         .div2 {
	            margin-left:50px;
	            margin-bottom: 10px;
	            width: 350px;
	            height:50px;
	            background-color: #EEEFF1;
	            border-radius: 5px;
	            text-align: initial;
	            
	        }
	        
	        #text1 {
	             width: 150px;
	             height: 30px;
	        }
	       
	
	        input {
	            width: 100px;
	            height: 10px;
	            padding: 10px;
	            box-sizing: border-box;
	            
	            border: solid black;
	        }
	
	        .in {
	            margin-bottom: 10px;
	        }
	
	        #btn1 {
	            background-color: #1BBC9B;
	            
	            color: white;
	            border-radius: 10px;
	            border: solid black;
	            
	        }
	
	        a {
	            text-decoration: none;
	            color: #9B9B9B;
	            font-size: 12px;
	        }
		</style>
	</head>
	     <body >
	     
	     <div id="app" class = "div3" style = "border:solid black;">
	     <div id="app" class = "div2" style = "background-color: white;height: 50px;font-size: 25px;" >
	     사업자 회원가입</div>
		   <div class="div2"  >
				아이디 <input type="text" id = "text1"v-model="id" style = "margin-left:60px"></input>
				<button @click="">중복확인</button>
			</div>
			<div class="div2">
				패스워드 <input type="password" id = "text1" v-model="pwd" style = "margin-left:45px"></input>
			</div>
			<div class="div2">
				패스워드 확인 <input type="password" id = "text1"  v-model="pwd2" style = "margin-left:12px"></input>
			</div>
			<div class="div2">
				이름 <input type="text" id = "text1" v-model="name" style = "margin-left:75px"></input>
			</div>
			<div class="div2">
				주민번호 <input type="text" v-model="age" style = "margin-left:45px"></input>
				- <input type="password" v-model="age"></input> <button @click="">실명인증</button>
			</div>
			<div class="div2">
				주소 <input type="text" id = "text1" v-model="address" style = "margin-left:75px"></input>
			</div>
			<div class="div2">
			    닉네임 <input type="text" id = "text1" v-model="nickname" style = "margin-left:60px"></input>
			    <button @click="">중복확인</button>
			</div>
			<div class="div2">
			    연락처 <input type="text" id = "text1" v-model="num" style = "margin-left:60px"></input>
			</div>
			<div class="div2">
			    계좌번호 <input type="text" id = "text1" v-model="account" style = "margin-left:45px"></input>
			</div>
			<div class="div2">
				사업자명 <input type="text" id = "text1"v-model="restaurant" style="margin-left:45px"></input>
			</div>
			<div class="div2">
				사업자번호 <input type="text" id = "text1" v-model="resnum" style="margin-left:30px"></input>
			</div>
			<div class="div2">
				업종 <input type="password" id = "text1" v-model="kind" style="margin-left:75px"></input>
			</div>
			<div class="div2">
				지역 <input type="text" id = "text1" v-model="region" style="margin-left:75px"></input>
			</div>
			<div class="div2">
			    점포주소 <input type="text" id = "text1" v-model="resad" style="margin-left:45px"></input>
			</div>
			<div class="div2">
			    점포번호 <input type="text" id = "text1" v-model="resphonenum" style="margin-left:45px"></input>
			</div>
			<button @click = "fnjoin" style = "width:200px; height:35px;">회원가입</button>
			<div class="div2">
			<a href="join.do">일반 회원가입하기</a>
			
			</div>
			<div class="div2">
			
			<a href="login.do">로그인 페이지로 이동</a>
			</div>
			
		</div> 
	 </body>
	<jsp:include page="/layout/footer.jsp"></jsp:include>
</html>
<script type="text/javascript">
var app = new Vue({
	el: '#app',
    data: {
    	id : ""
    	, pwd : ""
    	, name : ""
    	, age : ""
    	, address : ""
    } 
    , methods: {
    	
    
    }   
    , created: function () {
    
	}
});


</script>