<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
		<a href="${path }/user/editUser.shop?id=${user.id }" class="btn btn-primary btn-block">수정하기</a>
	</div>
</div>
<div class="col-sm-3">
</div>
</div>
</div>
</body>  
</html>