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

img{
width:6rem;
height:6rem;
}

/* ----------------------------------------------------- */

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



</style>
<body>
<jsp:include page="/layout/businesspagebody.jsp"></jsp:include>
	<div id="app">
		<div></div>
	<!-- 	<div class="table-list"> -->
			<div class="container">
			<h2>세잎 메뉴관리</h2>
			<div style="text-align: center;">
				<input type="text" placeholder="검색어를 입력해 주세요" id="input"></input>		<!-- 업종 리스트 출력하는 쿼리 생성 필요!! -->
				<button id="btn"  >검색</button>
			</div>
			<table class="board_list">
				<colgroup>
					<col width="5%"/>
					<col width="10%"/> 
					<col width="10%"/> 
					<col width="20%"/>
					<col width="12.5%"/>
					<col width="15%"/>
					<col width="5%"/>
					<col width="5%"/>
				</colgroup>
				<thead>
					<tr>
						<th scope="col">-</th>
						<th scope="col">메뉴명</th>
						<th scope="col">가격</th>
						<th scope="col">메뉴설명</th>
						<th scope="col">사진</th>
						<th scope="col">업로드날짜</th>
						<th scope="col">수정날짜</th>
						<th scope="col">재고</th>
						<th scope="col">-</th>
					</tr>
				</thead>
				<!-- db 수정되면 알맞은 값 가져오기 -->
				<tbody>
					<tr v-for="(item, index) in list" >                            
	                   <td><input type="checkbox" name="selectBoard" v-bind:id="'idx_' + index" v-bind:value="item" v-model="selectedItemList"></td>                       
	                   <td @click="fnDetailView(item)">{{item.menuname}}</td> 
	                   <td @click="fnDetailView(item)">{{item.price}}원</td> 
	                   <td @click="fnDetailView(item)">{{item.introduce}}</td>
	                   <td @click="fnDetailView(item)">{{item.picture}}<img src=""></td>
	                   <td @click="fnDetailView(item)">{{item.startdate}}</td>
	                   <td @click="fnDetailView(item)">{{item.enddate}}</td>
	                   <td @click="fnDetailView(item)">{{item.supply}}</td> 
	                   <td @click=""><button>수정</button></td> 
	                   <!-- 재고 수정관련 html (미완성) -->
    					<!-- 	<td>
							<button type ="button" onclick="fnCalCount('p',this);">+</button>
        					<input class="tdinput" type="text" name="pop_out" value= "{{item.supply}}"/>  values에 값 어떻게 넣어야하는지 모르겠음 
        					<button type="button" onclick="fnCalCount('m', this);">-</button>
    						</td> -->
    						
    							
	                   <!--------------------------------------------------------------------  -->
	                  			<form action="">
								<fieldset>
										<legend>input type</legend>
										<p><label for="number">수량: </label><input type="number" min="1"  max="10" step="1" value="1" id="number"/></p>
								</fieldset>
								</form>
	                   
	               	
	               </tr>
				</tbody>
			</table>
		<!-- 페이지 넘어가는 버튼들 -->		
			<div>
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
			  </div>
		  	<div>
		  	<!-- v-if에 조건을 'kind'가 '사업자라면'으로 변경하기  -->
		  		<button v-if="'admin' == userId" @click="fnAdd" class="myButton" style="float: right; margin-right: 10px;">작성하기</button>
		  		<button v-if="'admin' == userId" @click="fnRemove" class="myButton" style="float: right; margin-right : 5px;">삭제</button>
		  	</div>
		  	
		  </div>	
		  	</div>
	</div>
</body>



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
    }   
    , methods: {
/*     	//재고 수정관련 메소드 (미완성)
    	function fnCalCount(type, ths){
    	    var $input = $(ths).parents("td").find("input[name='pop_out']");
    	    var tCount = Number($input.val());
    	    var tEqCount = Number($(ths).parents("tr").find("td.bseq_ea").html());
    	    
    	    if(type=='p'){
    	        if(tCount < tEqCount) $input.val(Number(tCount)+1);
    	        
    	    }else{
    	        if(tCount >0) $input.val(Number(tCount)-1);    
    	        }
    	}
    	 /////////////////////////////////////////////// */
    	
    	
    	
    	// 기본 출력 메소드
        fnGetList : function(){
            var self = this;
            var startNum = ((self.selectPage-1) * 10);
    		var lastNum = self.selectPage * 10
            var nparmap = {startNum : self.startNum, lastNum : self.lastNum}; //startNum:page에 표시되는 최소 게시물 갯수(0), lastNum:page에 표시되는 최대 게시물 갯수(10)
            $.ajax({
                url:"/selectResmenu2.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {                                       
	                self.list = data.list;
	                self.pageCount = Math.ceil(data.cnt / 10);//게시물 갯수를 10으로 나누고 Math.ceil함수를 사용해서 필요한 페이지 갯수 정함 ex)(data.cnt/10)=1.02 -->페이지 2개
	                console.log("현재 페이지의 갯수는: " + self.pageCount);
                }
            }); 
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
    }   
    , created: function () {
    	var self = this;
    	self.fnGetList();      
	}
});
</script> 

</html>


