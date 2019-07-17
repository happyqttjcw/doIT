<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>비밀번호 변경</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	function cancle() {
		window.close();
	}
	function change(f) {
		if(f.pass.value != f.chgPass.value) {
			$('#text').css("display","");
			f.chgPass.focus();
			return false;
		}
		window.close();
		return true;
	}
</script>
</head>
<body>
<form:form action="passChg.shop" modelAttribute="user" name="f" onsubmit="return change(this)">
<input type="hidden" value="${user.id }" name="id">
<div style="padding-top: 70px;">
	<table style="margin: auto;">
		<tr><td>현재 비밀번호</td><td><input type="password" value="${user.pass }"></td></tr>
		<tr><td>변경 할 비밀번호</td><td><input type="password" value="" name="pass"></td></tr>
		<tr><td>비밀번호 재입력</td><td><input type="password" value="" name="chgPass"></td></tr>
	</table>
	<div style="display: none; color: red; font-size: 15px; text-align: center;" id="text">재입력 비밀번호가 틀렸습니다.</div>
	<div style="text-align: center; margin-top: 30px;">
		<input type="submit" class="w3-button w3-card" value="변경하기">
		<a href="javascript:cancle()" class="w3-button w3-card" style="margin-left: 10px;">취소</a>
	</div>
</div>
</form:form>
</body>
</html>