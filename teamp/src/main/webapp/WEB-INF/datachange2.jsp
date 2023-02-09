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
body{
     line-height:2em;        
     font-family:"맑은 고딕";
}
 .div3 {
                
	            margin: auto;
	            width: 800px;
	            height:800px;
	            background-color: white;
	            border-radius: 5px;
	            text-align: center;
	            padding: 20px;
	            
	        }
	         .div2 {
	         
	            margin-left:50px;
	            margin-bottom: 10px;
	            width: 800px;
	            height:50px;
	            background-color: white;
	            border-radius: 5px;
	            text-align: initial;
	            
	        }
</style>

<body >
<jsp:include page="/layout/businesspagebody.jsp"></jsp:include>
     <div id="app" class = "div3" style = "margin-top:100px" >
	       <div id="app" class = "div2" style = "background-color: white;height: 50px;font-size: 25px;" >
	             회원정보 수정
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
			
			<button @click = "fnJoin" style = "width:200px; height:35px; margin-top:50px">수정하기</button>
			
		</div> 
	 </body>
	<jsp:include page="/layout/footer.jsp"></jsp:include>
</html>
<script type="text/javascript">
var app = new Vue({
	el: '#app',
    data: {
    	id : ""
        	, pwd2 : ""
        	, pwd : ""
        	, name : ""
        	, age : ""
        	, address : ""
        	, nickname : ""
        	, num : ""
        	, account : ""
        	, restaurant : ""
        	, resnum : ""
        	, kind : ""
        	, region : ""
        	, resad : ""
        	, resphonenum : ""
        	
    } 
    , methods: {
    	
   
    
    }   
    , created: function () {
    
	}
});


</script>