<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
    <link rel="stylesheet" href="css/detail/reserveDetail.css">
    <script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<script src="https://unpkg.com/vuejs-paginate@latest"></script>
	<script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>
	<jsp:include page="/layout/header.jsp"></jsp:include>
	
	 <title>예약 내역 확인하기</title>
</head>

<style>
</style>

<body>
<jsp:include page="/layout/mypagebody.jsp"></jsp:include>
	<div id="app" >
		<div class="container">
			<h2 style="margin-left: 30px;">{{id}} 님의 예약 내역🎈</h2>
			<div style="text-align: center;">
			</div>
			<table class="board_list">
				<colgroup>
					<col width="5%"/>
					<col width="10%"/> 
					<col width="10%"/> 
					<col width="10%"/>
					<col width="10%"/>
					<col width="10%"/>
					<col width="15%"/>
					<col width="15%"/>
					<col width="15%"/>
					<col width="15%"/>
					
				</colgroup>
				<thead>
					<tr>
						<th scope="col">-</th>
						<th scope="col">주문번호</th>
						<th scope="col">상호명</th>
						<th scope="col">메뉴</th>
						<th scope="col">개수</th>
						<th scope="col">주문일자</th>
						<th scope="col">픽업시간</th>
						<th scope="col">개당 가격</th>
						<th scope="col">주문 일자</th>
						<th scope="col">판매 완료</th>
					</tr>
				</thead>
				<tbody>
					<tr v-for="(item, index) in list" >                            
	                   <td><input type="checkbox" name="selectBoard" v-bind:id="'idx_' + index" v-bind:value="item" v-model="selectedItemList"></td>                       
	                   <td >{{item.ordernum}}</td> 
	                   <td >{{item.resname}}</td> 
	                   <td >{{item.menuname}} 이어 붙이기</td>
	                   <td >{{item.menunum}} </td> 
	                   <td >{{item.orderdate}}</td>
	                   <td >{{item.pickuptime}}</td>
	                   <td >{{item.price}}</td>
	                   <td >{{item.orderdate}}</td>
	                   <td >{{item.salecomple}}</td>
	               	
	               </tr>
				</tbody>
			</table>
		<!-- 페이지 넘어가는 버튼들 -->			
    
    
			

    </div>   
 </div>
</body>
    <jsp:include page="/layout/footer.jsp"></jsp:include>
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
        , id: "${userId}"
        , ordernum : ""
        , menuname : ""
        , orderdate : ""
        , pickuptime : ""
        , price : ""
        , salecomple : ""
        
        
    }   
    , methods: {
    	// 기본 출력 메소드
      fnGetList : function(){
              var self = this;
              var startNum = ((self.selectPage-1) * 10);
      		  var lastNum = self.selectPage * 10;
              var nparmap = {startNum : startNum, lastNum : lastNum,id:self.id};
              $.ajax({
                  url:"/reservemy.dox",
                  dataType:"json",	
                  type : "POST", 
                  data : nparmap,
                  success : function(data) {                                       
  	                self.list = data.list;
  	            	self.pageCount = Math.ceil(data.cnt / 10);
  	                console.log(self.list);  
                  }
              }); 
              console.log(self.list);
          }  
    
      
      }   
      , created: function () {
    	var self = this;
  		this.fnGetList();
  	  } 
    
   
});
</script>