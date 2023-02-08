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
	            width: 300px;
	            background-color: #EEEFF1;
	            border-radius: 5px;
	            text-align: center;
	            padding: 20px;
	            
	        }
	         .div2 {
	            margin-left:50px;
	            margin-bottom: 10px;
	            width: 250px;
	            background-color: #EEEFF1;
	            border-radius: 5px;
	            text-align: initial;
	            
	        }
	
	        input {
	            width: 100px;
	            height: 10px;
	            padding: 10px;
	            box-sizing: border-box;
	            border-radius: 5px;
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
	<body style = "margin:0px;">
		<div id="app" class="div3">
		    <div class="div2">
				아이디: <input type="text" v-model="id" class="in"></input>
				<button id ="btn1" @click="fnJoin">중복확인</button>
			</div>
			<div class="div2">
				패스워드: <input type="password" v-model="pwd" class="in" ></input>
			</div>
			<div class="div2">
				이름: <input type="text" v-model="name" class="in" ></input>
			</div>
			<div class="div2">
				나이: <input type="password" v-model="age" class="in" ></input>
			</div>
			<div class="div2">
				주소: <input type="text" v-model="address" class="in" ></input>
			</div>
			<button id ="btn1" @click="fnJoin">회원가입</button>
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
    	fnJoin : function (){
    		var self = this;
    		var nparmap = {id : self.id, password : self.pwd, name: self.name, age: self.age, address: self.address};
    		console.log(nparmap);
    		$.ajax({
    			url:"/join/get.dox",
    			dataType: "json",
    			type : "POST",
    			data : nparmap,
    			success : function(data){
    				self.list = data.list;
    				if(data.result == "success"){
    					alert("데이터 삽입 성공");
    				}
    				else{
    					alert("데이터 삽입 실패");
    				}
    			}
    		})
    	}
    ,
    fnCheck : function (){
		var self = this;
		var nparmap = {id : self.id};
		console.log(nparmap);
		$.ajax({
			url:"/login/check.dox",
			dataType: "json",
			type : "POST",
			data : nparmap,
			success : function(data){
				//self.list = data.list;
				if(data.num>0){
					alert("중복되었습니다");
				}
				else{
					alert("사용하실수 있는 아이디입니다.");
				}
			}
		})
    }
    
    
    }   
    , created: function () {
    
	}
});
</script>