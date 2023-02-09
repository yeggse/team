<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<jsp:include page="/layout/header.jsp"></jsp:include>
	<title>[세잎] 메인페이지</title>
</head>
<style>
	        * {
	            font-family: 'Noto Sans KR', sans-serif;
	        }
	        /* 점(.)으로 시작하는 아이 : html 파트에서 클래스(명)를 의미. */
	        .div1 {
	        	font-size: xxx-large;
	        	font-weight: bolder;
	            margin-top: 100px;	/* 바깥쪽여백 */	
	            margin-left: 750px;
	            width: 800px;
	            border-radius: 5px;	/* 모서리 둥글기 크기 */
	            /* text-align: center; */
	            padding: 20px;	/* 안쪽 여백 */	/* padding-top: 50px 등으로 활용 */
	        }
	        .div2 {
	        	font-size: x-large;
	        	font-weight: bold;
	            margin-top: -25px;	/* 바깥쪽여백 */	
	            margin-left: 850px;
	            width: 600px;
	            border-radius: 5px;	/* 모서리 둥글기 크기 */
	            /* text-align: center; */
	            padding: 20px;	/* 안쪽 여백 */	/* padding-top: 50px 등으로 활용 */
	        }
	      .div3{
	        margin-top: -20px;	/* 바깥쪽여백 */	
	         margin-left: 600px;
	       }
	      .div4{
	        margin-top: 50px;	/* 바깥쪽여백 */	
	        margin-left: 500px;
	      }
	      
	      input {
	            width: 50%;
	            margin-top: 0px;
	            padding: 20px;
	            box-sizing: border-box;
	            border-radius: 10px;
	            border: solid 2px #8FBC94;	/* 외부 테두리 선  =>  border: none => 선 없음. border: solid 1.74px yellow; 등으로 활용*/
	        }   
	       #btn{
		       background-color: #8FBC94;
		       width: 100px;
		       height: 60px;
		       border-radius: 20px;
		       border: solid 2px #8FBC94;
		       font-size: x-large;
		       color: white;
		       padding: 0px;
	       }
	    #imgbtn1{
		       width: 350px;
		       height: 370px;
		       border-radius: 20px;
		       margin-right: 40px;
		       padding: 0px;
		       background: url("img/main/Mfood.png") no-repeat;
	       }      
	    #imgbtn2{
		       width: 350px;
		       height: 370px;
		       border-radius: 20px;
		       margin-right: 40px;
		       padding: 0px;
		       background: url("img/main/Mkor.PNG") no-repeat;
	       }   
	    #imgbtn3{
		       width: 350px;
		       height: 370px;
		       border-radius: 20px;
		       margin-right: 30px;
		       padding: 0px;
		       background: url("img/main/Mjap.PNG") no-repeat;
	       }   
	    #imgbtn4{
		       width: 350px;
		       height: 370px;
		       border-radius: 20px;
		       margin-right: 40px;
		       padding: 0px;
		       background: url("img/main/Mchi.PNG") no-repeat;
	       }      
	    #imgbtn5{
		       width: 350px;
		       height: 370px;
		       border-radius: 20px;
		       margin-right: 40px;
		       padding: 0px;
		       background: url("img/main/Masia.PNG") no-repeat;
	       }   
	    #imgbtn6{
		       width: 350px;
		       height: 370px;
		       border-radius: 20px;
		       margin-right: 30px;
		       padding: 0px;
		       background: url("img/main/Mwe.PNG") no-repeat;
	       }   
</style>

<body style="margin: 0px">
	<div id="app" style="width:2483.02px", anlign="center">
	<div class="div1">지금 계신 장소가 어디신가요?</div>
	<div class="div2">주변 식당에서 음식을 픽업해 가세요!</div>
	<div class="div3">
		<img src="img/main/point.PNG" width=80px height=100px>
		<input type="text" placeholder="장소를 입력해 주세요"></input>
		<button id="btn">선택</button>	<!-- 조건 넣어줘야 함: 버튼이벤트 생성 : 미선택시 안넘어가게!!!!!! -->
	</div>
	<div class="div4">
		<button id="imgbtn1" onclick="location.href='/main.storelist.do'"> </button>	<!-- 선택별로 다른 화면 출력되어야 함!!! -->
		<button id="imgbtn2" onclick="location.href='/main.storelist.do'"> </button>	<!-- 선택별로 다른 화면 출력되어야 함!!! -->
		<button id="imgbtn3" onclick="location.href='/main.storelist.do'"> </button>	<!-- 선택별로 다른 화면 출력되어야 함!!! -->
	</div>
	<div class="div4">
		<button id="imgbtn4"></button>
		<button id="imgbtn5"></button>
		<button id="imgbtn6"></button>
	</div>
		
	   
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
		this.fnGetList();       
	}
});
</script>