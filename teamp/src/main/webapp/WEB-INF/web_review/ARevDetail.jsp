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
	
	<title>bumDetail 페이지</title>
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
			<h2>리뷰 상세 보기🔎 사장님댓글까지 출력되도록~~ </h2>
			<div class="card">
				<h2 class="card-header p-4">
					업체명 : {{info.resname}}     
					<span class="badge badge-pill badge-dark pull-right" style="font-size: large; float: right; ">업체 번호 : {{info.resnum}}</span>
					<span class="badge badge-pill badge-dark pull-right" style="font-size: large; float: right;margin-right:40px;">카테고리 : {{info.categori}}</span>
					<span class="badge badge-pill badge-dark pull-right" style="font-size: large; float: right;margin-right:40px;">리뷰번호 : {{info.reviewnum}}</span>
				</h2>
				<div class="card-body1">
					<h4 style="font-size: large; margin-left: 20px;"> 제목 : {{info.title}}
					<span class="badge badge-pill badge-dark pull-right" style="font-size: large; float: right;"> 작성자 : {{info.nickname}}</span></h4>
				</div>
				<div class="card-body1">
				   	<div style="margin: 10px 10px 10px 10px;">
				   		{{info.content}}
				   	</div>
			   	</div>
			</div>
		 	<button @click="fnList" class="btn" style="float: right;">목록으로</button> 
			<button @click="fnCheck" class="btn" style="float: right;">댓글 삭제</button>
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
       , reviewnum : "${map.reviewnum}"	// boardList 에서 받아온 값!!!
       , userId : "${userId}"	//세션으로 id가져오기 - admin을 의미함
       , comment : ""
       , commentList : []
       
    }   
    , methods: {
    	// 회원정보 출력
    	fnGetMember : function(){
            var self = this;
            var nparmap = {reviewnum : self.reviewnum};
            $.ajax({
                url:"/ARevDetail.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {                                       
	                self.info = data.board;	// serviceImp 파트에서 넘어오는 것!
	                //self.commentList = data.commentList;
	                console.log(self.idx);
                }
            }); 
        }
        // 삭제 확인 버튼
    	, fnCheck : function(){
       		var self = this;
	      	var nparmap = {reviewnum : self.reviewnum};
	       	if (confirm("정말 삭제하시겠습니까??") == true){    //확인
	    		alert("리뷰 정보가 삭제되었습니다.");
	       		self.fnDelete();
	    	}else{   //취소
	    		 alert("리뷰 삭제가 취소되었습니다.");
	    		 location.href="/reviewadmin.do";
	    	 }
    	}
        // 삭제 실행
    	,fnDelete : function(){
       		var self = this;
	      	var nparmap = {reviewnum : self.reviewnum};
	        $.ajax({
	            url:"/deleteARev.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) {  
	           		location.href="/reviewadmin.do";
	            }
	        });  		
    	}
		// 목록으로 가기 버튼
    	, fnList : function(){
    		location.href="/reviewadmin.do";
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
    	self.fnGetMember(); 
	}
});
</script> 