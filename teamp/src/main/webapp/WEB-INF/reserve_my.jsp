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
#mainWrapper > ul > li:first-child {
	 clear:both;
     text-align:left;
     font-size:2rem;
     height:3rem;
     vertical-align:middle;
     line-height:2rem;
}
#ulTable{
	margin:1rem 1rem 1rem 1rem;
}
#ulTable > li:first-child > ul > li {
  background-color:green;
    color:white;
    font-weight:bold;
    text-align:center;
 }
 #ulTable > li > ul {
    clear:both;
    padding:0.5rem 0.5rem;
    position:relative;
    min-width:40px;
}
#ulTable > li > ul > li { 
    float:left;
    font-size:1rem;
    border-bottom:1px solid silver;
    vertical-align:baseline;
}    
 #ulTable > li > ul > li:first-child               	  {width:10%; height:3rem;} /*주문번호*/
#ulTable > li > ul > li:first-child +li               {width:15%; height:3rem;} /*상호명*/
#ulTable > li > ul > li:first-child +li+li            {width:15%; height:3rem;} /*메뉴*/
#ulTable > li > ul > li:first-child +li+li+li         {width:15%; height:3rem;} /*시간*/
#ulTable > li > ul > li:first-child +li+li+li+li      {width:15%; height:3rem;} /*결제금액*/
#ulTable > li > ul > li:first-child +li+li+li+li+li	  {width:15%; height:3rem;} /*예약상태*/
#ulTable > li > ul > li:first-child +li+li+li+li+li+li{width:15%; height:3rem;} /*상태변경*/
 
 #divPaging {
     clear:both; 
     margin:auto; 
     width:15rem; 
     height:5rem;
     font-size:2rem;
}

#divPaging > div {
     float:left;
     width: 1.9rem;
     margin:0 auto;
     text-align:center;
}

#liSearchOption {
	 clear:both;
     margin:0rem 0rem 0rem 20rem; 
     width:40rem; 
     height: 4rem;
     padding: 0.2rem 0.2rem;
}
.btn1{
 	 background:green;
  	 color:white;
 	 border:none;
 	 width:6rem;
 	 height:2rem;
}
.btn2{
 	 background:green;
  	 color:white;
 	 border:none;
 	 width:6rem;
 	 height:3.2rem;
}

ul, li{ 
     list-style:none;
     text-align:center;
     padding:0;
     margin:0;
}
.div0{
border: 10px solid pink;
height: 50%;
width: 100%;
}
#mainWrapper{
     border: 10px solid red;
	 clear:both;
     width: 100rem;
     height: 60rem;
     margin-left: 350px; /*가운데 정렬*/
     margin-right: 350px; /*가운데 정렬*/
     margin-bottom: 350px; /*가운데 정렬*/
     position: relative; left: -100px; bottom:900px; 
    }
    .div1{
border: 10px solid black;
width: 60rem;
height: 4rem;
margin:auto;
padding: 0.3rem 0rem 0rem 30rem;
}

.div2{
border: 10px solid blue;
width: 40rem;
height: 10rem;
font-align: center;
font-size:8rem;
padding:1rem 1rem 1rem 1rem;
margin: 0rem 0rem 0rem 6rem;

}
.div3{
border: 10px solid green;
margin:0.5rem;
width: 80rem;
height: 22rem;
margin:auto;
padding:0rem 1rem 0rem 1rem;
}

#txtKeyWord{
	width:20rem;
	height:3rem;
}
</style>

<body>

	<div id="app" style="width:2483.02px; padding-top:120px;" align="center">

	
	
	<div class="div0">
    <jsp:include page="/layout/mypagebody.jsp"></jsp:include>
    <div id="mainWrapper">
        	<div class="div2">
            <!-- 게시판 제목 -->
            예약내역 
        	</div>
            <div class="div1">
        	<ul>
             <!-- 검색 폼 영역 -->
            <li id='liSearchOption'>
                    <select class="btn2" id='selSearchOption' >
                        <option value='A'>제목+내용</option>
                        <option value='T'>제목</option>
                        <option value='C'>내용</option>
                    </select>
                    <input id='txtKeyWord' />
                    <input class="btn2" type='button' value='검색'/>
                </li>
                </div>
             <div class="div3">
            <!-- 게시판 목록  -->
            <li>
                <ul id ="ulTable">
                    <li>
                        <ul>
                            <li>주문번호</li>
                            <li>상호명</li>
                            <li>메뉴</li>
                            <li>시간</li>
                            <li>결제금액</li>
                            <li>예약상태</li>
                            <li>상태변경</li>
                        </ul>
                    </li>
                    
                    <!-- 게시물이 출력될 영역 -->
                    <li>
                        <ul>
                            <li>1</li>
                            <li class="left">여기맛집</li>
                            <li>짜장면</li>
                            <li>40분</li>
                            <li>20000원</li>
                            <li>예약완료</li>
                            <li><button class="btn1" onClick="location.href='http://localhost:8080/reviewwrite.do'">예약취소</button></li>
                        </ul>
                    </li>

                    <li>
                        <ul>
                            <li>2</li>
                            <li class="left">여기맛집</li>
                            <li>짜장면</li>
                            <li>30분</li>
                            <li>20000원</li>
                            <li>예약완료</li>
                           <li><button class="btn1" onClick="location.href='http://localhost:8080/reviewwrite.do'">예약취소</button></li>
                        </ul>
                    </li>

                    <li>
                        <ul>
                            <li>3</li>
                            <li class="left">여기맛집</li>
                            <li>짜장면</li>
                            <li>40분</li>
                            <li>20000원</li>
                            <li>결제취소</li>
                           <li><button class="btn1" onClick="location.href='http://localhost:8080/reviewwrite.do'">예약취소</button></li>
                        </ul>
                    </li>

                    <li>
                        <ul>
                            <li>4</li>
                            <li class="left">여기맛집</li>
                            <li>짜장면</li>
                            <li>40분</li>
                            <li>20000원</li>
                            <li>결제취소</li>
                           <li><button class="btn1" onClick="location.href='http://localhost:8080/reviewwrite.do'">예약취소</button></li>
                        </ul>
                    <li>                                        
                </ul>
            </li>
            </div>   
			<div>
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
        </div>	
    </div>
    </div>
    
    </div>
   
</body>
    <jsp:include page="/layout/footer.jsp"></jsp:include>
</html>  
