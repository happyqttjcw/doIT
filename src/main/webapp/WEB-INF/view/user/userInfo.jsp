<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원정보 관리</title>
</head>
<body>
<div class="w3-card" style="height: 100%; min-height: 800px; width: 900px; margin-bottom: 100px; display: inline-block; padding: 30px 20px 10px 20px;">
	<div style="height: 150px; margin-bottom: 50px; text-align: center;"><img src="img/${user.picture }" style="width: 149px; height: 149px; border-radius: 50%;"></div>
	<div style="text-align: left; width: 460px; border-bottom: 1px black solid; height: 50px; margin: 0 auto 50px auto;">
		<div style="font-size: 30px; display: inline-block; width: 100px;">이름</div>
		<div style="font-size: 25px; display: inline-block;"><input type="text" value="${user.name }" style="border-style: none;" readonly></div>
	</div>
	<div style="text-align: left; width: 460px; border-bottom: 1px black solid; height: 50px; margin: 0 auto 50px auto;">
		<div style="font-size: 30px; display: inline-block; width: 100px;">아이디</div>
		<div style="font-size: 25px; display: inline-block;"><input type="text" value="${user.id }" style="border-style: none;" readonly></div>
	</div>
	<div style="text-align: left; width: 460px; border-bottom: 1px black solid; height: 50px; margin: 0 auto 50px auto;">
		<div style="font-size: 30px; display: inline-block; width: 100px;">나이</div>
		<div style="font-size: 25px; display: inline-block;"><input type="text" value="${user.age }" style="border-style: none;" readonly></div>
	</div>
	<div style="text-align: left; width: 460px; border-bottom: 1px black solid; height: 50px; margin: 0 auto 50px auto;">
		<div style="font-size: 30px; display: inline-block; width: 100px;">성별</div>
		<div style="font-size: 25px; display: inline-block;"><input type="text" value="${user.gender }" style="border-style: none;" readonly></div>
	</div>
	<div style="text-align: left; width: 460px; border-bottom: 1px black solid; height: 50px; margin: 0 auto 50px auto;">
		<div style="font-size: 30px; display: inline-block; width: 100px;">이메일</div>
		<div style="font-size: 25px; display: inline-block;"><input type="text" value="${user.email }" style="border-style: none;" readonly></div>
	</div>
	<div style="text-align: left; width: 460px; border-bottom: 1px black solid; height: 50px; margin: 0 auto 50px auto;">
		<div style="font-size: 30px; display: inline-block; width: 100px;">핸드폰</div>
		<div style="font-size: 25px; display: inline-block;"><input type="text" value="${user.phone }" style="border-style: none;" readonly></div>
	</div>
	<div style="text-align: center;">
		<a href="${path }/doIT/user/editUser.shop?id=${user.id}" class="w3-button w3-center" style="height: 80px; width: 150px; font-size: 30px;">수정</a>
		<a href="${path }/doIT/user/deleteUser.shop?id=${user.id}" class="w3-button w3-center" style="height: 80px; width: 150px; font-size: 30px;">탈퇴</a>
	</div>
</div>
</body>  
</html>