<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<title>board 페이지</title>
</head>
<style>
   td{
        border-top : 1px solid black;
        font-size: 20px;
        text-align: center;
        padding : 6px;
    }
</style>
<body>
	<div id="app">
		<div>fdafdafdsafdsafdsafdsa</div>
		<div> <input v-model="keyword"></input>
		<button @click = "fnClick">버튼</button></div>
		<div class="table-list">
	        <table>                   
	            <thead>
	                <tr>        
	                    <th scope="col"></th>      
	                    <th scope="col">No.</th>                 
	                    <th scope="col">제목</th>
	                    <th scope="col">조회수</th>
	                    <th scope="col">작성일</th>
	                </tr>
	            </thead>
	            <tbody>
	                <tr v-for="(item, index) in list" >                            
	                    <td><input type="checkbox" name="selectBoard" v-bind:id="'idx_' + index" v-bind:value="item" v-model="selectedItemList"></td>                       
	                    <td>{{item.boardIdx}}</td> 
	                    <td>{{item.title}}</td> 
	                    <td><label v-bind:for="'idx_' + index">{{item.hitCnt}}</label></td>
	                    <td><label v-bind:for="'idx_' + index">{{item.createdDatetime}}</label></td>
	                </tr>
	            </tbody>                   
	        </table>
	        
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
       list : [] // 전체 데이터 리스트
       , selectedItemList : []
       , keyword : ""
    }   
    , methods: {
        fnGetList : function(){
            var self = this;
            var nparmap = {};
            $.ajax({
                url:"/list.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {                                       
	                self.list = data.list;
	                console.log(data.test1);
	                console.log(data.test2);
	                console.log(self.list);    
                }
            }); 
        }  
    	, fnRemove : function(){
    		 var self = this;
           	 var nparmap = {boardNum : 14};
             $.ajax({
                 url:"/remove.dox",
                 dataType:"json",	
                 type : "POST", 
                 data : nparmap,
                 success : function(data) {            
                	 alert("삭제되었습니다.");
                	 self.fnGetList();
                 }
             }); 
    	}
    	, fnClick : function(){
    		var self = this;
    		var nparmap = {keyword : self.keyword}
            $.ajax({
            	url:"/list.dox",
            	dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {      /* 데이터가 제대로 넘어오면, success실행됨 */                                 
                	self.list = data.list;
                }
            });
    	
    	}    

    }   
    , created: function () {
		this.fnGetList();       
	}
});
</script> 