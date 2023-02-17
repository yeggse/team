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
	margin-top: 200px;
	margin-bottom: 200px;
	width: 400px;
	height: 1200px;
	background-color: #EEEFF1;
	border-radius: 5px;
	text-align: center;
	padding: 20px;
}

.div2 {
	margin-left: 50px;
	margin-bottom: 10px;
	width: 350px;
	height: 50px;
	background-color: #EEEFF1;
	border-radius: 5px;
	text-align: initial;
}

#text1 {
	width: 150px;
	height: 30px;
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

	<div id="app" class="div3" style="border: solid black;">
		<div id="app" class="div2"
			style="background-color: white; height: 50px; font-size: 25px;">
			사업자 회원가입</div>
		<div class="div2">
			아이디 <input type="text" id="text1" v-model="id"
				style="margin-left: 60px"></input>
			<button @click="fnCheck">중복확인</button>
		</div>
		<div class="div2">
			패스워드 <input type="password" id="text1" v-model="pwd"
				style="margin-left: 45px" @change="fnPwcheck"></input>
		</div>
		<div v-if = "pwdtextCheck" style ="color : blue">{{pwdtext}}</div>
		<div v-else style ="color : red">{{pwdtext}}</div>
		<div class="div2">
			패스워드 확인 <input type="password" id="text1" v-model="pwd2"
				style="margin-left: 12px"></input>
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
		<div class="div2">
			사업자명 <input type="text" id="text1" v-model="restaurant"
				style="margin-left: 45px"></input>
		</div>
		<div class="div2">
			사업자번호 <input type="text" id="text1" v-model="resnum"
				style="margin-left: 30px"></input>
			<button @click="fnresnumCheck">중복확인</button>
		</div>
		<div class="div2">
		업종
			<select style="width: 150px; height: 30px; margin-left: 75px; font-size: large; font-weight: bold;" v-model ="kind">
							<option value="한식">한식</option>
							<option value="중식">중식</option>
							<option value="양식">양식</option>
							<option value="일식">일식</option>
							<option value="아시아">아시아</option>
							
							
			</select>
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
		<button @click="fnjoin" style="width: 200px; height: 35px;">회원가입</button>
		<div class="div2">
			<a href="join.do">일반 회원가입하기</a>

		</div>
		<div class="div2">

			<a href="login.do">로그인 페이지로 이동</a>
		</div>

	</div>
</body>
<jsp:include page="/layout/footer.jsp"></jsp:include>
</html>
<script type="text/javascript">
	var app = new Vue({
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
			restaurant : "",
			resnum : "",
			kind : "",
			region : "",
			resad : "",
			resphonenum : "",
			idcheck : false,
			agecheck : false,
			nickcheck : false,
			resnumcheck : false,
			flg : false,
			pwdtext:"",
			pwdtextCheck:false

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
			
			
			fnresnumCheck : function() {
				var self = this;
				var nparmap = {
					resnum : self.resnum
				};
				console.log(nparmap);
				$.ajax({
					url : "/join/resnumcheck.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						//self.list = data.list;
						if (data.num > 0) {
							alert("이미 등록된 사업자번호입니다.");
						} else {
							alert("사용하실수 있는 사업자번호 입니다.");
							self.resnumcheck = true;
						}
					}
				})

			},//사업자번호 중복확인

			fnPwcheck : function() {
				var self = this;
				var nparmap = {
					pwd : self.pwd,
					pwd2 : self.pwd2
				};
				var pattern1 = /[0-9]/;
				var pattern2 = /[a-zA-Z]/;
				var pattern3 = /[~!@\#$%<>^&*]/; // 원하는 특수문자 추가&제거 가능
				 
				if (!pattern1.test(self.pwd)
						|| !pattern2.test(self.pwd)
						|| !pattern3.test(self.pwd)
						|| self.pwd.length<8||self.pwd.length>16) {
					self.pwdtext = "❗ 영문, 숫자, 특수기호를 모두 사용하여, 8자리 이상 16자리이하로 구성하세요. \n❗❗ 사용가능한 특수 문자 : ~!@\#$%<>^&* ";
					
					self.pwdtextCheck = false;
				} else {
					self.pwdtext = "올바른 비밀번호 형태입니다.";
					
					self.pwdtextCheck = true;
				}
			
				

			}
			,// 패스워드 형식 체크

			fnjoin : function() {
				var self = this;
				var nparmap = {
					id : self.id,
					pwd : self.pwd,
					kind : "B",
					phonenum : self.num,
					acc : self.account,
					name : self.name,
					address : self.address,
					frontregisnum : self.age,
					afterregisnum : self.age1,
					nickname : self.nickname,
					resname : self.restaurant,
					resnum : self.resnum,
					reskind : self.kind,
					region : self.region,
					resad : self.resad,
					resphone : self.resphonenum
				};
				console.log(nparmap);
				if (self.pwd != self.pwd2) {
					alert("비밀번호가 일치하지 않습니다.");
				} else if (self.id == "" || self.pwd == "" || self.pwd2 == ""
						|| self.name == "" || self.age == "" || self.age1 == ""
						|| self.address == "" || self.account == ""
						|| self.nickname == "" || self.num == ""
						|| self.resname == "" || self.resnum == ""
						|| self.kind == "" || self.region == ""
						|| self.resad == "" || self.resphonenum == "") {
					console.log(self.kind);
					console.log(self.id);
					console.log(self.resphonenum)
					alert("빈칸을 확인해주세요");
					
				} else if (!self.idcheck) {
					alert("아이디 중복확인을 해주세요");
				} else if (!self.nickcheck) {
					alert("닉네임 중복확인을 해주세요");
				} else if (!self.resnumcheck) {
					alert("사업자번호 중복확인을 해주세요");
				} else {
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