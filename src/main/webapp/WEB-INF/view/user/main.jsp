<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %> 
<c:set var="path" value = "${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
 <style>
  
  .carousel-inner img {
    padding-right: 50px;
    padding-left: 50px;
  }
  #rcorners2 {
  border-radius: 25px;
  border: 2px solid black;
  padding: 20px; 
  width: 500px;
  height: 500px;
  max-width: 500px;
  max-height: 500px;  
	}
table {
   width : 100%;
   border-collapse: collapse;
}
th,td { border-bottom: 1px solid #c1c1c1;
   text-align: center;
   padding : 8px;
   }
th {background-color: #46556d; color : white;}
td {background-color:#ffffff;}
caption {
   color : #111111; font-size:20px;
   background-color: #FFFFFF;
}
input[type=text],input[type=password],textarea {
   width : 80%;
}
input[type=button],input[type=submit] {
   w3-button; w3-teal; w3-rigth;
}
.login {
   border: solid 0px #000000;
   background-color:#ffffff;
}
.submit {
   border-radius: 5px; 
   background-color: #46556d;
   color: white;
   }
   
   html,body{
  height:100%;
}
  </style>
<title>회원 정보</title>
</head>
<body>
<div id="demo" class="carousel slide" data-ride="carousel">
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="${path}/board/file/saporo.jpg" alt="Los Angeles" width="2400px" height="500px">
      <div class="carousel-caption">
        <h3 style="color:black">Los Angeles</h3>
        <p>We had such a great time in LA!</p>
      </div>   
    </div>
    <div class="carousel-item">
      <img src="${path}/board/file/saporo1.jpg" alt="Chicago" width="2400px" height="500px">
      <div class="carousel-caption">
        <h3>Chicago</h3>
        <p>Thank you, Chicago!</p>
      </div>   
    </div>
    <div class="carousel-item">
      <img src="${path}/board/file/saporo2.jpg" alt="New York" width="2400px" height="500px">
      <div class="carousel-caption">
        <h3>New York</h3>
        <p>We love the Big Apple!</p>
      </div>   
    </div>
  </div>
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next" style="color:black;">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>
<hr>
 <h3 style="padding:50px;">맞춤 공고</h3>
 <div>
 	<div style="padding-left:20%;">
 	<c:forEach var="i" begin="0" end="7">
 	<c:forEach var="b3" items="${list3 }" varStatus="stat">
                <c:if test="${stat.index%3==0 }"><br>
 	<span id="rcorners2" style="padding:10px;">기업 로고<br>
 						 					    기업명<br>
 						                                        공고 제목<br></span>
               </c:if> 						                                        
 			</c:forEach>
    </c:forEach>
 	</div>
 </div>
 <hr>
 <h3 style="padding:50px;">자소서 첨삭 게시판</h3>
 <div style="padding-left:5%;">
 	<table border="1" style="border-collapse:collapse;" >
 		<tr><th width="80">번호</th>
 			<th width="320">제목</th>
 			<th width="100">작성자</th>
 			<th width="80">등록일</th>
 			<th width="80">조회수</th></tr>
 	</table>
 </div>

</body>
</html>