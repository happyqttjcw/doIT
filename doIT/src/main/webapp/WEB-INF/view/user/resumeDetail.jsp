<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� �ڼҼ�</title>
</head>
<body>
<div class="container-fluid" style="margin-bottom: 30px;">
<div class="row content">
<div class="col-sm-3"></div>
<div class="col-sm-6">
	<div class="row content w3-card">
		<div class="col-sm-12" style="border-bottom: 1px #d6d6d6 solid;">
			<input type="text" class="form-control" name="rsubject" placeholder="������ �Է��ϼ���" 
			readonly="readonly" value="${resume.rsubject }" style="height: 60px; padding: 0 25px; background-color: white; border-style: none;">
		</div>
		<div class="col-sm-12" style="padding: 0 15px;">
			<div style="padding: 10px 25px;">${resume.rcontent }</div>
		</div>
	</div>   
</div>
<div class="col-sm-3">
	<div class="btn-group">
		<a href="${path }/user/resumeDel.shop?resumeno=${resume.resumeno }&&userno=${resume.userno }" class="btn btn-secondary">�����ϱ�</a>
		<a href="${path }/user/resumeUpdateForm.shop?resumeno=${resume.resumeno }" class="btn btn-primary">�����ϱ�</a>
	</div>
</div>
</div>
</div>
</body>
</html>