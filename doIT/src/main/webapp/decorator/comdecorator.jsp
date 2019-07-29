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
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Nanum+Gothic+Coding|Noto+Sans+KR:100,400|Song+Myung|Nanum+Myeongjo&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/8ee129e7b3.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
html, body, h1, h2, h3, h4, h5 {font-family: 'Noto Sans KR', sans-serif;  }
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
  
   function passchg() { 
      open("../com/compasschg.shop","passchg","width=700, height=450, left=100, top=50"); 
      }

   
</script>
<style type="text/css">
body{
   min-width:1500px;
}
</style>
<decorator:head/>
</head>
<body class="w3-theme-l5">
<div class="w3-center w3-top" style="height: 100px; padding-top: 10px;">
   <a href="commypage.shop?comid=${sessionScope.logincom.comid }" style="font-size:20px; color:#46556d; text-decoration: none;">IT���� ������<span style="font-size:40px; font-weight: bold;">doIT</span></a>
</div>
<div class="w3-top" id="deco1" style="background-color: #46556d; min-width:500px; margin-top:5%; height:80px; padding: 0 30px 0 30px; " >
  <div style="margin-top:20px;">
     <a href="writejobform.shop?comid=${sessionScope.logincom.comid }" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime"
              style="text-decoration:none; font-size:20px;">���� ���</a>
     <div class="w3-dropdown-hover w3-hide-small">
         <a href="#" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime"
                  style="text-decoration:none; font-size:20px;">����/������ ����</a>
         <div class="w3-dropdown-content w3-card-4 w3-bar-block" style="margin-top:5px;" >
            <span class="w3-bar-item w3-button"><a href="joblist.shop" style="text-decoration:none;">���� ����</a></span>
            <span class="w3-bar-item w3-button">������ ����</span>
         </div>
     </div>
     <a href="searchuser.shop" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime"
                 style="text-decoration:none; font-size:20px;">����˻�</a>
     <a href="recommenduser.shop?comno=${sessionScope.logincom.comno }" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime"
                 style="text-decoration:none; font-size:20px;">������õ</a>
     <a href="#" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime"
                 style="text-decoration:none; font-size:20px;">���� ����</a>
    
      <c:choose>
             <c:when test="${empty logincom }">
              <a href="comEntry.shop" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime w3-right"
                          style="text-decoration:none; font-size:20px;">ȸ������</a>
            <a href="comLogin.shop" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime w3-right"
                          style="text-decoration:none; font-size:20px;">�α���</a>
           </c:when>
           <c:otherwise>
            <a href="logout.shop" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime w3-right"
                        style="text-decoration: none; font-size: 20px;">�α׾ƿ�</a>
               <a href="commypage.shop?comid=${sessionScope.logincom.comid }" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime w3-right"
                          style="text-decoration:none; font-size:20px;">����������</a>
         </c:otherwise>
     </c:choose>
     <a href="#" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime w3-right"
                 style="text-decoration:none; font-size:20px;">��� ȸ�� ����</a>
   </div>
</div>

<div class="w3-top" id="deco2" style="background-color: #46556d; min-width:500px; height:80px; display:none;" >
   <div style="margin-top:18px;">
      <a href="#" class="w3-bar-item w3-padding-large w3-margin-top" title="doIT"
               style="font-size:28px; color:white; font-weight:bold; text-decoration: none; ">
               <i class="fa fa-home"></i>&nbsp;doIT</a>
       <a href="writejobform.shop?comid=${sessionScope.logincom.comid }" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime"
                 style="text-decoration:none; font-size:20px;">���� ���</a>
        <div class="w3-dropdown-hover w3-hide-small">
            <a href="#" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime"
                     style="text-decoration:none; font-size:20px;">����/������ ����</a>
            <div class="w3-dropdown-content w3-card-4 w3-bar-block" style="margin-top:5px;" >
               <span class="w3-bar-item w3-button"><a href="joblist.shop" style="text-decoration:none;">���� ����</a></span>
               <span class="w3-bar-item w3-button">������ ����</span>
            </div>
        </div>
        <a href="searchuser.shop" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime"
                    style="text-decoration:none; font-size:20px;">����˻�</a>
        <a href="recommenduser.shop?comno=${sessionScope.logincom.comno }" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime"
                    style="text-decoration:none; font-size:20px;">������õ</a>
        <a href="#" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime"
                    style="text-decoration:none; font-size:20px;">���� ����</a>
        <c:choose>
             <c:when test="${empty logincom }">
              <a href="comEntry.shop" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime w3-right"
                          style="text-decoration:none; font-size:20px;">ȸ������</a>
            <a href="comLogin.shop" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime w3-right"
                          style="text-decoration:none; font-size:20px;">�α���</a>
           </c:when>
           <c:otherwise>
            <a href="logout.shop" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime w3-right"
                        style="text-decoration: none; font-size: 20px;">�α׾ƿ�</a>
               <a href="commypage.shop" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime w3-right"
                          style="text-decoration:none; font-size:20px;">����������</a>
         </c:otherwise>
        </c:choose>
        <a href="#" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime w3-right"
                    style="text-decoration:none; font-size:20px;">��� ȸ�� ����</a>
     </div>
</div>

<!-- Page Container -->
<div class="w3-container w3-content w3-main" style="max-width:1350px;margin-top:200px;">    
  <!-- The Grid -->
  <div class="w3-row">
    <!-- Left Column -->
    <div class="w3-col m2 w3-hide-small">
      <!-- Profile -->
      <div class="w3-card w3-round w3-white" style="margin-top:25px;">
         <br>
         <p class="w3-center">
            <img src="../img/bonobono.jpg" class="w3-circle" style="height:106px;width:106px">
        </p>
        <div class="w3-center">
           <div class="w3-text-green">${sessionScope.logincom.comname } ��</div><br>
           <a href="comdetail.shop?comid=${sessionScope.logincom.comid }">��� ���� ����</a><br><br>
           <a href="setting.shop?comno=${sessionScope.logincom.comno }">��� ���� ����</a><br><br>
           <a href="#"  onclick="passchg();">��й�ȣ ����</a><br><br>
           <a href="writejobform.shop" class="w3-center w3-button w3-round w3-blue w3-medium" >���� ���</a>
        
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
         <decorator:body />
      </div><br><br><br>
   </div>
   <!-- End Middle Column -->
  </div>
</div>

</body>
</html>