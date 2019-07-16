<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title><decorator:title/></title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html, body, h1, h2, h3, h4, h5 {font-family: sans-serif, "Open Sans"}
</style>
<decorator:head/>
</head>
<body class="w3-theme-l5">

<!-- Navbar -->

<!-- logo -->
<div class="w3-top" >
	<div class="w3-center">
		<span style="color:#46556d; font-size:20px;">IT���� ������</span>
		<a href="#" style="color:#46556d; font-size:40px; font-weight:bold; text-decoration: none;">doIT</a>
	</div>  
	<span class="w3-right">
	 </span>
</div>
<!-- End logo -->

<div class="w3-top" style="background-color: #46556d; min-width:100%; margin-top:5%; height:50px;" >
  <a href="#" class="w3-bar-item w3-padding-large w3-margin-top" title="doIT"
  			style="font-size:28px; color:white; font-weight:bold; text-decoration: none; ">
  			<i class="fa fa-home"></i>&nbsp;doIT</a>
  <a href="#" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime"
  			style="text-decoration:none;">������</a>
  <div class="w3-dropdown-hover w3-hide-small">
  <a href="#" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime"
  			style="text-decoration:none;">����/������ ����</a>
    <div class="w3-dropdown-content w3-card-4 w3-bar-block" >
	      <span class="w3-bar-item w3-button">���� ����</span>
	      <span class="w3-bar-item w3-button">������ ����</span>
    </div>
  </div>
  <a href="#" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime"
  				style="text-decoration:none;">����˻�</a>
  <a href="#" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime"
  				style="text-decoration:none;">������õ</a>
  <a href="#" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime"
  				style="text-decoration:none;">���� ����</a>
 
  <a href="#" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime w3-right" 
  		style="font-size:11px; color:#46556d; margin:7px;">ȸ������</a>
  <a href="#" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime w3-right" 
  		style="font-size:11px; color:#46556d; margin:7px;">�α���</a>
  <a href="#" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime w3-right" 
  			style="font-size:11px; color:#46556d; margin:7px;">�α׾ƿ�</a>
  <a href="#" class="w3-bar-item w3-hide-small w3-padding-small w3-text-white w3-hover-text-lime w3-right" 
  			style="font-size:11px; color:#46556d; margin:7px;">����������</a>
  <a class="w3-bar-item w3-hide-small w3-padding-small w3-text-lime w3-right"
  			style="font-size:11px; color:#46556d; margin:7px;">��� ȸ�� ��</a>
  
 </div>
<!-- End Navbar -->
<br><br><br>
<div class = "w3-main">
<div style="margin-top: 200px;"><decorator:body/></div>
</div>
</body>
</html>