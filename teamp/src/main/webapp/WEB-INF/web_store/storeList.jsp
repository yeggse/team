<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="js/jquery.js"></script>
	<script src="js/vue.js"></script>
	<jsp:include page="/layout/header.jsp"></jsp:include>
	<title>[세잎] 업체군 리스트</title>
</head>
<style>
	        * {
	            font-family: 'Noto Sans KR', sans-serif;
	        }

		
	        /* 점(.)으로 시작하는 아이 : html 파트에서 클래스(명)를 의미. */
	      .div1{
	        margin-top: 120px;	/* 바깥쪽여백 */	
	         margin-left: 100px;
	       }
	      
	      input {
	            width: 400px;
	            margin-top: 0px;
	            padding: 10px;
	            box-sizing: border-box;
	            border-radius: 10px;
	            border: solid 2px #8FBC94;	/* 외부 테두리 선  =>  border: none => 선 없음. border: solid 1.74px yellow; 등으로 활용*/
	        }   
	       #btn{
		       background-color: #8FBC94;
		       width: 80px;
		       height: 40px;
		       border-radius: 20px;
		       border: solid 2px #8FBC94;
		       font-size: large;
		       color: white;
		       padding: 0px;
	       }
	       #btnList{
		       color: #8FBC94;
		       font-weight: bold; 
		       width: 80px;
		       height: 40px;
		       background-color: white;
		       border-radius: 20px;
		       border: white ;
		       font-size: large;
		       padding: 0px;
	       }
	       .row {
   margin: 0px auto;
   width:100%
}
                col-md-6{

                    max-width : 50%

                }
</style>

<body style="margin: 0px">	
	<div id="app" style="width:2483.02pxl" align="center">		<!-- 화면 고정을 위해 필요 -->
		<div class="div1">
			<button  id="btnList">추천순</button>	<!--클릭되었을 경우, 색변화되도록 이벤트 넣기!!!  -->
			<button id="btnList">재고순</button>	<!-- 선택순으로 리스트 출력하는 쿼리 생성 필요!! -->
			<span style="margin-left: 1000px">
				<input type="text" placeholder="가게명을 검색해 주세요" v-model="resname"></input>		<!-- 업종 리스트 출력하는 쿼리 생성 필요!! -->
				<button id="btn" @click="fnSearch" >검색</button>
			</span>
		</div>
		<div style="margin-top: 45px; text-align: center; font-weight: bold; font-size: x-large;">
			오늘 픽업 가능한 음식점🍕
	    </div>
	    
    <!-- [기본 ] 음식점 출력!! -->
	    <div style="background-color: yellow; ">
	    <!-- DB연결 후, 아래 링크 확인하고, 연동하기 -->
	    <!-- https://velog.io/@dldldl1022/Spring%EA%B3%BC-vue%EB%A5%BC-%EC%9D%B4%EC%9A%A9%ED%95%9C-%EC%9E%A5%EC%86%8C-%EB%AA%A9%EB%A1%9D-%EC%B6%9C%EB%A0%A5%ED%95%98%EA%B8%B0 -->
				<div style="width: 40%; float:left; margin-top: 60px; margin-left:80px;">
				<table >
					<colgroup>
						<col width="25%"/>
					</colgroup>
					<tbody>
						<tr v-for="(item, index) in list" v-if="index%2==0">
							<td>
								<span style="text-align: right; margin-right: 10px;">
								{{list[0].region}}
								{{si}}
		    					<button @click="fnView(item)">	<!-- 링크 확인!!!!!!!!!!!! -->
	    						<span style="background-color: lightgray; display: flex; text-align: center; width: 700px; height: 100px;">
	    							
		    						<img src="img/main/point.PNG" width=100px height=90px vertical-align= middle margin-right=70px>
		    						<span style="font-size: large; font-weight: bold; color: black; margin-left: 50px;">
		    						<br>
		    						<div>가게명 : {{item.resname}} </div><div>{{item.grade}} 점 / 주소: {{item.resadd}}</div>  
	    							</span>
	    						</span>
		    					</button>
		    					</span>
							</td>
						</tr>
					</tbody>
				</table>
				</div>
				
				<div style="width: 40%; float:right; margin-top: 60px; margin-right:80px;">
				<table >
					<colgroup>
						<col width="25%"/>
					</colgroup>
					<tbody>
						<tr v-for="(item, index) in list" v-if="index%2!=0">
							<td>
								<span style="text-align: right; margin-right: 10px;" >
		    					<button @click="fnView(item)">	<!-- 링크 확인!!!!!!!!!!!! -->
	    						<span style="background-color: lightgray; display: flex; text-align: center;width: 700px; height: 100px;">
		    						<img src="img/main/point.PNG" width=100px height=90px vertical-align= middle margin-right=80px>
		    						<span style="font-size: large; font-weight: bold; color: black; margin-left: 50px;">
		    						<br>
		    						<div>가게명 : {{item.resname}} </div><div>{{item.grade}} 점 / 주소: {{item.resadd}}</div>  
	    							</span>
	    						</span>
		    					</button>
		    					</span>
							</td>
						</tr>
					</tbody>
				</table>
				</div>
	   	 </div>

<!-- 가게명 검색 -->
	   	 
	   	 
	   	 
	   	 
	   	 
 </div>
</body>
<jsp:include page="/layout/footer.jsp"></jsp:include>

</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
    	list:[],
    	searchList : [],
    	resname: "",
    	grade: "",
    	resadd: "",
    	tempGrade : "",
    	si : "${si}",
    	reskind : "${reskind}"
    	
    }   
    , methods: {
    	// 기본 화면 출력 이벤트 (식당 출력)
       	fnGet : function(){
            var self = this;
            var nparmap = {si : self.si, reskind:self.reskind}; 
            $.ajax({
                url:"/main.storelist/list.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {/* 데이터가 제대로 넘어오면, success실행됨 */   
                	self.list = data.list;
                console.log(self.reskind);
                console.log(self.list);
   	            	if(self.list.length > 0){
   	            		self.tempGrade = self.list[0].grade;
   	            	}
   	            	
                }
           });
    	},
    	
 	// 가게명 검색 이벤트 (식당 출력)
   	fnSearch : function(){
        var self = this;
        var nparmap = {si : self.si,resname:self.resname}; //다음 페이지로 넘어갈때 필요한 변수만 적어주기. 
        $.ajax({
            url:"/main.storelist/slist.dox",
            dataType:"json",	
            type : "POST", 
            data : nparmap,
            success : function(data) {       
            	self.list = data.list;
            	console.log(self.list);	
	            	if(self.list.length == 0){
	            		self.fnGet();
	            	}    
            	console.log(self.list);
            }
       });
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
 	, fnView : function(item){
		var self = this;
		self.pageChange("/Mypage.do", {resnum : item.resnum}); // resnum(pk)로 찾아야 이름으로 중복된 식당충돌을 줄일 수 있음.
	}
    	
    }
    , created: function () {
		this.fnGet();
		 
	}
});
</script>