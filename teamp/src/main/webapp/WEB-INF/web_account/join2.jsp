<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery.js"></script>
<script src="js/vue.js"></script>
<jsp:include page="/layout/header.jsp"></jsp:include>
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
		<div id="app" class="div2" style="background-color: white; height: 50px; font-size: 25px;">	사업자 회원가입</div>
		<div class="div2">
			아이디 <input type="text" id="text1" v-model="id"	maxlength='13'	style="margin-left: 60px"></input>
			<button @click="fnCheck">중복확인</button>
		</div>
		<div class="div2">	비밀번호 <input type="password" id="text1" v-model="pwd" maxlength='16' @change="fnPwcheck" style="margin-left: 45px"></input>
		</div>
		<div v-if = "pwdtextCheck" style ="color : blue">{{pwdtext}}</div>
		<div v-else style ="color : red">{{pwdtext}} <br> {{pwdtext2}}</div>
		<div class="div2">	비밀번호 재확인 <input type="password" id="text1" v-model="pwd2" maxlength='16' tyle="margin-left: 12px"></input>
			<button @click="fnPwSame">비밀번호 확인</button>
		</div>
		<div class="div2">
			이름 <input type="text" id="text1" v-model="name" maxlength='7' style="margin-left: 75px"></input>
		</div>
		<div class="div2">
			주민번호 <input type="text" v-model="age" maxlength='6' style="margin-left: 45px"></input>
			- <input type="password" v-model="age1"maxlength='7' ></input>
			<button @click="fnPeople">실명인증</button>
		</div>
		<div class="div2">주소
			<select id="si" name="si" v-model="address" class="form-control">
				<option v-for="item in siList" v-bind:value="item.si">{{item.si}}</option>
			</select>
		</div>
		<div class="div2">
			닉네임 <input type="text" id="text1" v-model="nickname" maxlength='10' style="margin-left: 60px"></input>
			<button @click="fnnickCheck">중복확인</button>
		</div>
		<div class="div2">
			연락처 <input type="text" id="text1" v-model="num" maxlength='16' style="margin-left: 60px"></input>
		</div>
		<div class="div2">
			계좌번호 <input type="text" id="text1" v-model="account" maxlength='26' style="margin-left: 45px"></input>
		</div>
		<div class="div2">
			사업자명 <input type="text" id="text1" v-model="restaurant" maxlength='16' style="margin-left: 45px"></input>
		</div>
		<div class="div2">
			사업자번호 <input type="text" id="text1" v-model="resnum"	maxlength='35' style="margin-left: 30px"></input>
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
	    <div class="div2">지역
			        <select id="si" name="si" v-model="region" class="form-control" @change="fnGuList">
						<option v-for="item in siList" v-bind:value="item.si">{{item.si}}</option>
					</select>
					<select id="gu" name="gu" v-model="region1" class="form-control">
						<option v-for="item in guList" v-bind:value="item.gu">{{item.gu}}</option>
					</select>
		</div>
		<div class="div2">
			상세주소 <input type="text" id="text1" v-model="resad" style="margin-left: 45px"></input>
		</div>
		<div class="div2">
			점포번호 <input type="text" id="text1" v-model="resphonenum" maxlength='16' style="margin-left: 45px"></input>
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
			region1 : "",
			resad : "",
			resphonenum : "",
			idcheck : false,
			agecheck : false,
			nickcheck : false,
			resnumcheck : false,
			flg : false,
			pwSame : false,
			pwdtext: "",
			pwdtext2: "",
			pwdtextCheck:false
			, people : false
			, siList : ${siList}
			,guList : ${guList}
		},
		methods : {
			//아이디 중복확인
			fnCheck : function() {
				var self = this;
				var pattern1 = /[0-9]/;
				var pattern2 = /[a-zA-Z]/;
				var nparmap = {id : self.id};
				console.log(nparmap);
				$.ajax({
					url : "/join/check.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						//self.list = data.list;
						if(!pattern1.test(self.id)||!pattern2.test(self.id)||self.id.length<3||self.id.length>13){
							alert("영문, 숫자만을 활용한 3~13자리 ID를 입력해 주세요");
							self.id = ""
						} else{
							if (data.num > 0) {
								alert("중복된 ID가 있습니다");
							} else {
								alert("사용하실수 있는 아이디입니다.");
								self.idcheck = true;
							}
						}
					}
				});

			},
			//닉네임 중복확인
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

			}
			,fnGuList : function(){
	    		var self = this;
	            var nparmap = {si : self.region};
	            $.ajax({
	                url:"/gu/list.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) {                                       
		                self.guList = data.guList;
		                console.log(data.guList);
		                self.gu = "";
	                }
	            }); 
	        }
			//사업자번호 중복확인
			,fnresnumCheck : function() {
				var self = this;
				var pattern1 = /[0-9]/;
				var nparmap = {resnum : self.resnum};
				console.log(nparmap);
				$.ajax({
					url : "/join/resnumcheck.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						//self.list = data.list;
						if (!pattern1.test(self.resnum)) {
							alert("숫자만 입력하세요.");
							self.resnum = "";
						} else {
								if (data.num > 0) {
									alert("이미 등록된 사업자번호입니다.");
								} else {
									alert("사용하실수 있는 사업자번호 입니다.");
									self.resnumcheck = true;
								}
						}
				}
				})

			}
			//비밀번호 양식 확인
			,fnPwcheck : function() {
				var self = this;
				var nparmap = {pwd : self.pwd, pwd2 : self.pwd2};
				var pattern1 = /[0-9]/;
				var pattern2 = /[a-zA-Z]/;
				var pattern3 = /[~!@\#$%<>^&*]/; // 원하는 특수문자 추가&제거 가능
				if (!pattern1.test(self.pwd)
					|| !pattern2.test(self.pwd)
					|| !pattern3.test(self.pwd)
					|| self.pwd.length<8||self.pwd.length>16) {
					self.pwdtext = "❗ 영문, 숫자, 특수기호를 모두 사용하여, 8자리 이상 16자리 이하로 구성하세요.";
					self.pwdtext2 =	"❗❗ 사용가능한 특수 문자 : ~!@\#$%<>^&* ";
					self.pwd = "";
					self.pwdtextCheck = false;
				} else {
					self.pwdtext = "올바른 비밀번호 형태입니다.";	
					self.pwdtextCheck = true;
				}
			}
			// 비밀번호 일치 확인
			, fnPwSame : function(){
				var self = this;
				var nparmap = {pwd : self.pwd, pwd2 : self.pwd2};
				if (self.pwd != self.pwd2) {
					alert("비밀번호가 일치하지 않습니다.");
					self.pwSame = false;
				} else{
					alert("비밀번호가 일치합니다.");
					self.pwSame = true;
				}
			}
			// 실명인증
			, fnPeople : function(){
				var self = this;
				var nparmap = {age : self.age, age1 : self.age1};
				var pattern1 = /[0-9]/;
				if(self.age == "" || self.age1 == ""){
					alert("내용을 입력하세요");
				} else if(!pattern1.test(self.age) || !pattern1.test(self.age1)){
					alert("숫자만 입력하세요");
					self.age ="";
					self.age1 = "";
				} else{
					alert("실명인증이 확인되었습니다. 다만, 주민 뒷번호 체크필요~~~~~~");
					self.people = true;
				}
				
			}
			// 회원가입
			,fnjoin : function() {
				var self = this;
				var pattern1 = /[0-9]/;
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
					region1 : self.region1,
					resad : self.resad,
					resphone : self.resphonenum
				};
				console.log(nparmap);
				if (self.id == "" || self.pwd == "" || self.pwd2 == ""
						|| self.name == "" || self.age == "" || self.age1 == ""
						|| self.address == "" || self.account == ""
						|| self.nickname == "" || self.num == ""
						|| self.resname == "" || self.resnum == ""
						|| self.kind == "" || self.region == ""
							|| self.region1 == ""
						|| self.resad == "" || self.resphonenum == "") {
					console.log(self.kind);
					console.log(self.id);
					console.log(self.resphonenum)
					alert("빈칸을 확인해주세요");
				} else if(!pattern1.test(self.resphonenum) ||!pattern1.test(self.num) ){
					alert("연락처와 점포번호는 숫자만 입력해 주세요");
				} else if(!pattern1.test(self.account)){
					alert("계좌번호는 숫자만 입력해 주세요");
					self.account ="";
				} else if(!self.people){
					alert("실명인증을 해 주세요");
				} else if (!self.pwSame) {
					alert("비밀번호 일치여부를 확인해 주세요.");
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
					});
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