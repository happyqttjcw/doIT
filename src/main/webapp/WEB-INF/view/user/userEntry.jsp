<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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
 <div class="w3-container w3-center" style="margin-bottom: 100px;margin-left:30%;">
 <div class="w3-panel w3-card" style="width: 700px;">
    <p style="font-size: 30px; color: #46556d;">회원가입</p>
   <table>
      <tr>
         <td id="tab1" class="tab"><a
            href="javascript:disp_div('minfo','tab1')">일반 회원</a></td>
         <td id="tab2" class="tab"><a
            href="javascript:disp_div('oinfo','tab2')">기업 회원</a></td>
      </tr>
   </table>
   <form:form modelAttribute="user" method="post" action="../user/userEntry.shop">
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
   </form:form>

   <form:form modelAttribute="company" action="companyEntry.shop">
      <spring:hasBindErrors name="company">
         <font color="red"> 
         <c:forEach items="${errors.globalErrors}" var="error">
         <spring:message code="${error.code}"/>
         </c:forEach></font>
      </spring:hasBindErrors>
      
      <table id="oinfo" class="info" border="1" style="border-collapse: collapse;">
         <tr>
            <td style="width:25%">기업 ID</td>
            <td style="width:75%"><form:input path="comid"/>
             <font color="red"><form:errors path="comid"/></font></td>
         </tr>
         <tr>
            <td>비밀번호</td>
            <td><form:password path="compass"/> 
            <font color="red"><form:errors path="compass"/></font></td>
         </tr>
         <tr>
            <td>기업명</td>
            <td><form:input path="comname"/>
            <font color="red"><form:errors path="comname"/></font></td>
         </tr>
         <tr>
            <td>사업자등록번호</td>
            <td><form:input path="bussno"/>
            <font color="red"><form:errors path="bussno"/></font></td>
         </tr>
         <tr>
            <td>담당자</td>
            <td><form:input path="managername"/>
            <font color="red"><form:errors path="managername"/></font></td>
         </tr>
         <tr>
            <td>핸드폰 번호</td>
            <td><form:input path="managerphone"/>
            <font color="red"><form:errors path="managerphone"/></font></td>
         </tr>
         <tr>
            <td>이메일</td>
            <td><form:input path="manageremail"/> 
            <font color="red"><form:errors path="manageremail"/></font></td>
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
      </td>
      </tr>
      </table>   
   </form:form><br>
   	<span>이미 회원이세요?&nbsp;&nbsp;<a href="login.shop" style="color:#0000ff;">로그인</a>하기</span>
   <br><br>
   </div></div>
   
</body>
</html>