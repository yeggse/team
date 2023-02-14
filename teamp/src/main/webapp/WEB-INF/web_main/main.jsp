<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<jsp:include page="/layout/header.jsp"></jsp:include>
	<title>[세잎] 메인페이지</title>
</head>
<style>
	        * {
	            font-family: 'Noto Sans KR', sans-serif;
	        }
	        /* 점(.)으로 시작하는 아이 : html 파트에서 클래스(명)를 의미. */
	        
	        .div1 {
	        	font-size: xx-large;
	        	font-weight: bolder;
	            margin-top: 100px;	/* 바깥쪽여백 */	
	            margin-left: 730px;
	            width: 800px;
	            border-radius: 5px;	/* 모서리 둥글기 크기 */
	            /* text-align: center; */
	            padding: 20px;	/* 안쪽 여백 */	/* padding-top: 50px 등으로 활용 */
	        }
	        .div2 {
	        	font-size: large;
	        	font-weight: bold;
	            margin-top: -25px;	/* 바깥쪽여백 */	
	            margin-left: 775px;
	            width: 600px;
	            border-radius: 5px;	/* 모서리 둥글기 크기 */
	            /* text-align: center; */
	            padding: 20px;	/* 안쪽 여백 */	/* padding-top: 50px 등으로 활용 */
	        }
	      .div3{
	        margin-top: -50px;	/* 바깥쪽여백 */	
	         margin-left: 688px;
	       }
	      .div4{
	        margin-top: 50px;	/* 바깥쪽여백 */	
	        margin-left: 400px;
	      }
	      
	      input {
	            width: 25%;
	            margin-top: 0px;
	            padding: 10px;
	            box-sizing: border-box;
	            border-radius: 10px;
	            border: solid 2px #8FBC94;	/* 외부 테두리 선  =>  border: none => 선 없음. border: solid 1.74px yellow; 등으로 활용*/
	        }   
	       #btn{
		       background-color: #8FBC94;
		       width: 70px;
		       height: 40px;
		       border-radius: 20px;
		       border: solid 2px #8FBC94;
		       font-size: x-large;
		       color: white;
		       padding: 0px;
	       }
	    #imgbtn1{
		       width: 350px;
		       height: 250px;
		       border-radius: 20px;
		       margin-right: 40px;
		       padding: 0px;
		       background: url("img/main/Mfood.png") no-repeat;
	       }      
	    #imgbtn2{
		       width: 350px;
		       height: 250px;
		       border-radius: 20px;
		       margin-right: 40px;
		       padding: 0px;
		       background: url("img/main/Mkor.PNG") no-repeat;
	       }   
	    #imgbtn3{
		       width: 350px;
		       height: 250px;
		       border-radius: 20px;
		       margin-right: 30px;
		       padding: 0px;
		       background: url("img/main/Mjap.PNG") no-repeat;
	       }   
	    #imgbtn4{
		       width: 350px;
		       height: 250px;
		       border-radius: 20px;
		       margin-right: 40px;
		       padding: 0px;
		       background: url("img/main/Mchi.PNG") no-repeat;
	       }      
	    #imgbtn5{
		       width: 350px;
		       height: 250px;
		       border-radius: 20px;
		       margin-right: 40px;
		       padding: 0px;
		       background: url("img/main/Masia.PNG") no-repeat;
	       }   
	    #imgbtn6{
		       width: 350px;
		       height: 250px;
		       border-radius: 20px;
		       margin-right: 30px;
		       padding: 0px;
		       background: url("img/main/Mwe.PNG") no-repeat;
	       }   
</style>

<body style="margin: 0px">
	<div id="app" style="width:2483.02px" anlign="center">
	<div class="div1">지금 계신 장소가 어디신가요?</div>
	<div class="div2">주변 식당에서 음식을 픽업해 가세요!</div>
	<div class="div3">
		<img src="img/main/point.PNG" margin-top= 10px width=50px height=70px>
		<!-- <input type="text" v-model="region" placeholder="장소를 입력해 주세요" ></input>
		<button id="btn" @click="fnSearch">선택</button>	조건 넣어줘야 함: 버튼이벤트 생성 : 미선택시 안넘어가게!!!!!! -->
			<div>
				<form method="post" id="frm" name="frm"> <!-- form을 통해서 값을 다른 페이지로 값을 넘겨준다는 의미 frm이라는 이름을 주고 id에 form안에의 값이 있다. 넘겨주는 페이지 주소 있어야함!(1)-->
					<label for="si" class="control-label">먼저 지역을 골라주세요~ : </label>
					<select id="si" name="si" v-model="si" class="form-control" @change="fnSiChange"> <!-- 선택을 했을때 change가되는데 메소드를 넣어줌(3)-->
						<option value="">지역선택</option> <!-- 처음 값을 선택할 수 있게 빈값을 넣어준다.(2) -->
						<option v-for="item in siList" v-bind:value="item.si">{{item.si}}</option>
					</select>
				</form>
			</div>
	</div>
	
	<div class="div4">
		<button id="imgbtn1" onclick="location.href='/main.storelist.do'"> </button>	<!-- 선택별로 다른 화면 출력되어야 함!!! -->
		<button id="imgbtn2" onclick="location.href='/main.storelist.do'"> </button>	<!-- 선택별로 다른 화면 출력되어야 함!!! -->
		<button id="imgbtn3" onclick="location.href='/main.storelist.do'"> </button>	<!-- 선택별로 다른 화면 출력되어야 함!!! -->
	</div>
	<div class="div4">
		<button id="imgbtn4"></button>
		<button id="imgbtn5"></button>
		<button id="imgbtn6"></button>
	</div>
		
	</div>
</body>
<jsp:include page="/layout/footer.jsp"></jsp:include>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
    	region: ""
    	,list: []
		, siList : ${siList}
		, si : ""
    }   
    , methods: {
    	fnSearch : function(){
            var self = this;
            var nparmap = {region: self.region}; 
             $.ajax({
                url:"/main.region.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {       
                	self.list = data.list;
    	           	if(self.list.length == 0){
    	            	alert("지역명을 확인해 주세요");
    	            }else{
    	            	alert(self.list[0].region);
    	            }
                }
           }); 
    	}
    	,fnSiChange : function(){
    		if($("#si").val() == ""){//선택된 지역의 값이 빈값이면 화면이 넘어가지 않음
    			alert("주소를 먼저 선택해 주세요!");//검색버튼 있을때 필요함.
    		}else{
	    		document.frm.action = "/main.storelist.do"; //시를 선택하고 이 값으로 페이지를 이동한다는 뜻 (4)
	    		document.frm.submit(); // 이동하면서 선택한 지역을 저장한다는 의미.(5)
    		}
    		//alert($("#si").val());
    	}
    }
    , created: function () {
		//this.fnGetList();       
	}
});
</script>