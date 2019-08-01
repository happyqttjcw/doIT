<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ����</title>
<script type="text/javascript">
function delpu(){
	if($('input:checkbox:checked').length == 0){
		alert('���õ� ���簡 �����ϴ�.');
		return false;
	}else{
		if(confirm("�ش� ���縦 �� ��Ͽ��� �����Ͻðڽ��ϱ�?")){
			return true;
		}else{
			return false;
		}
	}
}
</script>
</head>
<body>
	<div class="w3-container w3-center">
	<form action="deletepu.shop" method="post" onsubmit="return delpu();">
		<input type="hidden" name="comno" value="${sessionScope.logincom.comno }">
		<h1 style="color: green;">���� ���� ����</h1><br><br>
		<c:if test="${!empty pulist }">
			<c:forEach var="pu" items="${pulist }" varStatus="stat">
				<div class="w3-card">
					<table class="w3-table"><tr>
							<td rowspan="2" style="width: 3%;"><br><br>
								<input type="checkbox" name="cvno" value="${pu.cv.cvno }"></td>
							<td rowspan="2" class="w3-center">
								<img style="width: 100px; height: 130px;" src="${path }/curriImg/${pu.cv.picture }"></td>
							<td colspan="2" width="20%" style="font-size: 25px;">${pu.user.name }</td>
							<td rowspan="2" width="60%" style="margin: 10px;">
								<a href="myCurriculumDetail.shop?cvno=${pu.cv.cvno }">
								�ڼҼ����� : ${pu.cv.subject }</a>
								<div>�����з� : ${pu.cv.school }</div>
								<div>������� : ${pu.cv.cdtsalary }</div>
								<div>���� : ${pu.cv.addr }</div></td>
						</tr>
						<tr>
							<td>${pu.user.gender == 1?'��':'��' }</td>
							<td>${pu.user.age }��</td>
						</tr>
					</table>
				</div>
				<br>
			</c:forEach><br><br>
			<input type="submit" class="w3-button w3-blue w3-round w3-center"  value="���� �����ϱ�">
			<a href="#" class="w3-button w3-blue w3-round w3-center">���� �˻��ϱ�</a><br><br>
		</c:if>
		</form>
		<c:if test="${empty pulist }">
			<h3>���� ���簡 �����ϴ�.</h3><br>
			<a href="#" class="w3-button w3-blue w3-round w3-center" style="font-size: 12px;">���� �˻��ϱ�</a><br><br>
		</c:if>

	</div>
</body>
</html>