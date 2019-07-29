<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Nanum+Gothic+Coding|Noto+Sans+KR:100,400|Song+Myung|Nanum+Myeongjo&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/8ee129e7b3.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
   function inchk() {
      if ($('#chgpass').val() != $('#chgpass2').val()) {
         alert("비밀번호가 일치하지 않습니다.")
         $('#chgpass2').val("");
         $('#chgpass').val("");
         $('#chgpass2').focus();
         return false;
      }else{
         return true;
      }
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
   text-align: left;
   padding: 15px;
   border: 1px solid #E5E5E5
}
</style>
</head>
<body>
<div class="w3-container" style="margin-bottom: 100px;">
      <div class="w3-panel w3-card">
    <form:form modelAttribute="company" action="compasschg.shop" method="post" onsubmit="return inchk();">
      <form:hidden path="comid"/>      
      <form:hidden path="comno"/>
       <p style="font-size: 30px; text-align: center; color: green;">비밀번호변경</p>
      <table>      
          <tr>
                  <td>현재 비밀번호</td>
                  <td>
                     <form:password path="compass" style="width:400px;"/> 
                     <font color="red"><form:errors path="compass" /></font>
                  </td>
               </tr>
         <tr>
            <td>변경 할 비밀번호</td>
            <td><input type="password" name="chgpass" id="chgpass" style="width:400px;"></td>
         </tr>
         <tr>
            <td>변경 할 비밀번호 확인</td>
            <td><input type="password" name="chgpass2" id="chgpass2" style="width:400px;"></td>
         </tr>
         <tr>
            <td colspan="2" style="text-align: center;"><input type="submit" class="w3-center w3-button w3-round w3-blue w3-medium" style="width: 150px;" value="변경"></td>
         </tr>
      </table>
   </form:form>
   <br>
   </div></div>
</body>
</html>