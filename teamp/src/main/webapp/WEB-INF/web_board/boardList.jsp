<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
		<script src="https://unpkg.com/vuejs-paginate@latest"></script>
	<script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>
	<jsp:include page="/layout/header.jsp"></jsp:include>
	
	<title>board 공지사항 기본 출력 페이지</title>
</head>
<style>
/*    td{
        border-top : 1px solid black;
        font-size: 20px;
        text-align: center;
        padding : 6px;
    }
     */
  	      #input {
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
    .container {max-width:1024px; margin:30px auto; margin-top: 120px;}	/* 게시글 출력 파트 */
	.board_list {table-layout: fixed; width:100%; border-top:2px solid #252525; border-bottom:1px solid #ccc; margin:15px 0; border-collapse: collapse;}
	.board_list thead th:first-child {background-image:none;}
	.board_list thead th {border-bottom:1px solid #ccc; padding:13px 0; color:#3b3a3a; text-align: center; vertical-align:middle;}
	.board_list tbody td {border-top:1px solid #ccc; padding:13px 0; text-align:center; vertical-align:middle;}
	.board_list tbody tr:first-child td {border:none;}
	.board_list tbody tr:hover{background:#ffff99;}
	.board_list tbody td.title {text-align:left; padding-left:20px;}
	.board_list tbody td a {display:inline-block}

	/* 화면 넘기는 아이템 디자인 */
.pagination {
        margin:24px;
        display: inline-flex;
        
    }
.pagination li {
    min-width:32px;
    padding:2px 6px;
    text-align:center;
    margin:0 3px;
    border-radius: 6px;
    border:1px solid #eee;
    color:#666;
}
.pagination li:hover {
    background: #E4DBD6;
}
.page-item a {
    color:#666;
    text-decoration: none;
}
	/* 페이징에 동그란 점 없어지게 하기 */
	li{
	list-style:none;
	}
	
.pagination li.active {
    background-color : red;	/* #E7AA8D */
    color:#fff;
}
 .pagination li.active a {
    color:#fff;
} 

.myButton {
	box-shadow:inset 0px 1px 0px 0px #a4e271;
	background-color:#a5d296;
	border-radius:6px;
	border:1px solid #74b807;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:6px 24px;
	text-decoration:none;
}
.myButton:hover {
	background:linear-gradient(to bottom, #77a809 5%, #89c403 100%);
	background-color:#77a809;
}
.myButton:active {
	position:relative;
	top:1px;
}


</style>
<body>
	<div id="app">
		<div></div>
	<!-- 	<div class="table-list"> -->
			<div class="container">
			<h2>세잎 공지사항 - 검색어 입력시, 페이징 오류</h2>
			<div style="text-align: center;">
				<input type="text" placeholder="검색어를 입력해 주세요" id="input" v-model="title"></input>		<!-- 업종 리스트 출력하는 쿼리 생성 필요!! -->
				<button id="btn" @click="fnSearch" >검색</button>
			</div>
			<table class="board_list">
				<colgroup>
					<col width="5%"/>
					<col width="5%"/> 
					<col width="10%"/> 
					<col width="*"/>
					<col width="5%"/>
					<col width="10%"/>
					<col width="20%"/>
				</colgroup>
				<thead>
					<tr>
						<th scope="col">-</th>
						<th scope="col">글번호</th>
						<th scope="col">분류</th>
						<th scope="col">제목</th>
						<th scope="col">조회수</th>
						<th scope="col">작성자</th>
						<th scope="col">작성일</th>
					</tr>
				</thead>
				<tbody>
					<tr v-for="(item, index) in list" >                            
	                   <td><input type="checkbox" name="selectBoard" v-bind:id="'idx_' + index" v-bind:value="item" v-model="selectedItemList"></td>                       
	                   <td @click="fnDetailView(item)">{{item.noticenum}}</td> 
	                   <td @click="fnDetailView(item)">{{item.boardtype}}</td> 
	                   <td @click="fnDetailView(item)">{{item.title}}</td> 
	                   <td @click="fnDetailView(item)">{{item.hits}}</td>
	                   <td @click="fnDetailView(item)">{{item.nickname}}</td>
	                   <td @click="fnDetailView(item)">{{item.startdate}}</td>
	               	
	               </tr>
				</tbody>
			</table>
		<!-- 페이지 넘어가는 버튼들 -->			
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
		  		<button v-if="'admin' == userId" @click="fnAdd" class="myButton" style="float: right; margin-right: 10px;">작성하기</button>
		  		<button v-if="'admin' == userId" @click="fnRemove" class="myButton" style="float: right; margin-right : 5px;">삭제</button>
		  	</div>
		  	
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
		, selectPage: 1	// 기본 세팅이 1번 페이지로 맞추어져 있음.
       	, pageCount: 1
        , userId : "${userId}"
        , boardtype : ""
        , noticenum : ""
        , title : ""
        , hits : ""
        , nickname : ""
        , startdate : ""
    }   
    , methods: {
    	// 기본 출력 메소드
        fnGetList : function(){
            var self = this;
            var startNum = ((self.selectPage-1) * 10);
    		var lastNum = self.selectPage * 10
            var nparmap = {startNum : startNum, lastNum : lastNum};
            $.ajax({
                url:"/firstBoard.dox",
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
    	// 게시글 상세 확인
    	, fnDetailView : function(item){
    		var self = this;
    		self.pageChange("/main.board.detail.do", {noticenum : item.noticenum});	// 상세페이지로 해당 인덱스 번호를 넘겨줌~~!
    	}
		// 화면 전환 for 게시글 상세 확인
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
		
		// 페이지 전환 메소드
		, changePage : function(pageNum) {
			var self = this;
			self.selectPage = pageNum;
			var startNum = ((pageNum-1) * 10);	// 한페이지에 10개씩 출력되도록 하기 위해 필요함
			var lastNum = pageNum * 10
	        var nparmap = {startNum : startNum, lastNum : lastNum};
	        $.ajax({
	            url:"/firstBoard.dox",
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
		// 작성하기 페이지로 이동
		, fnAdd : function(){
    		var self = this;
    		self.pageChange("/main.board.add.do", {});
		}
    	
		// 게시글 삭제하기
    	, fnRemove : function(){
    		var self = this;
    		var list = JSON.stringify(self.selectedItemList);
    		var nparmap = {"test" : "1",  "list" : list};
             $.ajax({
                 url:"/deleteBoard.dox",
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
		// 검색버튼 이벤트
       	,fnSearch : function(){
            var self = this;
            var nparmap = {boardtype : self.boardtype, noticenum : self.noticenum, title : self.title, 
            				hits : self.hits, nickname : self.nickname, startdate : self.startdate}; 
            $.ajax({
                url:"/searchBoard.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {       
                	self.list = data.list;
    	            	if(self.list.length == 0){
    	            		self.fnGet();
    	            	}    
                	console.log(self.list);
                }
           });
    	}  
    }
    , created: function () {
    	var self = this;
    	self.fnGetList();      
	}
});
</script> 