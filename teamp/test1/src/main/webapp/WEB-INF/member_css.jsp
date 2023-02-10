<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="js/jquery.js"></script>
		<script src="js/vue.js"></script>
		<title>테스트</title>
		<style>
	        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
	
	        * {
	            font-family: 'Noto Sans KR', sans-serif;
	        }
	
	        body {
	            background-color: #c495cb;
	        }
	
	        .div1 {
	            margin: auto;
	            width: 300px;
	            background-color: #EEEFF1;
	            border-radius: 5px;
	            text-align: center;
	            padding: 20px;
	        }
	         .div2 {
	            margin: auto;
	            width: 250px;
	            background-color: #EEEFF1;
	            border-radius: 5px;
	            text-align: center;
	            padding: 20px;
	        }
	
	        input {
	            width: 100%;
	            padding: 10px;
	            box-sizing: border-box;
	            border-radius: 5px;
	            border: none;
	        }
	
	        .in {
	            margin-bottom: 10px;
	        }
	
	        #btn {
	            background-color: #1BBC9B;
	            margin-bottom: 30px;
	            color: white;
	        }
	
	        a {
	            text-decoration: none;
	            color: #9B9B9B;
	            font-size: 12px;
	        }
    	</style>
	</head>
	<body>
		<div id="app" class="div1">
			<div class="div2">
				<input type="text" v-model="id" class="in" placeholder="아이디"></input>
			</div>
			<div class="div2">
				<input type="password" v-model="pwd" class="in" placeholder="비밀번호"></input>
			</div>
			<div class="div2" >
				<button id="btn" @click="fnLogin">로그인</button>
				<button id="btn" @click="fnJoin">회원가입</button>
			</div>
			<a href="find.do">비밀번호를 잊어버리셨나요?</a>
		</div>
		<div>test</div> 
	</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
    	id : ""
    	, pwd : ""
    	, name : ""
    }   
    , methods: {
    	fnLogin : function(){
            var self = this;
            var nparmap = {id : self.id, password : self.pwd}; 
            $.ajax({
                url:"/login/get.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {     
                	if(data.result == "success"){
                		alert(data.user.name + "님 로그인 성공!!");
                		self.pageChange("/board.do", {});
                	} else {
                		alert("로그인 실패!!");
                	}
                }
            }); 
        }
	    , fnJoin : function(){
	    	var self = this;
	    	self.pageChange("/join.do", {id : self.id});
	    }
	    , fnFindInfo : function(){
	    	var self = this;
	    	self.pageChange("/find.do", {});
	    }
	    , pageChange : function(url, param) {
	        var target = "_self";
	        if(param == undefined){
	        //   this.linkCall(url);
	           return;
	        }
	        var form = document.createElement("form"); 
	        form.name = "dataform";
	        form.action = url;
	        form.method = "post";
	        form.target = target;
	        for(var name in param){
	          var item = name;
	          var val = "";
	          if(param[name] instanceof Object){
	             val = JSON.stringify(param[name]);
	          } else {
	             val = param[name];
	          }
	          var input = document.createElement("input");
	           input.type = "hidden";
	           input.name = item;
	           input.value = val;
	           form.insertBefore(input, null);
	       }
	        document.body.appendChild(form);
	        form.submit();
	        document.body.removeChild(form);
	     }
    }   
    , created: function () {
    
	}
});
</script>
