<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title><decorator:title/></title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html, body, h1, h2, h3, h4, h5 {font-family: sans-serif, "Open Sans"}
</style>
<decorator:head/>
</head>
<body class="w3-theme-l5">

<!-- Navbar -->

<!-- logo -->
<div class="w3-top" >
	<div class="w3-center">
		<span style="color:#46556d; font-size:20px;">IT에서 일하자</span>
		<a href="#" style="color:#46556d; font-size:40px; font-weight:bold; text-decoration: none;">doIT</a>
	</div>  
	<span class="w3-right">
	 </span>
</div>
<!-- End logo -->

<div class="w3-top" style="background-color: #46556d; min-width:100%; margin-top:5%; height:50px;" >
  <a href="#" class="w3-bar-item w3-padding-large w3-margin-top" title="doIT"
  			style="font-size:28px; color:white; font-weight:bold; text-decoration: none; ">
  			<i class="fa fa-home"></i>&nbsp;doIT</a>
  <a href="#" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime"
  			style="text-decoration:none;">공고등록</a>
  <div class="w3-dropdown-hover w3-hide-small">
  <a href="#" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime"
  			style="text-decoration:none;">공고/지원자 관리</a>
    <div class="w3-dropdown-content w3-card-4 w3-bar-block" >
	      <span class="w3-bar-item w3-button">공고 관리</span>
	      <span class="w3-bar-item w3-button">지원자 관리</span>
    </div>
  </div>
  <a href="#" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime"
  				style="text-decoration:none;">인재검색</a>
  <a href="#" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime"
  				style="text-decoration:none;">인재추천</a>
  <a href="#" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime"
  				style="text-decoration:none;">찜한 인재</a>
 
  <a href="#" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime w3-right" 
  		style="font-size:11px; color:#46556d; margin:7px;">회원가입</a>
  <a href="#" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime w3-right" 
  		style="font-size:11px; color:#46556d; margin:7px;">로그인</a>
  <a href="#" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime w3-right" 
  			style="font-size:11px; color:#46556d; margin:7px;">로그아웃</a>
  <a href="#" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime w3-right" 
  			style="font-size:11px; color:#46556d; margin:7px;">마이페이지</a>
  <a class="w3-bar-item w3-hide-small w3-padding-small w3-text-lime w3-right"
  			style="font-size:11px; color:#46556d; margin:7px;">기업 회원 님</a>
  
 </div>
<!-- End Navbar -->
<br><br><br>
<div class = "w3-main">
<div style="margin-top: 200px;"><decorator:body/></div>
</div>
</body>
</html>