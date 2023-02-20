<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title>JS Bin</title>
<jsp:include page="/layout/header.jsp"></jsp:include>
</head>
<style>
body {
	line-height: 2em;
	font-family: "맑은 고딕";
}

.div3 {
	margin: auto;
	width: 800px;
	height: 800px;
	background-color: white;
	border-radius: 5px;
	text-align: center;
	padding: 20px;
}

.div2 {
	margin-left: 50px;
	margin-bottom: 10px;
	width: 800px;
	height: 50px;
	background-color: white;
	border-radius: 5px;
	text-align: initial;
}
</style>

<body>
	<jsp:include page="/layout/businesspagebody.jsp"></jsp:include>
	<div id="app" class="div3" style="margin-top: 100px">
		<div id="app" class="div2"
			style="background-color: white; height: 50px; font-size: 25px;">
			회원정보 수정</div>

		<div class="div2">아이디 : {{id}}</div>

		<div class="div2">
			패스워드 <input type="password" id="text1" v-model="pwd"
				style="margin-left: 45px"></input>
		</div>

		<div class="div2">
			패스워드 확인 <input type="password" id="text1" v-model="pwd2"
				style="margin-left: 12px"></input>
		</div>
		<div class="div2">이름 : {{name}}</div>
		<div class="div2">주민번호 : {{age}}-{{age1}}</div>
		<div class="div2">
			주소 <input type="text" id="text1" v-model="address"
				style="margin-left: 75px"></input>
		</div>
		<div class="div2">
			닉네임 <input type="text" id="text1" v-model="nickname"
				style="margin-left: 60px"></input>
			<button @click="fnnickCheck">중복확인</button>
		</div>
		<div class="div2">
			연락처 <input type="text" id="text1" v-model="phonenum"
				style="margin-left: 60px"></input>
		</div>
		<div class="div2">
			계좌번호 <input type="text" id="text1" v-model="account"
				style="margin-left: 45px"></input>
		</div>
		<div class="div2">
			사업자명 <input type="text" id="text1" v-model="restaurant"
				style="margin-left: 45px"></input>
		</div>
		<div class="div2">
			사업자번호 <input type="text" id="text1" v-model="resnum"
				style="margin-left: 30px"></input>
		</div>
		<div class="div2">
			업종 <input type="password" id="text1" v-model="kind"
				style="margin-left: 75px"></input>
		</div>
		<div class="div2">
			지역 <input type="text" id="text1" v-model="region"
				style="margin-left: 75px"></input>
		</div>
		<div class="div2">
			점포주소 <input type="text" id="text1" v-model="resad"
				style="margin-left: 45px"></input>
		</div>
		<div class="div2">
			점포번호 <input type="text" id="text1" v-model="resphonenum"
				style="margin-left: 45px"></input>
		</div>

		<button @click="fnfix"
			style="width: 200px; height: 35px; margin-top: 50px">수정하기</button>

	</div>
</body>
<jsp:include page="/layout/footer.jsp"></jsp:include>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			id : "${userId}",
			pwd2 : "",
			pwd : "",
			name : "${userName}",
			age : "${userFrontregisnum}",
			age1 : "${userafterregisnum}",
			address : "",
			nickname : "",
			phonenum : "",
			account : "",
			restaurant : "",
			resnum : "",
			kind : "",
			region : "",
			resad : "",
			resphonenum : ""

		},
		methods : {
			fnnickCheck : function() {
				var self = this;
				var nparmap = {
					nickname : self.nickname
				};
				console.log(nparmap);
				$.ajax({
					url : "/join/nickcheck.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						//self.list = data.list;
						if (data.num > 0) {
							alert("중복되었습니다");
						} else {
							alert("사용하실수 있는 닉네임입니다.");
							self.nickcheck = true;
						}
					}
				})
			},
			fnfix : function() {

				var self = this;
				var nparmap = {

					id : self.id,
					pwd : self.pwd,
					pwd2 : self.pwd2,
					address : self.address,
					nickname : self.nickname,
					phonenum : self.phonenum,
					account : self.account,
					restaurant : self.restaurant,
					resnum : self.resnum,
					kind : self.kind,
					region : self.region,
					resad : self.resad,
					resphonenum : self.resphonenum

				};

				if (self.pwd != self.pwd2) {
					alert("비밀번호가 일치하지 않습니다.");
				} else if (self.pwd == "" || self.pwd2 == ""
						|| self.address == "" || self.account == ""
						|| self.nickname == "" || self.phonenum == ""
						|| self.restaurant == "" || self.resnum == ""
						|| self.kind == "" || self.region == ""
						|| self.resad == "" || self.resphonenum == "") {
					alert("빈칸을 확인해주세요");
				} else if (!self.nickcheck) {
					alert("닉네임 중복확인을 해주세요");
				} else {
					console.log(nparmap);
					$.ajax({
						url : "/datachange.dox",
						dataType : "json",
						type : "POST",
						data : nparmap,
						success : function(data) {

							alert("정보 수정 성공! 다시 로그인해주세요");
							self.pageChange("/login.do", {});

						}
					})
				}
			},
			pageChange : function(url, param) {
				var target = "_self";
				if (param == undefined) {
					//   this.linkCall(url);
					return;
				}
				var form = document.createElement("form");
				form.name = "dataform";
				form.action = url;
				form.method = "post";
				form.target = target;
				for ( var name in param) {
					var item = name;
					var val = "";
					if (param[name] instanceof Object) {
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

		}
	});
</script>