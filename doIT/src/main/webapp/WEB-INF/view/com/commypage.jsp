<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>

<html>
<head>
<link
   href="https://fonts.googleapis.com/css?family=Do+Hyeon|Nanum+Gothic+Coding|Noto+Sans+KR:100,400|Song+Myung&display=swap"
   rel="stylesheet">
<meta charset="EUC-KR">
<title>��� ����������</title>
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
         <p style="font-size: 30px; color: green;">��� �⺻����</p>
         <table
            style="border: 1px solid black; border-left: none; border-right: none;">
            <tr>
               <td style="background-color: #E5E5E5; width: 20%;">����̸� :</td>
               <td style="width: 80%;">${com.comname }</td>
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
         <br><br>
      </div>
   </div>
   <br>
   <div class="w3-container">
      <div class="w3-panel w3-card">
         <a href="joblist.shop" style="text-decoration:none;font-size: 30px; color: green;">�������</a>
         <c:if test="${!empty job }">
            <c:forEach var="job1" items="${job }">
               <div class="w3-container">
                  <div class="w3-panel w3-card">
                     <table>
                        <tr>
                           <td><a href="jobdetail.shop?jobno=${job1.jobno }&comno=${job1.comno}">���� : ${job1.subject }</a></td>
                        </tr>
                        <tr>
                           <td><a href="jobdetail.shop?jobno=${job1.jobno }&comno=${job1.comno}">������� : ${job1.startdate } ~ ${job1.enddate }</a></td>
                        </tr>
                     </table>
                  </div>
               </div>
            </c:forEach>
         </c:if>
         <c:if test="${empty job }">
            <hr>
            ��ϵ� ���� �����ϴ�.
         </c:if>
         <br>
         <br>
      </div>
   </div>
   <br>
   <div class="w3-container" style="margin-bottom: 100px;">
      <div class="w3-panel w3-card">
         <p style="font-size: 30px; color: green;">���� ����</p>
         <c:if test="${!empty pulist }">
            <c:forEach var="p" items="${pulist }">
                  <div class="w3-container">
                     <div class="w3-panel w3-card">
                        <table>
                           <tr>
                              <td rowspan="2" class="w3-center">
                              	 <img style="width: 100px; height: 130px;" src="${path }/curriImg/${p.cv.picture }"></td>
                              <td colspan="2" width="20%">�̸� : ${p.user.name }</td>
                              <td rowspan="2" width="60%">
                                 <div><a href="myCurriculumDetail.shop?cvno=${p.cv.cvno }">�ڼҼ����� : ${p.cv.subject }</a></div>
                                 <div>�����з� : ${p.cv.school }</div>
                                 <div>������� : ${p.cv.cdtsalary }</div>
                                 <div>���� : ${p.cv.addr }</div>
                              </td>
                           </tr>
                           <tr>
                              <td>${p.user.gender == 1?'��':'��' }</td>
                              <td>${p.user.age }��</td>
                           </tr>
                        </table>
                     </div>
                  </div>
               </c:forEach>
      
         </c:if>
         <c:if test="${empty pulist }">
            <hr>
            	���� ���簡 �����ϴ�.
         </c:if>
         <br>
         <br>
      </div>
   </div>
   
</body>
</html>