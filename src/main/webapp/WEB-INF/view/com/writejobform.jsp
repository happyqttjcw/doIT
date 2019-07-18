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
#rtable {
	border:0.1px solid  #333c;
}
#rtable td{
	width:50%;
}

</style>
</head>

<body>
<div class="w3-container w3-center">
<h1>� ���縦 ���� ��ȹ�̼���?</h1>
<br>
<form:form modelAttribute="job" method="post" action="writejob.shop">
	<spring:hasBindErrors name="job">
		<font color="red"> <c:forEach items="${errors.globalErrors}"
				var="error">
				<spring:message code="${error.code}" />
			</c:forEach>
		</font>
	</spring:hasBindErrors>
	<span id="title">��������&nbsp;&nbsp;</span>
		<form:input path="subject" style="width:500px; height:40px;"/>
		<font color="red"><form:errors path="subject" /></font>
	<br><br>
	<div id="title">�����䰭</div>
	<hr>
	<div class="w3-center" id="rtable">
		<table>
		<tr><td>����/����</td><td>
		<form:select path="recruit.field" style="width:400px; height:40px;">
			<c:forEach items="${joblist}" var="jobs">
				<form:option value="">${jobs}</form:option>
			</c:forEach>
		</form:select></td></tr>
		<tr><td>�����ο�</td><td>
			<form:input path="recruit.num" style="width:500px; height:40px;"/>
			<font color="red"><form:errors path="subject" /></font>
			<td>
		</table>
	</div>
	<div id="title">�ڰݿ�� �� �������</div>
	<hr>
	<div id="title">�ٹ�����</div>
	<hr>
	<div id="title">�����Ⱓ �� ���</div>
	<hr>
	<div id="title">�����</div>
	<hr>
</form:form>
	<div>
	
	
	</div>
</div>
</body>
</html>