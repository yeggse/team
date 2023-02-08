<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<link rel="stylesheet" href="css/header.css" type="text/css">
	<style>
	/* 메뉴 클래스 */
	
	</style>
	<title>testing_header</title>
	<div>
	<span style="font-weight: nomal; font-style:Script; font-size: 50px; line-height: 1.0em; font-family:Verdana; color: green;">
		<img src="img/logo1.png" width="100px" height="100px">            세잎
			<a href="main.do" class="header" style="margin-left: 1200px">홈</a> <!-- a태그를 쓰면 갈려는 페이지 바로 입력하기, 처음에 @click으로 되지 않은 이유는 불러올 라이브러리 id="app"에 연결이 되어있지 않아서-->
		<a class="header" style="margin-left: 50px">게시글</a>
		<a class="header" style="margin-left: 50px">내정보</a>
		<a class="header" style="margin-left: 50px">로그인</a>
	</span>
	</div>
	
</head>

<body>
	<div id="app"></div>
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
	}
});
</script>