<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<link rel="stylesheet" href="css/style.css">
	<script src="https://unpkg.com/vuejs-paginate@latest"></script>
	<script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>
	<title>Insert title here</title>
</head>
<style>
</style>
<body>
	<div id="app">
		
		<div class="container">
			<div >
				<label for="si" class="control-label">시 : </label>
				<select id="si" v-model="si" class="form-control" id="si" @change="fnGuList"> 
					<option v-for="item in siList" v-bind:value="item.si">{{item.si}}</option>
				</select>
			</div>
			<div >
				<label for="gu" class="control-label">구/군 : </label>
				<select id="gu" v-model="gu" class="form-control" id="gu" @change="fnDongList">
					<option value="">:: 선택 ::</option>
					<option v-for="item in guList" v-bind:value="item.gu">{{item.gu}}</option>
				</select>
			</div>
			<div>
				<label for="dong" class="control-label">동 : </label>
				<select id="dong" v-model="dong" class="form-control" id="dong">
					<option value="">:: 선택 ::</option>
					<option v-for="item in dongList" v-bind:value="item.dong">{{item.dong}}</option>
				</select>
			</div>
			<h2>게시글 목록</h2>
			<table class="board_list">
				<colgroup>
					<col width="5%"/>
					<col width="5%"/>
					<col width="*"/>
					<col width="5%"/>
					<col width="10%"/>
					<col width="25%"/>
				</colgroup>
				<thead>
					<tr>
						<th scope="col"></th>
						<th scope="col">글번호</th>
						<th scope="col">제목</th>
						<th scope="col">조회수</th>
						<th scope="col">작성자</th>
						<th scope="col">작성일</th>
					</tr>
				</thead>
				<tbody>
					<tr v-for="(item, index) in list" >                            
	                   <td><input type="checkbox" name="selectBoard" v-bind:id="'idx_' + index" v-bind:value="item" v-model="selectedItemList"></td>                       
	                   <td @click="fnView(item)">{{item.boardIdx}}</td> 
	                   <td @click="fnView(item)">{{item.title}}</td> 
	                   <td @click="fnView(item)">{{item.hitCnt}}</td>
	                   <td @click="fnView(item)">{{item.creatorId}}</td>
	                   <td @click="fnView(item)">{{item.createdDatetime}}</td>
	               	
	               </tr>
				</tbody>
			</table>
			<template>
			  <paginate
			    :page-count="pageCount"
			    :page-range="3"
			    :margin-pages="2"
			    :click-handler="changePage"
			    :prev-text="'<'"
			    :next-text="'>'"
			    :container-class="'pagination'"
			    :page-class="'page-item'">
			  </paginate>
			</template>
		  	<div>
		  		<button @click="fnAdd" style="float: right;">글쓰기</button>
		  		<button @click="fnRemove" style="float: right; margin-right : 5px;">삭제</button>
		  	</div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
Vue.component('paginate', VuejsPaginate)
var app = new Vue({ 
    el: '#app',
    data: {
       list : [] 
       , selectedItemList : []
	   , selectPage: 1
	   , pageCount: 1
	   , userId : "${userId}"
	   , siList : ${siList}
	   , guList : ${guList}
	   , dongList : ${dongList}
	   , si : "서울특별시"
	   , gu : ""
	   , dong : ""
	   , guFlg : false
	   , dongFlg : false
    }   
    , methods: {
        fnGetList : function(){
            var self = this;
            var startNum = ((self.selectPage-1) * 10);
    		var lastNum = self.selectPage * 10
            var nparmap = {startNum : startNum, lastNum : lastNum};
            $.ajax({
                url:"/list.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {                                       
	                self.list = data.list;
	                self.pageCount = Math.ceil(data.cnt / 10);
	                console.log(self.pageCount);
                }
            }); 
        }  
    	, fnGuList : function(){
    		var self = this;
            var nparmap = {si : self.si};
            $.ajax({
                url:"/gu/list.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {                                       
	                self.guList = data.guList;
	                console.log(data.guList);
	                self.gu = "";
	                self.dong = "";
                }
            }); 
        }
    	, fnDongList : function(){
     		var self = this;
             var nparmap = {si : self.si, gu : self.gu};
             $.ajax({
                 url:"/dong/list.dox",
                 dataType:"json",	
                 type : "POST", 
                 data : nparmap,
                 success : function(data) {                                       
 	                self.dongList = data.dongList;
 	          		self.dong = "";
                 }
             }); 
         }
	    , changePage: function (pageNum) {
			var self = this;
			self.selectPage = pageNum;
			var startNum = ((pageNum-1) * 10);
			var lastNum = pageNum * 10
	        var nparmap = {startNum : startNum, lastNum : lastNum};
	        $.ajax({
	            url:"/list.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) {                                       
	                self.list = data.list;
	                self.pageCount = Math.ceil(data.cnt / 10);
	                console.log(self.pageCount);
	            }
	        }); 
	    }
    	// 조회
    	, fnView : function(item){
    		var self = this;
    		self.pageChange("./view.do", {boardIdx : item.boardIdx});
    	}
    	
    	// 작성
    	, fnAdd : function(){
    		var self = this;
    		self.pageChange("./add.do", {});
    	}
	    , fnEdit : function(){
			var self = this;
	      	var nparmap = {boardNum : 13, userId : self.userId};
	      	 
	        $.ajax({
	            url:"/edit.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) {            
		           	alert("수정되었습니다.");
		           	self.fnGetList();
	            }
	        }); 
		}
	    
    	, fnRemove : function(){
    		var self = this;
    		var list = JSON.stringify(self.selectedItemList);
    		var nparmap = {"test" : "1",  "list" : list};
             $.ajax({
                 url:"/remove.dox",
                 dataType:"json",	
                 type : "POST", 
                 data : nparmap,
                 success : function(data) {            
                	 alert("삭제되었습니다.");
                	 self.selectedItemList = [];
                	 self.fnGetList();
                 }
             });  
    	}
    	
    	, fnTest : function(){
    		var self = this;
    		self.pageChange("./test.do", {test1 : "1", test2 : "2"});
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
    	self.fnGetList();  
	}
});
</script>