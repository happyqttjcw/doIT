<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>나의 자소서</title>
</head>
<body>
<div class="container-fluid" style="margin-bottom: 30px;">
<div class="row content">
<div class="col-sm-3"></div>
<div class="col-sm-6">
<form:form action="resumeUpdate.shop" modelAttribute="resume" method="post">
   <input type="hidden" name="userno" value="${resume.userno }">
   <input type="hidden" name="resumeno" value="${resume.resumeno }">
   <input type="hidden" name="cvno" value="${resume.cvno }">
   <input type="hidden" name="jemokno" value="${resume.jemokno }">
   <div class="row content w3-card">
      <div class="col-sm-12" style="border-bottom: 1px #d6d6d6 solid;">
         <input type="text" class="form-control" name="rsubject" placeholder="제목을 입력하세요" value="${resume.rsubject }"  style="height: 60px; padding: 0 25px; border-style: none;">
      </div>
      <div class="col-sm-12">
         <textarea class="form-control" name="rcontent" style="resize: none; min-height: 500px; padding: 15px 25px; border-style:none;">${resume.rcontent }</textarea>
      </div>
      <div class="col-sm-12">
         <input type="submit" value="수정하기" class="btn btn-secondary" style="float: right;">
      </div>
   </div>   
</form:form>
</div>
<div class="col-sm-3"></div>
</div>
</div>
</body>
</html>