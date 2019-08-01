<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원정보 수정</title>
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
	<form:form action="userUpdate.shop" modelAttribute="user" enctype="multipart/form-data">
	<input type="hidden" value="${user.userno }" name="userno">
	<div class="row content">
		<div class="col-sm-3">
		<input type="hidden" name="picture" id="picture" value="">
		<img src="" style="width: 190px; height: 220px;" id="pic">
		<input type="file" name="pictureUrl" id="file">
		</div>
		<script>
			$(document).ready(function(){
				$('#pic').attr('src','${path }/userImg/${user.picture }');
			});
			function readURL(input) {
			    if (input.files && input.files[0]) {
			        var reader = new FileReader();
			        reader.onload = function(e) {
			            $('#pic').attr('src', e.target.result);
			            $('#picture').attr('value',e.target.result);
			            $('#pictureUrl').attr('value',e.target.result);
			        }
			        reader.readAsDataURL(input.files[0]);
			    }
			}	
			$("#file").change(function() {
			    readURL(this);
			});
		</script>
		<div class="col-sm-9"><div style="height: 200px;" class="row content">
			<div class="col-sm-2">
				<div class="info">이름</div>
				<div class="info">나이</div>
				<div class="info">성별</div>
			</div>
			<div class="col-sm-10">
				<div class="info"><input type="text" class="form-control" style="margin-top: 5px;" name="name" value="${user.name }"></div>
				<div class="info"><input type="text" class="form-control" style="margin-top: 5px;" name="age" value="${user.age }"></div>
				<div class="info">
					<select name="gender" class="form-control">
						<option value="1" id="1">남자</option>
						<option value="2" id="2">여자</option>
					</select>
				</div>
				<script>
					$(document).ready(function(){
						if(${user.gender} == 1) {
							$('#1').attr('selected','selected');
						} else {
							$('#2').attr('selected','selected');
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
			<div class="info"><input type="text" class="form-control" style="margin-top: 5px;" name="id" value="${user.id }" readonly="readonly"></div>
			<div class="info"><input type="text" class="form-control" style="margin-top: 5px;" name="email" value="${user.email }"></div>
			<div class="info"><input type="text" class="form-control" style="margin-top: 5px;" name="phone" value="${user.phone }"></div>
		</div>
		<input type="submit" class="btn btn-primary btn-block" value="완료">
	</div>
</form:form>
</div>
<div class="col-sm-3">
</div>
</div>
</div>
</body>  
</html>