<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>자소서 첨삭 게시판 글작성</title>
<script>
	function check() {
		var sub = $('input[name="subject"]').val();
		console.log(sub);
		if(sub == '') {
			$('#sublabel').text('제목을 입력해 주세요.');
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
		  	<h2>자소서 첨삭</h2>
  			<p>첨삭받을 자소서를 작성해 보세요. 작성된 자소서를 여러 사람에게 공유하여 자소서를 첨삭받아 보세요.</p>   
			<div class="w3-card" style="padding: 25px 20px;">
			<form:form action="write.shop" modelAttribute="resumeedit" method="post" onsubmit="return check();">
			<input type="hidden" name="userno" value="${user.userno }">
			<input type="hidden" name="name" value="${user.name }">
				<div style="padding: 0 15px; text-align: left; font-size: 30px; border-bottom: 1px #d6d6d6 solid; margin-bottom: 10px;">
					<label id="sublabel" style="color: red; display: none;"></label>
					<input type="text" name="subject" placeholder="제목 입력" style="border-style: none; width: 100%; height: 40px; padding: 0 15px; font-size: 15px;">
				</div>
				<div class="content1">
					<textarea name="content" style="width: 100%; min-height: 500px; resize: none; padding: 25px 30px"></textarea>
				</div>
				<div style="padding: 10px 25px; text-align: right;">
					<input type="submit" class="btn btn-secondary btn-sm" value="작성">
				</div>
			</form:form>
			</div>
		</div>
		<div class="col-sm-2"></div>
	</div>
</div>    
</body>
</html>