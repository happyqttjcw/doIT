<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인 화면</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script type="text/javascript">
	$(document).ready(function(){
		$("#minfo").show();
		$("#oinfo").hide();
		$(".saleLine").each(function(){ // 주문상품 목록 숨김.
			$(this).hide();
		})
		$("#tab1").addClass("select"); //class 속성에 select 값을 추가.
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
.button {
  	 border-radius: 5px; 
   	background-color: #de8f72;
  	 color: white;
   }
   

   html,body{
  		height:100%;
}
 	element{
 	width:60%;
 	}
	
</style>
</head>
<body>

<h2>사용자 로그인</h2>
<div class="w3-container" style="width:60%; margin:auto;">
<div class="w3-panel w3-card-2">
<table >
	<tr><td id="tab1" class="tab">
		<a href="javascript:disp_div('minfo','tab1')">일반 회원</a></td>
		<td id="tab2" class="tab">
		<a href="javascript:disp_div('oinfo','tab2')">기업 회원</a></td>
	</tr>
</table>
<form:form modelAttribute="user" method="post" action="login.shop">
	<input type="hidden" name="userName" value="유효성 검증을 위한 의미없는 이름"/>
	<spring:hasBindErrors name="user">
		<font color="red">
			<c:forEach items="${errors.globalErrors}" var="error">
			<spring:message code="${error.code}" />
			</c:forEach>
		</font>
	</spring:hasBindErrors>
	<table id="minfo" class="info" border="1" style="border-collapse:collapse;  ">
		<tr height="40px"><th>일반 아이디</th><td><form:input path="id"/>
		<font color="red"><form:errors path="id"/></font></td></tr>
		<tr height="40px"><th>비밀번호</th><td><form:password path="pass"/>
        <font color="red"><form:errors path="pass"/></font></td></tr>
        <tr height="40px"><td colspan="2" align="center">
        <input type="submit" value="로그인">
        <input type="button" value="회원가입" 
        		onclick="location.href='userEntry.shop'">
        </td></tr>
	</table>
</form:form>
<form:form modelAttribute="company" method="post" action="comlogin.shop">
	<input type="hidden" name="userName" value="유효성 검증을 위한 의미없는 이름"/>
	<spring:hasBindErrors name="user">
		<font color="red">
			<c:forEach items="${errors.globalErrors}" var="error">
			<spring:message code="${error.code}" />
			</c:forEach>
		</font>
	</spring:hasBindErrors>
	<table id="oinfo" class="info" border="1" style="border-collapse:collapse;">
		<tr height="40px"><th>기업 아이디</th><td><form:input path="comid"/>
		<font color="red"><form:errors path="comid"/></font></td></tr>
		<tr height="40px"><th>비밀번호</th><td><form:password path="compass"/>
        <font color="red"><form:errors path="compass"/></font></td></tr>
        <tr height="40px"><td colspan="2" align="center">
        <input type="submit" value="로그인">
        <input type="button" value="회원가입" 
        		onclick="location.href='../user/userEntry.shop'">
        </td></tr>
	</table>
</form:form>
</div></div>
</body>
</html>