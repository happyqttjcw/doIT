<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/addressapi.js"></script>
<script type="text/javascript">
function win_upload(){
	var op = "width=500, height=150, left=50, top=150";
	open("pictureimgform.jsp","",op);
}
function execPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
          
           var extraRoadAddr = '';
           if(data.bname !== '' && /[��|��|��]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
         .
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
     
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
       
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }

         
           console.log(data.zonecode);
           console.log(fullRoadAddr);
           
           document.getElementById('addr1').value = data.zonecode; //5�ڸ� �������ȣ ���
           document.getElementById('addr2').value = fullAddr;
        
       }
    }).open();
}
</script>
</head>
<body>
<h2 style="padding-top:30px; padding-left:50%;">�̷¼� �ۼ�</h2>
<form:form modelAttribute="cv" method="post" action="cv.shop">
	<table border="1" style="border-collapse:collapse;">
				<tr><td rowspan="4" valign="middle">
					<img src="" width="100" height="120" id="pic"><br>
					<hr>
					<font size="1">
					<a href="javascript:win_upload()" style="color:black">�������</a></font></td></tr>
		<tr height="40px" style="padding:5%;"><td>�̸�</td><td>${sessionScope.loginUser.name}</td></tr>
		<tr height="40px" style="padding:5%;"><td>�������</td><td><form:input path="birth"/></td></tr>
		<tr height="40px" style="padding:5%;"><td>�̸���</td><td>${sessionScope.loginUser.email}</td></tr>
		<tr height="40px" style="padding:5%;"><td>�ڵ���</td><td>${sessionScope.loginUser.phone}</td></tr>
		<tr height="40px" style="padding:5%;"><td>�ּ�</td><td><form:input path="arr1"/></td>
		<td><input type="button" value="�ּ��� ã��" onclick="execPostCode();"></td></tr>
		<tr height="40px"><td>�� �ּ�</td><td><form:input path="arr2"/></td></tr>
		
		
		
	</table>
</form:form>
</body>
</html>