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
<<<<<<< HEAD
</script>
<style>
#calendar {
	width: 1000px;
	margin-bottom: 50px;
}
.fc-view-container {
	z-index: -1;
}
</style>
</head>
<body>
<div style="display: inline-block; min-height: 500px; min-width: 1000px; padding: 0 30px 0 30px;">
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
		<div style="width: 900px; height:40px; margin: auto auto 30px auto;"><a href="#" class="w3-button" style="background-color:#EBF7FF; text-decoration: none; border-radius: 50px; float: right;">작성하기</a></div>
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
		<div style="width: 900px; height:40px; margin: auto auto 30px auto;"><a href="#" class="w3-button" style="background-color:#EBF7FF; text-decoration: none; border-radius: 50px; float: right;">작성하기</a></div>
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
				<div style="position: absolute; left: 80px; top: -10px;">
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
=======

	function pass_chg() {
		var op = "width=500px, height=300px, top=150px, left=700";
		open("passChgForm.shop", "", op);
	}
</script>
<style>
#calendar {
	width: 920px;
	margin-bottom: 50px;
}
</style>
</head>
<body>
<div class="container-fluid">
  <div class="row content">
    <div class="col-sm-3">
    	<!-- Page Container -->
		  <!-- The Grid -->
		  <div class="w3-row">
		    <!-- Left Column -->
		    <div class="w3-col m2 w3-hide-small" style="min-width: 220px; float: right;">
		      <!-- Profile -->
		      <div class="w3-card w3-round w3-white" style="margin-top:25px;">
		         <br>
		         <p class="w3-center">
		            <img src="${path }/userImg/${picture }" class="w3-circle" style="height:106px;width:106px">
		        </p>
		        <div class="w3-center">
		           <div class="w3-text-green">${sessionScope.loginUser.name } 님</div><br>
		           <a href="userInfo.shop?id=${sessionScope.loginUser.id }">회원 정보 관리</a><br><br>
		           <a href="passChgForm.shop"  onclick="passchg();">비밀번호 변경</a><br><br>
		           <a href="settingForm.shop?userno=${sessionScope.loginUser.userno }" class="w3-center w3-button w3-round w3-blue w3-medium" >맞춤 설정</a>
		        </div>
		        <br>
		      </div>
		      <br>
		      <!-- End Profile -->
		   </div>
		   <br>
		    <!-- End Left Column -->
		   
		   <!-- Middle,Right Column -->
		   <div class="w3-col m10 w3-container" style="padding-left:30px;">
		       <div class="w3-card" style="min-width:500px; max-width:1800px;">
		      </div><br><br><br>
		   </div>
		   <!-- End Middle Column -->
		  </div>
    </div>
    <div class="col-sm-6">
		<div style="font-size: 30px;">이력서 현황</div>
		<div style="width: 100%; min-height: 300px; padding: 5px 0 5px 0; margin-bottom: 50px;" class="w3-card"> <!-- 이력서 현황 -->	
			<div style="font-size: 20px; border-bottom: 1px solid #BDBDBD; width: 900px; margin: auto;">나의 이력서</div>
			<div style="font-size: 15px; background-color: #EBF7FF; width: 900px; margin: auto;">
				<div style="font-family: 'Nanum Gothic Coding', monospace; display: inline-block; width: 650px; text-align: center;">제목</div>
				<div style="font-family: 'Nanum Gothic Coding', monospace; display: inline-block; width: 145px; text-align: center;">작성일</div>
				<div style="font-family: 'Nanum Gothic Coding', monospace; display: inline-block; width: 90px; text-align: center;">공개여부</div>
			</div>
			<div style="font-size: 15px; width: 900px; margin: auto; min-height: 190px;">
				<c:forEach var="list" items="${cv }">
				<div style="border-bottom: 1px #d6d6d6 solid;">
					<div style="font-family: 'Nanum Gothic Coding', monospace; display: inline-block; width: 650px; text-align: center;">
					<a href="${path }/user/myCurriculumDetail.shop?cvno=${list.cvno }" >${list.subject }</a>
					</div>
					<div style="font-family: 'Nanum Gothic Coding', monospace; display: inline-block; width: 145px; text-align: center;">${list.date }</div>
					<div style="font-family: 'Nanum Gothic Coding', monospace; display: inline-block; width: 90px; text-align: center;">
						<input type="checkbox" <c:if test="${list.publicornot == 1}">checked='checked'</c:if> disabled="disabled">
					</div>
				</div>
				</c:forEach>
			</div>
			<div style="width: 900px; height:40px; margin: auto auto 30px auto;">
			  <a href="${path }/user/myCurriculum.shop?userno=${sessionScope.loginUser.userno }" class="btn btn-primary" style=" color: black; background-color:#EBF7FF; text-decoration: none; border-radius: 50px; float: right;">작성하기</a>
			</div>
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
					<div style="font-family: 'Nanum Gothic Coding', monospace; display: inline-block; width: 749px; text-align: left;">
						
					</div>
					<div style="font-family: 'Nanum Gothic Coding', monospace; display: inline-block; width: 145px; text-align: center;">
						<%-- <fmt:formatDate var="date" value="${list.date }" pattern="yyyy-MM-dd"/> --%>
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
	<div class="col-sm-3"></div>
  </div>
>>>>>>> refs/remotes/CGH/CGH
</div>
</body>
</html>