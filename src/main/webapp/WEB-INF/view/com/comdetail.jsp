<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>기업정보관리</title>
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
   <div class="w3-container">
      <div class="w3-panel w3-card">
         <h2>기업정보관리</h2>
         <table>   
      <tr>
         <td rowspan="2"><div class="w3-panel w3-card w3-center">
         <img style="width: 200px; height: 250px;" src="../img/bonobono.jpg"></div></td>   
         <td rowspan="2" width="70%">
            <div>기업이름 : ${com.comname }</div>
            <div>브랜드이름 : ${com.combrand }</div>
            <div>대표이름 : ${com.comboss }</div>
            <div>대표전화 : ${com.comphone }</div>
            <div>주소: ${com.comaddr }</div>
            <div>상세 주소: ${com.comaddr }</div>
         </td>
      </tr>
      </table>
      <br><br>
      </div>
      <br><br>
   </div>

</body>
</html>