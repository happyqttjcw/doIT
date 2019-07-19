<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<style>
ul.nav-pills {
	top: 20px;
	position: fixed;
}

div.col-sm-9 div {
	height: 250px;
	font-size: 28px;
}

#section1 {
	color: #fff;
	background-color: #1E88E5;
}

#section2 {
	color: #fff;
	background-color: #673ab7;
}

#section3 {
	color: #fff;
	background-color: #ff9800;
}

#section41 {
	color: #fff;
	background-color: #00bcd4;
}

#section42 {
	color: #fff;
	background-color: #009688;
}

@media screen and (max-width: 810px) {
	#section1, #section2, #section3, #section41, #section42 {
		margin-left: 150px;
	}
}

.inline-block {
	display: inline-block;
}

#pic {
	width: 140px;
	height: 170px;
}

span>input {
	border-style: none;
	padding: 0 15px;
	height: 40px;
}

h2>small {
	
}
</style>
<meta charset="EUC-KR">
<title>이력서</title>
</head>
<body data-spy="scroll" data-target="#myScrollspy" data-offset="20">
<form:form action="" modelAttribute="cv" enctype="multipart/form-data">
	<div class="container-fluid text-center">
		<div class="row content">
			<nav class="col-sm-3" style="position: relative;" id="myScrollspy">
				<ul class="nav nav-pills nav-stacked" style="position: absolute; display: list-item;"> 
					<li class="active"><a href="#section1">Section 1</a></li>
					<li><a href="#section2">Section 2</a></li>
					<li><a href="#section3">Section 3</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">Section 4 <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#section41">Section 4-1</a></li>
							<li><a href="#section42">Section 4-2</a></li>
						</ul></li>
				</ul>
			</nav>
			<div class="col-sm-6 text-left"
				style="background-color: #EAEAEA; padding: 1rem;">
				<div class="container-fluid">
					<div class="row content">
						<div class="col-sm-9">
							<h1>
								<small>기본 사항</small>
							</h1>
							<div class="row content">
								<div class="col-sm-2">
									<h3 style="padding: 0 10px;">
										<small>이름</small>
									</h3>
									<h3 style="padding: 0 10px;">
										<small>생년월일</small>
									</h3>
									<h3 style="padding: 0 10px;">
										<small>이메일</small>
									</h3>
									<h3 style="padding: 0 10px;">
										<small>핸드폰</small>
									</h3>
									<h3 style="padding: 0 10px;">
										<small>주소</small>
									</h3>
								</div>
								<div class="col-sm-10">
									<h3 style="padding: 0 10px;">
										<input type="text" style="padding: 0 10px;" name="name" value="" placeholder="이름">
									</h3>
									<h3 style="padding: 0 10px;">
										<input type="text" style="padding: 0 10px;" name="birth" value="" placeholder="생년월일">
									</h3>
									<h3 style="padding: 0 10px;">
										<input type="text" style="padding: 0 10px;" name="email" value="" placeholder="이메일">
									</h3>
									<h3 style="padding: 0 10px;">
										<input type="text" style="padding: 0 10px;" name="phone" value="" placeholder="핸드폰">
									</h3>
									<h3 style="padding: 0 10px;">
										<input type="text" style="padding: 0 10px;" name="addr" value="" placeholder="주소">
										<input type="text" style="padding: 0 10px;" name="addr" value="" placeholder="상세주소">
									</h3>
								</div>
							</div>
						</div>
						<div class="col-sm-3 sidenav" style="margin-top: 64px;">
							<img class="img-thumbnail" src="#"
								style="width: 190px; height: 220px;">
						</div>
						
					</div>
				</div>
			</div>
			<div class="col-sm-3 sidenav"></div>
		</div>
	</div>
</form:form>
</body>
</html>