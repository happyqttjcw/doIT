<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href='${path }/fullcalendar/core/main.css' rel='stylesheet'/>
<link href='${path }/fullcalendar/daygrid/main.css' rel='stylesheet'/>
<script src='${path }/fullcalendar/core/main.js'></script>
<script src='${path }/fullcalendar/daygrid/main.js'></script>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		
		var calendar = new FullCalendar.Calendar(calendarEl, {
			plugins : [ 'dayGrid' ]
		});
		calendar.render();
	});
</script>
</head>
<body>
<div id='calendar'></div>
</body>
</html>