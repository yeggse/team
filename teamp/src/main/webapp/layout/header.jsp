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
	        * {
	            font-family: 'Noto Sans KR', sans-serif;
	        }
	</style>
	<title>testing_header</title>
	<div class="header" >
	<img style="margin-left:40px"src="img/logo1.png" width="100px" height="100px"> 
	<span style="margin-left: 40px; margin-bottom: 50px; font-weight: nomal; font-style:Script; font-size: 50px; line-height: 1.0em; font-family:Verdana; color: green;">세잎</span>
			<a href="main.do" class="header" style="margin-left: 1900px">홈</a> <!-- a태그를 쓰면 갈려는 페이지 바로 입력하기, 처음에 @click으로 되지 않은 이유는 불러올 라이브러리 id="app"에 연결이 되어있지 않아서-->
		<a class="header" style="margin-left: 2000px">게시글</a>
		<a class="header" style="margin-left: 2100px">내정보</a>
		<a class="header" style="margin-left: 2200px">로그인</a>
	
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