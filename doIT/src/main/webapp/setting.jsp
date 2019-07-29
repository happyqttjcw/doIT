<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����� ���� ���� ������</title>
</head>
<body id="setting">
<form:form action="setting.shop" modelAttribute="SettingArray">
<div style="min-height:1000px; padding: 30px 0 0 50px; width: 920px; display: inline-block;">
	<div style="height: 100%;"> 
		<div style="font-size: 40px; font-family:'Do Hyeon', sans-serif; color: #7779; border: none; border-bottom: 1px #1119 solid;">���� ����</div>
		<div style="padding-left: 10px; font-size: 30px; font-family:'Do Hyeon', sans-serif; color: #333c;">���� ��� <span style="font-size: 17px; color: #D5D5D5;">�ִ� 5�������� ������ �����մϴ�.</span></div>
		<div style="height: 100%; padding-left: 50px; margin-bottom: 30px;">  
			<c:forEach items="${skill }" var="s_name">
				<div style="font-family: 'Noto Sans KR', sans-serif; width: 200px; display: inline-block; margin-bottom: 5px;"><input type="checkbox" name="skill" value="${s_name }">${s_name }</div>
			</c:forEach>
		<script>
			$("input:checkbox[name=skill]").click(function(){
				var count = $("input:checkbox[name=skill]:checked").length;
				if(count > 5) {
					$(this).prop('checked',false);
					swal({
						  title: "���� ����!",
						  text: "�ִ� 5�������� ������ �����մϴ�.",
						  icon: "warning",
						  button: true,
					});
				}
			});
		</script>
		</div>
		<div style="padding-left: 10px; font-size: 30px; font-family:'Do Hyeon', sans-serif; color: #333c;">�����Ļ� <span style="font-size: 17px; color: #D5D5D5;">�ִ� 5�������� ������ �����մϴ�.</span></div>
		<div style="height: 100%; padding-left: 50px; margin-bottom: 30px;"> 
			<c:forEach items="${welfare }" var="w_name">
				<div style="font-family: 'Noto Sans KR', sans-serif; width: 200px; display: inline-block;  margin-bottom: 5px;"><input type="checkbox" name="welfare" value="${w_name }">${w_name }</div>
			</c:forEach>
		<script>
			$("input:checkbox[name=welfare]").click(function(){
				var count = $("input:checkbox[name=welfare]:checked").length;
				if(count > 5) {
					$(this).prop('checked',false);
					swal({
						  title: "���� ����!",
						  text: "�ִ� 5�������� ������ �����մϴ�.",
						  icon: "warning",
						  button: true,
					});
				}
			});
		</script>
		</div>
		<div style="padding-left: 10px; font-size: 30px; font-family:'Do Hyeon', sans-serif; color: #333c;">������� <span style="font-size: 17px; color: #D5D5D5;">�ִ� 5�������� ������ �����մϴ�.</span></div>
		<div style="height: 100%; padding-left: 50px; margin-bottom: 30px;"> 
			<c:forEach items="${pluse }" var="p_name">
				<div style="font-family: 'Noto Sans KR', sans-serif; width: 200px; display: inline-block;  margin-bottom: 5px;"><input type="checkbox" name="pluse" value="${p_name }">${p_name }</div>
			</c:forEach>
		<script>
			$("input:checkbox[name=pluse]").click(function(){
				var count = $("input:checkbox[name=pluse]:checked").length;
				if(count > 5) {
					$(this).prop('checked',false);
					swal({
						  title: "���� ����!",
						  text: "�ִ� 5�������� ������ �����մϴ�.",
						  icon: "warning",
						  button: true,
					});
				}
			});
		</script>
		</div>
		<div style="padding-left: 10px; font-size: 30px; font-family:'Do Hyeon', sans-serif; color: #333c;">���� <span style="font-size: 17px; color: #D5D5D5;">�ִ� 5�������� ������ �����մϴ�.</span></div>
		<div style="height: 100%; padding-left: 50px; margin-bottom: 30px;"> 
			<c:forEach items="${location }" var="l_name">
				<div style="font-family: 'Noto Sans KR', sans-serif; width: 200px; display: inline-block;  margin-bottom: 5px;"><input type="checkbox" name="location" value="${l_name }">${l_name }</div>
			</c:forEach>
		<script>
			$("input:checkbox[name=location]").click(function(){
				var count = $("input:checkbox[name=location]:checked").length;
				if(count > 5) {
					$(this).prop('checked',false);
					swal({
						  title: "���� ����!",
						  text: "�ִ� 5�������� ������ �����մϴ�.",
						  icon: "warning",
						  button: true,
					});
				}
			});
		</script>
		</div>
		<div style="padding-left: 10px; font-size: 30px; font-family:'Do Hyeon', sans-serif; color: #333c;">���� <span style="font-size: 17px; color: #D5D5D5;">�ִ� 5�������� ������ �����մϴ�.</span></div>
		<div style="height: 100%; padding-left: 50px; margin-bottom: 30px;"> 
			<c:forEach items="${job }" var="j_name">
				<div style="font-family: 'Noto Sans KR', sans-serif; width: 200px; display: inline-block;  margin-bottom: 5px;"><input type="checkbox" name="job" value="${j_name }">${j_name }</div>
			</c:forEach>
		<script>
			$("input:checkbox[name=job]").click(function(){
				var count = $("input:checkbox[name=job]:checked").length;
				if(count > 5) {
					$(this).prop('checked',false);
					swal({
						  title: "���� ����!",
						  text: "�ִ� 5�������� ������ �����մϴ�.",
						  icon: "warning",
						  button: true,
					});
				}
			});
		</script>
		</div>
		<div style="display: inline-block; margin-right: 200px;">
		<div style="padding-left: 10px; font-size: 30px; font-family:'Do Hyeon', sans-serif; color: #333c;">�޿�</div>
		<div style="height: 100%; padding-left: 50px; margin-bottom: 30px;">
		<select name="min_pay" class="w3-button"> 
			<c:forEach var="min_pay" begin="1800" end="5000" step="100">
				<option value="${min_pay }">${min_pay }</option>				
			</c:forEach>
		</select>
		<span>~</span> 
		<select name="max_pay" class="w3-button"> 
			<c:forEach var="max_pay" begin="1800" end="5000" step="100">
				<option value="${max_pay }">${max_pay }</option>				
			</c:forEach>
		</select>
		</div>
		</div>
		<div style="display: inline-block;"> 
		<div style="padding-left: 10px; font-size: 30px; font-family:'Do Hyeon', sans-serif; color: #333c;">�з�</div>
		<div style="height: 100%; padding-left: 50px; margin-bottom: 30px;">
		<select name="education" class="w3-button">
			<c:forEach items="${education }" var="e_name">
				<option value="${e_name }">${e_name }</option>
			</c:forEach>
		</select>
		</div>
		</div>
		<div style="padding-left: 10px; font-size: 30px; font-family:'Do Hyeon', sans-serif; color: #333c;">�ٹ�����</div>
		<div style="height: 100%; padding-left: 50px; margin-bottom: 30px;"> 
			<div style="font-family: 'Noto Sans KR', sans-serif; width: 200px; display: inline-block;  margin-bottom: 5px;"><input type="checkbox" name="workform" value="������">������</div>
			<div style="font-family: 'Noto Sans KR', sans-serif; width: 200px; display: inline-block;  margin-bottom: 5px;"><input type="checkbox" name="workform" value="�����">�����</div>
		</div>
	</div>
	<input type="submit" class="w3-button w3-black" style="float: right;" value="�����ϱ�">
	<div style="height: 200px;"></div>
</div> 
</form:form>
</body>
</html>