<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<jsp:include page="/layout/header.jsp"></jsp:include>
<!-- <link rel="stylesheet" href="css/storeListClicked_Scroll.css"> -->
<title>[세잎] 업체군 리스트</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous" />
<!-- 구글 폰트 사용 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="css/bootstrap.css">
</head>
<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
}

/* ul li태그에 리스트 스타일을 없앰 */
ul li {
	list-style: none;
}
/* a태그에 텍스트 밑줄을 없애고 색상을 #333 */
a {
	text-decoration: none;
	color: #333;
}

/* 글자크기를 16px 맑은 고딕 굵게하고 width넓이 700, 높이 50만큼 배경색은 #ccc, 글자색은 검정색, 라인높이50px
menu박스 가운데정렬, 글자가운데 정렬 */
#filter {
	font: bold 16px "malgun gothic";
	width: 700px;
	height: 50px;
	background: #ccc;
	color: black;
	line-height: 50px;
	margin: 0 auto;
	text-align: center;
}

/* menu태그 자식의 ul의 자식 li를 왼쪽정렬과 넓이 140설정 */
#filter>ul>li {
	float: left;
	width: 140px;
	position: relative;
}

#filter>ul>li>ul {
	width: 130px;
	display: none;
	position: absolute;
	font-size: 14px;
	background: skyblue;
}

#filter>ul>li:hover>ul {
	display: block;
}

#filter>ul>li>ul>li:hover {
	background: orange;
	transition: ease 1s;
}

/* 점(.)으로 시작하는 아이 : html 파트에서 클래스(명)를 의미. */
.position_res {
	font-size: 25px;
	font-weight: bold;
	margin-left: 300px;
	margin-top: 10px;
}

.title_food {
	font-size: 50px;
	font-weight: bold;
	margin-left: 150px;
	padding: 20px;
}

.grade {
	font-size: 20px;
	margin-top: 0px; /* 바깥쪽여백 */
	margin-left: 180px;
	color: #ed9108;
}

input {
	width: 400px;
	margin-top: 0px;
	padding: 10px;
	box-sizing: border-box;
	border-radius: 10px;
	border: solid 2px #8FBC94;
	/* 외부 테두리 선  =>  border: none => 선 없음. border: solid 1.74px yellow; 등으로 활용*/
}

#btn_menu {
	background-color: #2ecc71;
	width: 250px;
	height: 40px;
	border-radius: 10px;
	border: solid 2px #2ecc71;
	font-size: large;
	color: white;
	padding: 0px;
	margin-top: 50px;
	margin-left: 100px;
}

#btn_review {
	background-color: gray;
	width: 250px;
	height: 40px;
	border-radius: 10px;
	border: solid 0px #gray;
	font-size: large;
	color: white;
	padding: 0px;
	margin-top: 50px;
	margin-left: 100px;
}

.count_menu {
	font-size: 30px;
	color: black;
	padding: 0px;
	margin-top: 50px;
	margin-left: 1500px;
}

#btn_order {
	background-color: #2ecc71;
	width: 190px;
	height: 50px;
	border-radius: 10px;
	font-size: large;
	color: white;
	padding: 0px;
	margin-top: 60px;
	margin-left: 74%;
	margin-bottom: 70px;
}

#btn_img {
	width: 350px;
	height: 210px;
	border-radius: 10px;
	margin-left: 50px;
	margin-top: 60px;
}

.text_img {
	width: 1300px;
	height: 210px;
	margin-left: 500px;
	margin-top: 60px;
	border: 1px solid green;
}
</style>

<body>
	<div id="app" style="width: 100%; padding-top: 120px;" anlign="center">
		<div class="title_food">{{res.resname}}</div>
		<span class="grade" style="margin-left: 180px; ">평점
			:{{res.grade}}</span> 
		<span class="position_res" style="marin-top: -50px;">
			가게위치:{{res.resadd}} <!-- {{list[0].pickuptime}} 집에서 mysqpl로 다시 수정하기.-->
		</span>
		<div class="position_res" style="margin-left: 619px;">운영시간 :
			
		</div>
		<!-- 가계주소들어와야함 1-->
		<div>
			<button id="btn_menu" @click="fnClick1">메뉴</button>
			<button id="btn_review" @click="fnClick">리뷰</button>
		</div>
		<div style="margin-top: 50px;">
			<!-- 값이 없을때를 대비해서 예외처리도 해줘야한다. -->
			<!-- {{list[0].price}} 포문없을때 출력하는 방법-->
			<!-- 지금 예쁘게 나오는 예시 -->
			<div v-if="flg">
				<span class="count_menu">메뉴선택 갯수</span>
				<div v-for="(item, index) in list" style="height: 200px;">
					<div
						style="margin-top: 30px; margin-left: 60px; width: 300px; height: 180px; border-radius: 10px; border: 1px solid red; float: left; margin-right: 60px;">
						<img style="margin-left: 0px" width="100%" height="100%"
							:src="item.picture" />

					</div>
					<div
						style="margin-top: 30px; margin-right: 100px; width: 1000px; height: 180px; border: 1px solid green; float: left;">
						<div style="margin-bottom: 10px;">메뉴명:{{item.menuname}}</div>
						<div style="margin-bottom: 10px;">수량:{{item.supply}}</div>
						<div style="margin-bottom: 10px;">가격:{{item.price}}</div>
						<div style="margin-bottom: 10px;">간단한
							음식설명:{{item.introduce}}</div>
					</div>
					<div style="padding-top: 110px;">
						<button @click="fnMenudegrease(item)">-</button>
						<input style="width: 50px; text-align: center;" type="text"
							name="calcul" :value="item.sum" />
						<!-- resmenu.xml에 ,0 as sum 을 넣음으로써 첫번째 값을 0으로 다 넣은 임의의 컬럼을 만들어줘서 가능함. :표시는 가져올때 씀 -->
						<button @click="fnMenuincrease(item)">+</button>
					</div>
				</div>
				<!-- 여기서 부터 offcanvas 테스트 -->
				<div>
					<button class="btn btn-primary" type="button"
						data-bs-toggle="offcanvas" data-bs-target="#staticBackdrop"
						aria-controls="staticBackdrop" @click ="fncal">결제하기</button>
					<div class="offcanvas offcanvas-start" data-bs-backdrop="static"
						tabindex="-1" id="staticBackdrop"
						aria-labelledby="staticBackdropLabel" style="width: 700px">
						<div class="offcanvas-header">
							<h5 class="offcanvas-title" id="staticBackdropLabel">결제창</h5>
							<button type="button" class="btn-close"
								data-bs-dismiss="offcanvas" aria-label="Close"></button>
						</div>
						<div class="offcanvas-body">



							<div class="div2">
								<div
									style="font-size: xx-large; font-weight: bolder; margin-bottom: 10px; margin-left: 30px; margin-top: 10px;">
									선택하신 메뉴</div>
								<table class="board_list">
									<colgroup>
										<col width="10%" />
										<col width="15%" />
										<col width="20%" />
									</colgroup>
									<thead>
										<tr>
											<th scope="col">이름</th>
											<th scope="col">가격</th>
											<th scope="col">개수</th>
										</tr>
									</thead>
									<tbody>

										<tr v-for="(item, index) in list"
											style="margin-bottom: 5px; font-size: large; font-weight: bold; margin-left: 20px;">

											<td v-if="item.sum !=0">{{item.menuname}}</td>
											<td v-if="item.sum !=0">{{item.price}}</td>
											<td v-if="item.sum !=0">{{item.sum}}</td>

										</tr>
									</tbody>
								</table>

								<table
									style="float: left; border: 1px solid black; border-collapse: collapse; margin-top: 100px; border-radius: 5px; text-align: center;">
									<td
										style="border: 1px solid #444444; font-size: x-large; font-weight: bolder; margin-top: 5px;">
										<div style="margin-top: 5px;">
											<label style="display: inline-flex;"><pre>아  이  디 </pre></label>
											<input type="text" :placeholder='userId' readonly></input>
										</div>
										<div style="margin-top: 20px;">
											<label style="display: inline-flex;"><pre>이      름 </pre></label>
											<input type="text" :placeholder='name' readonly></input>
										</div>
										<div style="margin-top: 20px;">
											<label style="display: inline-flex;"><pre>전화번호 </pre></label>
											<input type="text" :placeholder='phoneNum' readonly></input>
										</div>
										<div style="margin-top: 20px;">
											<label style="display: inline-flex;"><pre>계좌번호 </pre></label>
											<input type="text" :placeholder='acc' readonly></input>
										</div>
										<div style="margin-top: 20px; margin-bottom: 5px">
											<label style="display: inline-flex;"><pre>결제방법 </pre></label>
											<form action="#" style="display: inline;">
												<!-- 나란히 만들기 위해서 display: inline -->
												<select
													style="width: 400px; height: 40px; font-size: large; font-weight: bold;"
													v-model="payment">
													<option value="CASH">만나서 현금 결제</option>
													<option value="account">계좌 이체</option>
													<option value="card">만나서 카드 결제</option>
												</select>
											</form>
										</div>
									</td>
								</table>

								<div
									style="margin-top: 5px; font-size: large; font-weight: bold; margin-left: 100px;">
									결제 금액 : {{num}} 원</div>
								<div>

									<button @click="fnReserve"
										style="color: white; background-color: #8FBC94; margin-top: 10px; font-weight: bold; font-size: large; margin-bottom: 0px; width: 100%; border-radius: 10px; border: solid 2px #8FBC94;">
										예약 완료</button>

								</div>

							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- 여기까지 테스트 -->
			<div v-else>
				<h2 style="margin-left: 50px;">게시글 목록</h2>
				<table class="board_list">
					<colgroup>
					    <col width="5%" />
						<col width="5%" />
						<col width="5%" />
						<col width="*" />
						<col width="25%" />
						<col width="5%" />
						<col width="10%" />
						<col width="10%" />
					</colgroup>
					<thead>
						<tr>
						    <th scope="col"></th>
							<th scope="col">No.</th>
							<th scope="col">분류</th>
							<th scope="col">작성자닉네임</th>
							<th scope="col">내용</th>
							<th scope="col">제목</th>
							<th scope="col">날짜</th>
							<th scope="col">별점</th>
						</tr>
					</thead>
					
					<tr v-for="(item, index) in list1" >                            
	                   <td><input type="checkbox" name="selectBoard" v-bind:id="'idx_' + index" v-bind:value="item" v-model="selectedItemList1"></td>                       
	                   <td >{{item.reviewnum}}</td> 
	                   <td >{{item.categori}}</td> 
	                   <td >{{item.nickname}}</td>
	                   <td >{{item.content}}</td> 
	                   <td >{{item.title}}</td>
	                   <td >{{item.writedate}}</td>
	                   <td >{{item.grade}}</td>
	               	
	               </tr>

				</table>
				<%-- <template>
					<paginate :page-count="pageCount" :page-range="3" :margin-pages="2"
						:click-handler="changePage" :prev-text="'<'" :next-text="'>'"
						:container-class="'pagination'" :page-class="'page-item'">
					</paginate>
				</template> --%>
							<Button v-if="'${kind}' == 'A'" @click="fnReviewwrite" id="btn_menu" style="margin-left: 80%;" >리뷰 작성하기</Button>
			</div>
		</div>
	</div>

	</div>



	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous">
</script>
	<script src="https://kit.fontawesome.com/e2c13a792d.js"
		crossorigin="anonymous"></script>

</body>
<jsp:include page="/layout/footer.jsp"></jsp:include>
</html>

<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			list :[]/* 게시판에 올려지는 글들은 다른 리스트 새로만들기  */
	        ,list1:[]//리뷰리스트
	        ,selectedItemList1:[]
			,info : {}
			,flg : true
			,res : ${res} // Main type의 객체이름 res로(where=resnum 들고오는 과정) 당겨쓰는 과정 in ResmenuController
			,user : ${userVO}// user전체가 getter/setter되서 가져고 오는 형식. {{user.id}},{{user.name}} 쓸때 이렇게 쓸수있음. 여기한번 지정하고 다른데서 계속 쓸 수 있음.
							// 기존 방법과 차이 userId: "${userId}" 이렇게 적어 줬었음.
			,sum : 0
		    /* ,time : ${time} */
			,userId : "${userId}"
		    ,name : "${userName}"
		    ,kind : "${kind}"
		    ,phoneNum : "${userPhonenum}"
		    ,acc : "${userAcc}"	
		    ,num : 0
		    ,payment : ""
		    ,resname : ""
		    
		},
		methods : {
			fnGetImg : function() {
				var self = this;
				var nparmap = {resnum: self.res.resnum, idx: self.idx};
				$.ajax({
					url : "/Res.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.list = data.list;
						self.info = data.resimg;
						console.log(self.idx);
						console.log(self.list);
						
					}
				});
			}
		
		,fnGetReview : function() {
			var self = this;
			var nparmap = {resnum: self.res.resnum };
			$.ajax({
				url : "/searchReview.dox",
				dataType : "json",
				type : "POST",
				data : nparmap,
				success : function(data) {
					self.list1 = data.list1;
					/* self.info = data.resimg; */
					
					console.log(self.list1);
					
				}
			});
		}
		,fnClick : function() {
			var self = this;
			self.flg = false;
		}
		,fnClick1 : function() {
			var self = this;
			self.flg = true;
		}
		, fnMenuincrease : function(item){
			var self = this;
			if(item.supply > item.sum){
				item.sum += 1;	
			}else{
				alert("주문수량을 초과하였습니다.");
				return item.sum;
			}
		}
		, fnMenudegrease : function(item){
			var self = this;
			if(item.sum < 1){
				alert("주문수량을 체크해 주세요.");
				return item.sum=0;	
			}else{
				item.sum -= 1;	
			}
			
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
		, fncal : function(){
			var self = this;
			self.num = 0;
				for(var i =0; i<self.list.length; i++){
					
					console.log(self.list[i]);
		    		self.num += ((self.list[i].price)*(self.list[i].sum));
		    		
				}
				
		}
		, fnView : function(){
			var self = this;
			self.pageChange("/main.payment.do", {list : self.list,resname:self.res.resname}); /// 주문갯수를 포함하는 리스트를 넘김
		}
		, fnReviewwrite : function(){
			var self = this;
			self.pageChange("/reviewwrite.do", {list : self.list, resname:self.res.resname}); //리뷰작성페이지 이동
		}
		,fnReserve : function() {
			var self = this;
			console.log(self.list);
			if(self.payment ==""){
				alert("결제 방식을 입력해주세요");
			}
			else{
				if(confirm("정말로 결제하시겠습니까?")){
					for(var i = 0; i<self.list.length; i++){
						if(self.list[i].sum !=0){
							var nparmap = {
									resnum: self.list[i].resnum
				                    ,menuname:self.list[i].menuname
				                    ,ordernum:0
				                    ,orderer:self.userId
				                    ,pickuptime:self.list[i].pickuptime
				                    ,payment:self.payment
				                    ,price : self.list[i].price
				                    ,review:"N"
				                    ,salecomple: "N"
				                    ,menunum: self.list[i].sum
				                    ,sum : self.list[i].sum
				                    ,resname : self.resname
				                    };
							$.ajax({
								url : "/Res/get.dox",
					            dataType : "json",
					            type : "POST",
					            data : nparmap,
					            success : function(data) 
					            {
					            	if (data.result == "success") {
					            		alert("예약성공");
					            		self.flg = true;
					            		self.pageChange("/reservemy.do", {});
					            		}
					            	else {
							            alert("예약 실패!");
							            }
					            	}
							})
							}	
						}
					}
				}
			}
		
		},
		created : function() {
			var self = this;
			this.fnGetImg();
			self.fnGetReview();
			self.resname = self.res.resname;
			console.log(self.resname);
			
			
		}
	});
</script>