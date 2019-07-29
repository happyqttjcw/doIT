<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원정보 수정</title>
<style type="text/css">
	input {
		border-style: none;
	}
</style>
</head>
<body>
<form:form name="f" action="userUpdate.shop" modelAttribute="user" enctype="multipart/form-data">
<div class="w3-card" style="height: 100%; min-height: 800px; width: 900px; margin-bottom: 100px; display: inline-block; padding: 30px 20px 10px 20px;">
	<div style="height: 150px; margin-bottom: 20px; text-align: center;"><img src="file/${user.picture }" style="width: 149px; height: 149px; border-radius: 50%;" name="pictureUrl" id="pic"></div>
	<div style="text-align: center;"><input type="file" name="pictureUrl" style="" value="" id="file"></div>
	<script>
		function readURL(input) {
		    if (input.files && input.files[0]) {
		        var reader = new FileReader();
		        reader.onload = function(e) {
		            $('#pic').attr('src', e.target.result);
		        }
		        reader.readAsDataURL(input.files[0]);
		    }
		}
		
		$("#file").change(function() {
		    readURL(this);
		});
	</script>
	<div style="text-align: left; width: 460px; border-bottom: 1px black solid; height: 50px; margin: 0 auto 50px auto;">
		<div style="font-size: 30px; display: inline-block; width: 100px;">이름</div>
		<div style="font-size: 25px; display: inline-block;"><input type="text" name="name" value="${user.name }"></div>
	</div>
	<div style="text-align: left; width: 460px; border-bottom: 1px black solid; height: 50px; margin: 0 auto 50px auto;">
		<div style="font-size: 30px; display: inline-block; width: 100px;">아이디</div>
		<div style="font-size: 25px; display: inline-block;"><input type="text" name="id" value="${user.id }" readonly></div>
	</div>
	<div style="text-align: left; width: 460px; border-bottom: 1px black solid; height: 50px; margin: 0 auto 50px auto;">
		<div style="font-size: 30px; display: inline-block; width: 100px;">나이</div>
		<div style="font-size: 25px; display: inline-block;"><input type="text" name="age" value="${user.age }"></div>
	</div>
	<div style="text-align: left; width: 460px; border-bottom: 1px black solid; height: 50px; margin: 0 auto 50px auto;">
		<div style="font-size: 30px; display: inline-block; width: 100px;">성별</div>
		<div style="font-size: 25px; display: inline-block;"><select name="gender" class="w3-button"><option <c:if test="${user.gender == 1 }">selected</c:if> value="1">남자</option><option <c:if test="${user.gender == 2 }">selected</c:if> value="2">여자</option></select></div>
	</div>
	<div style="text-align: left; width: 460px; border-bottom: 1px black solid; height: 50px; margin: 0 auto 50px auto;">
		<div style="font-size: 30px; display: inline-block; width: 100px;">이메일</div>
		<div style="font-size: 25px; display: inline-block;"><input type="text" name="email" value="${user.email }"></div>
	</div>
	<div style="text-align: left; width: 460px; border-bottom: 1px black solid; height: 50px; margin: 0 auto 50px auto;">
		<div style="font-size: 30px; display: inline-block; width: 100px;">핸드폰</div>   
		<div style="font-size: 25px; display: inline-block;"><input type="text" name="phone" value="${user.phone }"></div>
	</div>
	<div style="text-align: center;">
		<input type="submit" value="수정하기">
	</div>
</div>
</form:form>
</body>
</html>