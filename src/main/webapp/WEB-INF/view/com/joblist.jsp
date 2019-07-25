<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>공고 관리</title>
</head>
<body>
<h1>공고관리입니다.</h1>
	<c:if test="${!empty job }">
		<c:forEach var="job1" items="${job }">
			<div class="w3-container">
				<div class="w3-panel w3-card">
					<table>
						<tr>
							<td><a
								href="jobdetail.shop?jobno=${job1.jobno }&comno=${job1.comno}">제목
									: ${job1.subject }</a></td>
						</tr>
						<tr>
							<td><a
								href="jobdetail.shop?jobno=${job1.jobno }&comno=${job1.comno}">공고일
									: ${job1.startdate } ~ ${job1.enddate }</a></td>
						</tr>
					</table>
				</div>
			</div>
		</c:forEach>
	</c:if>
	<c:if test="${empty job }">
		<hr>
          등록된 공고가 없습니다.
    </c:if>
</body>
</html>