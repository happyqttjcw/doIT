<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>기업상세정보</title>
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
         <p style="font-size: 30px; color: green;">기업상세정보</p>
         <table>
            <tr>
               <td rowspan="2"><div class="w3-panel w3-card w3-center">
                     <img style="width: 200px; height: 250px;" src="${path }/comImg/${com.compic }">
                  </div></td>
               <td rowspan="2" width="70%">
                  <table
                     style="border: 1px solid black; border-left: none; border-right: none;">
                     <tr>
                        <td style="background-color: #E5E5E5; width: 20%;">기업이름 :</td>
                        <td style="width: 80%;">${com.comid }</td>
                     </tr>
                     <tr>
                        <td style="background-color: #E5E5E5; width: 20%;">브랜드명칭 :</td>
                        <td>${com.combrand }</td>
                     </tr>
                     <tr>
                        <td style="background-color: #E5E5E5; width: 20%;">대표자명 :</td>
                        <td>${com.managername }</td>
                     </tr>
                     <tr>
                        <td style="background-color: #E5E5E5; width: 20%;">지역 :</td>
                        <td>${com.comaddr }</td>
                     </tr>
                     <tr>
                        <td style="background-color: #E5E5E5; width: 20%;">업종 :</td>
                        <td>${com.comtype }</td>
                     </tr>
                  </table>
               </td>
            </tr>
         </table>
         <table style="border: 1px solid black; border-left: none; border-right: none;">
            <tr>
               <td style="background-color: #E5E5E5; width: 20%;">담당자이름 :</td>
               <td style="width: 80%;">${com.managername }</td>
            </tr>
            <tr>
               <td style="background-color: #E5E5E5; width: 20%;">담당자전화 :</td>
               <td style="width: 80%;">${com.managerphone }</td>
            </tr>
            <tr>
               <td style="background-color: #E5E5E5; width: 20%;">담당자이메일 :</td>
               <td style="width: 80%;">${com.manageremail }</td>
            </tr>
            <tr>
               <td style="background-color: #E5E5E5; width: 20%;">기업분류 :</td>
               <td style="width: 80%;">${com.comsize }</td>
            </tr>
            <tr>
               <td style="background-color: #E5E5E5; width: 20%;">사원수 :</td>
               <td>${com.comstaffnum }</td>
            </tr>
            <tr>
               <td style="background-color: #E5E5E5; width: 20%;">설립일 :</td>
               <td>${com.combirth }</td>
            </tr>
            <tr>
               <td style="background-color: #E5E5E5; width: 20%;">평균매출액 :</td>
               <td>${com.comsales }</td>
            </tr>
            <tr>
               <td style="background-color: #E5E5E5; width: 20%;">한줄소개 :</td>
               <td>${com.comcontent }</td>
            </tr>
            <tr>
               <td style="background-color: #E5E5E5; width: 20%;">복리후생 :</td>
               <td>${com.comwelfare }</td>
            </tr>
            <tr>
               <td style="background-color: #E5E5E5; width: 20%;">URL :</td>
               <td>${com.comhomepage }</td>
            </tr>
         </table>
         <br>
         <div class="w3-center">
            <a href="comupdateform.shop?comid=${com.comid }" class="w3-center w3-button w3-round w3-blue w3-medium" style="width: 150px;"> 회원정보수정</a>&nbsp; 
            <a href="comdeleteform.shop?comid=${com.comid }" class="w3-center w3-button w3-round w3-blue w3-medium" style="width: 150px;">회원탈퇴</a>&nbsp;
         </div>
         <br>
      </div>
   </div>
</body>
</html>