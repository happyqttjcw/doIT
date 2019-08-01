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
<title>기업 마이페이지</title>
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
         <p style="font-size: 30px; color: green;">기업 기본정보</p>
         <table
            style="border: 1px solid black; border-left: none; border-right: none;">
            <tr>
               <td style="background-color: #E5E5E5; width: 20%;">기업이름 :</td>
               <td style="width: 80%;">${com.comname }</td>
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
         <br><br>
      </div>
   </div>
   <br>
   <div class="w3-container">
      <div class="w3-panel w3-card">
         <a href="joblist.shop" style="text-decoration:none;font-size: 30px; color: green;">공고관리</a>
         <c:if test="${!empty job }">
            <c:forEach var="job1" items="${job }">
               <div class="w3-container">
                  <div class="w3-panel w3-card">
                     <table>
                        <tr>
                           <td><a href="jobdetail.shop?jobno=${job1.jobno }&comno=${job1.comno}">제목 : ${job1.subject }</a></td>
                        </tr>
                        <tr>
                           <td><a href="jobdetail.shop?jobno=${job1.jobno }&comno=${job1.comno}">공고기한 : ${job1.startdate } ~ ${job1.enddate }</a></td>
                        </tr>
                     </table>
                  </div>
               </div>
            </c:forEach>
         </c:if>
         <c:if test="${empty job }">
            <hr>
            등록된 공고가 없습니다.
         </c:if>
         <br>
         <br>
      </div>
   </div>
   <br>
   <div class="w3-container" style="margin-bottom: 100px;">
      <div class="w3-panel w3-card">
         <p style="font-size: 30px; color: green;">찜한 인재</p>
         <c:if test="${!empty pulist }">
            <c:forEach var="p" items="${pulist }">
                  <div class="w3-container">
                     <div class="w3-panel w3-card">
                        <table>
                           <tr>
                              <td rowspan="2" class="w3-center">
                              	 <img style="width: 100px; height: 130px;" src="${path }/curriImg/${p.cv.picture }"></td>
                              <td colspan="2" width="20%">이름 : ${p.user.name }</td>
                              <td rowspan="2" width="60%">
                                 <div><a href="myCurriculumDetail.shop?cvno=${p.cv.cvno }">자소서제목 : ${p.cv.subject }</a></div>
                                 <div>최종학력 : ${p.cv.school }</div>
                                 <div>희망연봉 : ${p.cv.cdtsalary }</div>
                                 <div>지역 : ${p.cv.addr }</div>
                              </td>
                           </tr>
                           <tr>
                              <td>${p.user.gender == 1?'남':'여' }</td>
                              <td>${p.user.age }세</td>
                           </tr>
                        </table>
                     </div>
                  </div>
               </c:forEach>
      
         </c:if>
         <c:if test="${empty pulist }">
            <hr>
            	찜한 인재가 없습니다.
         </c:if>
         <br>
         <br>
      </div>
   </div>
   
</body>
</html>