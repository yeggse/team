<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="js/jquery.js"></script>
		<script src="js/vue.js"></script>
		<link rel="stylesheet" href= "css/mypagebody.css" type ="text/css">
	</head>
	<body >
	    <div id = "app1">
	        <div class = "div4" >
	        <button @click = "fnCheck1"> 테스트 버튼</button>
	        <div v-if = "flg" style = "margin:20px"><a href="datachange.do" class ="a1">회원 정보 수정</a></div>
	        <div style = "margin:20px"><a href="reservemy.do" class = "a1">예약 내역</a></div>
	        <div style = "margin:20px"><a href="paymentmy.do" class = "a1">결제 내역</a></div>
	        </div>
	    </div>
	</body>
</html>

<script type="text/javascript">
var app1 = new Vue({ 
    el: '#app1',
    data: {
    	flg : false
    }   
    , methods: {

    	fnCheck1: function(){
    		console.log("test");
    		var self = this;
    		self.flg = true;
    		
    	}
    }
    , created: function () {
	}
});
</script>
