<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery.js"></script>
<script src="js/vue.js"></script>
<title>login</title>
</head>

<style>
* {
	box-sizing: border-box;
}

.div0 {
	width: 30%;
	border: 10px solid #99dd81;
	margin-top: 50px;
	margin-right: 500px;
	border-radius: 15px;
	padding: 50px;
}

<!--
임시-->.tempbtn {
	width: 500px;
	height: 500px;
	border: 10px solid green;
}

.label1 {
	width: 180px;
	height: 100px;
	font-size: 3em;
	text-align: center;
	padding: 10px;
	margin-right: 400px;
	margin-top: 50px;
	font-weight: bold;
	margin-bottom: -50px;
}

.div2 {
	width: 500px;
	height: 280px;
	padding: 40px;
	margin-top: 0px;
	font-family: Fantasy;
	border: 2px solid gray;
}

.span {
	margin: 0px 5px 0px 5px;
}

.loginfooter {
	width: 500px;
	font-size: 10px;
	text-align: center;
	margin-top: 10px;
	padding: 5px;
	margin-right: 500px;
}

.btn1 {
	margin: 5px 10px 10px 10px;
	width: 100px;
	text-align: center;
}

.btn2 {
	margin: 20px 0px 5px 0px;
	font-size: 18px;
	font-weight: bold;
	width: 300px;
	height: 35px;
	text-align: center;
	background-color: #99dd81;
	color: white;
	border: none;
	border-radius: 10px;
	letter-spacing: 4px;
}

.btn_icon {
	/* background: url(/images/pc/ico_comm.png) */
	background-size: 300px auto;
}

.afind {
	text-decoration: none;
	font-size: 12px;
	margin-right: 20px;
}

.asign {
	text-decoration: none;
	margin-right: 70px;
	margin-left: 35px;
	font-size: 12px;
}

input {
	width: 200px;
	height: 50px;
	margin: 3px;
	border: solid #ccc;
	border-width: 0 0 2px;
	padding-right: 90px;
}

#image {
	margin-top: 20px;
}
</style>

<body>
	<jsp:include page="/layout/header.jsp"></jsp:include>
	<!-- 타이틀 -->
	<div id="app" style="width: 2483.02px; padding-top: 120px;"
		align="center">
		<div>
			<button onClick="location.href='http://127.0.0.1:8080/paymentmy.do'">결제내역</button>
			<button onClick="location.href='http://127.0.0.1:8080/reservemy.do'">예약내역</button>
			<button onClick="location.href='http://127.0.0.1:8080/reviewwrite.do'">리뷰쓰기</button>
			<button onClick="location.href='http://127.0.0.1:8080/searchid.do'">아이디찾기</button>
			<button onClick="location.href='http://127.0.0.1:8080/searchpw.do'">비밀번호찾기</button>
			<button onClick="location.href='http://127.0.0.1:8080/menumanagementbusiness.do'">메뉴관리</button>
		</div>
		<div class="div0">
			<label class="label1"> 로그인 </label>
			<!-- 전체 div -->
			<div class="div2">
				<div style="display: inline-block;">
					<label for="id"
						style="font-weight: bolder; font-size: x-large; margin-right: 50px;">
						ID </label> <input id="id" type="text" name="loginKey" placeholder="아이디"
						v-model="id">
				</div>
				<div>
					<label for="pw"
						style="font-weight: bolder; font-size: x-large; margin-right: 40px; letter-spacing: -1px;">
						PW </label> <input id="pw" type="password" name="password"
						placeholder="비밀번호" v-model="pwd">
				</div>
				<div>
					<input id="logining" type="checkbox"
						style="width: 20px; height: 10px; border: 1px; font-size: 12px;"
						name="" value="" /> <label for="logining">로그인 상태 유지</label>
				</div>
				<div>
					<button class="login > btn2" @click="fnLogin">로그인</button>
				</div>
				<!-- 아랫 div -->
				<div>
					<a href="http://127.0.0.1:8080/join.do" class="asign">회원가입</a> <a
						href="http://127.0.0.1:8080/searchid.do" class="afind">아이디 찾기</a>
					<a href="http://127.0.0.1:8080/searchpw.do" class="afind">비밀번호
						찾기</a>
				</div>
			</div>
		</div>
		<div id="image">
			<a href="main.do"><img style="margin-right: 500px"
				src="img/login/naver.jpg" width="500px" height="90px"></a>
			<!-- 링크달아주기 -->
		</div>
		<!-- 로그인 footer -->
		<div class="loginfooter">
			<span class="span">이용약관</span> <span class="span">개인정보 처리방침</span> <span
				class="span">운영정책</span> <span class="span">고객센터</span> <span
				class="span">공지사항</span>
			<div style="display: inline-block">
				<img src="img/main/newlogo.png" width="30px" height="30px"
					style="float: left; display: flex; margin-right: 5px;">
				<h4 style="float: right; display: flex;">Copyright © Safe Corp.
					All rights reserved.</h4>
			</div>
		</div>
		<!-- 전체 footer -->



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
			name : ""
		},
		methods : {
			fnLogin : function(){
	            var self = this;
	            var nparmap = {id : self.id, pwd : self.pwd};
	            
	            $.ajax({
	                url:"/login.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) {
	                	if(data.result == "success"){
	                		
	                		alert(data.user.name + "님 로그인 성공!!");
	                		self.pageChange("/main.do", {});
	                		
	                	} else {
	                		alert("로그인 실패!!");
	                	}
	                }
	            }); 
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