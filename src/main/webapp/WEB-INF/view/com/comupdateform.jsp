<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�����������</title>
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
         <p style="font-size: 30px; color: green;">�����������</p>
         <form:form modelAttribute="company" action="comupdateform.shop" method="post">
            <spring:hasBindErrors name="company">
               <font color="red"> <c:forEach items="${errors.globalErrors}"
                     var="error">
                     <spring:message code="${error.code}" />
                  </c:forEach></font>
            </spring:hasBindErrors>
            
            <table>
               <tr>
                  <td style="width: 25%">��� ID</td>
                  <td style="width: 75%"><form:input path="comid" readonly="true" /> 
                  <font color="red"><form:errors path="comid" /></font></td>
               </tr>
               <tr>
                  <td>��й�ȣ</td>
                  <td>
                     <form:password path="compass" /> 
                     <font color="red"><form:errors path="compass" /></font>
                  </td>
               </tr>
               <tr>
                  <td>����̸�</td>
                  <td><form:input path="comname" />
                  <font color="red"><form:errors path="comname" /></font>
               </td>
               </tr>
               <tr>
                  <td>�귣���Ī</td>
                  <td><form:input path="combrand" /> 
                  <font color="red"><form:errors path="combrand" /></font></td>
               </tr>
               <tr>
                  <td>����ڵ�Ϲ�ȣ</td>
                  <td><form:input path="bussno" />
                  <font color="red"><form:errors path="bussno" /></font></td>
               </tr>
               <tr>
                  <td>ȸ������</td>
                  <td><form:input path="comaddr" /> 
                  <font color="red"><form:errors path="comaddr" /></font></td>
               </tr>
               <tr>
                  <td>����� �̸�</td>
                  <td><form:input path="managername" /> 
                  <font color="red"><form:errors path="managername" /></font></td>
               </tr>
               <tr>
                  <td>����� ��ȭ</td>
                  <td><form:input path="managerphone" /> 
                  <font color="red"><form:errors path="managerphone" /></font></td>
               </tr>
               <tr>
                  <td>����� �̸���</td>
                  <td><form:input path="manageremail" /> 
                  <font color="red"><form:errors path="manageremail" /></font></td>
               </tr>
               <tr>
                  <td>����</td>
                  <td>
                     <select name="comtype">
                        <option value = "�����ϼ���">�����ϼ���</option>                     
                     <c:forEach items="${upjong}" var="uj" varStatus="stat">
                        <option value="${uj}">${uj}</option>         
                           </c:forEach>
                           </select>
                           <font color="red"><form:errors path="comtype" /></font>
                        </td>
               </tr>
               <tr>
                  <td>����з�</td>
                  <td>
                     <select name="comsize" >
                        <option value = "�����ϼ���">�����ϼ���</option>
                        <option value = "�߼ұ��">�߼ұ��</option>
                        <option value = "�߰߱��">�߰߱��</option>
                        <option value = "����">����</option>
                     </select> 
                     <font color="red"><form:errors path="comsize" /></font>
                  </td>
               </tr>
               <tr>
                  <td>�����</td>
                  <td><form:input path="comstaffnum" /> <font color="red"><form:errors
                           path="comstaffnum" /></font></td>
               </tr>
            
               <tr>
                  <td rowspan="2">��ո����</td>
                  <td><select id="year" name="year" style="margin-bottom:5px;">
                        <option value = "�����ϼ���">�����ϼ���</option>
                        <option value = "1">1��</option>
                        <option value = "2">2��</option>
                        <option value = "3">3��</option>
                        <option value = "4">4��</option>
                        <option value = "5">5��</option>
                  </select>
                  <div id="a"></div>
                  <div>
                     <a href="javascript:salesavg()" class="w3-center w3-button w3-round w3-blue w3-medium" style="margin-top:5px; width:100px;" >�Է�</a>
                     <a href="javascript:salesreset()" class="w3-center w3-button w3-round w3-blue w3-medium" style="margin-top:5px; width:100px;" >�ʱ�ȭ</a>
                  </div>
                  
                  </td></tr>
               <tr>
                  <td><form:input path="comsales" id="comsales" /> 
                  <font color="red"><form:errors path="comsales" /></font></td>
               </tr>
               <tr>
                  <td>ȸ��â����</td>
                  <td><form:input path="combirth" id="combirth" placeholder="ex)1988-05-02"/> 
                  <font color="red"><form:errors path="combirth" /></font></td>
               </tr>
               <tr>
                  <td>����� ���ټҰ�</td>
                  <td><form:textarea path="comcontent" style="width:700px; height:100px;"/> <font color="red"><form:errors
                           path="comcontent" /></font></td>
               </tr>
               <tr>
                  <td>�����Ļ�</td>
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
                     <input type="submit" class="w3-center w3-button w3-round w3-blue w3-medium" style="width: 150px;" value="����">    
                  </div>
               <br>
         </form:form>
      </div>
   </div>
</body>
</html>