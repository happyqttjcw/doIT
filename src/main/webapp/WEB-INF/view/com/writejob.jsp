<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��� ���� ���</title>
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
<h1>� ���縦 ���� ��ȹ�̼���?</h1>
<br>
<div id="title">�����䰭</div>
<hr>
	<form:form name="f1" modelAttribute="recruit" method="post">
		
	
	</form:form>

	<div>
		
	</div>
<div id="title">�ڰݿ�� �� �������</div>
<hr>
<div id="title">�ٹ�����</div>
<hr>
<div id="title">�����Ⱓ �� ���</div>
<hr>
<div id="title">�����</div>
<hr>

</div>
</body>
</html>