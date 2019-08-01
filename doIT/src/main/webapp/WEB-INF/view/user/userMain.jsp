<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="today" value="<%=new java.util.Date() %>"/>
<fmt:formatDate value="${today }" var="now" pattern="yyyy-MM-dd"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
.bx-wrapper {
	margin: auto;
	height: 500px;
	margin-bottom: 50px;
}
.carousel-inner img {
    width: 1350px;
    height: 500px;
}
#demo {
	width: 1350px;
	height: 500px;
	margin: auto;
}
.board {
	display: inline-block;
	font-size: 17px;
	text-align: center;
}
.right {
	border-right: 1px #d6d6d6 solid;
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

<div id="demo" class="carousel slide" data-ride="carousel">
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="${path }/ad/main.png" alt="Los Angeles" width="1100" height="500">
      <div class="carousel-caption">
        <h3>Los Angeles</h3>
        <p>We had such a great time in LA!</p>
      </div>   
    </div>
    <div class="carousel-item">
      <img src="${path }/ad/main2.jpg" alt="Chicago" width="1100" height="500">
      <div class="carousel-caption">
        <h3>Chicago</h3>
        <p>Thank you, Chicago!</p>
      </div>   
    </div>
    <div class="carousel-item">
      <img src="${path }/ad/main3.jpg" alt="New York" width="1100" height="500">
      <div class="carousel-caption">
        <h3>New York</h3>
        <p>We love the Big Apple!</p>
      </div>   
    </div>
  </div>
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>

	<br>
	<h3 style="padding: 50px; width: 1350px; margin: auto; border-top: 1px #BDBDBD solid;">맞춤 공고</h3>
	<div class="container-fluid w3-card" style="width: 1350px;">
		<div class="row content" style="padding: 0 30px;">
			<c:forEach var="job" items="${jobList }" varStatus="stat">
				<div class="col-sm-2" style="border: 1px #d6d6d6 solid; padding: 10px 15px; margin: 10px 21px;">
					<div style="text-align: center; margin-bottom: 10px;">
					<c:if test="${job.com.compic == null }"><img src="${path }/comImg/basic.jpg" style="width: 80px; height: 80px;"></c:if>
					<c:if test="${job.com.compic != null }"><img src="${path }/comImg/${job.com.compic }" style="width: 80px; height: 80px;"></c:if>
					</div>
					<div>${job.com.comname }</div>
					<div>${job.com.combrand }</div>
					<div style="font-size: 17px; height: 53px;"><a href="${path }/job/jobdetail.shop?jobno=${job.jobno }&&comno=${job.com.comno }">${job.subject }</a></div>
					<fmt:parseDate var="date" value="${job.enddate }" pattern="yyyy-MM-dd" />
					<fmt:formatDate value="${date }" var="date1" pattern="MM-dd (E)"/>
					<div style="text-align: right; color: #7B7B7B;">~${date1 }</div>
					<div><div style="float: right; display: inline-block; border-radius: 3px; border: 1px #FF8383 solid;">
					<font style="color: #FF7171;"><c:if test="${job.receivetype == 'e'}">이메일 지원</c:if>
					<c:if test="${job.receivetype != 'e' }">${job.receivetype }</c:if></font></div></div>
				</div>
			</c:forEach>
		</div>
	</div>
	<h3 style="padding: 50px; width: 1350px; margin: auto; border-top: 1px #BDBDBD solid;">자소서 첨삭 게시판</h3>
	<div class="container-fluid w3-card" style="width: 1350px; margin-bottom: 30px;">
		<div class="row content">
			<div class="col-sm-12" style="width: 100%; padding: 0 15px; border-bottom: 1px #d6d6d6 solid;">
			<div style="height: 50px; padding: 13px 0;">
				<div class="board right" style="width: 10%;">번호</div>
				<div class="board right" style="width: 50%;">제목</div>
				<div class="board right" style="width: 15%;">작성자</div>
				<div class="board right" style="width: 15%;">작성일</div>
				<div class="board" style="width: 8.5%;">조회수</div>
			</div>
			</div>
			<div class="col-sm-12" style="width: 100%; padding: 0 15px; border-bottom: 1px #d6d6d6 solid;">
			<c:set var="cnt" value="${count }"/>
			<c:forEach var="resume" items="${rList }">
			<div style="height: 50px; padding: 13px 0; border-bottom: 1px #d6d6d6 solid;">
				<div class="board right" style="width: 10%;">${cnt }</div>
				<fmt:parseDate var="date" value="${resume.date }" pattern="yyyy-MM-dd HH:mm:ss" />
				<fmt:formatDate var="date" value="${date }" pattern="yyyy-MM-dd"/>
				<div class="board right" style="width: 50%; text-align: left;">
				<a href="${path }/board/boardDetail.shop?editno=${resume.editno }">${resume.subject }</a>
				<c:if test="${now == date }"><span class="badge text-danger">New</span></c:if></div>
				<div class="board right" style="width: 15%;">${resume.name }</div>
				<fmt:parseDate var="date1" value="${resume.date }" pattern="yyyy-MM-dd HH:mm:ss" />
				<fmt:formatDate var="date2" value="${date1 }" pattern="yyyy-MM-dd"/>
				<fmt:formatDate var="date3" value="${date1 }" pattern="HH:mm:ss"/>
				<div class="board right" style="width: 15%;">
				<c:if test="${now == date }">${date3 }</c:if>
				<c:if test="${now != date }">${date2 }</c:if>
				</div>
				<div class="board" style="width: 8.5%;">${resume.count }</div>
			</div>
			<c:set var="cnt" value="${count-1 }"/>
			</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>