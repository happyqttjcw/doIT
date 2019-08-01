<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>인재 검색</title>
<script type="text/javascript">
function checkinput(){
	if($('input:checkbox:checked').length == 0){
		alert('선택된 인재가 없습니다.');
		return false;
	}else{
		if(confirm('해당 인재를 찜하시겠습니까?')){
			return true;
		}else return false;
	}
}
</script>
</head>
<body>
<div class="w3-container w3-center">
	<input type="hidden" name="comno" value="${sessionScope.logincom.comno }">
	<h1 style="color: green;">인재 검색</h1><br><br>
	<c:if test="${!empty cvlist }">
	<form action="addpickuser.shop" onsubmit="return checkinput()" method="post">
	<input type="hidden" name="comno" value="${sessionScope.logincom.comno }">
		<c:forEach var="cv" items="${cvlist }" varStatus="stat">
			<div class="w3-card">
				<table class="w3-table"><tr>
						<td rowspan="2" style="width: 3%;"><br><br>
							<input type="checkbox" name="cvno" value="${cv.cvno }"></td>
						<td rowspan="2" class="w3-center">
							<img style="width: 100px; height: 130px;" src="${path }/curriImg/${cv.picture }"></td>
						<td colspan="2" width="20%" style="font-size: 25px;">${cv.user.name }</td>
						<td rowspan="2" width="60%" style="margin: 10px;">
							<a href="myCurriculumDetail.shop?cvno=${cv.cvno }">
							자소서제목 : ${cv.subject }</a>
							<div>최종학력 : ${cv.school }</div>
							<div>희망연봉 : ${cv.cdtsalary }</div>
							<div>지역 : ${cv.addr }</div></td>
					</tr>
					<tr>
						<td>${cv.user.gender == 1?'남':'여' }</td>
						<td>${cv.user.age }세</td>
					</tr>
				</table>
			</div>
			<br>
		</c:forEach><br><br>
		<input type="submit" class="w3-button w3-blue w3-round w3-center"  value="인재찜하기">
		</form>
	</c:if><br><br>
	<c:if test="${empty cvlist }">
		<h3>인재 목록이 없습니다.</h3><br>
	</c:if>
</div>
</body>
</html>