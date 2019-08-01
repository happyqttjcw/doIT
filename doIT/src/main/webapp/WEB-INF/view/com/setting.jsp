<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��� ���� ���� ������</title>
<script type="text/javascript">
function settingcheck(){
	if($('#form').attr('action')=='updateset.shop'){
		return true;
	}
	if(confirm("���� ������ �Ϸ��Ͻðڽ��ϱ�?")){
		return true;
	}else return false;
	
}

function updateset(){
	if(confirm("���� ������ �����Ͻðڽ��ϱ�?")){
		$('#form').attr('action','updateset.shop');
		return true;
	}else return false;
}
</script>
</head>
<body>
<form:form id="form" modelAttribute="setting" action="comsetting.shop" method="post" onsubmit="return settingcheck();">
<input type="hidden" name="comno" value="${sessionScope.logincom.comno }">
<div style="min-height:1000px; padding: 30px 0 0 50px; width: 920px;">
   <div style="height: 100%;"> 
      <div style="font-size: 40px; font-family:'Do Hyeon', sans-serif; color: #7779; border: none; border-bottom: 1px #1119 solid;">���� ����</div>
      <div style="padding-left: 10px; font-size: 30px; font-family:'Do Hyeon', sans-serif; color: #333c;">���� ���</div>
      <div style="height: 100%; padding-left: 50px; margin-bottom: 30px;"> 
         <c:forEach items="${skill }" var="s_name">
            <div style="font-family: 'Noto Sans KR', sans-serif; width: 200px; display: inline-block; margin-bottom: 5px;">
            <input type="checkbox" name="skill" value="${s_name }" id="${s_name }"/>${s_name }</div>
         </c:forEach>
      <script>
         $("input:checkbox[name=skill]").click(function(){
            var count = $("input:checkbox[name=skill]:checked").length;
            if(count > 5) {
            	alert("�ִ� 5�� �׸� ������ �� �ֽ��ϴ�.");
               $(this).prop('checked',false);
            }
         });
      </script>
      </div>
      <div style="padding-left: 10px; font-size: 30px; font-family:'Do Hyeon', sans-serif; color: #333c;">�����Ļ�</div>
      <div style="height: 100%; padding-left: 50px; margin-bottom: 30px;"> 
         <c:forEach items="${welfare }" var="w_name">
            <div style="font-family: 'Noto Sans KR', sans-serif; width: 200px; display: inline-block;  margin-bottom: 5px;">
            <input type="checkbox" name="welfare" value="${w_name }" id="${w_name }">${w_name }</div>
         </c:forEach>
      <script>
         $("input:checkbox[name=welfare]").click(function(){
            var count = $("input:checkbox[name=welfare]:checked").length;
            if(count > 5) {
            	alert("�ִ� 5�� �׸� ������ �� �ֽ��ϴ�.");
               $(this).prop('checked',false);
            }
         });
      </script>
      </div>
      <div style="padding-left: 10px; font-size: 30px; font-family:'Do Hyeon', sans-serif; color: #333c;">�������</div>
      <div style="height: 100%; padding-left: 50px; margin-bottom: 30px;"> 
         <c:forEach items="${pluse }" var="p_name">
            <div style="font-family: 'Noto Sans KR', sans-serif; width: 200px; display: inline-block;  margin-bottom: 5px;">
            <input type="checkbox" name="pluse" value="${p_name }" id="${p_name }">${p_name }</div>
         </c:forEach>
      <script>
         $("input:checkbox[name=pluse]").click(function(){
            var count = $("input:checkbox[name=pluse]:checked").length;
            if(count > 5) {
            	alert("�ִ� 5�� �׸� ������ �� �ֽ��ϴ�.");
               $(this).prop('checked',false);
            }
         });
      </script>
      </div>
      <div style="padding-left: 10px; font-size: 30px; font-family:'Do Hyeon', sans-serif; color: #333c;">����</div>
      <div style="height: 100%; padding-left: 50px; margin-bottom: 30px;"> 
         <c:forEach items="${location }" var="l_name">
            <div style="font-family: 'Noto Sans KR', sans-serif; width: 200px; display: inline-block;  margin-bottom: 5px;">
            <input type="checkbox" name="location" value="${l_name }" id="${l_name }">${l_name }</div>
         </c:forEach>
      <script>
         $("input:checkbox[name=location]").click(function(){
            var count = $("input:checkbox[name=location]:checked").length;
            if(count > 5) {
            	alert("�ִ� 5�� �׸� ������ �� �ֽ��ϴ�.");
               $(this).prop('checked',false);
            }
         });
      </script>
      </div>
      <div style="padding-left: 10px; font-size: 30px; font-family:'Do Hyeon', sans-serif; color: #333c;">����</div>
      <div style="height: 100%; padding-left: 50px; margin-bottom: 30px;"> 
         <c:forEach items="${joblist }" var="j_name">
            <div style="font-family: 'Noto Sans KR', sans-serif; width: 200px; display: inline-block;  margin-bottom: 5px;">
            <input type="checkbox" name="job" value="${j_name }" id="${j_name }">${j_name }</div>
         </c:forEach>
      <script>
         $("input:checkbox[name=job]").click(function(){
            var count = $("input:checkbox[name=job]:checked").length;
            if(count > 5) {
            	alert("�ִ� 5�� �׸� ������ �� �ֽ��ϴ�.");
               $(this).prop('checked',false);
            }
         });
      </script>
      </div>
      <div style="display: inline-block; margin-right: 200px;">
      <div style="padding-left: 10px; font-size: 30px; font-family:'Do Hyeon', sans-serif; color: #333c;">�޿�</div>
      <div style="height: 100%; padding-left: 50px; margin-bottom: 30px;">
       
       <select name="salary" class="w3-button">
         <option value="ȸ�系�Կ� ����">ȸ�系�Կ� ����</option>
         <option value="������ ����">������ ����</option>
         <option value="1400���� ����">1400���� ����</option>
         <c:forEach var="pay" begin="1400" end="3800" step="200">
            <option value="${pay}~${pay+200}">${pay }~${pay+200 }</option>
         </c:forEach>
         <c:forEach var="pay" begin="4000" end="9000" step="1000">
            <option value="${pay}~${pay+1000}">${pay }~${pay+1000 }</option>
         </c:forEach>
         <option value="1��� �̻�">1��� �̻�</option>
      </select>

      </div>
      </div>
      <div style="display: inline-block;"> 
      <div style="padding-left: 10px; font-size: 30px; font-family:'Do Hyeon', sans-serif; color: #333c;">�з�</div>
      <div style="height: 100%; padding-left: 50px; margin-bottom: 30px;">
      <select name="education" class="w3-button">
         <c:forEach items="${education }" var="e_name">
            <option value="${e_name }" id="${e_name }">${e_name }</option>
         </c:forEach>
      </select>
      </div>
      </div>
      <div style="padding-left: 10px; font-size: 30px; font-family:'Do Hyeon', sans-serif; color: #333c;">�ٹ�����</div>
      <div style="height: 100%; padding-left: 50px; margin-bottom: 30px;"> 
         <div style="font-family: 'Noto Sans KR', sans-serif; width: 200px; display: inline-block;  margin-bottom: 5px;">
         <input type="checkbox" name="workform" value="������" id="������">������</div>
         <div style="font-family: 'Noto Sans KR', sans-serif; width: 200px; display: inline-block;  margin-bottom: 5px;">
         <input type="checkbox" name="workform" value="�����" id="�����">�����</div>
      </div>
   </div>
  	<c:if test="${empty setting  }"> 
   		<input type="submit" class="w3-button w3-round w3-blue" style="float: right;" value="�����ϱ�">
    </c:if>
   	<c:if test="${!empty setting  }">
   		<input type="submit" class="w3-button w3-round w3-blue" style="float: right;" value="�����ϱ�" onclick="javascript:updateset();">
 	</c:if> 
   <div style="height: 100px;"></div>
</div> 
</form:form>


<c:if test="${!empty setting }">
<c:forTokens items="${setting.skill }" delims="," var="skill">
   <script>
      $(document).ready(function(){
         $('#${skill }').attr('checked','checked');
      });
   </script>
</c:forTokens>
<c:forTokens items="${setting.welfare }" delims="," var="welfare">
   <script>
      $(document).ready(function(){
         $('#${welfare }').attr('checked','checked');
      });
   </script>
</c:forTokens>
<c:forTokens items="${setting.pluse }" delims="," var="pluse">
   <script>
      $(document).ready(function(){
         $('#${pluse }').attr('checked','checked');
      });
   </script>
</c:forTokens>
<c:forTokens items="${setting.location }" delims="," var="location">
   <script>
      $(document).ready(function(){
         $('#${location }').attr('checked','checked');
      });
   </script>
</c:forTokens>
<c:forTokens items="${setting.job }" delims="," var="job">
   <script>
      $(document).ready(function(){
         $('#${job }').attr('checked','checked');
      });
   </script>
</c:forTokens>
<c:forTokens items="${setting.education }" delims="," var="education">
   <script>
      $(document).ready(function(){
         $('#${education }').attr('selected','selected');
      });
   </script>
</c:forTokens>
<script>
   $(document).ready(function(){
      $('select[name="salary"]').children('option[value="${setting.salary }"]').attr('selected','selected');
   });
</script>
<c:forTokens items="${setting.workform }" delims="," var="workform">
   <script>
      $(document).ready(function(){
         $('#${workform }').attr('checked','checked');
      });
   </script>
</c:forTokens>
</c:if>

</body>
</html>