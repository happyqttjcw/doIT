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
      alert("������ȣ�� �Է��ϼ���");
      return false;
   }
   if(form.authnum.value!=authNum){
      alert("Ʋ�� ������ȣ �Դϴ�. ������ȣ�� �ٽ� �Է����ּ���");
      form.authnum.value="";
      return false;
   }
   if(form.authnum.value==authNum){
      alert("�����Ϸ�");
      opener.document.userinput.mailCheck.value="�����Ϸ�";
      self.close();
   }
}   

</script>
</head>
<body>
<br><br>
<h5>���� ��ȣ 7�ڸ��� �Է��ϼ���.</h5>
<div>
   <form method="post" name="authenform" onSubmit="return check();">
   <input type="text" name="authnum"><br /><br />
   <input type="submit" value="�����ϱ�">
   </form>
</div>
</body>
</html>