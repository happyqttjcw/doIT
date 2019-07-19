<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>사용자 등록</title>
<script type="text/javascript">
	$(document).ready(function() {
		$("#minfo").show();
		$("#oinfo").hide();
		$(".saleLine").each(function() { // 주문상품 목록 숨김.
			$(this).hide();
		})
		$("#tab1").addClass("select"); //class 속성에 select 값을 추가.
	})
	function disp_div(id, tab) {
		$(".info").each(function() {
			$(this).hide();
		})
		$(".tab").each(function() {
			$(this).removeClass("select");
		})
		$("#" + id).show();
		$("#" + tab).addClass("select");
	}
	function list_disp(id) {
		$("#" + id).toggle(); //
	}
	function messageAuthontation(email){
		var op = "width=500, height=150, left=50, top=150";
		open("emailAuth.shop?email="+email,"",op);
	}
</script>
<style type="text/css">
.select {
	padding: 3px;
	text-decoration: none;
	font-weight: bold;
	background-color: #0000ff;
}
.select>a {
	color: white;
}
</style>
</head>
<body>
	<table>
		<tr>
			<td id="tab1" class="tab"><a
				href="javascript:disp_div('minfo','tab1')">일반 회원</a></td>
			<td id="tab2" class="tab"><a
				href="javascript:disp_div('oinfo','tab2')">기업 회원</a></td>
		</tr>
	</table>
	<h2>사용자 등록</h2>
	<form:form modelAttribute="user" method="post"
		action="../user/userEntry.shop">
		<spring:hasBindErrors name="user">
			<font color="red"> <c:forEach items="${errors.globalErrors}"
					var="error">
					<spring:message code="${error.code}" />
				</c:forEach>
			</font>
		</spring:hasBindErrors>
		<table id="minfo" class="info" border="1"
			style="border-collapse: collapse;">
			<tr height="40px">
				<td>아이디</td>
				<td><form:input path="id" /> <font color="red"><form:errors
							path="id" /></font></td>
			</tr>
			<tr height="40px">
				<td>비밀번호</td>
				<td><form:password path="pass" /> <font color="red"><form:errors
							path="pass" /></font></td>
			</tr>
			<tr height="40px">
				<td>이름</td>
				<td><form:input path="name" /> <font color="red"><form:errors
							path="name" /></font></td>
			</tr>
			<tr height="40px">
				<td>전화번호</td>
				<td><form:input path="phone" /> <font color="red"><form:errors
							path="phone" /></font></td>
			</tr>
			<tr height="40px">
				<td>나이</td>
				<td><form:input path="age" /> <font color="red"><form:errors
							path="age" /></font></td>
			</tr>
			<tr height="40px">
				<td>이메일</td>
				<td><form:input path="email" /> 
				<input type="button" value="인증하기"  onclick="messageAuthontation('xoalas55@gmail.com')"> 
				<font color="red"><form:errors path="email" /></font></td>
			</tr>
			<tr height="40px">
				<td>성별</td>
				<td><form:radiobutton path="gender" value="1" checked="checked" />남자
					<form:radiobutton path="gender" value="2" />여자 <font color="red"><form:errors
							path="gender" /></font></td>
			</tr>
			<tr height="40px">
				<td colspan="2" align="center"><input type="submit" value="등록">
					<input type="reset" value="초기화"></td>
			</tr>
		</table>
	</form:form>

<%-- 	<form:form modelAttribute="company" action="companyEntry.shop">
		<spring:hasBindErrors name="company">
			<font color="red"> <c:forEach items="${errors.globalErrors}"
					var="error">
					<spring:message code="${error.code}" />
				</c:forEach>
			</font>
		</spring:hasBindErrors>
		<table id="oinfo" class="info" border="1"
			style="border-collapse: collapse;">
			<tr height="40px">
				<td>기업 ID</td>
				<td><form:input path="comid" /> <font color="red"><form:errors
							path="comid" /></font></td>
			</tr>
			<tr height="40px">
				<td>비밀번호</td>
				<td><form:password path="compass" /> <font color="red"><form:errors
							path="compass" /></font></td>
			</tr>
			<tr height="40px">
				<td>기업명</td>
				<td><form:input path="comname" /> <font color="red"><form:errors
							path="comname" /></font></td>
			</tr>
			<tr height="40px">
				<td>사업자등록번호</td>
				<td><form:input path="bussno" /> <font color="red"><form:errors
							path="bussno" /></font></td>
			</tr>
			<tr height="40px">
				<td>담당자</td>
				<td><form:input path="managername" /> <font color="red"><form:errors
							path="managername" /></font></td>
			</tr>
			<tr height="40px">
				<td>핸드폰 번호</td>
				<td><form:input path="managerphone" /> <font color="red"><form:errors
							path="managerphone" /></font></td>
			</tr>
			<tr height="40px">
				<td>이메일</td>
				<td><form:input path="manageremail" /> <font color="red"><form:errors
							path="manageremail" /></font></td>
			</tr>
			<tr height="40px">
				<td colspan="2" align="center"><input type="submit" value="등록">
					<input type="reset" value="초기화"></td>
			</tr>
		</table>
	</form:form> --%>
</body>
</html>