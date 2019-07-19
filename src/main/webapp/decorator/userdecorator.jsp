<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Do+Hyeon|Nanum+Gothic+Coding|Noto+Sans+KR:100,400|Song+Myung&display=swap">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/8ee129e7b3.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<title><decorator:title /></title>
<style>
html, body, h1, h2, h3, h4, h5 {
	font-family: sans-serif, "Open Sans"
}

#top2 {
	z-index: 100;
}

.navbar {
	height: 70px;
}

.navbar a {
	font-size: 20px;
}

#top1 {
	padding: .5rem 18rem;
	background-color: #46556d;
}
</style>
<script>
	$(window).scroll(function() {
		if ($(this).scrollTop() >= 200) {
			$('#top2').css("display", "");
		} else {
			$('#top2').css("display", "none");
		}
	});
	
	function pass_chg() {
		var op = "width=500px, height=300px, top=150px, left=700";
		open("passChgForm.shop", "", op);
	}

	$(document).ready(function() {
		$('#dropdown').hover(function() {
			$('.dropdown-menu').addClass('show');
		}, function() {
			$('.dropdown-menu').removeClass('show');
		});
	});
</script>
<decorator:head />
</head>
<body class="w3-theme-l5">
	<div class="w3-center" style="height: 100px; padding-top: 10px;">
		<a href="#"
			style="font-family: 'Song Myung', serif; font-size: 20px; color: #46556d; text-decoration: none;">IT에서 일하자 
			<span style="font-family: inherit; font-size: 40px; font-weight: bold;">doIT</span>
		</a>
	</div>
	<nav class="navbar navbar-expand-sm navbar-dark" id="top1">
		<ul class="navbar-nav">
			<li class="nav-item active"><a class="nav-link" href="#">doIT</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="#" id="dropdown">기업
					공고</a>
				<div class="dropdown-menu">
					<a class="nav-link dropdown-item" href="#">기업 공고</a> <a
						class="nav-link dropdown-item" href="#">기업 공고</a> <a
						class="nav-link dropdown-item" href="#">기업 공고</a>
				</div></li>
			<li class="nav-item"><a class="nav-link" href="#">맞춤 공고</a></li>
			<li class="nav-item"><a class="nav-link" href="#">인재 검색</a></li>
			<li class="nav-item"><a class="nav-link" href="#">자소서 첨삭</a></li>
			<li class="nav-item" style="width: 688px;"></li>
			<li class="nav-item"><c:if
					test="${sessionScope.loginUser == null }">
					<a class="nav-link" href="${path }/user/login.shop">로그인</a>
				</c:if> <c:if test="${sessionScope.loginUser != null }">
					<a class="nav-link" href="#">${sessionScope.loginUser.id }님</a>
				</c:if></li>
			<li class="nav-item" style="float: right;"><c:if
					test="${sessionScope.loginUser == null }">
					<a class="nav-link" href="${path }/user/userEntry.shop">회원가입</a>
				</c:if> <c:if test="${sessionScope.loginUser != null }">
					<a class="nav-link"
						href="${path }/user/userMyPage.shop?id=${sessionScope.loginUser.id }">마이페이지</a>
				</c:if></li>
		</ul>
	</nav>
	<nav class="navbar navbar-expand-sm navbar-dark fixed-top"
		style="background-color: #46556d; display: none;" id="top2">
		<ul class="navbar-nav">
			<li class="nav-item active"><a class="nav-link" href="#">doIT</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="#">기업 공고</a></li>
			<li class="nav-item"><a class="nav-link" href="#">맞춤 공고</a></li>
			<li class="nav-item"><a class="nav-link" href="#">인재 검색</a></li>
			<li class="nav-item"><a class="nav-link" href="#">자소서 첨삭</a></li>
			<li class="nav-item" style="width: 1180px;"></li>
			<li class="nav-item"><c:if
					test="${sessionScope.loginUser == null }">
					<a class="nav-link" href="${path }/user/login.shop">로그인</a>
				</c:if> <c:if test="${sessionScope.loginUser != null }">
					<a class="nav-link" href="#">${sessionScope.loginUser.id }님</a>
				</c:if></li>
			<li class="nav-item" style="float: right;"><c:if
					test="${sessionScope.loginUser == null }">
					<a class="nav-link" href="${path }/user/userEntry.shop">회원가입</a>
				</c:if> <c:if test="${sessionScope.loginUser != null }">
					<a class="nav-link"
						href="${path }/user/userMyPage.shop?id=${sessionScope.loginUser.id }">마이페이지</a>
				</c:if></li>
		</ul>
	</nav>
	<!-- Page Container -->
	<div class="w3-left w3-container w3-content"
		style="display: inline-block; margin-left: 310px; display: none;">
		<!-- The Grid -->
		<div class="w3-row" style="" id="leftdeco">
			<!-- Left Column -->
			<div class="w3-col m3 w3-hide-small">
				<!-- Profile -->
				<div class="w3-card w3-round w3-white"
					style="width: 300px; padding: 15px 10px 15px 10px;">
					<div style="margin-bottom: 15px; padding-left: 88px;">
						<c:if test="${sessionScope.loginUser.picture == null}">
							<i class="fas fa-user-circle fa-7x" style="color: #D5D5D5;"></i>
						</c:if>
						<c:if test="${sessionScope.loginUser.picture != null}">
							<img src="img/${sessionScope.loginUser.picture }"
								style="border-radius: 50%;">
						</c:if>
					</div>
					<!-- 사진 -->
					<div class="w3-center">
						<p
							style="font-family: 'Noto Sans KR', sans-serif; font-size: 15px; color: #747474; margin: 5px 0 5px 0;">${sessionScope.loginUser.name }님</p>
						<p style="margin: 5px 0 5px 0;">
							<a
								href="${path }/user/userInfo.shop?id=${sessionScope.loginUser.id }"
								style="font-family: 'Noto Sans KR', sans-serif; font-size: 15px; color: #747474; text-decoration: none;">회원정보관리</a>
						</p>
						<p style="margin: 5px 0 5px 0;">
							<a href="javascript:pass_chg()"
								style="font-family: 'Noto Sans KR', sans-serif; font-size: 15px; color: #747474; text-decoration: none;">비밀번호 변경</a>
						</p>
					</div>
					<!-- 회원 간략 정보 -->
					<div class="w3-center" style="margin-top: 10px;">
						<a class="w3-button w3-grey"
							href="${path }/user/settingForm.shop?userno=${sessionScope.loginUser.userno}"
							style="height: 50px; width: 120px; border-radius: 30px; font-family: 'Noto Sans KR', sans-serif; font-size: 20px; font-weight: bold;">맞춤 설정</a>
					</div>
				</div>
				<br>
			</div>
			<br>
		</div>
	</div>

	<decorator:body />
	<div class=""
		style="height: 200px; background-color: #EAEAEA; padding: 30px 300px 20px 300px;">
		<a href="#"
			style="font-size: 20px; text-decoration: none; color: #8C8C8C;">고객센터
			<span style="font-size: 15px; color: #8C8C8C;">(QnA 게시판 및 관리자
				채팅)</span>
		</a>
	</div>
</body>
</html>