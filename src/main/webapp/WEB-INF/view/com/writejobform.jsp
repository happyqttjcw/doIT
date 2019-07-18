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
<h1>어떤 인재를 뽑을 계획이세요?</h1>
<br>
<form:form modelAttribute="job" method="post" action="writejob.shop">
	<spring:hasBindErrors name="job">
		<font color="red"> <c:forEach items="${errors.globalErrors}"
				var="error">
				<spring:message code="${error.code}" />
			</c:forEach>
		</font>
	</spring:hasBindErrors>
	<span id="title">공고제목&nbsp;&nbsp;</span>
		<form:input path="subject" style="width:500px; height:40px;"/>
		<font color="red"><form:errors path="subject" /></font>
	<br><br>
	<div id="title">모집요강</div>
	<hr>
	<div class="w3-center" id="rtable">
		<table>
		<tr><td>직종/직무</td><td>
		<form:select path="recruit.field" style="width:400px; height:40px;">
			<c:forEach items="${joblist}" var="jobs">
				<form:option value="">${jobs}</form:option>
			</c:forEach>
		</form:select></td></tr>
		<tr><td>모집인원</td><td>
			<form:input path="recruit.num" style="width:500px; height:40px;"/>
			<font color="red"><form:errors path="subject" /></font>
			<td>
		</table>
	</div>
	<div id="title">자격요건 및 우대조건</div>
	<hr>
	<div id="title">근무조건</div>
	<hr>
	<div id="title">접수기간 및 방법</div>
	<hr>
	<div id="title">담당자</div>
	<hr>
</form:form>
	<div>
	
	
	</div>
</div>
</body>
</html>