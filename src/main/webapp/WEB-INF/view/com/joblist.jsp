<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ����</title>
</head>
<body>
<h1>��������Դϴ�.</h1>
	<c:if test="${!empty job }">
		<c:forEach var="job1" items="${job }">
			<div class="w3-container">
				<div class="w3-panel w3-card">
					<table>
						<tr>
							<td><a
								href="jobdetail.shop?jobno=${job1.jobno }&comno=${job1.comno}">����
									: ${job1.subject }</a></td>
						</tr>
						<tr>
							<td><a
								href="jobdetail.shop?jobno=${job1.jobno }&comno=${job1.comno}">������
									: ${job1.startdate } ~ ${job1.enddate }</a></td>
						</tr>
					</table>
				</div>
			</div>
		</c:forEach>
	</c:if>
	<c:if test="${empty job }">
		<hr>
          ��ϵ� ���� �����ϴ�.
    </c:if>
</body>
</html>