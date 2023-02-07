<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="css/header.css" type="text/css">	<!-- css파일 연결 -->
		<style>
		 .span1 {
	            margin-left: 200px;
	            text-align: center;
	        }
	     .span2{
	     	margin-bottom: 10px;
	     }
	     input{
	    	 width: 500px;
	    	 margin-top: 0px;
	         padding: 20px;
	         box-sizing: border-box;
	         border-radius: null;
	         border: solid 2px blue;	/* 외부 테두리 선  =>  border: none => 선 없음. border: solid 1.74px yellow; 등으로 활용*/
	     }
	     .in {
	            margin-top: 0px;
	        }
    	</style>
	</head>
	<body style="margin: 0px;">
		<div class="header">
		<span class="span1">
			<img src="img/cate.PNG" width="90px" height="100px">
		</span>
		<img src="img/logo.png" width="150px" height="100px">
		<input type="text" class="in" v-model="search" placeholder="검색어를 입력하세요"></input>
		<span class="span2">
		<img src="img/my.PNG" width="80px" height="80px">
		</span>
		</div> 
		
	</body>
</html>
