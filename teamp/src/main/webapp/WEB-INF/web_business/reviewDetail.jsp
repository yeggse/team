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
	
	<title>boardDetail 페이지</title>
</head>
<style>
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
		<div class="container">
			<h2>리뷰 상세보기 </h2>
			<div class="card">
				<h2 class="card-header p-4">
					제목 : {{info.title}}
				</h2>
				<div class="card-body1">
					<h4 style="font-size: large; margin-left: 20px;">분류 : {{info.categori}}
					<span class="badge badge-pill badge-dark pull-right" style="font-size: large; float: right;">작성일 : {{info.writedate}}</span></h4>
				</div>
				<div class="card-body">
				   	<div v-if="info.img != null" style="margin: 10px 10px 10px 10px;">	<!-- info.img : 이미지 경로(img/이미지 이름) DB 컬럼이랑 동일한 이름으로!-->
				   		<img :src="info.img"/>	<!-- src앞에 콜론: 을 붙이면 변수로 지정가능 -->
				   	</div>
				   	<div style="margin: 10px 10px 10px 10px;">
				   		{{info.content}}
				   	</div>
			   	</div>
			</div>
			<div v-if="'${kind}' === 'B'">
				<div style="font-size: 30px;">
					사장님:{{info.answer}}
				</div>
			 	<div>
						<textarea rows="3" cols="100" v-model="answer"></textarea>
						<button @click="fnComment" class="btn" style="margin-bottom:40px;">답변하기</button>
				</div>
			</div>	
				<button @click="fnList" class="btn" style="float: right;">목록으로</button>
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
       , reviewnum : "${map.reviewnum}"	// boardList 에서 받아온 값!!!
       , userId : "${userId}"	//세션으로 id가져오기
       , comment : ""
       , commentList : []
       , answer : ""
       
    }   
    , methods: {
    	// 게시글 상세 기본 출력
    	fnGetReview : function(){
            var self = this;
            var nparmap = {reviewnum : self.reviewnum};
            $.ajax({
                url:"/detailReviewboard.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {                                       
	                self.info = data.review;
	               
	                self.commentList = data.review;
	                console.log(self.commentList);
	                
                }
            }); 
        }
        
    	/* , fnEdit : function(){
			var self = this;
			self.pageChange("./main.board.edit.do", {noticenum : self.idx});	
			
		} */
	    , fnComment : function(){
	        var self = this;
	        var nparmap = {reviewnum : self.reviewnum, userId : self.userId, answer:self.answer};
	        $.ajax({
	            url:"/reviewcomment.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) {
	            	alert("댓글을 등록했습니다.");
	            	self.comment = "";
	            	window.location.reload();
	            }
	        }); 
	    }
		// 목록으로 가기 버튼
    	, fnList : function(){
    		location.href="/review.do";
    	} 
    	// 페이지 이동
    	, pageChange : function(url, param) {
    		var target = "_self";
    		if(param == undefined){
    			return;
    		}
    		var form = document.createElement("form"); 
    		form.name = "dataform";
    		form.action = url;
    		form.method = "post";
    		form.target = target;
    		for(var name in param){
				var item = name;
				var val = "";
				if(param[name] instanceof Object){
					val = JSON.stringify(param[name]);
				} else {
					val = param[name];
				}
				var input = document.createElement("input");
	    		input.type = "hidden";
	    		input.name = item;
	    		input.value = val;
	    		form.insertBefore(input, null);
			}
    		document.body.appendChild(form);
    		form.submit();
    		document.body.removeChild(form);
    	}
    }   
    , created: function(){
    	var self = this;
    	self.fnGetReview(); 
	}
});
</script> 