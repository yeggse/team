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
.body{
     line-height:2em;        
     font-family:"맑은 고딕";
}
ul, li{ 
     list-style:none;
     text-align:center;
     padding:0;
     margin:0;
}

#mainWrapper > ul > li:first-child {
     text-align: left;
     font-size:32px;
     height:40px;
     vertical-align:middle;
     line-height:30px;
}
#ulTable{
	margin-top:10px;
}
#ulTable > li:first-child > ul > li {
    background-color:#c9c9c9;
    font-weight:bold;
    text-align:center;
}
#ulTable > li > ul {
    clear:both;
    padding:0px auto;
    position:relative;
    min-width:40px;
}
#ulTable > li > ul > li { 
    float:left;
    font-size:10pt;
    border-bottom:1px solid silver;
    vertical-align:baseline;
}    
#ulTable > li > ul > li:first-child               	  {width:15%;} /*주문번호*/
#ulTable > li > ul > li:first-child +li               {width:10%;} /*상호명*/
#ulTable > li > ul > li:first-child +li+li            {width:10%;} /*메뉴*/
#ulTable > li > ul > li:first-child +li+li+li         {width:15%;} /*시간*/
#ulTable > li > ul > li:first-child +li+li+li+li      {width:15%;} /*결제금액*/
#ulTable > li > ul > li:first-child +li+li+li+li+li	  {width:15%;} /*예약상태*/
#ulTable > li > ul > li:first-child +li+li+li+li+li+li{width:10%;} /*상태변경*/
#ulTable > li > ul > li:first-child +li+li+li+li+li+li+li{width:10%;} /*상태변경*/
#divPaging {
     clear:both; 
     margin:0 auto; 
     width:220px; 
     height:50px;
}
#divPaging > div {
     float:left;
     width: 30px;
     margin:0 auto;
     text-align:center;
}
#liSearchOption {
	width: 320px;
	 clear:both;
     margin-left:350px; 
     positio;
	 border: 2px solid black;
}
.btnreview{
 	 background:green;
  	 color:white;
 	 border:none;
 	 width:66px;
}

.titletext{
font-size: 2em;
padding-right: 500px;


} 	 
.ul{
border: 5px solid red; 
margin: 10px;
padding: 10px;
width: 700px;
align: center;
}

.btnonoff{
 	 background:black;
  	 color:white;
 	 border:none;
 	 width:350px;
 	 height:50px;
}

.btnadd{
 	 background:green;
  	 color:white;
 	 border:none;
 	 width:80px;
 	 height:35px;
 	 float:right;
}

.div1{
border: 1px solid blue;
margin:10px;
padding: 5px;
}

#mainWrapper{
	 clear:both;
     width: 800px;
     margin-left: 350px; /*가운데 정렬*/
     margin-right: 350px; /*가운데 정렬*/
     margin-bottom: 350px; /*가운데 정렬*/
     border: 2px solid black;
     position: relative; left: -500px; bottom:900px; 
    }
.div2{
border: 5px solid black;	
width: 90%;
height: 55px;
padding: 5px;
margin: 5px;
}
.div3{
border: 5px solid green;	
width: 90%;
height: 40px;
margin-top: 5px;
}

</style>

<body class="body">
<div>
<jsp:include page="/layout/mypagebody.jsp"></jsp:include>
	<div id="app" style="width:2483.02px; padding-top:120px;" align="center">
    <div id="mainWrapper"> 
                <!--영업 on/off  -->
        	<div class="div2">
			<button class="btnonoff">영업시작</button>        	
			<button class="btnonoff">영업종료</button>
			</div>
                <!-- 메뉴관리 -->
        	<div class="div3">
			<span class="titletext">메뉴관리</span>
			<span>
			<button class="btnadd">추가</button>
			</span>   	
        	</div>
        <ul class="ul">
            <!-- 게시판 목록  -->
            <li>
                <ul id ="ulTable">
                    <li>
                        <ul>
                            <li>메뉴명</li>
                            <li>가격</li>
                            <li>재고</li>
                            <li>픽업시간</li>
                            <li>메뉴설명</li>
                            <li>사진등록여부</li>
                            <li>삭제</li>
                            <li>수정</li>
                        </ul>
                    </li>
                    
                    <!-- 게시물이 출력될 영역 -->
                    <li>
                        <ul>
                            <li>떡볶이</li>
                            <li>30000원</li>
                            <li>1개</li>
                            <li>14:40</li>
                            <li>맛있어요</li>
                            <li>등록완료</li>
                            <li><button @click="fnDelete" class="btnreview" >삭제</button></li>
                            <li><button class="btnreview">수정</button></li>
                        </ul>
                    </li>

                    <li>
                        <ul>
                            <li>떡볶이</li>
                            <li>30000원</li>
                            <li>1개</li>
                            <li>20분뒤</li>
                            <li>맛있어요</li>
                            <li>등록완료</li>
                            <li><button @click="fnDelete" class="btnreview" >삭제</button></li>
                            <li><button class="btnreview">수정</button></li>
                        </ul>
                    </li>

                    <li>
                        <ul>
                            <li>떡볶이</li>
                            <li>30000원</li>
                            <li>1개</li>
                            <li>20분뒤</li>
                            <li>맛있어요</li>
                            <li>등록완료</li>
                            <li><button @click="fnDelete" class="btnreview" >삭제</button></li>
                            <li><button class="btnreview">수정</button></li>
                        </ul>
                    </li>

                    <li>
                        <ul>
                            <li>떡볶이</li>
                            <li>30000원</li>
                            <li>1개</li>
                            <li>20분뒤</li>
                            <li>맛있어요</li>
                            <li>등록완료</li>
                            <li><button @click="fnDelete" class="btnreview" >삭제</button></li>
                            <li><button class="btnreview">수정</button></li>
                        </ul>
                    <li>                                        
                </ul>
            </li>

            <!-- 게시판 페이징 영역 -->
            <li>
                <div id="divPaging">
                    <div>◀</div>
                       <div><b>1</b></div>
                    <div>2</div>
                    <div>3</div>
                    <div>4</div>
                    <div>5</div>
                    <div>▶</div>
                </div>
            </li>
        </ul>
        수정할것: 레이아웃,rem, 사이즈,헤더 푸터 옆에거랑 연동 잘 해보기
    </div>
    </div>
    </div>
</body>
    <jsp:include page="/layout/footer.jsp"></jsp:include>
</html>  


<script type="text/javascript">
var app = new Vue({
	el: '#app',
    data: {
    	id : ""
    	, pwd : ""
    	, pwd2 : ""
    	, name : ""
    	, age : ""
    	, address : ""
    	, flg : true
    	, kind : "${kind}"
    	, userId : "${userId}"
    	
    } 
    , methods: {
    	
    	fnDelete: function(){
    		var self = this;
    		alert("정말 삭제하시겠습니까?");
    	}
    
    }   
    , created: function () {
    
	}
});


</script>
