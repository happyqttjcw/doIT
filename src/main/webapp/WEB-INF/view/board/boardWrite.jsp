<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�ڼҼ� ÷�� �Խ��� ���ۼ�</title>
<script>
	function check() {
		var sub = $('input[name="subject"]').val();
		console.log(sub);
		if(sub == '') {
			$('#sublabel').text('������ �Է��� �ּ���.');
			$('#sublabel').css('display','');
			$('#sublabel').focus();
			return false;
		} else {
			return true;
		}
	}
</script>
</head>
<body>
<div class="container-fluid text-center">
	<div class="row content">
		<div class="col-sm-2"></div>
		<div class="col-sm-8" style="padding: 35px 20px;">
		  	<h2>�ڼҼ� ÷��</h2>
  			<p>÷����� �ڼҼ��� �ۼ��� ������. �ۼ��� �ڼҼ��� ���� ������� �����Ͽ� �ڼҼ��� ÷��޾� ������.</p>   
			<div class="w3-card" style="padding: 25px 20px;">
			<form:form action="write.shop" modelAttribute="resumeedit" method="post" onsubmit="return check();">
			<input type="hidden" name="userno" value="${user.userno }">
			<input type="hidden" name="name" value="${user.name }">
				<div style="padding: 0 15px; text-align: left; font-size: 30px; border-bottom: 1px #d6d6d6 solid; margin-bottom: 10px;">
					<label id="sublabel" style="color: red; display: none;"></label>
					<input type="text" name="subject" placeholder="���� �Է�" style="border-style: none; width: 100%; height: 40px; padding: 0 15px; font-size: 15px;">
				</div>
				<div class="content1">
					<textarea name="content" style="width: 100%; min-height: 500px; resize: none; padding: 25px 30px"></textarea>
				</div>
				<div style="padding: 10px 25px; text-align: right;">
					<input type="submit" class="btn btn-secondary btn-sm" value="�ۼ�">
				</div>
			</form:form>
			</div>
		</div>
		<div class="col-sm-2"></div>
	</div>
</div>    
</body>
</html>