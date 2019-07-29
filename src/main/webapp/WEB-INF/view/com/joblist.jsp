<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>공고 관리</title>
<style type="text/css">
a {
	text-decoration:none;
}
.listcard{
	text-align:left; 
	width:100%; 
	margin-left:10%;
	height:90px;
}
#title{
	font-weight:bold;
	font-size:20px;
}
</style>
<script type="text/javascript">
function deljob(){
	if(confirm("선택한 공고를 삭제하시겠습니까?")){
		return true;
	}else{
		return false;
	}
}
</script>
</head>
<body>
<div class="w3-container w3-center">
<h1 style="color:green;">공고관리</h1><br><br>
<form action="deletejobs.shop" method="post" onsubmit="return deljob();">
	<c:if test="${!empty job }">
			<div class="w3-container">
					<table class="w3-table">
					<c:forEach var="job1" items="${job }" varStatus="stat">
					<tr><td style="width:5%;">
					   <input type="checkbox" name="jobcheck" style="margin:50px;" value="${job1.jobno }"></td>
						<td><div class="w3-panel w3-card w3-right listcard">
							<span style="margin-top:10px;">
						    	<a href="jobdetail.shop?jobno=${job1.jobno }&comno=${job1.comno}" id="title">${job1.subject }</a><br>
						    	<a href="jobdetail.shop?jobno=${job1.jobno }&comno=${job1.comno}">
						    		<font color="blue">~ ${job1.enddate }</font></a><br>
						    	<a href="jobdetail.shop?jobno=${job1.jobno }&comno=${job1.comno}">
						 			${job1.employ }&nbsp;&nbsp;&nbsp;${job1.education }&nbsp;&nbsp;&nbsp;${job1.major }</a>
							</span></div><br></td></tr>
					</c:forEach>
					</table>
			</div>
	</c:if>
	<c:if test="${empty job }">
	<hr>
          등록된 공고가 없습니다.
    </c:if>
    <br>
    <input type="submit" class="w3-button w3-round w3-blue" value="선택공고삭제">
    <a href="writejobform.shop?comid=${sessionScope.logincom.comid }" class="w3-button w3-round w3-blue">공고 등록</a>
</form>
    <br><br>
</div>
</body>
</html>