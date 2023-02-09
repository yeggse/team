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
#mainWrapper{

     position: relative; 
     left: 0px; 
     bottom:800px; 
     clear:both;
     width: 800px;
     height :500px;
     margin-left: 350px; /*가운데 정렬*/
     margin-right: 350px; /*가운데 정렬*/
     margin-bottom: 350px; /*가운데 정렬*/
     border: 2px solid black;
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
#ulTable > li > ul > li:first-child               	  {width:10%;} /*주문번호*/
#ulTable > li > ul > li:first-child +li               {width:15%;} /*상호명*/
#ulTable > li > ul > li:first-child +li+li            {width:15%;} /*메뉴*/
#ulTable > li > ul > li:first-child +li+li+li         {width:15%;} /*시간*/
#ulTable > li > ul > li:first-child +li+li+li+li      {width:10%;} /*결제금액*/
#ulTable > li > ul > li:first-child +li+li+li+li+li	  {width:10%;} /*예약상태*/
#ulTable > li > ul > li:first-child +li+li+li+li+li+li{width:10%;} /*상태변경*/
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
	 clear:both;
}
#liSearchOption {
     margin-left:180px; auto; 
     width:auto; 
     positio
}
.left {
     text-align : left;
}
.btn{
 	 background:green;
  	 color:white;
 	 border:none;
 	 width:66px;
}

</style>

<body>

<div id="app" style="width:100%; padding-top:120px;" align="center"  style = "margin-top: 100px">
	<jsp:include page="/layout/adminmypage.jsp"></jsp:include>
    <div id="mainWrapper" class="body"> 
        <ul>
        	<div>
            <!-- 게시판 제목 -->
            <li>리뷰관리 </li>
        	</div>
            
             <!-- 검색 폼 영역 -->
             
            <li id='liSearchOption'>
                    <select id='selSearchOption' >
                        <option value='A'>제목+내용</option>
                        <option value='T'>제목</option>
                        <option value='C'>내용</option>
                    </select>
                    <input id='txtKeyWord' />
                    <input type='button' value='검색'/>
                </li>
                
            <!-- 게시판 목록  -->
            <li>
                <ul id ="ulTable">
                    <li>
                        <ul>
                            <li>No.</li>
                            <li>주문번호</li>
                            <li>가게명</li>
                            <li>메뉴</li>
                            <li>일시</li>
                            <li>결제금액</li>
                            <li>리뷰</li>
                        </ul>
                    </li>
                    
                    <!-- 게시물이 출력될 영역 -->
                    <li>
                        <ul>
                            <li>1</li>
                            <li class="left">123165456</li>
                            <li>떡참잘</li>
                            <li>짜장면</li>
                            <li>2023.02.08</li>
                            <li>20000원</li>
                            <li><button class="btn" onClick="location.href='http://localhost:8080/reviewwrite.do'">리뷰</button></li>
                        </ul>
                    </li>

                    <li>
                        <ul>
                            <li>2</li>
                            <li class="left">123165456</li>
                            <li>떡참잘</li>
                            <li>짜장면</li>
                            <li>2023.02.08</li>
                            <li>20000원</li>
                           <li><button class="btn" onClick="location.href='http://localhost:8080/reviewwrite.do'">리뷰</button></li>
                        </ul>
                    </li>

                    <li>
                        <ul>
                            <li>3</li>
                            <li class="left">123165456</li>
                            <li>떡참잘</li>
                            <li>짜장면</li>
                            <li>2023.02.08</li>
                            <li>20000원</li>
                           <li><button class="btn" onClick="location.href='http://localhost:8080/reviewwrite.do'">리뷰</button></li>
                        </ul>
                    </li>

                    <li>
                        <ul>
                            <li>4</li>
                            <li class="left">123165456</li>
                            <li>떡참잘</li>
                            <li>짜장면</li>
                            <li>2023.02.08</li>
                            <li>20000원</li>
                           <li><button class="btn" onClick="location.href='http://localhost:8080/reviewwrite.do'">리뷰</button></li>
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
    
    </div>
    </div>
</body>
    <jsp:include page="/layout/footer.jsp"></jsp:include>
</html>  
