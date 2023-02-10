<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<link rel="stylesheet" href="css/style.css">
	<title>Insert title here</title>
</head>
<style>
	
</style>
<body>
	<div id="app">
		<div class="container">
			<div class="card">
				<h3 class="card-header p-4">
					{{info.title}}
					<span class="badge badge-pill badge-dark pull-right" style="float: right;">{{info.createdDatetime}}</span>
				</h3>
				<div class="card-body">
				   	<div v-if="info.img != null" style="margin: 10px 10px 10px 10px;">
				   		<img :src="info.img"/>
				   	</div>
				   	<div style="margin: 10px 10px 10px 10px;">
				   		{{info.contents}}
				   	</div>
			   	</div>
			</div>
			<div v-for="(item, index) in commentList" style="font-size: 20px;">
				{{item.writer}}({{item.createdate}}) : {{item.content}}
			</div>
			<div>
				<textarea rows="3" cols="100" v-model="comment"></textarea>
				<button @click="fnComment" class="btn" style="margin-bottom:40px;">댓글달기</button>
			</div>
			<button @click="fnList" class="btn" style="float: right;">목록으로</button>
			<button v-if="info.creatorId == userId" @click="fnEdit" class="btn">수정하기</button>
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
       , idx : "${map.boardIdx}"
       , userId : "${userId}"
       , comment : ""
       , commentList : []
       
    }   
    , methods: {
    	fnGetBoard : function(){
            var self = this;
            var nparmap = {boardIdx : self.idx};
            $.ajax({
                url:"/view.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {                                       
	                self.info = data.board;
	                self.commentList = data.commentList;
                }
            }); 
        }
    	, fnComment : function(){
            var self = this;
            var nparmap = {boardIdx : self.idx, userId : self.userId, content : self.comment, depth : "0", cgroup : ""};
            $.ajax({
                url:"/comment.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	alert("댓글을 등록했습니다.");
                	self.comment = "";
                	window.location.reload()
                }
            }); 
        }
    	, fnEdit : function(){
			var self = this;
			self.pageChange("./edit.do", {boardIdx : self.idx});
		}
    	, fnList : function(){
    		location.href="/board.do";
    	}
    	
    	, pageChange : function(url, param) {
    		var target = "_self";
    		if(param == undefined){
    		//	this.linkCall(url);
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
    , created: function () {
    	var self = this;
    	self.fnGetBoard();
	}
});
</script>