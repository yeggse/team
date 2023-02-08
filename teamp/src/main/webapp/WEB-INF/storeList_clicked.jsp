<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<jsp:include page="/layout/header.jsp"></jsp:include>
	<link rel="stylesheet" href="css/storeListClicked_Scroll.css">
	<title>[세잎] 업체군 리스트</title>
</head>
<style>
	        * {
	            font-family: 'Noto Sans KR', sans-serif;
	        }
	        
	        /* ul li태그에 리스트 스타일을 없앰 */
			ul li{
				list-style: none;
			}
			/* a태그에 텍스트 밑줄을 없애고 색상을 #333 */
			a {
				text-decoration: none;
				color:#333;
			}
		
/* 글자크기를 16px 맑은 고딕 굵게하고 width넓이 700, 높이 50만큼 배경색은 #ccc, 글자색은 검정색, 라인높이50px
menu박스 가운데정렬, 글자가운데 정렬 */
	#filter {
		font:bold 16px "malgun gothic";
		width:700px;
		height:50px;
		background: #ccc;
		color:black;
		line-height: 50px; 
		margin:0 auto;
		text-align: center;
	}

/* menu태그 자식의 ul의 자식 li를 왼쪽정렬과 넓이 140설정 */
	#filter > ul > li {
		float:left;
		width:140px;
		position:relative;
	}
#filter > ul > li > ul {
		width:130px;
		display:none;
		position: absolute;
		font-size:14px;
		background: skyblue;
	}
	#filter > ul > li:hover > ul {
		display:block;
	}
	
#filter > ul > li > ul > li:hover {
		background: orange;
		transition: ease 1s;
		}
		
	        /* 점(.)으로 시작하는 아이 : html 파트에서 클래스(명)를 의미. */
	        .position_res {
	        	font-size: 25px;
	        	font-weight: bold;
	            margin-left: 30%;
	            margin-top: 10px;

	        }
	       .title_food {
	        	font-size: 50px;
	        	font-weight: bold;
	            margin-left: 150px;
	            margin-top: 50px;
	            padding: 20px;	
	        }
	      .grade{
	     		font-size: 20px;
	       		margin-top: 0px;	/* 바깥쪽여백 */	
	      		margin-left: 180px;
	        	color: #ed9108;
	       }
	      
	      input {
	            width: 400px;
	            margin-top: 0px;
	            padding: 10px;
	            box-sizing: border-box;
	            border-radius: 10px;
	            border: solid 2px #8FBC94;	/* 외부 테두리 선  =>  border: none => 선 없음. border: solid 1.74px yellow; 등으로 활용*/
	        }   
	       #btn_menu{
		       background-color: #2ecc71;
		       width: 250px;
		       height: 40px;
		       border-radius: 10px;
		       border: solid 2px #2ecc71;
		       font-size: large;
		       color: white;
		       padding: 0px;
		       margin-top: 50px;
               margin-left: 100px;
	       }
	        #btn_review{
		       background-color: gray;
		       width: 250px;
		       height: 40px;
		       border-radius: 10px;
		       border: solid 0px #gray;
		       font-size: large;
		       color: white;
		       padding: 0px;
		       margin-top: 50px;
               margin-left: 100px;
	       }
	        .count_menu{
		       font-size: 30px;
		       color: black;
		       padding: 0px;
		       margin-top: 50px;
               margin-left: 8%;
	       }
	       #btn_order{
		       background-color: #2ecc71;
		       width: 190px;
		       height: 50px;
		       border-radius: 10px;
		       font-size: large;
		       color: white;
		       padding: 0px;
		       margin-top: 20px;
               margin-left: 85%;
               margin-bottom: 20px;
	       }
</style>

<body>
	<div id="app">
		<div class="title_food" >옛날짜장 <div class="position_res" style="marin-top: -50px;" >가게위치 : 
										</div><!-- 가계주소들어와야함 -->
										<div class="position_res" >픽업시간 : 
										</div><!-- 가계주소들어와야함 -->	</div>
				<div class="grade" >평점 :</div><!-- DB넣기 -->
					<button id="btn_menu">메뉴</button><!-- 이동하는 리스너 넣어주기. -->
					<button id="btn_review">리뷰</button><!-- 이동하는 리스너 넣어주기. -->
						<span style="margin-left:40%; font-size: 30px;" >db수</span>
						<span class="count_menu">메뉴선택 갯수</span>
							<div style="margin-top:50px;">
								<div style="overflow: auto">
								<br>f</br><br>f</br><br>f</br><br>f</br><br>f</br><br>f</br><br>f</br><br>f</br><br>f</br><br>f</br><br>f</br><br>f</br><br>f</br><br>f</br>
								 <button id="btn_order">주문시작</button>
								</div>
							</div>
								
	  
	</div>
	
</body>
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