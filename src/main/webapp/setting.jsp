<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>사용자 맞춤 설정 페이지</title>
<script src="https://kit.fontawesome.com/8ee129e7b3.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
	body {
		padding: 0 20% 0 20%; width: 60%;
	}
	.main_div {
		border: 1px black solid; width: 100%; min-width: 750px; 
		margin-top: 50px; height: 100%; min-height: 1000px; padding: 10px 100px 0 100px;
	}
	.main_div_input {
		border-bottom-style: groove; border-color: #0001; border-widht: inherit;
	}
	.main_input {
		border-style: none; height: 50px; font-size: 40px; color: #000a;
	}
	.content_div {
		height: 100%; min-height: 900px; padding-top: 10px;
	}
	.content_div_text {
		height: 30px; padding-left: 15px; margin-bottom: 10px; color: #000a; font-size: 25px;
		display: inline-block; width: 60px;
	}
	.select {
		display: inline-block; width: 100px;
	}
</style>
</head>
<body>
	<div class="main_div">
		<div class="main_div_text">
			<input type="text" class="main_input" value="맞춤 설정" readonly>
		</div>
		<form action="" name="f">
		<div class="content_div">
			<div class="content_div_text">기술</div><i class="far fa-plus-square"></i>
			<div style="padding-left: 25px;" id="skill">

			</div>
		</div>
		</form>
	</div>

</body>
</html>