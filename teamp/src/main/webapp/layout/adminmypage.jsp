<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="js/jquery.js"></script>
		<script src="js/vue.js"></script>
		<jsp:include page="/layout/header.jsp"></jsp:include>
		<link rel="stylesheet" href= "css/mypagebody.css" type ="text/css">
		<style>
		</style>
	</head>
	<body >
	    <div id = "app1">
	        <div class = "div4" >
	        <div style = "font-size:20px"> 관리하기 </div>
	        <div><label style ="font-size:25px; margin-left: 10px; color:gray"> 리뷰 관리 </label>
	        <button id = "bodybtn" @click = "Aserve1" style ="font-size:20px; margin-left: 5px; color:gray"> > </button></div>
	        <div v-if ="serve1" style = "margin:20px"><a href="datachange.do" class ="a1">전체</a></div>
	        <div v-if ="serve1" style = "margin:20px"><a href="reservemy.do" class = "a1">한식</a></div>
	        <div v-if ="serve1" style = "margin:20px"><a href="paymentmy.do" class = "a1">중식</a></div>
	        <div v-if ="serve1" style = "margin:20px"><a href="paymentmy.do" class = "a1">일식</a></div>
	        <div v-if ="serve1" style = "margin:20px"><a href="datachange2.do" class = "a1">양식</a></div>
	        <div v-if ="serve1" style = "margin:20px"><a href="datachange2.do" class = "a1">아시아</a></div>
	        <div><label style ="font-size:25px; margin-left: 10px; color:gray"> 회원 관리 </label>
	        <button id = "bodybtn" @click = "Aserve2" style ="font-size:20px; margin-left: 5px; color:gray"> > </button></div>
	        <div v-if ="serve2" style = "margin:20px"><a href="paymentmy.do" class = "a1">일반 회원 관리</a></div>
	        <div v-if ="serve2" style = "margin:20px"><a href="datachange2.do" class = "a1">사업자 회원 관리</a></div>
	        </div>
	    </div>
	</body>
</html>

<script type="text/javascript">
var app = new Vue({ 
    el: '#app1',
    data: {
    	
    	serve1 : false
    	, serve2 : false
    	
    }   
    , methods: {
    	
    	Aserve1 : function(){
    		var self = this;
    		console.log("test1");
    		if(self.serve1 == false){
    			self.serve1 = true;
    		}
    		else if(self.serve1 == true){
    			self.serve1 = false;
    		}
    	},
    	Aserve2 : function(){
    		var self = this;
    		console.log("test2");
    		if(self.serve2 == false){
    			self.serve2 = true;
    		}
    		else if(self.serve2 == true){
    			self.serve2 = false;
    		}
    	}

    }
    , created: function () {
	}
});
</script>