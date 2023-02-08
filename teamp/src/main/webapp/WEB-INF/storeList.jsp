<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
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
		
			/* menu태그 자식의 ul의 자식 li를 왼쪽정렬과 넓이 140설정 */
			#menu > ul > li > ul {
				width:130px;
				display:none;
				position: absolute;
				font-size:14px;
				background: skyblue;
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
	        margin-top: 50px;	/* 바깥쪽여백 */	
	         margin-left: 50px;
	       }
	      .div4{
	        margin-top: 50px;	/* 바깥쪽여백 */	
	        margin-left: 500px;
	      }
	      
	      input {
	            width: 400px;
	            margin-top: 0px;
	            padding: 10px;
	            box-sizing: border-box;
	            border-radius: 10px;
	            border: solid 2px #8FBC94;	/* 외부 테두리 선  =>  border: none => 선 없음. border: solid 1.74px yellow; 등으로 활용*/
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
</style>

<body>
	<div id="app">
	<div class="div3">
		<input type="text" placeholder="업종을 검색해 주세요"></input>		<!-- 업종 리스트 출력하는 쿼리 생성 필요!! -->
		<button id="btn">검색</button>
		<span>
	<ul>
		<li><a href="#">MENU1</a>
			<ul>
				<li><a href="#">SUB_MENU</a></li>
				<li><a href="#">SUB_MENU2</a></li>
				<li><a href="#">SUB_MENU3</a></li>
			</ul>
		</li>
		<li><a href="#">MENU2</a>
			<ul>
				<li><a href="#">SUB_MENU</a></li>
				<li><a href="#">SUB_MENU2</a></li>
				<li><a href="#">SUB_MENU3</a></li>
			</ul>
		</li>
		<li><a href="#">MENU3</a>
			<ul>
				<li><a href="#">SUB_MENU</a></li>
				<li><a href="#">SUB_MENU2</a></li>
				<li><a href="#">SUB_MENU3</a></li>
			</ul>
		</li>
		<li><a href="#">MENU4</a>
			<ul>
				<li><a href="#">SUB_MENU</a></li>
				<li><a href="#">SUB_MENU2</a></li>
				<li><a href="#">SUB_MENU3</a></li>
			</ul>
		</li>
		<li><a href="#">MENU5</a>
			<ul>
				<li><a href="#">SUB_MENU</a></li>
				<li><a href="#">SUB_MENU2</a></li>
				<li><a href="#">SUB_MENU3</a></li>
			</ul>
		</li>
	</ul>
		</span>
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