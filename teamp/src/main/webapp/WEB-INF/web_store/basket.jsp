<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<jsp:include page="/layout/header.jsp"></jsp:include>
	<title>[세잎] 선택 메뉴 리스트 </title>
</head>
<style>
	        * {
	            font-family: 'Noto Sans KR', sans-serif;
	        }
	        /* 점(.)으로 시작하는 아이 : html 파트에서 클래스(명)를 의미. */
	      .div1{
	        margin-top: 170px;	/* 바깥쪽여백 */	
	        margin-left: 900px;
	        font-size: xxx-large;
	        font-weight: bolder;
	        width: 500px;
	        height: 50px;
	       }
	      
			
		.div2 {
				margin-right: 250px; 
				width: 600px;
		        margin-top:120px;
		        height:320px;
	            background-color: #E0F0F0;
	            border-radius: 5px;
	            float:right;
	            padding:10px;
	   }
		.div3 {
				margin-top: 10px;
				margin-right: 250px; 
				width: 600px;
		        height:125px;
	            background-color: #E0F0F0;
	            border-radius: 5px;
	            float:right;
	            padding:10px;
	   }
	   
	   
</style>

<body style="margin: 0px">
<div id="app">
	  <div class="div2">
		<div style="font-size: xx-large; font-weight: bolder; margin-bottom: 10px; margin-left: 30px; margin-top:10px;" > 선택하신 메뉴</div> 
		<div style="margin-bottom:5px; font-size:large; font-weight: bold; margin-left: 20px;">메뉴들 출력</div>	<!-- for문!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
	  </div>
<!-- 	  <div class="div3">
	  	<a href="main.storelist.do" style="font-size:large; font-weight: bold; margin-left: 200px; color: orange;"> 메뉴를 추가하시겠습니까?</a> 
		<div style="margin-top: 5px; font-size:large; font-weight: bold; margin-left: 100px;">
			결제 금액 : {{계산 금액 출력}}	  원
	  	</div>
	</div> -->
 </div>
</body>
<jsp:include page="/layout/footer.jsp"></jsp:include>

</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
      
    }   
    , methods: {
       
    }
    
    		 
    , created: function () {
	}
});
</script>