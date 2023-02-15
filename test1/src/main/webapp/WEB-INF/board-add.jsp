<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="css/style.css">
	<title>Insert title here</title>
</head>
<style>
</style>
<body>
	<div id="app">
		<div class="container">
			<h2>게시판 등록</h2>
			<table class="board_detail">
				<colgroup>
					<col width="10%"/>
					<col width="*"/>
				</colgroup>
				<tr>
					<td style="text-align : center;" >제목</td>
					<td><input type="text" id="title" name="title" v-model="title"></td>
				</tr>
				<tr>
					<td style="text-align : center;" >첨부파일</td>
					<td>
						<div>
						    <input type="file" id="file1" name="file1" > 
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea id="contents" name="contents" v-model="content"></textarea>
					</td>
				</tr>
			</table>
			<button @click="fnList" class="btn" style="float: right;">목록으로</button>
			<button @click="fnSave" class="btn" style="float: right;">저장</button>
		</div>
		
	</div>
	
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
       list : [] 
       , selectedItemList : []
       , content : ""
       , title : ""
       , userId : "${userId}"
       , img : ""
    }   
    , methods: {
    	fnSave : function(){
    		var self = this;
    		console.log(self.img);
	      	var nparmap = {title : self.title, content : self.content, userId : self.userId, img : self.img};
	        $.ajax({
	            url:"/add.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) {            
	            	var form = new FormData();
	       	        form.append( "file1", $("#file1")[0].files[0] );
	       	     	form.append( "boardIdx",  data.boardIdx);
	       	        
	       	         $.ajax({
	       	             url : "/upload"
	       	           , type : "POST"
	       	           , processData : false
	       	           , contentType : false
	       	           , data : form
	       	           , success:function(response) { }
	       	           ,error: function (jqXHR) 
	       	           {}
	       	       });
	            	alert("저장되었습니다..");
	           		location.href="/board.do";
	            }
	        }); 
	        
    	}
    	, upload : function(){
   		
    		var form = new FormData();
   	        form.append( "file1", $("#file1")[0].files[0] );
   	        
   	         $.ajax({
   	             url : "/upload"
   	           , type : "POST"
   	           , processData : false
   	           , contentType : false
   	           , data : form
   	           , success:function(response) { }
   	           ,error: function (jqXHR) 
   	           {}
   	       });
    	}
	    , fnList : function(){
			location.href="/board.do";
		}
    }   
    , created: function () {
    	
	}
});

</script>