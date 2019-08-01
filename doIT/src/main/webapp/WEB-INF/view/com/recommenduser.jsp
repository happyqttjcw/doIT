<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ��õ</title>
<style type="text/css">
#setlike{
   color:#778899;
   font-size:20px;
   font-weight:bold;
}
</style>
</head>
<body>
<div class="w3-container w3-center">
<h1 style="color:green;">doIT ��õ</h1><br><br>
  <c:if test="${!empty comset }">
   <h3 class="w3-left">${com.comname } ���� �����Ͻ� ���� �����Դϴ�.</h3><br>
   <a href="setting.shop?comno=${com.comno }" class="w3-button w3-blue w3-round w3-right" style="font-size:12px;">�����ϱ�</a> <br><br>
   <div style="border:1px solid #778899; border-radius: 10px;" id="setlike">
    <c:set var="skills" value="${fn:split(comset.skill,',')}" />
	<c:set var="welfares" value="${fn:split(comset.welfare,',')}" />
	<c:set var="pluses" value="${fn:split(comset.pluse,',')}" />
	<c:set var="locations" value="${fn:split(comset.location,',')}" />
	<c:set var="jobs" value="${fn:split(comset.job,',')}"/>
      <div style="margin:25px;">
         <c:forEach var="s" items="${skills }" varStatus="stat">
	      <c:if test="${s != '' }">
            #${s }&nbsp;&nbsp;
	      </c:if>
         </c:forEach>
         <c:forEach var="w" items="${welfares }" varStatus="stat">
     	  <c:if test="${w != '' }">
            #${w }&nbsp;&nbsp;
          </c:if>
         </c:forEach>
         <c:forEach var="p" items="${pluses }" varStatus="stat">
      	  <c:if test="${p != '' }">     
            #${p }&nbsp;&nbsp;
          </c:if>  
         </c:forEach>
         <c:forEach var="l" items="${locations }" varStatus="stat">
	      <c:if test="${l != '' }">
            #${l }&nbsp;&nbsp;
    	  </c:if>
         </c:forEach>
         <c:forEach var="j" items="${jobs }" varStatus="stat">
     	  <c:if test="${j != '' }">
            #${j }&nbsp;&nbsp;
     	  </c:if>
         </c:forEach>
      </div>
   </div><br><br>
   <h3 style="text-align:left;">ȸ���԰� ���� Ȯ���� ��Ī�� <font color="blue" style="font-weight:bold;">��õ����</font></h3><br>
   <c:forEach var="cv" items="${viewcv }" varStatus="stat">
   		<div class="w3-card">
   		<table class="w3-table">
          <tr>
          	 <td rowspan="2" style="width:3%;"><br><br>
	          	 <c:if test="${cv.pu.pickuserno==0 }">
	          	 	<a href="addpickuser.shop?comno=${com.comno }&cvno=${cv.cvno}" onclick="return addpickuser()">
	          	 	<i class="fa fa-star-o" id="${stat.index }" style="font-size:15px; text-align: center;" ></i></a>
	          	 </c:if>
	          	 <c:if test="${cv.pu.pickuserno!=0 }">
	          	 	<a href="delpickuser.shop?comno=${com.comno }&cvno=${cv.cvno}" onclick="return delpickuser()">
	          	 	<i class="fa fa-star checked" id="fullstar${stat.index }" style="font-size:15px; text-align: center; color:orange;"></i></a>
	          	 </c:if></td>
             <td rowspan="2" class="w3-center"><img style="width: 100px; height: 130px;" src="${path }/curriImg/${cv.picture }"></td>
             <td colspan="2" width="20%" style="font-size:25px;">${cv.user.name }</td>
             <td rowspan="2" width="60%" style="margin:10px;">
                <a href="myCurriculumDetail.shop?cvno=${cv.cvno }">�ڼҼ����� : ${cv.subject }</a>
                <div>�����з� : ${cv.school }</div>
                <div>������� : ${cv.cdtsalary }</div>
                <div>���� : ${cv.addr }</div>
             </td>
          </tr>
          <tr>
             <td>${cv.user.gender == 1?'��':'��' }</td>
             <td>${cv.user.age }��</td>
          </tr>
       	</table>
       	</div><br>
   </c:forEach>
   </c:if>
   <c:if test="${empty comset }">
   		<h3>���� ���� ������ �����ϴ�.</h3>
   		<a href="setting.shop?comno=${com.comno }" class="w3-button w3-blue w3-round w3-center" style="font-size:12px;">�����ϱ�</a> <br><br>
   </c:if>
   
</div>
<br><br>
</body>
</html>