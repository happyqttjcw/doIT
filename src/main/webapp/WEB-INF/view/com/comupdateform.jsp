<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>기업정보수정</title>
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

<script>
$(function(){
   $('#year').change(function(){
      $('#a').html('');
         
      var year = parseInt($('#year').val());
      var ahtml = $("#a").html();
      for(var j=0; j<year; j++){
         var t = "<input type='text' id='"+(j+1)+"' style='margin-top:5px; margin-bottom:5px;'><br>";
         $(t).appendTo('#a');
      }
   });
});

function salesavg(){
   var year = parseInt($('#year').val());
   var tot = 0;
   for(var i=0; i<year; i++){
      var id = "#"+(i+1)
      tot += parseInt($(id).val())
   }
   var avg= parseInt(tot/parseInt($('#year').val()));
   $('#comsales').val(avg);
};

function salesreset(){
   $('#a > input').val('');
   $('#comsales').val('');
}


</script>
</head>
<body>
   <div class="w3-container" style="margin-bottom: 100px;">
      <div class="w3-panel w3-card">
         <p style="font-size: 30px; color: green;">기업정보수정</p>
         <form:form modelAttribute="company" action="comupdateform.shop" method="post">
            <spring:hasBindErrors name="company">
               <font color="red"> <c:forEach items="${errors.globalErrors}"
                     var="error">
                     <spring:message code="${error.code}" />
                  </c:forEach></font>
            </spring:hasBindErrors>
            
            <table>
               <tr>
                  <td style="width: 25%">기업 ID</td>
                  <td style="width: 75%"><form:input path="comid" readonly="true" /> 
                  <font color="red"><form:errors path="comid" /></font></td>
               </tr>
               <tr>
                  <td>비밀번호</td>
                  <td>
                     <form:password path="compass" /> 
                     <font color="red"><form:errors path="compass" /></font>
                  </td>
               </tr>
               <tr>
                  <td>기업이름</td>
                  <td><form:input path="comname" />
                  <font color="red"><form:errors path="comname" /></font>
               </td>
               </tr>
               <tr>
                  <td>브랜드명칭</td>
                  <td><form:input path="combrand" /> 
                  <font color="red"><form:errors path="combrand" /></font></td>
               </tr>
               <tr>
                  <td>사업자등록번호</td>
                  <td><form:input path="bussno" />
                  <font color="red"><form:errors path="bussno" /></font></td>
               </tr>
               <tr>
                  <td>회사지역</td>
                  <td><form:input path="comaddr" /> 
                  <font color="red"><form:errors path="comaddr" /></font></td>
               </tr>
               <tr>
                  <td>담당자 이름</td>
                  <td><form:input path="managername" /> 
                  <font color="red"><form:errors path="managername" /></font></td>
               </tr>
               <tr>
                  <td>담당자 전화</td>
                  <td><form:input path="managerphone" /> 
                  <font color="red"><form:errors path="managerphone" /></font></td>
               </tr>
               <tr>
                  <td>담당자 이메일</td>
                  <td><form:input path="manageremail" /> 
                  <font color="red"><form:errors path="manageremail" /></font></td>
               </tr>
               <tr>
                  <td>업종</td>
                  <td>
                     <select name="comtype">
                        <option value = "선택하세요">선택하세요</option>                     
                     <c:forEach items="${upjong}" var="uj" varStatus="stat">
                        <option value="${uj}">${uj}</option>         
                           </c:forEach>
                           </select>
                           <font color="red"><form:errors path="comtype" /></font>
                        </td>
               </tr>
               <tr>
                  <td>기업분류</td>
                  <td>
                     <select name="comsize" >
                        <option value = "선택하세요">선택하세요</option>
                        <option value = "중소기업">중소기업</option>
                        <option value = "중견기업">중견기업</option>
                        <option value = "대기업">대기업</option>
                     </select> 
                     <font color="red"><form:errors path="comsize" /></font>
                  </td>
               </tr>
               <tr>
                  <td>사원수</td>
                  <td><form:input path="comstaffnum" /> <font color="red"><form:errors
                           path="comstaffnum" /></font></td>
               </tr>
            
               <tr>
                  <td rowspan="2">평균매출액</td>
                  <td><select id="year" name="year" style="margin-bottom:5px;">
                        <option value = "선택하세요">선택하세요</option>
                        <option value = "1">1년</option>
                        <option value = "2">2년</option>
                        <option value = "3">3년</option>
                        <option value = "4">4년</option>
                        <option value = "5">5년</option>
                  </select>
                  <div id="a"></div>
                  <div>
                     <a href="javascript:salesavg()" class="w3-center w3-button w3-round w3-blue w3-medium" style="margin-top:5px; width:100px;" >입력</a>
                     <a href="javascript:salesreset()" class="w3-center w3-button w3-round w3-blue w3-medium" style="margin-top:5px; width:100px;" >초기화</a>
                  </div>
                  
                  </td></tr>
               <tr>
                  <td><form:input path="comsales" id="comsales" /> 
                  <font color="red"><form:errors path="comsales" /></font></td>
               </tr>
               <tr>
                  <td>회사창립일</td>
                  <td><form:input path="combirth" id="combirth" placeholder="ex)1988-05-02"/> 
                  <font color="red"><form:errors path="combirth" /></font></td>
               </tr>
               <tr>
                  <td>담당자 한줄소개</td>
                  <td><form:textarea path="comcontent" style="width:700px; height:100px;"/> <font color="red"><form:errors
                           path="comcontent" /></font></td>
               </tr>
               <tr>
                  <td>복리후생</td>
                  <td><c:forEach items="${welfare}" var="wel" varStatus="stat">
                        <input type="checkbox" value="${wel}" name="comwelfare">${wel}
                  </c:forEach> <font color="red"><form:errors path="comwelfare" /></font></td>
               </tr>
               <tr>
                  <td>URL</td>
                  <td><form:input path="comhomepage" /> <font color="red"><form:errors
                           path="comhomepage" /></font></td>
               </tr>
               
            </table>
               <br>
                  <div class="w3-center">
                     <input type="submit" class="w3-center w3-button w3-round w3-blue w3-medium" style="width: 150px;" value="수정">    
                  </div>
               <br>
         </form:form>
      </div>
   </div>
</body>
</html>