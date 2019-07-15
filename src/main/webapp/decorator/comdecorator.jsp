<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title><decorator:title/></title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://kit.fontawesome.com/8ee129e7b3.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
html, body, h1, h2, h3, h4, h5 {font-family: sans-serif, "Open Sans"}
</style>
<script>
   $(window).scroll(function() {
     if($(this).scrollTop() >= 200) {
        $('#deco').css("display","");
     }
     else {
        $('#deco').css("display","none");
     }
   });
</script>
<decorator:head/>
</head>
<body class="w3-theme-l5">
<div class="w3-center" style="height: 100px; padding-top: 10px;"><a href="#" style="font-size:20px; color:#46556d; text-decoration: none;">IT에서 일하자<span style="font-size:40px; font-weight: bold;">doIT</span></a></div>
<div style="height: 100px; background-color: #46556d; padding: 0 300px 0 300px; margin-bottom: 50px;"> 
    <div style="padding-bottom: 20px; height: 100%;">
       <div style="height:60px; width:158px; display: inline-block;"><a href="#" style="font-size: 25px; text-decoration: none; color: white;">기업공고</a></div>
       <div style="height:60px; width:158px; display: inline-block;"><a href="#" style="font-size: 25px; text-decoration: none; color: white;">맞춤 기업</a></div>
       <div style="height:60px; width:158px; display: inline-block;"><a href="#" style="font-size: 25px; text-decoration: none; color: white;">인재 검색</a></div>
       <div style="height:60px; width:158px; display: inline-block;"><a href="#" style="font-size: 25px; text-decoration: none; color: white;">자소서 첨삭</a></div>
       <div style="height:60px; width:158px; display: inline-block;"></div>
       <div style="height:60px; width:158px; display: inline-block;"></div>
       <div style="height:60px; width:158px; display: inline-block;"><a href="#" style="font-size: 25px; text-decoration: none; color: white;">로그인</a></div>
       <div style="height:60px; width:158px; display: inline-block;"><a href="#" style="font-size: 25px; text-decoration: none; color: white;">마이페이지</a></div>
    </div>
</div>
<div class="w3-top" id="deco" style="height: 50px; background-color:#46556d; display: none;">
       <div style="width:158px; display: inline-block; padding-left: 30px;"><a href="#" style="font-size:30px; font-weight:bold; color:#ffff; text-decoration: none;">doIT</a></div>
       <div style="width:158px; display: inline-block;"><a href="#" style="font-size: 25px; text-decoration: none; color: white;">기업공고</a></div>
       <div style="width:158px; display: inline-block;"><a href="#" style="font-size: 25px; text-decoration: none; color: white;">맞춤 기업</a></div>
       <div style="width:158px; display: inline-block;"><a href="#" style="font-size: 25px; text-decoration: none; color: white;">인재 검색</a></div>
       <div style="width:158px; display: inline-block;"><a href="#" style="font-size: 25px; text-decoration: none; color: white;">자소서 첨삭</a></div>
       <div style="width:158px; display: inline-block;"></div>
       <div style="width:158px; display: inline-block;"></div>
       <div style="width:158px; display: inline-block;"></div>
       <div style="width:158px; display: inline-block;"></div>
       <div style="width:100px; display: inline-block;"></div>
       <div style="width:158px; display: inline-block;"><a href="#" style="font-size: 25px; text-decoration: none; color: white;">로그인</a></div>
       <div style="width:158px; display: inline-block;"><a href="#" style="font-size: 25px; text-decoration: none; color: white;">마이페이지</a></div>
</div>

<!-- Page Container -->
<div class="w3-container w3-content" style="max-width:1350px;margin-top:50px;">    
  <!-- The Grid -->
  <div class="w3-row">
    <!-- Left Column -->
    <div class="w3-col m2 w3-hide-small">
      <!-- Profile -->
      <div class="w3-card w3-round w3-white">
        <h1>왼쪽 카드</h1>
      </div>
      <br>
      <!-- End Profile -->
	</div>
	<br>
    <!-- End Left Column -->
   
	<!-- Middle,Right Column -->
    <div class="w3-col m8" style="min-width:500px;">
		<decorator:body />
	</div>
    </div>
	<!-- End Middle Column -->
</div>
</body>
</html>