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
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Nanum+Gothic+Coding|Noto+Sans+KR:100,400|Song+Myung|Nanum+Myeongjo&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/8ee129e7b3.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<title>사용자 등록</title>
<script type="text/javascript">
   $(document).ready(function() {
      $("#minfo").show();
      $("#oinfo").hide();
      $(".saleLine").each(function() { // 주문상품 목록 숨김.
         $(this).hide();
      })
      $("#tab1").addClass("select"); //class 속성에 select 값을 추가.
   })
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
<body>
<header class="w3-container w3-center"> 
  <h1><b>Do IT</b></h1>
  <p>IT전문 구인구직 site <span class="w3-tag w3-#46556d" >DoIT</span></p>
</header>
 <div class="w3-container w3-center" style="margin-bottom: 100px;margin-left:30%;">
 <div class="w3-panel w3-card" style="width: 700px;">
    <p style="font-size: 30px; color: #46556d;">회원가입</p>
   <table>
      <tr>
         <td id="tab1" class="tab" style="background-color:#46556d; color:white;">
         <a href="${path }/user/userEntry.shop">일반 회원</a>
         <!-- <a href="javascript:disp_div('minfo','tab1')">일반 회원</a> --></td>
         <td id="tab2" class="tab">
         <a href="${path }/com/comEntry.shop">기업 회원</a>
         <!-- <a href="javascript:disp_div('oinfo','tab2')">기업 회원</a> --></td>
      </tr>
   </table>
   <form:form modelAttribute="user" method="post" action="userEntry.shop">
      <spring:hasBindErrors name="user"><font color="red"> 
      <c:forEach items="${errors.globalErrors}" var="error">
      <spring:message code="${error.code}"/>
      </c:forEach></font>
      </spring:hasBindErrors>
      
      <table id="minfo" class="info" border="1" style="border-collapse: collapse;">
         <tr>
            <td style="width:25%">아이디</td>
            <td style="width:75%"><form:input path="id"/> 
            <font color="red"><form:errors path="id"/></font></td>
         </tr>
         <tr>
            <td>비밀번호</td>
            <td><form:password path="pass"/> 
            <font color="red"><form:errors path="pass"/></font></td>
         </tr>
         <tr>
            <td>이름</td>
            <td><form:input path="name"/> 
            <font color="red"><form:errors path="name"/></font></td>
         </tr>
         <tr>
            <td>전화번호</td>
            <td><form:input path="phone"/> 
            <font color="red"><form:errors path="phone"/></font></td>
         </tr>
         <tr>
            <td>나이</td>
            <td><form:input path="age"/>
            <font color="red"><form:errors path="age"/></font></td>
         </tr>
         <tr>
            <td>이메일</td>
            <td><form:input path="email"/>
            <font color="red"><form:errors path="email"/></font></td>
         </tr>
         <tr>
            <td>성별</td>
            <td><form:radiobutton path="gender" value="1" checked="checked"/>남자
               <form:radiobutton path="gender" value="2"/>여자 
               <font color="red"><form:errors path="gender" /></font></td>
         </tr>
      <tr>
      <td colspan="2" style="padding-top:0px; padding-bottom:0px;">
      <table>
         <tr>
            <td class="w3-center" style="border:1px;">
               <input type="submit" class="w3-center w3-button" style="width: 200px;" value="등록">
            </td>
            <td class="w3-center" style="border:0px;">
               <input type="reset" class="w3-center w3-button" style="width: 200px;" value="초기화">      
            </td>
         </tr>
      </table>
      </table>
   </form:form><br>
      <span>이미 회원이세요?&nbsp;&nbsp;<a href="userLogin.shop" style="color:#0000ff;">로그인</a>하기</span>
   <br><br>
   </div></div>
   
</body>
</html>