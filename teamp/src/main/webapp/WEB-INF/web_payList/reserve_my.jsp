<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width">
  <link rel="stylesheet" href="css/detail/reserveDetail.css">
  <script src="js/jquery.js"></script>
  <script src="js/vue.js"></script>
  <title>JS Bin</title>
  <jsp:include page="/layout/header.jsp"></jsp:include>
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
					<col width="*"/>
					<col width="10%"/>
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
						<th scope="col">주문일자</th>
						<th scope="col">픽업시간</th>
						<th scope="col">결제금액</th>
						<th scope="col">예약상태</th>
					</tr>
				</thead>
				<tbody>
					<tr v-for="(item, index) in list" >                            
	                   <td><input type="checkbox" name="selectBoard" v-bind:id="'idx_' + index" v-bind:value="item" v-model="selectedItemList"></td>                       
	                   <td @click="fnDetailView(item)">{{item.ordernum}}</td> 
	                   <td @click="fnDetailView(item)">{{item.ordernum}} 수정필요</td> 
	                   <td @click="fnDetailView(item)">{{item.menuname}} 이어 붙이기</td> 
	                   <td @click="fnDetailView(item)">{{item.orderdate}}</td>
	                   <td @click="fnDetailView(item)">{{item.pickuptime}}</td>
	                   <td @click="fnDetailView(item)">{{item.price}} 더하기</td>
	                   <td @click="fnDetailView(item)">{{item.salecomple}}</td>
	               	
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
var app = new Vue({ 
    el: '#app',
    data: {
    	list : [] 
        , selectedItemList : []
		, selectPage: 1	// 기본 세팅이 1번 페이지로 맞추어져 있음.
		, pageCount: 1
        , id: "${userId}"
    }   
    , methods: {
    	// 기본 출력 메소드
      fnGetList : function(){
              var self = this;
              var startNum = ((self.selectPage-1) * 10);
      		  var lastNum = self.selectPage * 10
              var nparmap = {startNum : startNum, lastNum : lastNum};
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
          }  
    
      
      }   
      , created: function () {
  		this.fnGetList();       
  	  } 
    
   
});
</script>