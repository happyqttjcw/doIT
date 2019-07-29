<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<<<<<<< HEAD
<title><decorator:title/></title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Nanum+Gothic+Coding|Noto+Sans+KR:100,400|Song+Myung&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/8ee129e7b3.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script   src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<style>
html, body, h1, h2, h3, h4, h5 {font-family: 'Noto Sans KR', sans-serif;}
</style>
<script>
$(window).scroll(function() {
    if($(this).scrollTop() >= 170) {
       $('#deco1').css("display","none");
       $('#deco2').css("display","");
    }
    else {
       $('#deco1').css("display","");
       $('#deco2').css("display","none");
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
	
	$(document).ready(function() {
	      $('#dropdown').hover(function() {
	         $('.dropdown-menu').addClass('show');
	      }, function() {
	         $('.dropdown-menu').removeClass('show');
	      });
	   });
=======
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><decorator:title/></title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Nanum+Gothic+Coding|Noto+Sans+KR:100,400|Song+Myung&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/8ee129e7b3.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script   src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
>>>>>>> refs/remotes/CGH/CGH

<<<<<<< HEAD
</script>
<decorator:head/>
</head>
<body class="w3-theme-l5">
<div class="w3-center w3-top" style="height: 100px; padding-top: 10px;">
   <a href="${path }/user/userMyPage.shop?userno=${sessionScope.loginUser.userno }" style="font-size:20px; color:#46556d; text-decoration: none;">IT에서 일하자<span style="font-size:40px; font-weight: bold;">doIT</span></a>
</div>
<div class="w3-top" id="deco1" style="background-color: #46556d; min-width:500px; margin-top:5%; height:80px; padding: 0 30px 0 30px; " >
  <div style="margin-top:20px;">
  	<a href="#" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime" style="text-decoration:none; font-size:20px;" id="dropdown">기업 공고</a>
  	<a href="#" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime" style="text-decoration:none; font-size:20px;">맞춤 기업</a>
  	<a href="#" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime" style="text-decoration:none; font-size:20px;">인재 검색</a>
  	<a href="${path }/board/resumeBoard.shop" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime" style="text-decoration:none; font-size:20px;">자소서 첨삭</a>
    <c:choose>
    	<c:when test="${empty loginUser }">
       	    <a href="userEntry.shop" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime w3-right" style="text-decoration:none; font-size:20px;">회원가입</a>
            <a href="userLogin.shop" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime w3-right" style="text-decoration:none; font-size:20px;">로그인</a>
        </c:when>
        <c:otherwise>
            <a href="logout.shop" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime w3-right" style="text-decoration: none; font-size: 20px;">로그아웃</a>
            <a href="${path }/user/userMyPage.shop?userno=${sessionScope.loginUser.userno }" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime w3-right" style="text-decoration:none; font-size:20px;">마이페이지</a>
        </c:otherwise>
    </c:choose>
    <span style="font-size:20px;" class="w3-bar-item w3-hide-small w3-padding-small w3-text-lime w3-right">일반 회원 서비스</span>
	</div>
</div>

<div class="w3-top" id="deco2" style="background-color: #46556d; min-width:500px; height:80px; display:none;" >
   <div style="margin-top:18px;">
   	<a href="#" class="w3-bar-item w3-padding-large w3-margin-top" title="doIT" style="font-size:28px; color:white; font-weight:bold; text-decoration: none; "><i class="fa fa-home"></i>&nbsp;doIT</a>
  	<a href="#" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime" style="text-decoration:none; font-size:20px;" id="dropdown">기업 공고</a>
  	<a href="#" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime" style="text-decoration:none; font-size:20px;">맞춤 기업</a>
  	<a href="#" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime" style="text-decoration:none; font-size:20px;">인재 검색</a>
  	<a href="${path }/board/resumeBoard.shop" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime" style="text-decoration:none; font-size:20px;">자소서 첨삭</a>
    <c:choose>
    	<c:when test="${empty loginUser }">
       	    <a href="userEntry.shop" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime w3-right" style="text-decoration:none; font-size:20px;">회원가입</a>
            <a href="userLogin.shop" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime w3-right" style="text-decoration:none; font-size:20px;">로그인</a>
        </c:when>
        <c:otherwise>
            <a href="logout.shop" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime w3-right" style="text-decoration: none; font-size: 20px;">로그아웃</a>
            <a href="${path }/user/userMyPage.shop?userno=${sessionScope.loginUser.userno }" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime w3-right" style="text-decoration:none; font-size:20px;">마이페이지</a>
        </c:otherwise>
    </c:choose>
	<span style="font-size:20px;" class="w3-bar-item w3-hide-small w3-padding-small w3-text-lime w3-right">일반 회원 서비스</span>
	</div>
</div>

 <decorator:body />
=======
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
html, body, h1, h2, h3, h4, h5 {font-family: 'Noto Sans KR', sans-serif;}
</style>
<script>
$(window).scroll(function() {
    if($(this).scrollTop() >= 170) {
       $('#deco1').css("display","none");
       $('#deco2').css("display","");
    }
    else {
       $('#deco1').css("display","");
       $('#deco2').css("display","none");
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
   
   $(document).ready(function() {
         $('#dropdown').hover(function() {
            $('.dropdown-menu').addClass('show');
         }, function() {
            $('.dropdown-menu').removeClass('show');
         });
      });

</script>
<decorator:head/>
</head>
<body class="w3-theme-l5">
<div class="w3-center w3-top" style="height: 100px; padding-top: 10px;">
   <a href="${path }/user/userMyPage.shop?userno=${sessionScope.loginUser.userno }" style="font-size:20px; color:#46556d; text-decoration: none;">IT에서 일하자<span style="font-size:40px; font-weight: bold;">doIT</span></a>
</div>
<div class="w3-top" id="deco1" style="background-color: #46556d; min-width:500px; margin-top:5%; height:80px; padding: 0 30px 0 30px; " >
  <div style="margin-top:20px;">
     <a href="#" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime" style="text-decoration:none; font-size:20px;" id="dropdown">기업 공고</a>
     <a href="#" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime" style="text-decoration:none; font-size:20px;">맞춤 기업</a>
     <a href="#" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime" style="text-decoration:none; font-size:20px;">인재 검색</a>
     <a href="${path }/board/resumeBoard.shop" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime" style="text-decoration:none; font-size:20px;">자소서 첨삭</a>
    <c:choose>
       <c:when test="${empty loginUser }">
              <a href="userEntry.shop" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime w3-right" style="text-decoration:none; font-size:20px;">회원가입</a>
            <a href="userLogin.shop" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime w3-right" style="text-decoration:none; font-size:20px;">로그인</a>
        </c:when>
        <c:otherwise>
            <a href="logout.shop" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime w3-right" style="text-decoration: none; font-size: 20px;">로그아웃</a>
            <a href="${path }/user/userMyPage.shop?userno=${sessionScope.loginUser.userno }" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime w3-right" style="text-decoration:none; font-size:20px;">마이페이지</a>
        </c:otherwise>
    </c:choose>
    <span style="font-size:20px;" class="w3-bar-item w3-hide-small w3-padding-small w3-text-lime w3-right">일반 회원 서비스</span>
   </div>
</div>

<div class="w3-top" id="deco2" style="background-color: #46556d; min-width:500px; height:80px; display:none; z-index: 100;" >
   <div style="margin-top:18px;">
      <a href="#" class="w3-bar-item w3-padding-large w3-margin-top" title="doIT" style="font-size:28px; color:white; font-weight:bold; text-decoration: none; "><i class="fa fa-home"></i>&nbsp;doIT</a>
     <a href="#" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime" style="text-decoration:none; font-size:20px;" id="dropdown">기업 공고</a>
     <a href="#" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime" style="text-decoration:none; font-size:20px;">맞춤 기업</a>
     <a href="#" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime" style="text-decoration:none; font-size:20px;">인재 검색</a>
     <a href="${path }/board/resumeBoard.shop" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime" style="text-decoration:none; font-size:20px;">자소서 첨삭</a>
    <c:choose>
       <c:when test="${empty loginUser }">
              <a href="userEntry.shop" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime w3-right" style="text-decoration:none; font-size:20px;">회원가입</a>
            <a href="userLogin.shop" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime w3-right" style="text-decoration:none; font-size:20px;">로그인</a>
        </c:when>
        <c:otherwise>
            <a href="logout.shop" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime w3-right" style="text-decoration: none; font-size: 20px;">로그아웃</a>
            <a href="${path }/user/userMyPage.shop?userno=${sessionScope.loginUser.userno }" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime w3-right" style="text-decoration:none; font-size:20px;">마이페이지</a>
        </c:otherwise>
    </c:choose>
   <span style="font-size:20px;" class="w3-bar-item w3-hide-small w3-padding-small w3-text-lime w3-right">일반 회원 서비스</span>
   </div>
</div>
<div style="margin-top: 210px;">
<decorator:body />
</div>
>>>>>>> refs/remotes/CGH/CGH
   <div class="" style="height: 200px; background-color: #EAEAEA; padding: 30px 300px 20px 300px;">
      <a href="#" style="font-size: 20px; text-decoration: none; color: #8C8C8C;">고객센터
         <span style="font-size: 15px; color: #8C8C8C;">(QnA 게시판 및 관리자  채팅)</span></a>
   </div>
</body>
</html>