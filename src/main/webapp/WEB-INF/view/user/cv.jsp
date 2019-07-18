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
$(document).ready(function(){
	$("#minfo").show();
	$("#oinfo").hide();
	$(".saleLine").each(function(){ // �ֹ���ǰ ��� ����.
		$(this).hide();
	})
	$("#tab1").addClass("select"); //class �Ӽ��� select ���� �߰�.
})
function disp_div(id,tab){
	$(".info").each(function(){
		$(this).hide();
	})
	$(".tab").each(function(){
		$(this).removeClass("select");
	})
	$("#"+id).show();
	$("#" + tab).addClass("select");
}
function list_disp(id){
	$("#"+id).toggle(); //
}
</script>
<style type="text/css">
	.select{
		padding:3px;
		text-decoration:none; font-weight:bold;
		background-color:#46556d;
	}
	.select>a{color:white;}
	
	table {
   width : 100%;
   border-collapse: collapse;
	}
	th,td { border-bottom: 1px solid #c1c1c1;
   			text-align: center;
   			padding : 8px;
   	}
	th {background-color: #46556d; color : white;}
	td {background-color:#ffffff;}
	caption {
  	 color : #111111; font-size:20px;
   	background-color: #FFFFFF;
	}
	input[type=text],input[type=password],textarea {
  	 width : 80%;
		}
	input[type=button],input[type=submit] {
  		 w3-button; w3-teal; w3-rigth;
	}
.login {
   	border: solid 0px #000000;
  	 background-color:#ffffff;
}
.button {
  	 border-radius: 5px; 
   	background-color: #de8f72;
  	 color: white;
   }
   

   html,body{
  		height:100%;
}
 	element{
 	width:60%;
 	}
	
</style>
</head>
<body>
<h2 style="padding-top:30px; padding-left:50%;">�̷¼� �ۼ�</h2>
<form:form modelAttribute="cv" method="post" action="cv.shop">
	<table border="1" style="border-collapse:collapse; padding:5%">
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
	<table border="1" style="border-collapse:collapse; padding:5%">
		<tr height="40px" style="padding:5%;"><td>�����з�</td><td>
		<select name="school">
		<option>����</option>
		<option>����(2,3��)</option>
		<option>����(4��)</option>
		<option>���п�(����)</option>
		<option>���п�(�ڻ�)</option>
		</select></td></tr>
		<tr height="40px" style="padding:5%;"><td>�б���</td><td><form:input path="schoolname"/></td></tr>
		<tr height="40px" style="padding:5%;"><td>����</td><td><form:input path="schoollocation"/></td></tr>
		<tr height="40px" style="padding:5%;"><td>����</td><td><form:input path="major"/></td></tr>
		<tr height="40px" style="padding:5%;"><td>�б���</td><td><form:input path="schoolname"/></td></tr>
		<tr height="40px" style="padding:5%;"><td>��/�߰�</td><td>
		<select name="daynight">
		<option>�ְ�</option>
		<option>�߰�</option>
		</select></td></tr>
		<tr height="40px" style="padding:5%;"><td>����</td><td><form:input path="score"/></td></tr>
	</table>
	<table >
	<tr><td id="tab1" class="tab">
		<a href="javascript:disp_div('minfo','tab1')">����</a></td>
		<td id="tab2" class="tab">
		<a href="javascript:disp_div('oinfo','tab2')">���</a></td>
	</tr>
	</table>
	<table id="minfo" class="info" border="1" style="border-collapse:collapse;">
	</table>
	<table id="oinfo" class="info" border="1" style="border-collapse:collapse;">
		<tr height="40px" style="padding:5%;"><td>ȸ���</td><td><form:input path="ename"/></td></tr>
		<tr height="40px" style="padding:5%;"><td>�����Ⱓ</td><td>
		<select name="workstart">
			<c:forEach var=i begin="1960" end="2019">
				<c:forEach var=o begin="1" end="12">
				<option>i</option>�� <option>o</option>��
				</c:forEach>
			</c:forEach>
		</select>
		<tr height="40px" style="padding:5%;"><td>��� ����</td><td><form:input path="reason"/></td></tr>
		<tr height="40px" style="padding:5%;"><td>��� ����</td><td><form:input path="position"/></td>
		<td>����</td><td>
		<select name="pyear">
			<c:forEach var=i begin="1" end="20">
			<option>i</option>
			</c:forEach>
		</select>
		</td></tr>
		<tr height="40px" style="padding:5%;"><td>����</td><td><form:input path="worktype"/></td></tr>
		<tr height="40px" style="padding:5%;"><td>�ٹ� ����</td><td><form:input path="worklocation"/></td></tr>
		<tr height="40px" style="padding:5%;"><td>�ٹ� �μ�</td><td><form:input path="dept"/></td></tr>
		<tr height="40px" style="padding:5%;"><td>����</td><td><form:input path="salary"/></td></tr>
		<tr height="40px" style="padding:5%;"><td>��� ����</td><td><form:input path="task"/></td></tr>
		<tr><td colspan="2"><input type="button" value="�߰�" onclick</td></tr>
		<tr height="40px" style="padding:5%;"><td>�� ���
		
		
	</table>
	
</form:form>

</body>
</html>