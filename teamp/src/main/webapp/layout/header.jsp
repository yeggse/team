<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head >
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<link rel="stylesheet" href="css/header.css" type="text/css">
	<style>
	/* 메뉴 클래스 */
	        * {
	            font-family: 'Noto Sans KR', sans-serif;
	        }
	</style>
	<title>testing_header</title>
	<div class="header"  >
      <a  href="main.do"><img style="margin-left:40px"src="img/main/newlogo.png" width="100px" height="80px"></a> 
      <a href="main.do" class="header" style="margin-left: 1500px; display: flex; align-items: center;">홈</a> <!-- a태그를 쓰면 갈려는 페이지 바로 입력하기, 처음에 @click으로 되지 않은 이유는 불러올 라이브러리 id="app"에 연결이 되어있지 않아서-->
      <a class="header" style="margin-left: 1600px; display: flex; align-items: center;">게시글</a>
      <a class="header" style="margin-left: 1700px; display: flex; align-items: center;">내정보</a>
      <a href="login.do" class="header" style="margin-left: 1800px; display: flex; align-items: center;">로그인</a>
      


	
	</div>
</head>

<body style="margin: 0px;" >
	<div id="app2"></div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app2',
    data: {

    }   
    , methods: {
    	 
    }
    , created: function () {
	}
});
</script>