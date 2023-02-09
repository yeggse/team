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
.div1{
  width: 400px;
  height: 800px;
  padding: 20px;
  position: absolute; 
  left: 50%; 
  transform: translateX(-50%); 
  border: 2px solid black;
  background: white;
}
.text{
  text-align:center;
  font-size:16px;
  width:400px;
  height:350px;
}
.btnphoto1{
 	 background:white;
  	 color:black;
 	 border:2px solid black;
 	 width:27%;
     height:100px;
     margin:10px;
     padding:5px;
     text-align:center;
}
.btnphoto2{
 	 background:white;
  	 color:black;
 	 border:2px dashed black;
 	 width:27%;
     height:100px;
     margin:10px;
     padding:5px;
     text-align:center;
}
.btncomplete{
 	 background:green;
  	 color:white;
 	 border:none;
 	 width:400px;
     height:35px;
     margin:10px;
     font-size:25px;
}
input{
  width:200px;
  height:200px;
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
    font-size: 2em; /* 이모지 크기 */
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
</style>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width">
  <title>JS Bin</title>
</head>
<body class="body">
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
                <input type="radio" name="rating" value="5" id="rate1"><label for="rate1">⭐</label>
                <input type="radio" name="rating" value="4" id="rate2"><label for="rate2">⭐</label>
                <input type="radio" name="rating" value="3" id="rate3"><label for="rate3">⭐</label>
                <input type="radio" name="rating" value="2" id="rate4"><label for="rate4">⭐</label>
                <input type="radio" name="rating" value="1" id="rate5"><label for="rate5">⭐</label>
              </fieldset>
            </form>
          <div>
            <input type="text" class="text" placeholder="음식에 대한 솔직한 리뷰를 남겨주세요. ">
          </div>  
          <div>
            <button class="btnphoto1">
              <img src="https://cdn-icons-png.flaticon.com/512/158/158715.png" style="width:50px; height:50px;" alt="사진0/5">
              <ol>사진첨부</ol>
            </button>
            <button class="btnphoto2">사진</button>
            <button class="btnphoto2">사진</button>
          </div>
          <div>
            <button class="btncomplete">완료</button>
          </div>
        </div>
     </div>     
    </div>
   </div> <!--전체 div-->
   </div>
</body>
  <jsp:include page="/layout/footer.jsp"></jsp:include>
</html>  
