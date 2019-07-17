<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ include file="/WEB-INF/view/jspHeader.jsp"%>

<!DOCTYPE html>

<html>
<head>
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon|Nanum+Gothic+Coding|Noto+Sans+KR:100,400|Song+Myung&display=swap"
	rel="stylesheet">
<meta charset="EUC-KR">
<title>��� ����������</title>
<style type="text/css">
body, tr, td, th {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 18px;
}
table {
	border-collapse: collapse;
	width: 100%;
}
th, td {
	text-align: left;
	padding: 15px;
	border: 1px solid #E5E5E5
}
</style>
</head>
<body>
	<div class="w3-container">
		<div class="w3-panel w3-card">
			<p style="font-size: 30px; color: green;">��� �⺻����</p>
			<table
				style="border: 1px solid black; border-left: none; border-right: none;">
				<tr>
					<td style="background-color: #E5E5E5; width: 20%;">����̸� :</td>
					<td style="width: 80%;">${com.comid }</td>
				</tr>
				<tr>
					<td style="background-color: #E5E5E5; width: 20%;">�귣���Ī :</td>
					<td>${com.combrand }</td>
				</tr>
				<tr>
					<td style="background-color: #E5E5E5; width: 20%;">��ǥ�ڸ� :</td>
					<td>${com.managername }</td>
				</tr>
				<tr>
					<td style="background-color: #E5E5E5; width: 20%;">���� :</td>
					<td>${com.comaddr }</td>
				</tr>
				<tr>
					<td style="background-color: #E5E5E5; width: 20%;">���� :</td>
					<td>${com.comtype }</td>
				</tr>
			</table>
			<br> <br>
		</div>
	</div>
	<br>
	<div class="w3-container">
		<div class="w3-panel w3-card">
			<p style="font-size: 30px; color: green;">�������</p>
			<c:if test="${!empty job }">
				<c:forEach var="job1" items="${job }">
					<div class="w3-container">
						<div class="w3-panel w3-card">
							<table>
								<tr>
									<td>���� : ${job1.subject }</td>
								</tr>
								<tr>
									<td>������ : ${job1.startdate } ~ ${job1.enddate }</td>
								</tr>
							</table>
						</div>
					</div>
				</c:forEach>
			</c:if>
			<br>
			<br>
		</div>
	</div>
	<br>
	<div class="w3-container">
		<div class="w3-panel w3-card">
			<p style="font-size: 30px; color: green;">���� ����</p>
			<c:if test="${!empty cvlist }">
				<c:forEach var="cv" items="${cvlist }">
					<c:forEach var="user" items="${userlist }">
						<div class="w3-container">
							<div class="w3-panel w3-card">
								<table>
									<tr>
										<td rowspan="2"><img src="img/${cv.picture }"></td>
										<td colspan="2" width="20%">�̸� : ${user.name }</td>
										<td rowspan="2" width="60%">
											<div>�ڼҼ����� : ${cv.subject }</div>
											<div>�����з� : ${cv.school }</div>
											<div>������� : ${cv.cdtsalary }</div>
											<div>���� : ${cv.addr }</div>
										</td>
									</tr>
									<tr>
										<td>${user.gender == 1?'��':'��' }</td>
										<td>${user.age }��</td>
									</tr>
								</table>
							</div>
						</div>
					</c:forEach>
				</c:forEach>
			</c:if>
			<br>
			<br>
		</div>
	</div>
</body>
</html>