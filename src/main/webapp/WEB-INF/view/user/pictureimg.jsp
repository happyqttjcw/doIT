<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<script>
	img=opener.document.getElementById("pic");
	img.src = "img/${filename}"; // ���ε�� �̹��� ȸ������ ȭ�鿡 ���
	opener.document.f.picture.value="${filename}";// �Ķ���Ϳ� ���� �̸� ����
	self.close();
</script>