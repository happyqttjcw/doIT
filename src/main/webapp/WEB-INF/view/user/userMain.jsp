<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	text-align: center;
	padding: 8px;
}

th {
	background-color: #4CAF50;
	color: white;
}

td {
	background-color: #F2F2F2;
}

.bx-wrapper {
	margin: auto;
	height: 500px;
	margin-bottom: 50px;
}
img {
	width: 100%;
	height: 490px;
}
</style>
<title>회원 정보</title>
<script>
	$(document).ready(function() {
		$('.slider').bxSlider({
			auto : true,
			pager : true,
			slideWidth : 1350
		});
	});
</script>
</head>
<body>
	<div class="slider">
		<div><img src="${path }/ad/main.png"></div>
		<div><img src="${path }/ad/main2.jpg"></div>
		<div><img src="${path }/ad/main3.jpg"></div>
	</div>
	<br>
	<h3 style="padding: 50px; width: 1350px; margin: auto; border-top: 1px #BDBDBD solid;">맞춤 공고</h3>
	<div style="width: 1350px; min-height: 500px; margin:auto; margin-bottom: 50px;" class="w3-card">
		<div style="padding-left: 20%;">
			<c:forEach var="i" begin="0" end="7">
				<c:forEach var="b3" items="${list3 }" varStatus="stat">
					<c:if test="${stat.index%3==0 }">
						<br>
						<span id="rcorners2" style="padding: 10px;">기업 로고<br>
							기업명<br> 공고 제목<br></span>
					</c:if>
				</c:forEach>
			</c:forEach>
		</div>
	</div>
	<h3 style="padding: 50px; width: 1350px; margin: auto; border-top: 1px #BDBDBD solid;">자소서 첨삭 게시판</h3>
	<div style="width: 1350px; min-height: 500px; margin:auto; margin-bottom: 50px;" class="w3-card">
		<table border="1" style="border-collapse: collapse;">
			<tr>
				<td width="80">번호</td>
				<td width="320">제목</td>
				<td width="100">작성자</td>
				<td width="80">등록일</td>
				<td width="80">조회수</td>
			</tr>
		</table>
	</div>

</body>
</html>