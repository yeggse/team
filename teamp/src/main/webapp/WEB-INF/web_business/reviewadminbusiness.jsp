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
	
	<title>일반 회원 관리</title>
</head>
<style>
img{
width:6rem;
height:6rem;
}
/* ----------------------------------------------------- */
#input {
   width: 25rem;
   margin-top: 0rem;
   padding: 0.66rem;
   box-sizing: border-box;
   border-radius: 0.66rem;
   border: solid 2px #8FBC94;	/* 외부 테두리 선  =>  border: none => 선 없음. border: solid 1.74px yellow; 등으로 활용*/
}
   
#btn{
	background-color: #8FBC94;
	width: 5rem;
	height: 2.5rem;
	border-radius: 1.25rem;
	border: solid 2px #8FBC94;
	font-size: large;
	color: white;
	padding: 0rem;
}
/* ------------------------------------------------------- */
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
.pagination {
        margin:1.5rem;
        display: inline-flex;
    }
.pagination li {
    min-width:32px;
    padding:2px 6px;
    text-align:center;
    margin:0 0.3rem;
    border-radius: 0.33rem;
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
.pagination li.active {
    background-color : red;	/* #E7AA8D */
    color:white;
}
 .pagination li.active a {
    color:whir;
} 
.tdinput{
width:2rem;
}
.container {
max-width:70rem; margin:auto; margin-top: 8rem;
}	/* 게시글 출력 파트 */
.board_list {
table-layout:; width:100%; border-top:2px solid #252525; border-bottom:1px solid #ccc; margin:1rem 0rem;
}
.board_list tbody td {
border-top:1px solid #ccc; padding:0.8rem 0rem; text-align:center; vertical-align:middle;
}
.board_list tbody tr:hover{
background:#ffff99;
}
</style>
<body>
<jsp:include page="/layout/businesspagebody.jsp"></jsp:include>

	<div id="app">
		<div></div>
	<!-- 	<div class="table-list"> -->
			<div class="container">
			<h2>{{resname}} 점포 리뷰 관리🙆‍♀️ - 검색버튼 활성화 필요</h2>‍
			<div style="text-align: center;">
			
				<!-- <input type="text" placeholder="id 혹은 이름을 검색해 주세요" v-model="search"  v-on:keyup.enter="fnSearch"></input>
				<button id="btn" @click="fnSearch">검색</button>	 검색기능 활성화 필요-->
				
		<!-- 		<input type="text" placeholder="검색어를 입력해 주세요" id="input"></input>		업종 리스트 출력하는 쿼리 생성 필요!!
				<button id="btn"  >검색</button>  -->
				
				
			</div>
			<table class="board_list">
				<colgroup>
					<col width="5%"/>
					<col width="10%"/> 
					<col width="10%"/> 
					
					<col width="15%"/>
					<col width="15%"/>
					<col width="15%"/>
					<col width="20%"/>
				</colgroup>
				<thead>
					<tr>
						<th scope="col">-</th>
						<th scope="col">리뷰 번호</th>
						<th scope="col">분류</th>
						<th scope="col">제목</th>
						<!-- <th scope="col">내용</th> -->
						<th scope="col">별점</th>
						<th scope="col">닉네임</th>
						<th scope="col">날짜</th>
					</tr>
				</thead>
				<!-- db 수정되면 알맞은 값 가져오기 -->
				<tbody>
					<tr v-for="(item, index) in list" >                            
	                   <td><input type="checkbox" name="selectBoard" v-bind:id="'idx_' + index" v-bind:value="item" v-model="selectedItemList"></td>                       
	                   <td @click="fnDetailreview(item)">{{item.reviewnum}}</td> 
	                   <td @click="fnDetailreview(item)">{{item.categori}}</td> 
	                   <td @click="fnDetailreview(item)">{{item.title}}</td>
	                   <!-- <td>{{item.content}}</td> -->
	                   <td @click="fnDetailreview(item)">{{item.grade}}</td>
	                   <td @click="fnDetailreview(item)">{{item.nickname}}</td>
	                   <td @click="fnDetailreview(item)">{{item.writedate}}</td> 
	               </tr>
				</tbody>
			</table>
		<!-- 페이지 넘어가는 버튼들 -->		
			  
		  	
		  </div>	
	</div>
</body>


</html>
<script type="text/javascript">
Vue.component('paginate', VuejsPaginate)
var app = new Vue({
		el : '#app',
		data : {
			list :[]/* 게시판에 올려지는 글들은 다른 리스트 새로만들기  */
	        
	        ,selectedItemList:[]
	        ,resnum : "${resnum}"
	        ,userId : "${userId}"
	        ,resname :  "${resname}"
	        ,reviewnum :  ""

	        ,categori : ""
	        ,grade : ""
	        ,nickname : ""
	        ,writedate : ""
		},
		methods : {
		fnGetReview : function() {
			var self = this;
			var nparmap = {resnum: self.resnum};
			$.ajax({
				url : "/searchReview2.dox",
				dataType : "json",
				type : "POST",
				data : nparmap,
				success : function(data) {
					self.list = data.list1;
					/* self.info = data.resimg; */
					
					console.log(self.list);
					
				}
			});
		}
		,fnDetailreview : function(item){
			var self = this;
			self.pageChange("/review.board.detail.do",{reviewnum : item.reviewnum, answer : item.answer});
			console.log(self.reviewnum);
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
		
		},
		created : function() {
			var self = this;
			self.fnGetReview();
			console.log(self.resname);
			console.log(self.userId);
			
		}
	});
</script>


