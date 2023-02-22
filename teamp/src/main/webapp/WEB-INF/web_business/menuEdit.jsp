<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
  	<link rel="stylesheet" href="css/detail/MenuDetail.css">
  <title>메뉴 수정</title>
  <jsp:include page="/layout/header.jsp"></jsp:include>
</head>

<style>
	
		.contain {max-width:1024px; margin:30px auto; margin-top: 120px;}
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
		h1{font-size: 1em;}
		h2{font-size: 2em;}

</style>

<body>
<div>
<jsp:include page="/layout/businesspagebody.jsp"></jsp:include>
	<div id="app" style="height: 900px;">
		<div class="contain">
				<h2>메뉴 수정하기✒✒ 아직 파일만 만들어둠..!{{reskind}}</h2>
			<table class="board_detail" style="margin-top: 20px;">
				<colgroup>
					<col width="10%"/>
					<col width="20%"/>
					<col width="10%"/>
					<col width="20%"/>
				</colgroup>
				<tr style="border-bottom:2px solid #ccc;">
					<td style="text-align : center; width: 15%;" ><h1>음식명 {{resnum}}</h1></td>
					<td><input type="text" id="title" name="menuname" v-model="menuname" style="font-size: 1.3em; font-weight: 600;"></td>
					<td style="text-align : center; width: 15%;" ><h1>가격</h1></td>
					<td><input type="text" id="title" name="price" v-model="price" style="font-size: 1.3em; font-weight: 600;"></td>
				</tr>
				<tr style="border-bottom:2px solid #ccc;">
					<td style="text-align : center; width: 15%;" ><h1>재고 {{userId}}</h1></td>
					<td><input type="text" id="title" name="supply" v-model="supply" style="font-size: 1.3em; font-weight: 600;"></td>
					<td style="text-align : center; width: 15%;" ><h1>픽업 시간</h1></td>
					<td><input type="text" id="title" name="pickuptime" v-model="pickuptime" style="font-size: 1.3em; font-weight: 600;"></td>
				</tr>				
				<tr style="border-bottom:2px solid #ccc;">
					<td  style="text-align : center; width: 15%; " ><h1>첨부파일</h1></td>
					<td colspan="3">
						<div>
						    <input type="file" id="file1" name="file1" style="font-size: 1em; font-weight: 500;"> 
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea id="contents" name="introduce" v-model="introduce" style="font-weight: 400;"></textarea>
					</td>
				</tr>
			</table>
			<button id="btn" @click="fnList" class="btn" style="float: right;">목록으로</button>
			<button id="btn" @click="fnSave" class="btn" style="float: right;">저장</button>
		</div>
	
	
	
	 </div>
    </div>
</div>
</body>
    <jsp:include page="/layout/footer.jsp"></jsp:include>
</html>  


<script type="text/javascript">
var app = new Vue({
	el: '#app',
    data: {
    	  list : [] 
  		  , info : {}
 		  , idx : "${map.idx}"	// boardList 에서 받아온 값!!! for 이미지
   		  , userId : "${userId}"	//세션으로 id가져오기
   		  , resnum : "${resnum}"
   		  , reskind : "${reskind}"
 		  , selectedItemList : []
 	 	  , img : ""
 	 	  , price : ""
 	 	  , menuname : ""
 	 	  , introduce : ""
 	 	  , supply :""
 	 	  , pickuptime : ""
 	 	  
 
    } 
    , methods: {
		// 저장 버튼
		fnSave : function(){
    		var self = this;
    		console.log(self.img);
	      	var nparmap = {userId : self.userId, price : self.price, menuname : self.menuname, introduce : self.introduce, 
	      					reskind : self.reskind, resnum : self.resnum,
	      					supply : self.supply, pickuptime : self.pickuptime, img : self.img}; 
	        $.ajax({
	            url:"/editBoard.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) {            
	            	var form = new FormData();	// FormData란 HTML 단이 아닌 자바스크립트 단에서 폼 데이터를 다루는 객체
	       	        form.append( "file1", $("#file1")[0].files[0] );	// <input name="file1" value="$("#file1")[0].files[0]"> 의미
	       	     	form.append( "idx",  data.idx);	// 여기에 있는 boardIdx는 어디로 가나?????
	       	        
	       	         $.ajax({
	       	             url : "/menuUpload"
	       	           , type : "POST"
	       	           , processData : false
	       	           , contentType : false
	       	           , data : form
	       	           , success:function(response) { }
	       	           ,error: function (jqXHR) 
	       	           {}
	       	       }); 
	            	alert("게시글이 저장되었습니다.");
	           		location.href="/menu.add.do";
	            }
	        }); 
		}
	    // 사진 업로드 
		, upload : function(){
			
			var form = new FormData();
		        form.append( "file1", $("#file1")[0].files[0] );
		        
		         $.ajax({
		             url : "/menuUpload"
		           , type : "POST"
		           , processData : false
		           , contentType : false
		           , data : form
		           , success:function(response) { }
		           ,error: function (jqXHR) {}
		       });
		} 
		// 목록으로 가기 버튼
		, fnList : function(){
			location.href="/menumanagement.do";
		} 
		

    
    }   
    , created: function () {
    
	}
});


</script>
