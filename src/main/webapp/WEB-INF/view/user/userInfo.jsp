<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<<<<<<< HEAD
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원정보 관리</title>
</head>
<body>
<div class="w3-card" style="height: 100%; min-height: 800px; width: 900px; margin-bottom: 100px; display: inline-block; padding: 30px 20px 10px 20px;">
	<div style="height: 150px; margin-bottom: 50px; text-align: center;"><img src="img/${user.picture }" style="width: 149px; height: 149px; border-radius: 50%;"></div>
	<div style="text-align: left; width: 460px; border-bottom: 1px black solid; height: 50px; margin: 0 auto 50px auto;">
		<div style="font-size: 30px; display: inline-block; width: 100px;">이름</div>
		<div style="font-size: 25px; display: inline-block;"><input type="text" value="${user.name }" style="border-style: none;" readonly></div>
	</div>
	<div style="text-align: left; width: 460px; border-bottom: 1px black solid; height: 50px; margin: 0 auto 50px auto;">
		<div style="font-size: 30px; display: inline-block; width: 100px;">아이디</div>
		<div style="font-size: 25px; display: inline-block;"><input type="text" value="${user.id }" style="border-style: none;" readonly></div>
	</div>
	<div style="text-align: left; width: 460px; border-bottom: 1px black solid; height: 50px; margin: 0 auto 50px auto;">
		<div style="font-size: 30px; display: inline-block; width: 100px;">나이</div>
		<div style="font-size: 25px; display: inline-block;"><input type="text" value="${user.age }" style="border-style: none;" readonly></div>
	</div>
	<div style="text-align: left; width: 460px; border-bottom: 1px black solid; height: 50px; margin: 0 auto 50px auto;">
		<div style="font-size: 30px; display: inline-block; width: 100px;">성별</div>
		<div style="font-size: 25px; display: inline-block;"><input type="text" value="${user.gender }" style="border-style: none;" readonly></div>
	</div>
	<div style="text-align: left; width: 460px; border-bottom: 1px black solid; height: 50px; margin: 0 auto 50px auto;">
		<div style="font-size: 30px; display: inline-block; width: 100px;">이메일</div>
		<div style="font-size: 25px; display: inline-block;"><input type="text" value="${user.email }" style="border-style: none;" readonly></div>
	</div>
	<div style="text-align: left; width: 460px; border-bottom: 1px black solid; height: 50px; margin: 0 auto 50px auto;">
		<div style="font-size: 30px; display: inline-block; width: 100px;">핸드폰</div>
		<div style="font-size: 25px; display: inline-block;"><input type="text" value="${user.phone }" style="border-style: none;" readonly></div>
	</div>
	<div style="text-align: center;">
		<a href="${path }/doIT/user/editUser.shop?id=${user.id}" class="w3-button w3-center" style="height: 80px; width: 150px; font-size: 30px;">수정</a>
		<a href="${path }/doIT/user/deleteUser.shop?id=${user.id}" class="w3-button w3-center" style="height: 80px; width: 150px; font-size: 30px;">탈퇴</a>
	</div>
=======
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원정보 관리</title>
<style>
	.info {
		font-size: 30px;
    	height: 70px;
    	padding: 12px 0;
	}
</style>
</head>
<body>
<div class="container-fluid">
<div class="row content">
<div class="col-sm-3"></div>
<div class="col-sm-6 w3-card" style="height: 100%; width: 900px; margin-bottom: 100px; display: inline-block; padding: 30px 20px 10px 20px;">
	<div class="row content">
		<div class="col-sm-3"><img src="${path }/userImg/${user.picture }" style="width: 170px; height: 200px;"></div>
		<div class="col-sm-9"><div style="height: 200px;" class="row content">
			<div class="col-sm-2">
				<div class="info">이름</div>
				<div class="info">나이</div>
				<div class="info">성별</div>
			</div>
			<div class="col-sm-10">
				<div class="info"><input type="text" class="form-control" style="margin-top: 5px;" value="${user.name }" readonly="readonly"></div>
				<div class="info"><input type="text" class="form-control" style="margin-top: 5px;" value="${user.age }" readonly="readonly"></div>
				<div class="info"><input type="text" class="form-control" style="margin-top: 5px;" id="gender" readonly="readonly"></div>
				<script>
					$(document).ready(function(){
						if(${user.gender} == 1) {
							$('#gender').val('남자');
						} else {
							$('#gender').val('여자');
						}
					});
				</script>
			</div>
		</div></div>
	</div>
	<div class="row content">
		<div class="col-sm-2" style="padding-left: 20px;">
			<div class="info">아이디</div>
			<div class="info">이메일</div>
			<div class="info">전화번호</div>
		</div>
		<div class="col-sm-10">
			<div class="info"><input type="text" class="form-control" style="margin-top: 5px;" value="${user.id }" readonly="readonly"></div>
			<div class="info"><input type="text" class="form-control" style="margin-top: 5px;" value="${user.email }" readonly="readonly"></div>
			<div class="info"><input type="text" class="form-control" style="margin-top: 5px;" value="${user.phone }" readonly="readonly"></div>
		</div>
	</div>
</div>
<div class="col-sm-3">
	<a href="${path }/user/editUser.shop?" class="btn btn-primary btn-block">수정하기</a>
</div>
</div>
>>>>>>> refs/remotes/CGH/CGH
</div>
</body>  
</html>