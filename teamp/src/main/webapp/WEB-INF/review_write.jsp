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
.text{
  text-align:center;
  font-size:2rem;
  width:30rem;
  height:20rem;
}
.btnphoto1{
 	 background:white;
  	 color:black;
 	 border:2px solid black;
 	 width:27%;
     height:6.3rem;
     margin:0.6rem;
     padding:0.4rem;
     text-align:center;
}
.btnphoto2{
 	 background:white;
  	 color:black;
 	 border:2px dashed black;
 	 width:27%;
     height:6.3rem;
     margin:0.6rem;
     padding:0.4rem;
     text-align:center;
}
.btncomplete{
 	 background:green;
  	 color:white;
 	 border:none;
 	 width:30rem;
     height:3rem;
     margin:1rem;
     font-size:2rem;
}

/*별점*/
#myform fieldset{
    display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
    direction: rtl; /* 이모지 순서 반전 */
    border: 0; /* 필드셋 테두리 제거 */
}
#myform fieldset legend{
    text-align: left;
}
#myform input[type=radio]{
    display: none; /* 라디오박스 감춤 */
}
#myform label{
    font-size: 2rem; /* 이모지 크기 */
    color: transparent; /* 기존 이모지 컬러 제거 */
    text-shadow: 0 0 0 #f0f0f0; /* 새 이모지 색상 부여 */
}
#myform label:hover{
    text-shadow: 0 0 0 gray; /* 마우스 호버 */
}
#myform label:hover ~ label{
    text-shadow: 0 0 0 gray; /* 마우스 호버 뒤에오는 이모지들 */
}
#myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 yellow; /* 마우스 클릭 체크 */
}
.div1{
  width: 60rem;
  height: 65rem;
  padding: 1.3rem;
  border: 2px solid black;
  background: white;
  position: absolute; 
  left: 50%; 
  transform: translateX(-50%); 
}
.div2{
  width: 30rem;
  height: 50rem;
  padding: 2rem;
  border: 2px solid black;
  background: white;
  1position: absolute; 
  left: 50%; 
  transform: translateX(-50%); 
}
</style>




<body>
<jsp:include page="/layout/mypagebody.jsp"></jsp:include>
	<div id="app" style="width:2483.02px; padding-top:120px;" align="center">
    <div class="div1"> <!--전체 div-->
      <div class="div2"> <!--별점,텍스트 div-->
        <h1 style="font-size:50px">리뷰 작성하기</h1>
        <div>
          <div>
            <form name="myform" id="myform" method="post" action="./save">
              <fieldset>
                <legend><h2>별점</h2></legend>
                <input @click="fnGrade" type="radio" name="rating" value="5" id="rate1" v-model = "grade"><label for="rate1">⭐</label>
                <input @click="fnGrade" type="radio" name="rating" value="4" id="rate2" v-model = "grade"><label for="rate2">⭐</label>
                <input @click="fnGrade" type="radio" name="rating" value="3" id="rate3" v-model = "grade"><label for="rate3">⭐</label>
                <input @click="fnGrade" type="radio" name="rating" value="2" id="rate4" v-model = "grade"><label for="rate4">⭐</label>
                <input @click="fnGrade" type="radio" name="rating" value="1" id="rate5" v-model = "grade"><label for="rate5">⭐</label>
              </fieldset>
            </form>
          <div>
            <input type="text" name="content" class="text" placeholder="음식에 대한 솔직한 리뷰를 남겨주세요." v-model="content">
          </div>  
          <div>
            <button class="btnphoto1">
              <img src="https://cdn-icons-png.flaticon.com/512/158/158715.png" style="width:50px; height:50px;" alt="사진0/5">
              <ol>사진첨부</ol>
            </button>
            <input type="file" id="file3" name="file3">
			<!--  
			<input type="file" onchange="readURL(this);">  //사진 미리보기 시도하려다 실패
				-->            
           <!--  <button class="btnphoto2">사진</button>
            <button class="btnphoto2">사진</button> -->
          </div>
          <div>
            <button  @click="fnSave" id="radioButton">완료</button>
            수정할것: 레이아웃,rem, 사이즈,헤더 푸터 옆에거 연동 잘 해보기,클릭시 아래 페이지 나오게하기
          </div>
        </div>
     </div>     
    </div>
   </div> <!--전체 div-->
   </div>
</body>
  <jsp:include page="/layout/footer.jsp"></jsp:include>
</html>  
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
		  	list : [] 
			, info : {}
			,writedate:""
			,menuname:""
			,price:""
			,ordernum:""
			,content:""
			,img:""
			,nickname : "${nickname}"
			,reviewnum:"${map.reviewnum}"
			,grade:""
			,reskind:"${map.reskind}"
			,resnum:"${map.resnum}"
			
			
    }

    , methods: {
    	/* fnTest : function(){
            var self = this;
            var nparmap = {resnum: self.resnum, 
            		startdate: self.startdate, 
            	 	menuname: self.menuname, 
            	 	price: self.price, 
            	 	ordernum:self.ordernum,
            	 	reviewnum: self.reviewnum}; 
            
                console.log(nparmap);
           
            $.ajax({
                url:"/reviewwrite.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                
                success : function(data) {
                	self.list = data.list;
                	
                	console.log(nparmap);
                	console.log(data.list);
                }
            }); 
        } */
    	 fnGrade : function(){
    	    	$(document).ready(function(){
    	    		$('#radioButton').click(function(){
    	    			//getter
    	    			self.grade = $('input[name="rating"]:checked').val();
    	    			alert(self.grade);
    	    		});	
    	    	});
    	    }
     ,fnSave : function(){
		var self = this;
      	var nparmap = {nickname:self.nickname,content : self.content, img : self.img, grade: self.grade, reskind:self.reskind, resnum: self.resnum}; 
        $.ajax({
            url:"/addReview.dox",
            dataType:"json",	
            type : "POST", 
            data : nparmap,
            success : function(data) {  
	            var form = new FormData();	// FormData란 HTML 단이 아닌 자바스크립트 단에서 폼 데이터를 다루는 객체
       	        form.append( "file3", $("#file3")[0].files[0] );	// <input name="file1" value="$("#file1")[0].files[0]"> 의미 //이미지 선택한 파일이 form으로 들어감	보트컨트롤러의 fileList파이
       	     	form.append( "reviewnum",  data.reviewnum);	// 여기에 있는 boardIdx는 어디로 가나?????		// boardIdx에 게시글의 경로를 일치시켜주기
       	  		// 이미지 파일을 활성화하는 아작스 통신 더 불러오기
       	         $.ajax({
       	             url : "/upload2"	// board controller - upload파트와 연결
       	           , type : "POST"
       	           , processData : false
       	           , contentType : false
       	           , data : form
       	           , success:function(response) { }
       	           ,error: function (jqXHR) 
       	           {}
       	       }); 
            	alert("리뷰 작성해 주셔서 감사합니다!");
           		location.href="/main.do";
            }
        }); 
     }
	
    // 사진 업로드 
		, upload : function(){
		var form = new FormData();
	        form.append( "file3", $("#file3")[0].files[0] );
	        
	         $.ajax({
	             url : "/upload2"
	           , type : "POST"
	           , processData : false
	           , contentType : false
	           , data : form
	           , success:function(response) { }
	           ,error: function (jqXHR) {}
	       });
    	}
		, change :function(item){
	    	var self = this;
	    	var nparmap = {no : item.no};
	        $.ajax({
	            url:"/reviewFin.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) {            
	            	var form = new FormData();	// FormData란 HTML 단이 아닌 자바스크립트 단에서 폼 데이터를 다루는 객체
	       	        //form.append( "file1", $("#file1")[0].files[0] );	// <input name="file1" value="$("#file1")[0].files[0]"> 의미
	       	     	//form.append( "idx",  data.idx);	// 여기에 있는 boardIdx는 어디로 가나?????
	       	        
	            	alert("게시글이 저장되었습니다.");
	           		location.href="/reservebusiness.do";
	           		
	            }
	        }); 
	        self.pageChange("/reviewwrite.do", {resnum:item.resnum, reskind:item.reskind});
	    }
    }
    , created: function () {
    	
	}
});
</script>