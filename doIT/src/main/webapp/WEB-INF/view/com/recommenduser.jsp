<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="skills" value="${fn:split(comset.skill,',')}"/>
<c:set var="welfares" value="${fn:split(comset.welfare,',')}"/>
<c:set var="pluses" value="${fn:split(comset.pluse,',')}"/>
<c:set var="locations" value="${fn:split(comset.location,',')}"/>
<c:set var="jobs" value="${fn:split(comset.job,',')}"/>
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
   <h3 class="w3-left">${com.comname } ���� �����Ͻ� ���� �����Դϴ�.</h3><br>
   <a href="setting.shop?comno=${com.comno }" class="w3-button w3-blue w3-round w3-right" style="font-size:12px;">�����ϱ�</a> <br><br>
   <div style="border:1px solid #778899; border-radius: 10px;" id="setlike">
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
   
   <h3>ȸ���԰� ���� Ȯ���� ��Ī�� <font color="blue" style="font-weight:bold;">��õ����</font></h3>
   <c:forEach var="ru" items="${recomUser }">
   		<div>${ru }</div>
   </c:forEach>
</div>
<br><br>
</body>
</html>