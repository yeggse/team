<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<link rel="stylesheet" href="css/boardDetail.css">
	<jsp:include page="/layout/header.jsp"></jsp:include>
	
	<title>boardAdd 페이지</title>
</head>
<style>

		.contain {max-width:1024px; margin:30px auto; margin-top: 160px;}
  	    input {
            width: 50%;
            height: 13%	;
            margin-top: 0px;
	        padding: 10px;
            box-sizing: border-box;
            border-radius: 10px;
            border: solid 2px #8FBC94;	/* 외부 테두리 선  =>  border: none => 선 없음. border: solid 1.74px yellow; 등으로 활용*/
         } 
	      #btn{
		       background-color: #8FBC94;
		       width: 120px;
		       height: 50px;
		       border-radius: 10px;
		       border: solid 2px #8FBC94;
		       font-size: large;
		       font-weight: bolder;
		       color: white;
		       padding: 0px;
	       }
		h1{font-size: 1.5em;}
		h2{font-size: 2em;}
</style>
<body>
	<div id="app">
		<div class="contain">
			<h2>공지사항 작성하기 - 내용출력 이벤트 등 필요! </h2>
			<table class="board_detail" style="margin-top: 20px;">
				<colgroup>
					<col width="10%"/>
					<col width="*"/>
				</colgroup>
				<tr style="border-bottom:2px solid #ccc;">
					<td style="text-align : center; width: 15%;" ><h1>제목</h1></td>
					<td><input type="text" id="title" name="title" v-model="title" style="font-size: 1.3em; font-weight: 600;"></td>
				</tr>
				<tr style="border-bottom:2px solid #ccc;">
					<td style="text-align : center; width: 15%; " ><h1>첨부파일</h1></td>
					<td>
						<div>
						    <input type="file" id="file1" name="file1" style="font-size: 1.3em; font-weight: 500;"> 
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea id="contents" name="contents" v-model="content" style="font-weight: 400;"></textarea>
					</td>
				</tr>
			</table>
			<button id="btn" @click="fnList" class="btn" style="float: right;">목록으로</button>
			<button id="btn" @click="fnSave" class="btn" style="float: right;">저장</button>
		</div>
	</div>
	        
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
       list : [] 
       , info : {}
       , idx : "${map.noticenum}"	// boardList 에서 받아온 값!!!
       , userId : "${userId}"	//세션으로 id가져오기
       , comment : ""
       , commentList : []
       , selectedItemList : []
       , title : ""
       , img : ""
    }   
    , methods: {
    	// 게시글 작성 완료 - 저장
    	fnSave : function(){
    		var self = this;
    		console.log(self.img);
	      	var nparmap = {title : self.title, content : self.content, userId : self.userId}; //, img : self.img 
	        $.ajax({
	            url:"/addBoard.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) {            
/* 	            	var form = new FormData();	// FormData란 HTML 단이 아닌 자바스크립트 단에서 폼 데이터를 다루는 객체
	       	        form.append( "file1", $("#file1")[0].files[0] );	// <input name="file1" value="$("#file1")[0].files[0]"> 의미
	       	     	form.append( "boardIdx",  data.boardIdx);	// 여기에 있는 boardIdx는 어디로 가나?????
	       	        
	       	         $.ajax({
	       	             url : "/upload"
	       	           , type : "POST"
	       	           , processData : false
	       	           , contentType : false
	       	           , data : form
	       	           , success:function(response) { }
	       	           ,error: function (jqXHR) 
	       	           {}
	       	       }); */
	            	alert("저장되었습니다..");
	           		location.href="/main.board.do";
	            }
	        }); 
	        
    	}
        // 사진 업로드 : 미완
/* 		, upload : function(){
   		
			var form = new FormData();
		        form.append( "file1", $("#file1")[0].files[0] );
		        
		         $.ajax({
		             url : "/upload"
		           , type : "POST"
		           , processData : false
		           , contentType : false
		           , data : form
		           , success:function(response) { }
		           ,error: function (jqXHR) {}
		       });
		} */
		
		// 목록으로 가기 버튼
    	, fnList : function(){
    		location.href="/main.board.do";
    	} 
    }   
    , created: function () {
    	var self = this;
    	self.fnGetBoard(); 
	}
});
</script> 