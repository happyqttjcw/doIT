<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��й�ȣ ����</title>
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
		<tr><td>���� ��й�ȣ</td><td><input type="password" value="${user.pass }"></td></tr>
		<tr><td>���� �� ��й�ȣ</td><td><input type="password" value="" name="pass"></td></tr>
		<tr><td>��й�ȣ ���Է�</td><td><input type="password" value="" name="chgPass"></td></tr>
	</table>
	<div style="display: none; color: red; font-size: 15px; text-align: center;" id="text">���Է� ��й�ȣ�� Ʋ�Ƚ��ϴ�.</div>
	<div style="text-align: center; margin-top: 30px;">
		<input type="submit" class="w3-button w3-card" value="�����ϱ�">
		<a href="javascript:cancle()" class="w3-button w3-card" style="margin-left: 10px;">���</a>
	</div>
</div>
</form:form>
</body>
</html>