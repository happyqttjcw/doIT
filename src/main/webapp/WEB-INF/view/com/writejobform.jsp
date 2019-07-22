<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��� ���� ���</title>
<style type="text/css">
#title {
	font-family:'Noto Sans KR', sans-serif;
	padding-left: 10px; 
	font-size: 30px; 
	color: #333c; 
	text-align:left;
}
hr{
	height: 1px;
  	color: #333c;
  	background-color: #333c;
  	border: none;
}
table {
	border:0.1px solid #333c;
	max-width: 80%;
	margin-left: 10%;
}
table td{
	width:20%;
}
input,select{
	margin:5px;
}
</style>
<script type="text/javascript">
function addrecruit() {
		$('#rtable').clone().appendTo('#rtable-container');
		$('#rtable-container > #rtable:last-child').attr("id","rtable-add");
		$('#rtable-add:last-child input').val('');
		$('<br>').appendTo("#rtable-container")
}
function delrecruit(b) {
	var cnt = $('#rtable-container').children('table').length;
	if(cnt == 1){
		alert('�ּ� �� �� �̻��� �����䰭�� �Է��ϼ���.');
	}else{
		$(b).closest('table').remove();
	}
}
</script>
</head>

<body>

<div class="w3-container w3-center" style="min-width: 1000px;"><br>
<h1>� ���縦 ���� ��ȹ�̼���?</h1>
<br>
<form:form modelAttribute="job" method="post" action="writejob.shop" onsubmit="">
	<spring:hasBindErrors name="job">
		<font color="red"> <c:forEach items="${errors.globalErrors}" var="error">
				<spring:message code="${error.code}" />
			</c:forEach>
		</font>
	</spring:hasBindErrors>
	<span id="title">��������&nbsp;&nbsp;</span>
		<form:input path="subject" style="width:500px; height:40px;"/>
		<font color="red"><form:errors path="subject" /></font>
	<br><br><br>
	<div id="title">�����䰭</div>
	<hr>
	<div class="w3-container  " id="rtable-container">
		<table id="rtable" class="w3-center" >
		<tr><td>����/����</td><td>
			<select name="field" style="width:400px; height:40px;">
				<c:forEach items="${joblist}" var="jobs" varStatus="stat">
					<option value="${jobs }" <c:if test="${stat.index == 0 }"> selected="selected"</c:if>>${jobs }</option>
				</c:forEach>
			</select>
			<font color="red"><form:errors path="field" /></font></td></tr>
		<tr><td>�����ο�</td><td>
			<input type="text" name="num" style="width:100px; height:40px;">
			<font color="red"><form:errors path="num" /></font>��</td></tr>
		<tr><td>������</td><td>
			<input type="text" name="task" style="width:400px; height:200px;">
			<font color="red"><form:errors path="task" /></font></td></tr>
		<tr><td>�ٹ��μ�</td><td>
			<input type="text" name="dept" style="width:400px; height:40px;">
			<font color="red"><form:errors path="dept" /></font></td></tr>
		<tr><td>����/��å</td><td>
			<input type="text" name="position" style="width:400px; height:40px;">
			<font color="red"><form:errors path="position" /></font></td></tr>
		<tr><td colspan="2">
			<a href="javascript:addrecruit()" class="w3-button w3-blue" id="abutton">+�߰�</a>
			<div class="w3-button w3-blue" id="dbutton" onclick="delrecruit(this)">-����</div>		  
</td></tr>
 		</table><br>
	</div><br>
	
	<div id="title">�ڰݿ�� �� �������</div>
	<hr>
	<div class="w3-container w3-center w3-centered" id="condition-container">
	<table id="condition" class="w3-center" >
		<tr><td>�з�</td><td>
			<select name="education" style="width:400px; height:40px;">
				<c:forEach items="${education}" var="edu" varStatus="stat">
					<option value="${edu }" <c:if test="${stat.index == 0 }"> selected="selected"</c:if>>${edu }</option>
				</c:forEach>
			</select>
			<font color="red"><form:errors path="education" /></font></td></tr>
		<tr><td>IT��������</td><td>
			<input type="radio" checked="checked" value="����" name="major">����&nbsp;&nbsp;
			<input type="radio" value="������" name="major">������
			<font color="red"><form:errors path="major" /></font></td></tr>
		<tr><td>�������</td><td>
			<div style="w3-center">
			<input type="checkbox" value="�ش����� �ٹ�����" name="likecdt">�ش����� �ٹ�����&nbsp;&nbsp;	
			<input type="checkbox" value="�αٰ�����" name="likecdt" >�αٰ�����&nbsp;&nbsp;<br>
			<input type="checkbox" value="������޴ɷ���" name="likecdt">������޴ɷ���&nbsp;&nbsp;
			<input type="checkbox" value="����������" name="likecdt">����������&nbsp;&nbsp;</div>
			<font color="red"><form:errors path="likecdt" /></font></td></tr>
		<tr><td>�ܱ���</td><td>
			<c:forEach items="${language }" var="lang" varStatus="stat">
        		<input type="checkbox" name="language" value="${lang }">${lang }
        		<c:if test="${stat.count%5==0 }"><br></c:if>
         	</c:forEach>
			<font color="red"><form:errors path="language" /></font></td></tr>
		<tr><td>�䱸���</td><td>
			<c:forEach items="${skill }" var="skill" varStatus="stat">
        		<input type="checkbox" name="skill" value="${skill }">${skill }
        		<c:if test="${stat.count%5==0 }"><br></c:if>
         	</c:forEach>
			<font color="red"><form:errors path="skill" /></font></td></tr>
		<tr><td>��� ����</td><td>
			<select name="gender">
				<option value="��������">��������
				<option value="����">����
				<option value="����">����
			</select>
			<font color="red"><form:errors path="gender" /></font></td></tr>
		<tr><td>��� ����</td><td>
			<input type="radio" checked="checked" value="���ɹ���" name="age-check">���ɹ���&nbsp;&nbsp;
			<input type="radio" value="����" name="age-check" id="a">����
			<div id="ab"></div>
			<script>
				$(document).change(function(){
					var h = '<input type="text" name="startage" style="width:100px;"> ~ <input type="text" name="endage" style="width:100px;">��'
					if($('#a').is(':checked')) {
						$('#ab').html(h);
					}
				});
			</script>
			<font color="red"><form:errors path="gender" /></font></td></tr>
	</table>
	</div><br><br>
	
	<div id="title">�ٹ�����</div>
	<hr>
	<div class="w3-container w3-center w3-centered" id="work-container">
	<table id="work" class="w3-center" >
		<tr><td>����</td><td>
			<select name="salary" style="width: 400px;">
                <option value="ȸ�系�Կ� ����">ȸ�系�Կ� ����</option>
                <option value="������ ����">������ ����</option>
                <option value="1400���� ����">1400���� ����</option>
                <c:forEach var="salary" begin="1400" end="3800" step="200">
                   <option value="${salary }~${salary+200 }">${salary }����~${salary+200 }����</option>
                </c:forEach>
                <c:forEach var="salary2" begin="4000" end="9000" step="1000">
                   <option value="${salary2 }~${salary2+1000 }">${salary2 }����~${salary2+1000 }����</option>
                </c:forEach>
                <option value="1��� �̻�">1��� �̻�</option>
             </select><font color="red"><form:errors path="gender" /></font></td></tr>
    	<tr><td>�ٹ�����</td><td>
			<input type="text" name="worklocation"  style="width:400px;"></td></tr>   		
    	<tr><td>�ٹ�����</td><td>
    		<select name="workday" style="width: 400px;">
    			<option value="5">�� 5�� �ٹ�
    			<option value="6">�� 6�� �ٹ�
    			<option value="2">�ָ� �ٹ�
    			<option value="s">������ �ٹ�
    		</select>
       	<tr><td>�ٹ��ð�</td><td>
    		<input type="text" name="worktime" >
        	
	</table></div>
	<div id="title">�����Ⱓ �� ���</div>
	<hr>
	<div id="title">�����</div>
	<hr>
	<input type="submit" value="������" class="w3-button w3-blue"><br><br><br>
</form:form>
</div>
</body>
</html>