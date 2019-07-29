<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인 화면</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Nanum+Gothic+Coding|Noto+Sans+KR:100,400|Song+Myung|Nanum+Myeongjo&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/8ee129e7b3.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script type="text/javascript">
  /*  $(document).ready(function() {
      $("#minfo").show();
      $("#oinfo").hide();
      $(".saleLine").each(function() { // 주문상품 목록 숨김.
         $(this).hide();
      })
      $("#tab1").addClass("select"); //class 속성에 select 값을 추가.
   }) */
   function disp_div(id, tab) {
      $(".info").each(function() {
         $(this).hide();
      })
      $(".tab").each(function() {
         $(this).removeClass("select");
      })
      $("#" + id).show();
      $("#" + tab).addClass("select");
   }
   function list_disp(id) {
      $("#" + id).toggle(); //
   }
   
   function userlogincheck(){
      if($('#userid').val()==''){
         alert('아이디를 입력하세요.');
         return false;
      }
      else if($('#userpass').val()==''){
         alert('비밀번호를 입력하세요.');
         return false;
      }else
      return true;
   }
      
   function comlogincheck(){
      if($('#comid').val()==''){
         alert('아이디를 입력하세요.');
         return false;
      }
      else if($('#compass').val()==''){
         alert('비밀번호를 입력하세요.');
         return false;
      }else
      return true;
   }
   
   
</script>
<style type="text/css">
body, tr, td, th {
   font-family: 'Noto Sans KR', sans-serif;
   font-size: 18px;
}

table {
   border-collapse: collapse;
   width: 100%;
}

th, td {
   text-align: center;
   padding: 15px;
   border: 1px solid #E5E5E5
}
.select {
   background-color: #46556d;
}

.select>a {
   color: white;
   text-decoration: none;
}
</style>
</head>

<body style="padding-top:5%;">
<header class="w3-container w3-center"> 
  <h1><b>Do IT</b></h1>
  <p>IT전문 구인구직 site <span class="w3-tag w3-#46556d" >DoIT</span></p>
</header>
<div class="w3-container w3-center w3-centered" style="margin-left:30%;">
    <div class="w3-container w3-center w3-centered" style="margin-bottom: 100px;">
     <div class="w3-panel w3-card " style="width: 700px;">
    <p style="font-size: 30px; color: #46556d;">사용자로그인</p>
   <table>
      <tr>
         <td id="tab1" class="tab w3-center" style="width:50%; background-color:#46556d; color:white;">
         <a href="${path }/user/userLogin.shop" class="w3-block" style="width:50%; text-decoration:none; margin:auto;">일반 회원</a></td>      
         <td id="tab2" class="tab w3-center" style="width:50%;">
         <a href="${path }/com/comLogin.shop" class="w3-block" style="width:50%; text-decoration:none; margin:auto;">기업 회원</a></td>
      </tr>
   </table>   

   <form:form modelAttribute="user" method="post" action="userLogin.shop" onsubmit="return userlogincheck()">
      <table id="minfo" class="info" border="1" style="border-collapse: collapse;">
         <tr>
            <td>일반 아이디</td>
            <td><form:input path="id" style="width:500px;" id="userid"/> 
            <font color="red"><form:errors path="id" /></font></td>
         </tr>
         <tr>
            <td>비밀번호</td>
            <td><form:password path="pass" style="width:500px;" id="userpass"/>
            <font color="red"><form:errors path="pass" /></font></td>
         </tr>
      <tr>
      <td colspan="2" style="padding-top:0px; padding-bottom:0px;">
      <table>
          <tr>
         <td class="w3-center" style="border:1px;">
            <input type="submit" class="w3-center w3-button" style="width: 200px;" value="로그인">
         </td>
         <td class="w3-center" style="border:0px;">
<<<<<<< HEAD
            <input type="button" class="w3-center w3-button" style="width: 200px;" value="회원가입" onclick="location.href='../user/userEntry.shop'">      
=======
            <input type="button" class="w3-center w3-button" style="width: 200px;" value="회원가입" onclick="location.href='${path}/user/userEntry.shop'">      
>>>>>>> refs/remotes/CGH/CGH
         </td>
      </tr>
      </table>
      </td>
      </tr>
      </table>      
   </form:form>
   <br><br>
   </div></div>
</div>
</body>
</html>