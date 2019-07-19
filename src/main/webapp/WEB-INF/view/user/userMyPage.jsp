<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>사용자 마이페이지</title>
<link href='${path }/fullcalendar/core/main.css' rel='stylesheet'/>
<link href='${path }/fullcalendar/daygrid/main.css' rel='stylesheet'/>
<script src='${path }/fullcalendar/core/main.js'></script>
<script src='${path }/fullcalendar/daygrid/main.js'></script>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			plugins : [ 'dayGrid' ],
			height: 650,
			events: [{
				 title: 'The Title', // a property!
			      start: '2019-07-01', // a property!
			      end: '2019-07-02' // a property! ** see important note below about 'end' **
			}]
		});
		calendar.render();
	});
</script>
<style>
#calendar {
	width: 940px;
	margin-bottom: 50px;
}
</style>
</head>
<body>
<div style="min-height: 500px; min-width: 1000px; padding: 0 30px 0 30px; margin:auto; margin-left: 620px; width: 1000px">
	<div style="font-size: 30px;">이력서 현황</div>
	<div style="width: 100%; min-height: 300px; padding: 5px 0 5px 0; margin-bottom: 50px;" class="w3-card"> <!-- 이력서 현황 -->	
		<div style="font-size: 20px; border-bottom: 1px solid #BDBDBD; width: 900px; margin: auto;">나의 이력서</div>
		<div style="font-size: 15px; background-color: #EBF7FF; width: 900px; margin: auto;">
			<div style="font-family: 'Nanum Gothic Coding', monospace; display: inline-block; width: 650px; text-align: center;">제목</div>
			<div style="font-family: 'Nanum Gothic Coding', monospace; display: inline-block; width: 145px; text-align: center;">작성일</div>
			<div style="font-family: 'Nanum Gothic Coding', monospace; display: inline-block; width: 90px; text-align: center;">공개여부</div>
		</div>
		<div style="font-size: 15px; width: 900px; margin: auto; min-height: 190px;">
			<c:forEach var="#" items="#">
				<div style="font-family: 'Nanum Gothic Coding', monospace; display: inline-block; width: 650px; text-align: center;">
					
				</div>
				<div style="font-family: 'Nanum Gothic Coding', monospace; display: inline-block; width: 145px; text-align: center;">
					<%-- <fmt:formatDate value="#" pattern="yyyy-MM-dd"></fmt:formatDate> --%>
				</div>
				<div style="font-family: 'Nanum Gothic Coding', monospace; display: inline-block; width: 90px; text-align: center;">
					<input type="checkbox" <c:if test="">checked</c:if> readonly>
				</div>
			</c:forEach>
		</div>
		<div style="width: 900px; height:40px; margin: auto auto 30px auto;">
		  <a href="${path }/user/myCurriculum.shop?userno=${dbUser.userno }" class="btn btn-primary" style=" color: black; background-color:#EBF7FF; text-decoration: none; border-radius: 50px; float: right;">작성하기</a>
		_</div>
	</div>
	<div style="font-size: 30px;">자소서 현황</div>
	<div style="width: 100%; min-height: 300px; padding: 5px 0 5px 0; margin-bottom: 50px;" class="w3-card">
		<div style="font-size: 20px; border-bottom: 1px solid #BDBDBD; width: 900px; margin: auto;">나의 자소서</div>
		<div style="font-size: 15px; background-color: #EBF7FF; width: 900px; margin: auto;">
			<div style="font-family: 'Nanum Gothic Coding', monospace; display: inline-block; width: 749px; text-align: center;">제목</div>
			<div style="font-family: 'Nanum Gothic Coding', monospace; display: inline-block; width: 145px; text-align: center;">작성일</div>
		</div>
		<div style="font-size: 15px; width: 900px; margin: auto; min-height: 190px;">
			<c:forEach var="#" items="#">
				<div style="font-family: 'Nanum Gothic Coding', monospace; display: inline-block; width: 749px; text-align: center;">
					
				</div>
				<div style="font-family: 'Nanum Gothic Coding', monospace; display: inline-block; width: 145px; text-align: center;">
					<%-- <fmt:formatDate value="#" pattern="yyyy-MM-dd"></fmt:formatDate> --%>
				</div>
			</c:forEach>
		</div>
		<div style="width: 900px; height:40px; margin: auto auto 30px auto;">
		  <a href="${path }/user/myResume.shop?userno=${dbUser.userno }" class="btn btn-primary" style=" color: black; background-color:#EBF7FF; text-decoration: none; border-radius: 50px; float: right;">작성하기</a>
		</div>
	</div>
	<div style="font-size: 30px;">지원 현황</div>
	<div style="width: 100%; min-height: 300px; padding: 5px 0 5px 0; margin-bottom: 50px;" class="w3-card">
		<div style="font-size: 20px; border-bottom: 1px solid #BDBDBD; width: 900px; height:31px; margin: auto;"></div>
		<div style="font-size: 15px; background-color: #EBF7FF; width: 900px; margin: auto;">
			<div style="font-family: 'Nanum Gothic Coding', monospace; display: inline-block; width: 749px; text-align: center;">제목</div>
			<div style="font-family: 'Nanum Gothic Coding', monospace; display: inline-block; width: 145px; text-align: center;">지원일</div>
		</div>
		<div style="font-size: 15px; width: 900px; margin: auto; min-height: 190px;">
			<c:forEach var="#" items="#">
				<div style="font-family: 'Nanum Gothic Coding', monospace; display: inline-block; width: 749px; text-align: center;">
					
				</div>
				<div style="font-family: 'Nanum Gothic Coding', monospace; display: inline-block; width: 145px; text-align: center;">
					<%-- <fmt:formatDate value="#" pattern="yyyy-MM-dd"></fmt:formatDate> --%>
				</div>
			</c:forEach>
		</div>
	</div>
	
	<div style="min-height: 500px;"><div id="calendar"></div></div> <!-- 달력 -->
	
	<div style="font-size: 30px;">찜한 공고</div>
	<div class="" style="width: 100%; min-height: 300px; padding: 5px 0 5px 0; margin-bottom: 200px;">
		<div style="font-size: 20px; width: 900px; height:31px; margin: auto;"></div>
		<div class="w3-card" style="width: 880px; margin: auto;">
		<div style="font-size: 15px; width: 900px; margin: auto;">
			<c:forEach var="#" items="#">
			<div style="min-height: 160px; position: relative;" class="pick">
				<div style="position: absolute; height: 30px; width: 40px; top: 55px; left: 10px; color: #FFFF8F"><i class="fas fa-star fa-2x" id="pick_star"></i></div>
				<div style="position: absolute; left: 80px; top: 15px;">
					<p style="font-size: 25px;">기업명</p>
					<p style="font-size: 20px;">공고 제목</p>
					<p style="font-size: 15px;">간략정보(신입/경력 학력 정규직/계약직 주소)</p>
				</div>
				<div style="position: absolute; top: 85px; right: 50px;">
					<p style="font-size: 15px;">~ 7/30(화)</p>
				</div>
				<p id="event" style="cursor: pointer; cursor: pointer; display: inline-block; position: absolute; top: 112px; right: 50px;">달력에 등록하기</p>
			</div>
			</c:forEach>
		</div>
		</div>
	</div>
</div>
</body>
</html>