<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<jsp:include page="/layout/header.jsp"></jsp:include>
	<title>[세잎] 결제창</title>
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
	      
	      input {
	            width: 400px;
	            margin-top: 0px;
	            padding: 10px;
	            box-sizing: border-box;
	            border-radius: 10px;
	            border: solid 4px #8FBC94;	/* 외부 테두리 선  =>  border: none => 선 없음. border: solid 1.74px yellow; 등으로 활용*/
	            text-align: center; 
	            font-weight: bold; 
	            font-size: large;
	        }   
	       #btn{
		       background-color: #8FBC94;
		       width: 80px;
		       height: 40px;
		       border-radius: 20px;
		       border: solid 2px #8FBC94;
		       font-size: large;
		       color: white;
		       padding: 0px;
	       }
	       label {
 				display: flex;
  				align-items: center;
  				justify-content: center;
 				margin: 0 auto;
			}
			select {	/* https://www.freecodecamp.org/korean/news/html-select-taegeu-deurobdaun-menyu-ddoneun-kombo-riseuteureul-mandeuneun-bangbeob/ */
			  	margin-bottom: 10px;
  				margin-top: 10px;
  				background: lightgray;
			}
			
		.div2 {
				margin-top: 90px;
				margin-right: 250px; 
				width: 600px;
		        margin-top:100px;
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
	<div style="width:2483.02px", anlign="center">
		<div class="div1">결제창</div>
		
		<table style="float:left; margin-left: 350px; width: 600px; border: 1px solid black; border-collapse : collapse; margin-top: 100px; border-radius: 5px; text-align: center;">
			<td style="border: 1px solid #444444; font-size: x-large; font-weight: bolder; margin-top: 20px; ">
				<div style="margin-top: 30px;">아&nbsp;이&nbsp;디 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" placeholder="아이디 자동출력되도록!!!!!!!!!!!" readonly ></input>
				</div> 
				<div style="margin-top: 30px;">이&nbsp;&nbsp;&nbsp;&nbsp;름 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" placeholder="이름 자동출력되도록!!!!!!!!!!!" readonly></input>
				</div>
				<div style="margin-top: 30px;">전화번호 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" placeholder="전화번호 자동출력되도록!!!!!!!!!!!" readonly></input>
				</div>
				<div style="margin-top: 30px;">계좌번호 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" placeholder="계좌번호 자동출력되도록!!!!!!!!!!!" readonly></input>
				</div>					
				<div style="margin-top: 30px; margin-bottom: 20px">결제방법 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<form action="#" style=" display: inline;">	<!-- 나란히 만들기 위해서 display: inline -->
						<select style="width: 400px; height: 40px; font-size: large; font-weight: bold;">
   							<option value="CASH">만나서 현금 결제</option>
   							<option value="account">계좌 이체</option>
   							<option value="card">만나서 카드 결제</option>
   						</select>
					</form>

				</div>
			</td>
		</table>	
	  </div>
	  <div>
	  <div class="div2">
		<div style="font-size: xx-large; font-weight: bolder; margin-bottom: 10px; margin-left: 30px; margin-top:10px;" > 선택하신 메뉴</div> 
		<div style="margin-bottom:5px; font-size:large; font-weight: bold; margin-left: 20px;">메뉴들 출력</div>	<!-- for문!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
	  </div>
	  <div class="div3">
	  	<a href="main.storelist.do" style="font-size:large; font-weight: bold; margin-left: 200px; color: orange;"> 메뉴를 추가하시겠습니까?</a> 
		<div style="margin-top: 5px; font-size:large; font-weight: bold; margin-left: 100px;">
			결제 금액 : {{계산 금액 출력}}	  원
	  	</div>
	  	<div>
	  		<button style="color:white; background-color: green; margin-top: 10px; font-weight: bold; font-size: large; margin-bottom: 0px; width:100%;"> 예약 완료 </button>
	  	</div>
	  	<div>
	  		<button style="color:white; background-color: lightgray; margin-top: 5px; font-weight: bold; font-size: large; margin-bottom: 0px; width:100%;"> 취소 </button>
	  	</div>
	  </div>
</body>
<jsp:include page="/layout/footer.jsp"></jsp:include>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app8',
    data: {
      
    }   
    , methods: {
       
    }
    
    		 
    , created: function () {
		this.fnGetList();       
	}
});
</script>