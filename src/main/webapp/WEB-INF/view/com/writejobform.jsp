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
table {
	border:0.1px solid #333c;
	max-width: 80%;
}
#rtable-container td{
	width:20%;
}
</style>
<script type="text/javascript">
function addrecruit() {
	$('#rtable').clone().appendTo('#rtable-add-container');
	$('#rtable-add-container > #rtable:last-child').attr("id","rtable-add");
}
function delrecruit() {
	$('#rtable-add:last-child').empty();
}
</script>
</head>

<body>

<div class="w3-container w3-center"><br>
<h1>어떤 인재를 뽑을 계획이세요?</h1>
<br>
<form:form modelAttribute="job" method="post" action="writejob.shop" onsubmit="">
	<spring:hasBindErrors name="job">
		<font color="red"> <c:forEach items="${errors.globalErrors}" var="error">
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
	<div class="w3-container w3-center" id="rtable-container">
		<table id="rtable" class="w3-center" >
		<tr><td>직종/직무</td><td>
			<form:select path="field" style="width:400px; height:40px;">
				<c:forEach items="${joblist}" var="jobs">
					<form:option value="">${jobs}</form:option>
				</c:forEach>
			</form:select>
			<font color="red"><form:errors path="field" /></font></td></tr>
		<tr><td>모집인원</td><td>
			<form:input path="num" style="width:100px; height:40px;"/>
			<font color="red"><form:errors path="num" /></font>명</td></tr>
		<tr><td>담당업무</td><td>
			<form:textarea path="task" style="width:400px; height:200px;"/>
			<font color="red"><form:errors path="task" /></font></td></tr>
		<tr><td>근무부서</td><td>
			<form:input path="dept" style="width:400px; height:40px;"/>
			<font color="red"><form:errors path="dept" /></font></td></tr>
		<tr><td>직급/직책</td><td>
			<form:input path="position" style="width:400px; height:40px;"/>
			<font color="red"><form:errors path="position" /></font></td></tr>
		<tr><td colspan="2">
			<a href="javascript:addrecruit()" class="w3-button w3-blue">+추가</a>
			<a href="javascript:delrecruit()" class="w3-button w3-blue">-삭제</a></td></tr>
		</table>
		<input type="submit" value="보내기">
		<div id="rtable-add-container" class="w3-center"></div>
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