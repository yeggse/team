<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery.js"></script>
<script src="js/vue.js"></script>
<jsp:include page="/layout/header.jsp"></jsp:include>
<title>테스트</title>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap')
	;

* {
	font-family: 'Noto Sans KR', sans-serif;
}

body {
	background-color: #1BBC9B;
}

.div3 {
	margin: auto;
	margin-top: 5px;
	margin-bottom: 200px;
	width: 600px;
	height: 800px;
	background-color: #EEEFF1;
	border-radius: 5px;
	text-align: center;
	padding: 20px;
}

.div2 {
	margin-left: 50px;
	margin-top: 20px;
	width: 550px;
	height: 50px;
	background-color: #EEEFF1;
	border-radius: 5px;
	text-align: initial;
	font-size: 25px;
	display: inline-box;
}

#text1 {
	width: 150px;
	height: 30px;
	text-align: left;
}

input {
	width: 100px;
	height: 10px;
	padding: 10px;
	box-sizing: border-box;
	border: solid black;
}

.in {
	margin-bottom: 10px;
}

#btn1 {
	background-color: #1BBC9B;
	color: white;
	border-radius: 10px;
	border: solid black;
}

a {
	text-decoration: none;
	color: #9B9B9B;
	font-size: 12px;
}
</style>
</head>
<body>
	<div
		style="margin-top: 190px; background-color: white; height: 50px; font-weight: bolder; font-size: 45px; text-align: center;">
		<img style="vertical-align: middle; margin-right: 20px"
			src="img/main/newlogo.png" width="100px" height="80px"> 일반 회원가입
	</div>
	<div
		style="margin-top: 15px; background-color: white; height: 30px; text-align: center; margin-left: 500px;">
		<a href="join2.do" style="font-size: 15px; font-weight: normal;">사업자
			회원가입</a>
	</div>
	<div id="app" class="div3" style="border: solid black;">
		<div class="div2">
			아이디 <input type="text" id="text1" v-model="id"
				style="margin-left: 60px"></input>
			<button @click="fnCheck">중복확인</button>
		</div>
		<div class="div2">
			비밀번호 <input type="password" id="text1" v-model="pwd"
				style="margin-left: 45px"></input>
		</div>
		<div class="div2">
			비밀번호 확인 <input type="password" id="text1" v-model="pwd2"
				style="margin-left: 12px"></input>
			<button @click="fnPwcheck">비밀번호 유효성 확인</button>
		</div>
		<div class="div2">
			이름 <input type="text" id="text1" v-model="name"
				style="margin-left: 75px"></input>
		</div>
		<div class="div2">
			주민번호 <input type="text" v-model="age" style="margin-left: 45px"></input>
			- <input type="password" v-model="age1"></input>
			<button @click="">실명인증</button>
		</div>
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
			연락처 <input type="text" id="text1" v-model="num"
				style="margin-left: 60px"></input>
		</div>
		<div class="div2">
			계좌번호 <input type="text" id="text1" v-model="account"
				style="margin-left: 45px"></input>
		</div>
		<button @click="fnjoin" style="width: 200px; height: 35px;">회원가입</button>


		<div class="div2">

			<a href="login.do">로그인 페이지로 이동</a>
		</div>
	</div>
</body>
<jsp:include page="/layout/footer.jsp"></jsp:include>
</html>
<script type="text/javascript">
	var app = new Vue(
			{
				el : '#app',
				data : {
					id : "",
					pwd : "",
					pwd2 : "",
					name : "",
					age : "",
					age1 : "",
					address : "",
					account : "",
					nickname : "",
					num : "",
					idcheck : false,
					agecheck : false,
					nickcheck : false,
					flg : false

				},
				methods : {
					fnCheck : function() {
						var self = this;
						var nparmap = {
							id : self.id
						};
						console.log(nparmap);
						$.ajax({
							url : "/join/check.dox",
							dataType : "json",
							type : "POST",
							data : nparmap,
							success : function(data) {
								//self.list = data.list;
								if (data.num > 0) {
									alert("중복되었습니다");
								} else {
									alert("사용하실수 있는 아이디입니다.");
									self.idcheck = true;
								}
							}
						})

					},//아이디 중복확인
					
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

					},//닉네임 중복확인
					fnjoin : function() {
						var self = this;
						var nparmap = {
							id : self.id,
							pwd : self.pwd,
							kind : "일반",
							phonenum : self.num,
							acc : self.account,
							name : self.name,
							add : self.address,
							frontregisnum : self.age,
							afterregisnum : self.age1,
							nickname : self.nickname,
							resname : "",
							resnum : 0,
							reskind : "",
							region : "",
							resad : "",
							resphone : 0
						};
						console.log(nparmap);
						if (self.pwd != self.pwd2) {
							alert("비밀번호가 일치하지 않습니다.");
						} else if (self.id == "" || self.pwd == ""
								|| self.pwd2 == "" || self.name == ""
								|| self.age == "" || self.age1 == ""
								|| self.address == "" || self.account == ""
								|| self.nickname == "" || self.num == "") {
							alert("빈칸을 확인해주세요");
						} else if(!self.idcheck){
							alert("아이디 중복확인을 해주세요");
						}
						else if(!self.nickcheck){
							alert("닉네임 중복확인을 해주세요");
						}
						
						else {
							$.ajax({
								url : "/join/get.dox",
								dataType : "json",
								type : "POST",
								data : nparmap,
								success : function(data) {
									self.list = data.list;
									if (data.result == "success") {
										alert("회원가입 성공!");
										self.flg = true;
										self.pageChange("/login.do", {});
									} else {
										alert("회원가입 실패!");
									}

								}
							})
						}

					},//회원가입
					fnPwcheck : function() {
						var self = this;
						var nparmap = {
							pwd : self.pwd,
							pwd2 : self.pwd2
						};
						var pattern1 = /[0-9]/;
						var pattern2 = /[a-zA-Z]/;
						var pattern3 = /[~!@\#$%<>^&*]/; // 원하는 특수문자 추가&제거 가능
						if (self.pwd == "") {
							alert("❗ 비밀번호를 입력하세요.");
						} else {
							if (!pattern1.test(self.pwd)
									|| !pattern2.test(self.pwd)
									|| !pattern3.test(self.pwd)
									|| self.pwd.length<8||self.pwd.length>50) {
								alert("❗ 영문, 숫자, 특수기호를 모두 사용하여, 8자리 이상으로 구성하세요. \n❗❗ 사용가능한 특수 문자 : ~!@\#$%<>^&* ");
							} else {
								alert("오케!");
							}
						}

					}
					, pageChange : function(url, param) {
				        var target = "_self";
				        if(param == undefined){
				        //   this.linkCall(url);
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

				}
			});
</script>