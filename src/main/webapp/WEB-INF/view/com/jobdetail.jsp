<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>공고 상세</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style type="text/css">
table{
	min-width: 1000px;
	border: 1px solid black;
}
</style>
</head>
<body>
<div class="w3-container w3-center" style="min-width: 1000px;"><br>
<h1>${job.subject }</h1>
<span style="color:gray; font-size:15px;">${com.comname}</span>
<br><hr>
<div id="container">
<div><img style="width: 200px; height: 250px;" src="../img/bonobono.jpg"></div>
<br><br>
<table>
	<caption style="font-size:18px;">모집 공고 상세</caption>
	<tr><td>모집분야</td><td>모집인원</td><td>담당업무</td><td>자격요건 및 우대사항</td><td>요구기술</td><td>
		</td></tr>
</table>
<br><br>
</div>
</div>
</body>
</html>