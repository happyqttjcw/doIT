<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script>
   function check(){
      var form = document.authenform;
      var authNum = ${authNum};
   
   if(form.authnum.value==""){
      alert("인증번호를 입력하세요");
      return false;
   }
   if(form.authnum.value!=authNum){
      alert("틀린 인증번호 입니다. 인증번호를 다시 입력해주세요");
      form.authnum.value="";
      return false;
   }
   if(form.authnum.value==authNum){
      alert("인증완료");
      opener.document.userinput.mailCheck.value="인증완료";
      self.close();
   }
}   

</script>
</head>
<body>
<br><br>
<h5>인증 번호 7자리를 입력하세요.</h5>
<div>
   <form method="post" name="authenform" onSubmit="return check();">
   <input type="text" name="authnum"><br /><br />
   <input type="submit" value="인증하기">
   </form>
</div>
</body>
</html>