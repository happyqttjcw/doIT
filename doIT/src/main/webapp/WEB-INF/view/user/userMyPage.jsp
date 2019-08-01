<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����� ����������</title>
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
		         	<c:if test="${sessionScope.loginUser.picture == null}"><img src="${path }/userImg/basic.jpg" style="height:106px;width:106px"></c:if>
		            <c:if test="${sessionScope.loginUser.picture != null }"><img src="${path }/userImg/${sessionScope.loginUser.picture }" style="height:106px;width:106px"></c:if>
		        </p>
		        <div class="w3-center">
		           <div class="w3-text-green">${sessionScope.loginUser.name } ��</div><br>
		           <a href="userInfo.shop?id=${sessionScope.loginUser.id }">ȸ�� ���� ����</a><br><br>
		           <a href="#" onclick="pass_chg();">��й�ȣ ����</a><br><br>
		           <a href="settingForm.shop?userno=${sessionScope.loginUser.userno }" class="w3-center w3-button w3-round w3-blue w3-medium" >���� ����</a>
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
		<div style="font-size: 30px;">�̷¼� ��Ȳ</div>
		<div style="width: 100%; min-height: 300px; padding: 5px 0 5px 0; margin-bottom: 50px;" class="w3-card"> <!-- �̷¼� ��Ȳ -->	
			<div style="font-size: 20px; border-bottom: 1px solid #BDBDBD; width: 900px; margin: auto;">���� �̷¼�</div>
			<div style="font-size: 15px; background-color: #EBF7FF; width: 900px; margin: auto;">
				<div style="font-family: 'Nanum Gothic Coding', monospace; display: inline-block; width: 650px; text-align: center; border-right: 1px #d6d6d6 solid;">����</div>
				<div style="font-family: 'Nanum Gothic Coding', monospace; display: inline-block; width: 145px; text-align: center; border-right: 1px #d6d6d6 solid;">�ۼ���</div>
				<div style="font-family: 'Nanum Gothic Coding', monospace; display: inline-block; width: 90px; text-align: center;">��������</div>
			</div>
			<div style="font-size: 15px; width: 900px; margin: auto; min-height: 190px;">
				<c:forEach var="list" items="${cv }">
				<div style="border-bottom: 1px #d6d6d6 solid;">
					<div style="font-family: 'Nanum Gothic Coding', monospace; display: inline-block; width: 650px; text-align: center; border-right: 1px #d6d6d6 solid;">
						<a href="${path }/user/myCurriculumDetail.shop?cvno=${list.cvno }" >${list.subject }</a>
					</div>
					<div style="font-family: 'Nanum Gothic Coding', monospace; display: inline-block; width: 145px; text-align: center; border-right: 1px #d6d6d6 solid;">${list.date }</div>
					<div style="font-family: 'Nanum Gothic Coding', monospace; display: inline-block; width: 90px; text-align: center;">
						<input type="checkbox" <c:if test="${list.publicornot == 1}">checked='checked'</c:if> disabled="disabled">
					</div>
				</div>
				</c:forEach>
			</div>
			<div style="width: 900px; height:40px; margin: auto auto 30px auto;">
			  <a href="${path }/user/myCurriculum.shop?userno=${sessionScope.loginUser.userno }" class="btn btn-primary" style=" color: black; background-color:#EBF7FF; text-decoration: none; border-radius: 50px; float: right;">�ۼ��ϱ�</a>
			</div>
		</div>
		<div style="font-size: 30px;">�ڼҼ� ��Ȳ</div>
		<div style="width: 100%; min-height: 300px; padding: 5px 0 5px 0; margin-bottom: 50px;" class="w3-card">
			<div style="font-size: 20px; border-bottom: 1px solid #BDBDBD; width: 900px; margin: auto;">���� �ڼҼ�</div>
			<div style="font-size: 15px; background-color: #EBF7FF; width: 900px; margin: auto;">
				<div style="font-family: 'Nanum Gothic Coding', monospace; display: inline-block; width: 749px; text-align: center;">����</div>
				<div style="font-family: 'Nanum Gothic Coding', monospace; display: inline-block; width: 145px; text-align: center;">�ۼ���</div>
			</div>
			<div style="font-size: 15px; width: 900px; margin: auto; min-height: 190px;">
				<c:forEach var="resume" items="${rs }">
				<div style="border-bottom: 1px #d6d6d6 solid;">
					<div style="font-family: 'Nanum Gothic Coding', monospace; display: inline-block; width: 749px; text-align: center;">
						<a href="${path }/user/resumeDetail.shop?resumeno=${resume.resumeno }" >${resume.rsubject }</a>
					</div>
					<div style="font-family: 'Nanum Gothic Coding', monospace; display: inline-block; width: 145px; text-align: center;">
						<fmt:parseDate var="date" value="${resume.rdate }" pattern="yyyy-MM-dd" />
						<fmt:formatDate value="${date }" var="date2" pattern="yyyy-MM-dd" />
						${date2 }
					</div>
				</div>
				</c:forEach>
			</div>
			<div style="width: 900px; height:40px; margin: auto auto 30px auto;">
			  <a href="${path }/user/myResume.shop?userno=${sessionScope.loginUser.userno }" class="btn btn-primary" style=" color: black; background-color:#EBF7FF; text-decoration: none; border-radius: 50px; float: right;">�ۼ��ϱ�</a>
			</div>
		</div>
		<div style="font-size: 30px;">���� ��Ȳ</div>
		<div style="width: 100%; min-height: 300px; padding: 5px 0 5px 0; margin-bottom: 50px;" class="w3-card">
			<div style="font-size: 20px; border-bottom: 1px solid #BDBDBD; width: 900px; height:31px; margin: auto;"></div>
			<div style="font-size: 15px; background-color: #EBF7FF; width: 900px; margin: auto;">
				<div style="font-family: 'Nanum Gothic Coding', monospace; display: inline-block; width: 749px; text-align: center;">����</div>
				<div style="font-family: 'Nanum Gothic Coding', monospace; display: inline-block; width: 145px; text-align: center;">������</div>
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
		
		<div style="min-height: 500px;"><div id="calendar"></div></div> <!-- �޷� -->
		
		<div style="font-size: 30px;">���� ����</div>
		<div class="" style="width: 100%; min-height: 300px; padding: 5px 0 5px 0; margin-bottom: 200px;">
			<div style="font-size: 20px; width: 900px; height:31px; margin: auto;"></div>
			<div class="w3-card" style="width: 880px; margin: auto;">
			<div style="font-size: 15px; width: 900px; margin: auto;">
				<c:forEach var="#" items="#">
				<div style="min-height: 160px; position: relative;" class="pick">
					<div style="position: absolute; height: 30px; width: 40px; top: 55px; left: 10px; color: #FFFF8F"><i class="fas fa-star fa-2x" id="pick_star"></i></div>
					<div style="position: absolute; left: 80px; top: 15px;">
						<p style="font-size: 25px;">�����</p>
						<p style="font-size: 20px;">���� ����</p>
						<p style="font-size: 15px;">��������(����/��� �з� ������/����� �ּ�)</p>
					</div>
					<div style="position: absolute; top: 85px; right: 50px;">
						<p style="font-size: 15px;">~ 7/30(ȭ)</p>
					</div>
					<p id="event" style="cursor: pointer; cursor: pointer; display: inline-block; position: absolute; top: 112px; right: 50px;">�޷¿� ����ϱ�</p>
				</div>
				</c:forEach>
			</div>
			</div>
		</div>
	</div>
	<div class="col-sm-3"></div>
  </div>
</div>
</body>
</html>