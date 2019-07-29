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
<div class="col-sm-6 w3-card" style="height: 100%; min-height: 800px; width: 900px; margin-bottom: 100px; display: inline-block; padding: 30px 20px 10px 20px;">
	<div class="row content">
		<div class="col-sm-3"><img src="${path }/img/${user.picture }" style="width: 170px; height: 200px;"></div>
		<div class="col-sm-9"><div style="height: 200px;" class="row content">
			<div class="col-sm-3">
				<div class="info">이름</div>
				<div class="info">나이</div>
				<div class="info">성별</div>
			</div>
			<div class="col-sm-9">
				<div class="info"><input type="text" class="form-control" ></div>
				<div class="info">나이</div>
				<div class="info">성별</div>
			</div>
		</div></div>
		
	</div>
</div>
<div class="col-sm-3"></div>
</div>
</div>
</body>  
</html>