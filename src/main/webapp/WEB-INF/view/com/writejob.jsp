<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>기업 공고 등록</title>
<style type="text/css">
#title {
	font-family:'Noto Sans KR', sans-serif;
	padding-left: 10px; 
	font-size: 30px; 
	color: #333c; 
	text-align:left;
}
hr{
	height: 1px;
  	color: #333c;
  	background-color: #333c;
  	border: none;
}
</style>
</head>

<body>
<div class="w3-container w3-center">
<h1>어떤 인재를 뽑을 계획이세요?</h1>
<br>
<div id="title">모집요강</div>
<hr>
	<form:form name="f1" modelAttribute="recruit" method="post">
		
	
	</form:form>

	<div>
		
	</div>
<div id="title">자격요건 및 우대조건</div>
<hr>
<div id="title">근무조건</div>
<hr>
<div id="title">접수기간 및 방법</div>
<hr>
<div id="title">담당자</div>
<hr>

</div>
</body>
</html>