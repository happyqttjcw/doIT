<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� �˻�</title>
</head>
<body>
<h3 style="color:green;">���� �˻�</h3>
<c:forEach var="cv" items="${cvlist }">
	${cv }<br><br>
</c:forEach>
</body>
</html>