<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���������</title>
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
         <p style="font-size: 30px; color: green;">���������</p>
         <table>
            <tr>
               <td rowspan="2"><div class="w3-panel w3-card w3-center">
                     <img style="width: 200px; height: 250px;" src="${path }/comImg/${com.compic }">
                  </div></td>
               <td rowspan="2" width="70%">
                  <table
                     style="border: 1px solid black; border-left: none; border-right: none;">
                     <tr>
                        <td style="background-color: #E5E5E5; width: 20%;">����̸� :</td>
                        <td style="width: 80%;">${com.comid }</td>
                     </tr>
                     <tr>
                        <td style="background-color: #E5E5E5; width: 20%;">�귣���Ī :</td>
                        <td>${com.combrand }</td>
                     </tr>
                     <tr>
                        <td style="background-color: #E5E5E5; width: 20%;">��ǥ�ڸ� :</td>
                        <td>${com.managername }</td>
                     </tr>
                     <tr>
                        <td style="background-color: #E5E5E5; width: 20%;">���� :</td>
                        <td>${com.comaddr }</td>
                     </tr>
                     <tr>
                        <td style="background-color: #E5E5E5; width: 20%;">���� :</td>
                        <td>${com.comtype }</td>
                     </tr>
                  </table>
               </td>
            </tr>
         </table>
         <table style="border: 1px solid black; border-left: none; border-right: none;">
            <tr>
               <td style="background-color: #E5E5E5; width: 20%;">������̸� :</td>
               <td style="width: 80%;">${com.managername }</td>
            </tr>
            <tr>
               <td style="background-color: #E5E5E5; width: 20%;">�������ȭ :</td>
               <td style="width: 80%;">${com.managerphone }</td>
            </tr>
            <tr>
               <td style="background-color: #E5E5E5; width: 20%;">������̸��� :</td>
               <td style="width: 80%;">${com.manageremail }</td>
            </tr>
            <tr>
               <td style="background-color: #E5E5E5; width: 20%;">����з� :</td>
               <td style="width: 80%;">${com.comsize }</td>
            </tr>
            <tr>
               <td style="background-color: #E5E5E5; width: 20%;">����� :</td>
               <td>${com.comstaffnum }</td>
            </tr>
            <tr>
               <td style="background-color: #E5E5E5; width: 20%;">������ :</td>
               <td>${com.combirth }</td>
            </tr>
            <tr>
               <td style="background-color: #E5E5E5; width: 20%;">��ո���� :</td>
               <td>${com.comsales }</td>
            </tr>
            <tr>
               <td style="background-color: #E5E5E5; width: 20%;">���ټҰ� :</td>
               <td>${com.comcontent }</td>
            </tr>
            <tr>
               <td style="background-color: #E5E5E5; width: 20%;">�����Ļ� :</td>
               <td>${com.comwelfare }</td>
            </tr>
            <tr>
               <td style="background-color: #E5E5E5; width: 20%;">URL :</td>
               <td>${com.comhomepage }</td>
            </tr>
         </table>
         <br>
         <div class="w3-center">
            <a href="comupdateform.shop?comid=${com.comid }" class="w3-center w3-button w3-round w3-blue w3-medium" style="width: 150px;"> ȸ����������</a>&nbsp; 
            <a href="comdeleteform.shop?comid=${com.comid }" class="w3-center w3-button w3-round w3-blue w3-medium" style="width: 150px;">ȸ��Ż��</a>&nbsp;
         </div>
         <br>
      </div>
   </div>
</body>
</html>