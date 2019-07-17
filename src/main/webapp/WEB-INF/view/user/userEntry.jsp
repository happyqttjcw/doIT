<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����� ���</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script type="text/javascript">
	$(document).ready(function(){
		$("#minfo").show();
		$("#oinfo").hide();
		$(".saleLine").each(function(){ // �ֹ���ǰ ��� ����.
			$(this).hide();
		})
		$("#tab1").addClass("select"); //class �Ӽ��� select ���� �߰�.
	})
	function disp_div(id,tab){
		$(".info").each(function(){
			$(this).hide();
		})
		$(".tab").each(function(){
			$(this).removeClass("select");
		})
		$("#"+id).show();
		$("#" + tab).addClass("select");
	}
	function list_disp(id){
		$("#"+id).toggle(); //
	}
</script>
<style type="text/css">
	.select{
		padding:3px;
		text-decoration:none; font-weight:bold;
		background-color:#46556d;
	}
	.select>a{color:white;}
	table {
   width : 100%;
   border-collapse: collapse;
}
th,td { border-bottom: 1px solid #c1c1c1;
   text-align: center;
   padding : 8px;
   }
th {background-color: #46556d; color : white;}
td {background-color:#ffffff;}
caption {
   color : #111111; font-size:20px;
   background-color: #FFFFFF;
}
input[type=text],input[type=password],textarea {
   width : 80%;
}
input[type=button],input[type=submit] {
   w3-button; w3-teal; w3-rigth;
}
.login {
   border: solid 0px #000000;
   background-color:#ffffff;
}
.submit {
   border-radius: 5px; 
   background-color: #46556d;
   color: white;
   }
   

   html,body{
  height:100%;
}

	
	
</style>
</head>
<body>
<h2>����� ���</h2>
<div class="w3-container" style="width:60%; margin:auto;">
<div class="w3-panel w3-card-2">
<table>
	<tr><td id="tab1" class="tab">
		<a href="javascript:disp_div('minfo','tab1')">�Ϲ� ȸ��</a></td>	
		<td id="tab2" class="tab">
		<a href="javascript:disp_div('oinfo','tab2')">��� ȸ��</a></td>
	</tr>
</table>

<form:form modelAttribute="user"  method="post" action="../user/userEntry.shop">
	<spring:hasBindErrors name="user">
		<font color="red">
			<c:forEach items="${errors.globalErrors}" var="error">
			<spring:message code="${error.code}" />
			</c:forEach>
		</font>
	</spring:hasBindErrors>
 <table id="minfo" class="info" border="1" style="border-collapse: collapse;">
      <tr height="40px"><th>���̵�</th><td><form:input path="id"/>
         <font color="red"><form:errors path="id"/></font></td></tr>
      <tr height="40px"><th>��й�ȣ</th><td><form:password path="pass"/>
         <font color="red"><form:errors path="pass"/></font></td></tr>
      <tr height="40px"><th>�̸�</th><td><form:input path="name"/>
         <font color="red"><form:errors path="name"/></font></td></tr>
      <tr height="40px"><th>��ȭ��ȣ</th><td><form:input path="phone"/>
         <font color="red"><form:errors path="phone"/></font></td></tr>
      <tr height="40px"><th>����</th><td><form:input path="age"/>
         <font color="red"><form:errors path="age"/></font></td></tr>
      <tr height="40px"><th>�̸���</th><td><form:input path="email"/>
         <font color="red"><form:errors path="email"/></font></td></tr>
      <tr height="40px"><th>����</th>
      <td><form:radiobutton path="gender" value="1" checked="checked"/>����
      	  <form:radiobutton path="gender" value="2"/>����
          <font color="red"><form:errors path="gender"/></font></td></tr>
      <tr height="40px">
      <td colspan="2" align="center">
      	<input type="submit" value="���" >
      	<input type="reset" value="�ʱ�ȭ" >
      </td></tr>
   </table>
</form:form>

 <form:form modelAttribute="company"  action="companyEntry.shop">
	<spring:hasBindErrors name="company">
 		<font color="red"> 
			<c:forEach items="${errors.globalErrors}" var="error">
			<spring:message code="${error.code}" />
			</c:forEach>
		</font> 
	</spring:hasBindErrors>
 <table id="oinfo" class="info" border="1" style="border-collapse: collapse;"> 
      <tr height="40px"><th>��� ID</th><td><form:input path="comid"/>
         <font color="red"><form:errors path="comid"/></font></td></tr>
      <tr height="40px"><th>��й�ȣ</th><td><form:password path="compass"/>
         <font color="red"><form:errors path="compass"/></font></td></tr>
      <tr height="40px"><th>�����</th><td><form:input path="comname"/>
         <font color="red"><form:errors path="comname"/></font></td></tr>
      <tr height="40px"><th>����� ��ȣ</th><td><form:input path="bussno"/>
         <font color="red"><form:errors path="bussno"/></font></td></tr>
      <tr height="40px"><th>�����</th><td><form:input path="managername"/>
         <font color="red"><form:errors path="managername"/></font></td></tr>
      <tr height="40px"><th>�ڵ��� ��ȣ</th><td><form:input path="managerphone"/>
         <font color="red"><form:errors path="managerphone"/></font></td></tr>
      <tr height="40px"><th>�̸���</th><td><form:input path="manageremail"/>
         <font color="red"><form:errors path="manageremail"/></font></td></tr>
      <tr height="40px">
       <td colspan="2" align="center"> 
       	<input type="submit" value="���"> 
      	<input type="reset" value="�ʱ�ȭ">
       </td></tr> 
   </table> 
</form:form>
</div> 
</div>
</body>
</html>