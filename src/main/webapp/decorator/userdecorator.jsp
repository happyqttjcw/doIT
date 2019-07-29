<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title><decorator:title/></title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Nanum+Gothic+Coding|Noto+Sans+KR:100,400|Song+Myung&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/8ee129e7b3.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
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
	function pass_chg() {
		var op ="width=500px, height=300px, top=150px, left=700";
		open("passChgForm.shop","",op);
	}
	
	$(document).ready(function(){
		var link = document.location.href;
		var last = link.lastIndexOf('.shop');
		var start = link.lastIndexOf('/')+1;
		var url = link.substring(start,last);
		if(url == 'userMyPage' || url == 'settingForm' || url == 'editUser' || url == 'userInfo') {
			$('#leftdeco').css('display','');
		} else {
			$('#leftdeco').css('display','none');
		}
	});
</script>
<decorator:head/>
</head>
<body class="w3-theme-l5">
<div class="w3-center" style="height: 100px; padding-top: 10px;"><a href="#" style="font-family: 'Song Myung', serif; font-size:20px; color:#46556d; text-decoration: none;">IT에서 일하자 <span style="font-family: inherit; font-size:40px; font-weight: bold;">doIT</span></a></div>
<div style="height: 100px; background-color: #46556d; padding: 0 300px 0 300px; margin-bottom: 50px;"> 
	 <div style="padding-bottom: 20px; height: 100%;">
		 <div style="height:60px; width:158px; display: inline-block; text-align: center;"><a href="#" style="font-family: 'Noto Sans KR', sans-serif; font-size: 25px; text-decoration: none; color: white;">기업공고</a></div>
		 <div style="height:60px; width:158px; display: inline-block; text-align: center;"><a href="#" style="font-family: 'Noto Sans KR', sans-serif; font-size: 25px; text-decoration: none; color: white;">맞춤 기업</a></div>
		 <div style="height:60px; width:158px; display: inline-block; text-align: center;"><a href="#" style="font-family: 'Noto Sans KR', sans-serif; font-size: 25px; text-decoration: none; color: white;">인재 검색</a></div>
		 <div style="height:60px; width:158px; display: inline-block; text-align: center;"><a href="#" style="font-family: 'Noto Sans KR', sans-serif; font-size: 25px; text-decoration: none; color: white;">자소서 첨삭</a></div>
		 <div style="height:60px; width:158px; display: inline-block;"></div>
		 <div style="height:60px; width:158px; display: inline-block;"></div>
		 <div style="width:158px; display: inline-block; text-align: center;">
		 <c:if test="${sessionScope.loginUser == null }">
		 	<a href="${path }/user/login.shop" style="font-family: 'Noto Sans KR', sans-serif; font-size: 25px; text-decoration: none; color: white;">로그인</a>
		 </c:if>
		 <c:if test="${sessionScope.loginUser != null }">
		 	<a href="#" style="font-family: 'Noto Sans KR', sans-serif; font-size: 25px; text-decoration: none; color: white;">${sessionScope.loginUser.name }님</a>
		 </c:if>
		 </div>
		 <div style="width:158px; display: inline-block; text-align: center;">
		 <c:if test="${sessionScope.loginUser == null }">
		 	<a href="${path }/user/userEntry.shop" style="font-family: 'Noto Sans KR', sans-serif; font-size: 25px; text-decoration: none; color: white;">회원가입</a>
		 </c:if>
		 <c:if test="${sessionScope.loginUser != null }">
		 	<a href="${path }/user/userMyPage.shop?id=${sessionScope.loginUser.id}" style="font-family: 'Noto Sans KR', sans-serif; font-size: 25px; text-decoration: none; color: white;">마이페이지</a>
		 </c:if>
		 </div>
	 </div>
</div>
<div class="w3-top" id="deco" style="height: 50px; background-color:#46556d; display: none;">
		 <div style="width:158px; display: inline-block; padding-left: 30px;"><a href="#" style="font-size:30px; font-weight:bold; color:#ffff; text-decoration: none;">doIT</a></div>
		 <div style="width:158px; display: inline-block; text-align: center;"><a href="recommendcom.shop?userno=${sessionScope.loginUser.userno }" style="font-family: 'Noto Sans KR', sans-serif; font-size: 25px; text-decoration: none; color: white;">기업공고</a></div>
		 <div style="width:158px; display: inline-block; text-align: center;"><a href="#" style="font-family: 'Noto Sans KR', sans-serif; font-size: 25px; text-decoration: none; color: white;">맞춤 기업</a></div>
		 <div style="width:158px; display: inline-block; text-align: center;"><a href="#" style="font-family: 'Noto Sans KR', sans-serif; font-size: 25px; text-decoration: none; color: white;">인재 검색</a></div>
		 <div style="width:158px; display: inline-block; text-align: center;"><a href="#" style="font-family: 'Noto Sans KR', sans-serif; font-size: 25px; text-decoration: none; color: white;">자소서 첨삭</a></div>
		 <div style="width:158px; display: inline-block;"></div>
		 <div style="width:158px; display: inline-block;"></div>
		 <div style="width:158px; display: inline-block;"></div>
		 <div style="width:158px; display: inline-block;"></div>
		 <div style="width:100px; display: inline-block;"></div>
		 <div style="width:100px; display: inline-block;"></div>
		 <div style="width:100px; display: inline-block;"></div>
		 <div style="width:158px; display: inline-block; text-align: center;">
		 <c:if test="${sessionScope.loginUser == null }">
		 	<a href="${path }/user/login.shop" style="font-family: 'Noto Sans KR', sans-serif; font-size: 25px; text-decoration: none; color: white; text-align: center;">로그인</a>
		 </c:if>
		 <c:if test="${sessionScope.loginUser != null }">
		 	<a href="#" style="font-family: 'Noto Sans KR', sans-serif; font-size: 25px; text-decoration: none; color: white; text-align: center;">${sessionScope.loginUser.name }님</a>
		 </c:if>
		 </div>
		 <div style="width:158px; display: inline-block; text-align: center;">
		 <c:if test="${sessionScope.loginUser == null }">
		 	<a href="${path }/user/userEntry.shop" style="font-family: 'Noto Sans KR', sans-serif; font-size: 25px; text-decoration: none; color: white; text-align: center;">회원가입</a>
		 </c:if>
		 <c:if test="${sessionScope.loginUser != null }">
		 	<a href="${path }/user/userMyPage.shop?id=${sessionScope.loginUser.id}" style="font-family: 'Noto Sans KR', sans-serif; font-size: 25px; text-decoration: none; color: white; text-align: center;">마이페이지</a>
		 	<a href="logout.shop" style="font-family: 'Noto Sans KR', sans-serif; font-size: 25px; text-decoration: none; color: white; text-align: center;">로그아웃</a>
		 </c:if>
		 </div>
</div>

<!-- Page Container -->
<div class="w3-container w3-content w3-main" style="max-width:1350px;margin-top:200px;">
  <!-- The Grid -->
  <div class="w3-row" style="" id="leftdeco">
    <!-- Left Column -->
    <div class="w3-col m2 w3-hide-small">    
      <!-- Profile -->
      <div class="w3-card w3-round w3-white" style="width: 300px; padding: 15px 10px 15px 10px;">
        <div style="margin-bottom: 15px; padding-left: 88px;">
        <c:if test="${sessionScope.loginUser.picture == null}"><i class="fas fa-user-circle fa-7x" style="color: #D5D5D5;"></i></c:if>
	    <c:if test="${sessionScope.loginUser.picture != null}"><img src="img/${sessionScope.loginUser.picture }" style="border-radius: 50%;"></c:if>
        </div> <!-- 사진 -->
        <div class="w3-center">
        	<p style="font-family: 'Noto Sans KR', sans-serif; font-size: 15px; color: #747474; margin: 5px 0 5px 0;">${sessionScope.loginUser.name }님</p>
        	<p style="margin: 5px 0 5px 0;"><a href="${path }/user/userInfo.shop?id=${sessionScope.loginUser.id}" style="font-family: 'Noto Sans KR', sans-serif; font-size: 15px; color: #747474; text-decoration: none;">회원정보관리</a></p>
        	<p style="margin: 5px 0 5px 0;"><a href="javascript:pass_chg()" style="font-family: 'Noto Sans KR', sans-serif; font-size: 15px; color: #747474; text-decoration: none;">비밀번호 변경</a></p>
        </div> <!-- 회원 간략 정보 -->
        <div class="w3-center" style="margin-top: 10px;">
        	<a class="w3-button w3-grey" href="${path }/user/settingForm.shop" style="height: 50px; width: 120px; border-radius: 30px; font-family: 'Noto Sans KR', sans-serif; font-size:20px; font-weight: bold;">맞춤 설정</a> 
        </div>
      </div>
      <br>
   </div>
   <br>
  </div>
</div>
 <div class="w3-col m10 w3-container" style="padding-left:30px;">
       <div class="w3-card" style="min-width:500px; max-width:1800px;">
<decorator:body /></div><br><br><br></div>

</body>
</html>