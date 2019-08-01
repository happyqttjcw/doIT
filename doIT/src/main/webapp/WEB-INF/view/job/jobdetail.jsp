<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="fields" value="${fn:split(job.field,',')}" />
<c:set var="nums" value="${fn:split(job.num,',')}" />
<c:set var="tasks" value="${fn:split(job.task,',')}" />
<c:set var="depts" value="${fn:split(job.dept,',')}" />
<c:set var="positions" value="${fn:split(job.position,',')}" />
<c:set var="cdts" value="${fn:split(job.cdt,',')}" />
<% pageContext.setAttribute("newline", "\n"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>공고 상세</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style type="text/css">
table {
	max-width: 100%;
	border: 1px solid black;
	text-align:center;
}
th{
	background-color: #DCDCDC;
	border: 1px solid black;
	text-align:center;
}
td{
	border: 1px solid black;
	text-align:center;
}
.title{
	color: #778899;
}
#3, #4{
	font-size:30px;
}
#6{
	width:100%;
	border: 1px solid black;
}
</style>
<script>
function delcheck(){
	 if (confirm("해당 공고를 삭제하시겠습니까?") == true){    //확인
		 return true;
	 }else{   //취소
	     return false;
	 }
}
</script>
</head>
<body>
<div class="w3-container w3-center" style="max-width: 1000px; margin: auto;"><br>
<h1>${job.subject }</h1>
<span style="color:gray; font-size:15px;">${com.comname}</span>
<br><hr>
<div id="table-container" class="w3-center w3-table w3-centered">
<div><img style="width: 200px; height: 250px;" src="../img/bonobono.jpg"></div>
<br><br><br>

<div class="title" style="text-align:left; font-weight:bold; font-size:20px;">01. 모집분야 및 자격요건</div><br><br>
<table id="1" class="w3-table w3-center">
		<tr><th style="width:200px;">모집분야</th><th style="width:80px;">경력</th><th style="width:80px;">모집인원</th><th style="width:300px;">담당업무</th><th>자격요건</th></tr>
	<c:forEach begin="0" end="${fn:length(fields)-1 }" step="1" var="index">
		<tr><td>${fields[index] }</td><td>${positions[index] }</td><td>${nums[index] }명</td>
			<td>${fn:replace(tasks[index],newline,"<br>")}</td><td>${cdts[index] }</td></tr>
	</c:forEach>
</table><br><br>

<div class="title" style="text-align:left; font-weight:bold; font-size:20px;">02. 근무조건</div><br><br>
<table id="2" class="w3-table w3-center">
	<tr><td style="width:30%;background-color: #DCDCDC; font-weight:bold;">근무형태</td><td>${job.employ }</td></tr>
	<tr><td style="width:30%;background-color: #DCDCDC; font-weight:bold;">근무요일 및 시간</td><td>${job.workday },&nbsp;${job.worktime }</td></tr>
	<tr><td style="width:30%;background-color: #DCDCDC; font-weight:bold;">근무지역</td><td>${job.worklocation }</td></tr>
	<tr><td style="width:30%;background-color: #DCDCDC; font-weight:bold;">연봉</td><td>${job.salary }</td></tr>
	<tr><td style="width:30%;background-color: #DCDCDC; font-weight:bold;">우대조건</td><td>- 우대조건 : ${job.likecdt }<br>
						- 성별 : ${job.gender } &nbsp;&nbsp;<br>
						- 연령 : &nbsp;
						<c:if test="${empty job.startage }">연령무관</c:if>
						<c:if test="${!empty job.startage }">${job.startage } ~ ${job.endage }</c:if><br>
						- 외국어 : ${job.language }<br>
						- IT전공여부 : ${job.major }</td></tr>
	<tr><td style="width:30%;background-color: #DCDCDC; font-weight:bold;">요구기술</td>
		<td>${fn:replace(job.skill,newline,"<br>")}</td></tr>
</table><br><br>

<div class="title" style="text-align:left; font-weight:bold; font-size:20px;">03. 접수기간 및 방법</div><br><br>
<div id="3" style="text-align:left;font-size:18px;">
	- 접수방법 : &nbsp;
				<c:choose>
					<c:when test="${job.receivetype=='d' }">doIT지원</c:when>
					<c:when test="${job.receivetype=='h' }">본사 홈페이지 지원(${com.comhomepage})</c:when>
					<c:when test="${job.receivetype=='e' }">이메일 지원</c:when>
				</c:choose><br>
	- 접수기간 : &nbsp; <span style="color:blue;font-weight:bold;">${job.startdate } ~ ${job.enddate }</span></div><br><br>
	
<div class="title" style="text-align:left; font-weight:bold; font-size:20px;">04. 담당자</div><br><br>
<div id="4" style="text-align:left;font-size:18px;">
- 채용담당자 이메일 :&nbsp; ${job.email }<br>
- 채용담당자 연락처 :&nbsp; ${job.phone }</div><br><br><br>

<hr>
<div style="font-weight:bold; font-size:20px;">기업정보</div><br><br>
		<table id="5" class="w3-table w3-center">
            <tr>
               <td style="width:30%;" ><div class="w3-panel w3-card w3-center w3-centered" style="margin-top:15%;">
                     <img style="width: 160px; height: 200px;" src="../img/bonobono.jpg">
                  </div></td>
               <td  class="w3-center w3-centered" >
                  <table id="6" class="w3-table w3-centered w3-center" >
                     <tr>	
                        <td style="width: 20%;background-color: #DCDCDC;">기업이름</td>
                        <td style="width: 80%;">${com.comname }</td>
                     </tr>
                     <tr>
                        <td style="width: 20%;background-color: #DCDCDC;">업종</td>
                        <td>${com.comtype }</td>
                     </tr>
                     <tr>
                        <td style="width: 20%;background-color: #DCDCDC;">설립일</td>
                        <td>${com.combirth }</td>
                     </tr>
                     <tr>
                        <td style="width: 20%;background-color: #DCDCDC;">대표자명</td>
                        <td>${com.managername }</td>
                     </tr>
                     <tr>
                        <td style="width: 20%;background-color: #DCDCDC;">사원수</td>
                        <td>${com.comstaffnum } 명</td>
                     </tr>
                     <tr>
                        <td style="width: 20%;background-color: #DCDCDC;">평균 매출액</td>
                        <td><fmt:formatNumber value="${com.comsales }" pattern="###,###"/></td>
                     </tr>
                     <tr>
                        <td style="width: 20%;background-color: #DCDCDC;">기업 홈페이지</td>
                        <td>${com.comhomepage }</td>
                     </tr>
                  </table></td></tr>
         </table>
</div><br><br>


<a href="updatejobform.shop?comno=${com.comno}&jobno=${job.jobno}" class="w3-button w3-round w3-blue">공고 수정</a>
<a href="deletejob.shop?comno=${com.comno }&jobno=${job.jobno}&comid=${com.comid}" 
	class="w3-button w3-round w3-blue"	onclick="return delcheck()">공고 삭제</a>
<a href="commypage.shop?comid=${com.comid}" class="w3-button w3-round w3-blue">마이페이지</a>


<br><br>
</div>
</body>
</html>