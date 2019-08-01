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
<title>���� ��</title>
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
	 if (confirm("�ش� ���� �����Ͻðڽ��ϱ�?") == true){    //Ȯ��
		 return true;
	 }else{   //���
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

<div class="title" style="text-align:left; font-weight:bold; font-size:20px;">01. �����о� �� �ڰݿ��</div><br><br>
<table id="1" class="w3-table w3-center">
		<tr><th style="width:200px;">�����о�</th><th style="width:80px;">���</th><th style="width:80px;">�����ο�</th><th style="width:300px;">������</th><th>�ڰݿ��</th></tr>
	<c:forEach begin="0" end="${fn:length(fields)-1 }" step="1" var="index">
		<tr><td>${fields[index] }</td><td>${positions[index] }</td><td>${nums[index] }��</td>
			<td>${fn:replace(tasks[index],newline,"<br>")}</td><td>${cdts[index] }</td></tr>
	</c:forEach>
</table><br><br>

<div class="title" style="text-align:left; font-weight:bold; font-size:20px;">02. �ٹ�����</div><br><br>
<table id="2" class="w3-table w3-center">
	<tr><td style="width:30%;background-color: #DCDCDC; font-weight:bold;">�ٹ�����</td><td>${job.employ }</td></tr>
	<tr><td style="width:30%;background-color: #DCDCDC; font-weight:bold;">�ٹ����� �� �ð�</td><td>${job.workday },&nbsp;${job.worktime }</td></tr>
	<tr><td style="width:30%;background-color: #DCDCDC; font-weight:bold;">�ٹ�����</td><td>${job.worklocation }</td></tr>
	<tr><td style="width:30%;background-color: #DCDCDC; font-weight:bold;">����</td><td>${job.salary }</td></tr>
	<tr><td style="width:30%;background-color: #DCDCDC; font-weight:bold;">�������</td><td>- ������� : ${job.likecdt }<br>
						- ���� : ${job.gender } &nbsp;&nbsp;<br>
						- ���� : &nbsp;
						<c:if test="${empty job.startage }">���ɹ���</c:if>
						<c:if test="${!empty job.startage }">${job.startage } ~ ${job.endage }</c:if><br>
						- �ܱ��� : ${job.language }<br>
						- IT�������� : ${job.major }</td></tr>
	<tr><td style="width:30%;background-color: #DCDCDC; font-weight:bold;">�䱸���</td>
		<td>${fn:replace(job.skill,newline,"<br>")}</td></tr>
</table><br><br>

<div class="title" style="text-align:left; font-weight:bold; font-size:20px;">03. �����Ⱓ �� ���</div><br><br>
<div id="3" style="text-align:left;font-size:18px;">
	- ������� : &nbsp;
				<c:choose>
					<c:when test="${job.receivetype=='d' }">doIT����</c:when>
					<c:when test="${job.receivetype=='h' }">���� Ȩ������ ����(${com.comhomepage})</c:when>
					<c:when test="${job.receivetype=='e' }">�̸��� ����</c:when>
				</c:choose><br>
	- �����Ⱓ : &nbsp; <span style="color:blue;font-weight:bold;">${job.startdate } ~ ${job.enddate }</span></div><br><br>
	
<div class="title" style="text-align:left; font-weight:bold; font-size:20px;">04. �����</div><br><br>
<div id="4" style="text-align:left;font-size:18px;">
- ä������ �̸��� :&nbsp; ${job.email }<br>
- ä������ ����ó :&nbsp; ${job.phone }</div><br><br><br>

<hr>
<div style="font-weight:bold; font-size:20px;">�������</div><br><br>
		<table id="5" class="w3-table w3-center">
            <tr>
               <td style="width:30%;" ><div class="w3-panel w3-card w3-center w3-centered" style="margin-top:15%;">
                     <img style="width: 160px; height: 200px;" src="../img/bonobono.jpg">
                  </div></td>
               <td  class="w3-center w3-centered" >
                  <table id="6" class="w3-table w3-centered w3-center" >
                     <tr>	
                        <td style="width: 20%;background-color: #DCDCDC;">����̸�</td>
                        <td style="width: 80%;">${com.comname }</td>
                     </tr>
                     <tr>
                        <td style="width: 20%;background-color: #DCDCDC;">����</td>
                        <td>${com.comtype }</td>
                     </tr>
                     <tr>
                        <td style="width: 20%;background-color: #DCDCDC;">������</td>
                        <td>${com.combirth }</td>
                     </tr>
                     <tr>
                        <td style="width: 20%;background-color: #DCDCDC;">��ǥ�ڸ�</td>
                        <td>${com.managername }</td>
                     </tr>
                     <tr>
                        <td style="width: 20%;background-color: #DCDCDC;">�����</td>
                        <td>${com.comstaffnum } ��</td>
                     </tr>
                     <tr>
                        <td style="width: 20%;background-color: #DCDCDC;">��� �����</td>
                        <td><fmt:formatNumber value="${com.comsales }" pattern="###,###"/></td>
                     </tr>
                     <tr>
                        <td style="width: 20%;background-color: #DCDCDC;">��� Ȩ������</td>
                        <td>${com.comhomepage }</td>
                     </tr>
                  </table></td></tr>
         </table>
</div><br><br>


<a href="updatejobform.shop?comno=${com.comno}&jobno=${job.jobno}" class="w3-button w3-round w3-blue">���� ����</a>
<a href="deletejob.shop?comno=${com.comno }&jobno=${job.jobno}&comid=${com.comid}" 
	class="w3-button w3-round w3-blue"	onclick="return delcheck()">���� ����</a>
<a href="commypage.shop?comid=${com.comid}" class="w3-button w3-round w3-blue">����������</a>


<br><br>
</div>
</body>
</html>