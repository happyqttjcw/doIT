<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����� ����������</title>
</head>
<body>
<div style="display: inline-block; min-height: 500px; min-width: 1000px; padding: 0 30px 0 30px;">
	<div style="font-size: 30px;">�̷¼� ��Ȳ</div>
	<div style="width: 100%; min-height: 300px; padding: 5px 0 5px 0; margin-bottom: 50px;" class="w3-card"> <!-- �̷¼� ��Ȳ -->	
		<div style="font-size: 20px; border-bottom: 1px solid #BDBDBD; width: 900px; margin: auto;">���� �̷¼�</div>
		<div style="font-size: 15px; background-color: #EBF7FF; width: 900px; margin: auto;">
			<div style="font-family: 'Nanum Gothic Coding', monospace; display: inline-block; width: 650px; text-align: center;">����</div>
			<div style="font-family: 'Nanum Gothic Coding', monospace; display: inline-block; width: 145px; text-align: center;">�ۼ���</div>
			<div style="font-family: 'Nanum Gothic Coding', monospace; display: inline-block; width: 90px; text-align: center;">��������</div>
		</div>
		<div style="font-size: 15px; width: 900px; margin: auto; min-height: 190px;">
			<c:forEach var="#" items="#">
				<div style="font-family: 'Nanum Gothic Coding', monospace; display: inline-block; width: 650px; text-align: center;">
					
				</div>
				<div style="font-family: 'Nanum Gothic Coding', monospace; display: inline-block; width: 145px; text-align: center;">
					<%-- <fmt:formatDate value="#" pattern="yyyy-MM-dd"></fmt:formatDate> --%>
				</div>
				<div style="font-family: 'Nanum Gothic Coding', monospace; display: inline-block; width: 90px; text-align: center;">
					<input type="checkbox" <c:if test="">checked</c:if> readonly>
				</div>
			</c:forEach>
		</div>
		<div style="width: 900px; height:40px; margin: auto auto 30px auto;"><a href="#" class="w3-button" style="background-color:#EBF7FF; text-decoration: none; border-radius: 50px; float: right;">�ۼ��ϱ�</a></div>
	</div>
	<div style="font-size: 30px;">�ڼҼ� ��Ȳ</div>
	<div style="width: 100%; min-height: 300px; padding: 5px 0 5px 0; margin-bottom: 50px;" class="w3-card">
		<div style="font-size: 20px; border-bottom: 1px solid #BDBDBD; width: 900px; margin: auto;">���� �ڼҼ�</div>
		<div style="font-size: 15px; background-color: #EBF7FF; width: 900px; margin: auto;">
			<div style="font-family: 'Nanum Gothic Coding', monospace; display: inline-block; width: 749px; text-align: center;">����</div>
			<div style="font-family: 'Nanum Gothic Coding', monospace; display: inline-block; width: 145px; text-align: center;">�ۼ���</div>
		</div>
		<div style="font-size: 15px; width: 900px; margin: auto; min-height: 190px;">
			<c:forEach var="#" items="#">
				<div style="font-family: 'Nanum Gothic Coding', monospace; display: inline-block; width: 749px; text-align: center;">
					
				</div>
				<div style="font-family: 'Nanum Gothic Coding', monospace; display: inline-block; width: 145px; text-align: center;">
					<%-- <fmt:formatDate value="#" pattern="yyyy-MM-dd"></fmt:formatDate> --%>
				</div>
			</c:forEach>
		</div>
		<div style="width: 900px; height:40px; margin: auto auto 30px auto;"><a href="#" class="w3-button" style="background-color:#EBF7FF; text-decoration: none; border-radius: 50px; float: right;">�ۼ��ϱ�</a></div>
	</div>
	<div style="font-size: 30px;">���� ��Ȳ</div>
	<div style="width: 100%; min-height: 300px; padding: 5px 0 5px 0; margin-bottom: 50px;" class="w3-card">
		<div style="font-size: 20px; border-bottom: 1px solid #BDBDBD; width: 900px; height:31px; margin: auto;"></div>
		<div style="font-size: 15px; background-color: #EBF7FF; width: 900px; margin: auto;">
			<div style="font-family: 'Nanum Gothic Coding', monospace; display: inline-block; width: 749px; text-align: center;">����</div>
			<div style="font-family: 'Nanum Gothic Coding', monospace; display: inline-block; width: 145px; text-align: center;">������</div>
		</div>
		<div style="font-size: 15px; width: 900px; margin: auto; min-height: 190px;">
			<c:forEach var="#" items="#">
				<div style="font-family: 'Nanum Gothic Coding', monospace; display: inline-block; width: 749px; text-align: center;">
					
				</div>
				<div style="font-family: 'Nanum Gothic Coding', monospace; display: inline-block; width: 145px; text-align: center;">
					<%-- <fmt:formatDate value="#" pattern="yyyy-MM-dd"></fmt:formatDate> --%>
				</div>
			</c:forEach>
		</div>
	</div>
	<div style="min-height: 500px;">�޷�</div> <!-- �޷� -->
	<div style="font-size: 30px;">���� ����</div>
	<div class="" style="width: 100%; min-height: 300px; padding: 5px 0 5px 0; margin-bottom: 200px;">
		<div style="font-size: 20px; width: 900px; height:31px; margin: auto;"></div>
		<div class="w3-card" style="width: 880px; margin: auto;">
		<div style="font-size: 15px; width: 900px; margin: auto;">
			<c:forEach var="#" items="#">
			<div style="min-height: 160px; position: relative;" class="pick">
				<div style="position: absolute; height: 30px; width: 40px; top: 55px; left: 10px; color: #FFFF8F"><i class="fas fa-star fa-2x" id="pick_star"></i></div>
				<div style="position: absolute; left: 80px; top: -10px;">
					<p style="font-size: 25px;">�����</p>
					<p style="font-size: 20px;">���� ����</p>
					<p style="font-size: 15px;">��������(����/��� �з� ������/����� �ּ�)</p>
				</div>
				<div style="position: absolute; top: 115px; right: 30px;">
					<p style="font-size: 15px;">~ 7/30(ȭ)</p>
				</div>
			</div>
			</c:forEach>
		</div>
		</div>
	</div>
</div>
</body>
</html>