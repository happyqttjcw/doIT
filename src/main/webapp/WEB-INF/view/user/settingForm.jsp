<%@ page language="java" contentType="text/html; charset=EUC-KR"
<<<<<<< HEAD
   pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>기업 맞춤 설정 페이지</title>
<script type="text/javascript">
function settingcheck(){
	if($('#form').attr('action')=='updateset.shop'){
		return true;
	}
	if(confirm("맞춤 설정을 완료하시겠습니까?")){
		return true;
	}else return false;
	
}

function updateset(){
	if(confirm("맞춤 설정을 수정하시겠습니까?")){
		$('#form').attr('action','updateset.shop');
		return true;
	}else return false;
}
</script>
</head>
<body>
<form:form id="form" modelAttribute="setting" action="usersetting.shop" method="post" onsubmit="return settingcheck();">
<input type="hidden" name="userno" value="${sessionScope.loginUser.userno }">
<div style="min-height:1000px; padding: 30px 0 0 50px; width: 920px;">
   <div style="height: 100%;"> 
      <div style="font-size: 40px; font-family:'Do Hyeon', sans-serif; color: #7779; border: none; border-bottom: 1px #1119 solid;">맞춤 설정</div>
      <div style="padding-left: 10px; font-size: 30px; font-family:'Do Hyeon', sans-serif; color: #333c;">보유 기술</div>
      <div style="height: 100%; padding-left: 50px; margin-bottom: 30px;"> 
         <c:forEach items="${skill }" var="s_name">
            <div style="font-family: 'Noto Sans KR', sans-serif; width: 200px; display: inline-block; margin-bottom: 5px;">
            <input type="checkbox" name="skill" value="${s_name }"/>${s_name }</div>
         </c:forEach>
      <script>
         $("input:checkbox[name=skill]").click(function(){
            var count = $("input:checkbox[name=skill]:checked").length;
            if(count > 5) {
            	alert("최대 5개 항목만 선택할 수 있습니다.");
               $(this).prop('checked',false);
            }
         });
      </script>
      </div>
      <div style="padding-left: 10px; font-size: 30px; font-family:'Do Hyeon', sans-serif; color: #333c;">복리후생</div>
      <div style="height: 100%; padding-left: 50px; margin-bottom: 30px;"> 
         <c:forEach items="${welfare }" var="w_name">
            <div style="font-family: 'Noto Sans KR', sans-serif; width: 200px; display: inline-block;  margin-bottom: 5px;">
            <input type="checkbox" name="welfare" value="${w_name }">${w_name }</div>
         </c:forEach>
      <script>
         $("input:checkbox[name=welfare]").click(function(){
            var count = $("input:checkbox[name=welfare]:checked").length;
            if(count > 5) {
            	alert("최대 5개 항목만 선택할 수 있습니다.");
               $(this).prop('checked',false);
            }
         });
      </script>
      </div>
      <div style="padding-left: 10px; font-size: 30px; font-family:'Do Hyeon', sans-serif; color: #333c;">우대조건</div>
      <div style="height: 100%; padding-left: 50px; margin-bottom: 30px;"> 
         <c:forEach items="${pluse }" var="p_name">
            <div style="font-family: 'Noto Sans KR', sans-serif; width: 200px; display: inline-block;  margin-bottom: 5px;">
            <input type="checkbox" name="pluse" value="${p_name }">${p_name }</div>
         </c:forEach>
      <script>
         $("input:checkbox[name=pluse]").click(function(){
            var count = $("input:checkbox[name=pluse]:checked").length;
            if(count > 5) {
            	alert("최대 5개 항목만 선택할 수 있습니다.");
               $(this).prop('checked',false);
            }
         });
      </script>
      </div>
      <div style="padding-left: 10px; font-size: 30px; font-family:'Do Hyeon', sans-serif; color: #333c;">지역</div>
      <div style="height: 100%; padding-left: 50px; margin-bottom: 30px;"> 
         <c:forEach items="${location }" var="l_name">
            <div style="font-family: 'Noto Sans KR', sans-serif; width: 200px; display: inline-block;  margin-bottom: 5px;">
            <input type="checkbox" name="location" value="${l_name }">${l_name }</div>
         </c:forEach>
      <script>
         $("input:checkbox[name=location]").click(function(){
            var count = $("input:checkbox[name=location]:checked").length;
            if(count > 5) {
            	alert("최대 5개 항목만 선택할 수 있습니다.");
               $(this).prop('checked',false);
            }
         });
      </script>
      </div>
      <div style="padding-left: 10px; font-size: 30px; font-family:'Do Hyeon', sans-serif; color: #333c;">직종</div>
      <div style="height: 100%; padding-left: 50px; margin-bottom: 30px;"> 
         <c:forEach items="${joblist }" var="j_name">
            <div style="font-family: 'Noto Sans KR', sans-serif; width: 200px; display: inline-block;  margin-bottom: 5px;">
            <input type="checkbox" name="job" value="${j_name }">${j_name }</div>
         </c:forEach>
      <script>
         $("input:checkbox[name=job]").click(function(){
            var count = $("input:checkbox[name=job]:checked").length;
            if(count > 5) {
            	alert("최대 5개 항목만 선택할 수 있습니다.");
               $(this).prop('checked',false);
            }
         });
      </script>
      </div>
      <div style="display: inline-block; margin-right: 200px;">
      <div style="padding-left: 10px; font-size: 30px; font-family:'Do Hyeon', sans-serif; color: #333c;">급여</div>
      <div style="height: 100%; padding-left: 50px; margin-bottom: 30px;">
      <select name="minpay" class="w3-button"> 
         <c:forEach var="min_pay" begin="1800" end="5000" step="100">
            <option value="${min_pay }">${min_pay }</option>            
         </c:forEach>
      </select>
      <span>~</span> 
      <select name="maxpay" class="w3-button"> 
         <c:forEach var="max_pay" begin="1800" end="5000" step="100">
            <option value="${max_pay }">${max_pay }</option>            
         </c:forEach>
      </select>
      </div>
      </div>
      <div style="display: inline-block;"> 
      <div style="padding-left: 10px; font-size: 30px; font-family:'Do Hyeon', sans-serif; color: #333c;">학력</div>
      <div style="height: 100%; padding-left: 50px; margin-bottom: 30px;">
      <select name="education" class="w3-button">
         <c:forEach items="${education }" var="e_name">
            <option value="${e_name }">${e_name }</option>
         </c:forEach>
      </select>
      </div>
      </div>
      <div style="padding-left: 10px; font-size: 30px; font-family:'Do Hyeon', sans-serif; color: #333c;">근무형태</div>
      <div style="height: 100%; padding-left: 50px; margin-bottom: 30px;"> 
         <div style="font-family: 'Noto Sans KR', sans-serif; width: 200px; display: inline-block;  margin-bottom: 5px;">
         <input type="checkbox" name="workform" value="정규직">정규직</div>
         <div style="font-family: 'Noto Sans KR', sans-serif; width: 200px; display: inline-block;  margin-bottom: 5px;">
         <input type="checkbox" name="workform" value="계약직">계약직</div>
      </div>
   </div>
  	<c:if test="${empty setting  }"> 
   		<input type="submit" class="w3-button w3-round w3-blue" style="float: right;" value="설정하기">
    </c:if>
   	<c:if test="${!empty setting  }">
   		<input type="submit" class="w3-button w3-round w3-blue" style="float: right;" value="수정하기" onclick="javascript:updateset();">
 	</c:if> 
   <div style="height: 100px;"></div>
</div> 
</form:form>
=======
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>사용자 맞춤 설정 페이지</title>
</head>
<body id="setting">
<form:form action="setting.shop" modelAttribute="SettingArray">
<input type="hidden" name="userno" value="${param.userno }">
<div class="container-fluid">
<div class="row content">    
<div class="col-sm-3">
	<!-- Page Container -->
	<div class="w3-container w3-content w3-main" style="max-width:1350px;margin-top:200px;">    
	  <!-- The Grid -->
	  <div class="w3-row">
	    <!-- Left Column -->
	    <div class="w3-col m2 w3-hide-small" style="min-width: 420px">
	      <!-- Profile -->
	      <div class="w3-card w3-round w3-white" style="margin-top:25px;">
	         <br>
	         <p class="w3-center">
	            <img src="../img/bonobono.jpg" class="w3-circle" style="height:106px;width:106px">
	        </p>
	        <div class="w3-center">
	           <div class="w3-text-green">${sessionScope.loginUser.name } 님</div><br>
	           <a href="comdetail.shop?comid=${sessionScope.loginUser.id }">회원 정보 관리</a><br><br>
	           <a href="#"  onclick="passchg();">비밀번호 변경</a><br><br>
	           <a href="settingForm.shop?userno=${sessionScope.loginUser.userno }" class="w3-center w3-button w3-round w3-blue w3-medium" >맞춤 설정</a>
	        </div>
	        <br>
	      </div>
	      <br>
	      <!-- End Profile -->
	   </div>
	   <br>
	    <!-- End Left Column -->
	   
	   <!-- Middle,Right Column -->
	   <div class="w3-col m10 w3-container" style="padding-left:30px;">
	       <div class="w3-card" style="min-width:500px; max-width:1800px;">
	      </div><br><br><br>
	   </div>
	   <!-- End Middle Column -->
	  </div>
	</div>
</div>
<div class="col-sm-6">
	<div> 
		<div style="font-size: 40px; font-family:'Do Hyeon', sans-serif; color: #7779; border: none; border-bottom: 1px #1119 solid;">맞춤 설정</div>
		<div style="padding-left: 10px; font-size: 30px; font-family:'Do Hyeon', sans-serif; color: #333c;">보유 기술 <span style="font-size: 17px; color: #D5D5D5;">최대 5개까지만 선택이 가능합니다.</span></div>
		<div style="height: 100%; padding-left: 50px; margin-bottom: 30px;">  
			<c:forEach items="${skill }" var="s_name">
				<div style="font-family: 'Noto Sans KR', sans-serif; width: 200px; display: inline-block; margin-bottom: 5px;"><input type="checkbox" name="skill" value="${s_name }"id="${s_name }">${s_name }</div>
			</c:forEach>
		<script>
			$("input:checkbox[name=skill]").click(function(){
				var count = $("input:checkbox[name=skill]:checked").length;
				if(count > 5) {
					$(this).prop('checked',false);
					swal({
						  title: "선택 제한!",
						  text: "최대 5개까지만 선택이 가능합니다.",
						  icon: "warning",
						  button: true,
					});
				}
			});
		</script>
		</div>
		<div style="padding-left: 10px; font-size: 30px; font-family:'Do Hyeon', sans-serif; color: #333c;">복리후생 <span style="font-size: 17px; color: #D5D5D5;">최대 5개까지만 선택이 가능합니다.</span></div>
		<div style="height: 100%; padding-left: 50px; margin-bottom: 30px;"> 
			<c:forEach items="${welfare }" var="w_name">
				<div style="font-family: 'Noto Sans KR', sans-serif; width: 200px; display: inline-block;  margin-bottom: 5px;"><input type="checkbox" name="welfare" value="${w_name }" id="${w_name }">${w_name }</div>
			</c:forEach>
		<script>
			$("input:checkbox[name=welfare]").click(function(){
				var count = $("input:checkbox[name=welfare]:checked").length;
				if(count > 5) {
					$(this).prop('checked',false);
					swal({
						  title: "선택 제한!",
						  text: "최대 5개까지만 선택이 가능합니다.",
						  icon: "warning",
						  button: true,
					});
				}
			});
		</script>
		</div>
		<div style="padding-left: 10px; font-size: 30px; font-family:'Do Hyeon', sans-serif; color: #333c;">우대조건 <span style="font-size: 17px; color: #D5D5D5;">최대 5개까지만 선택이 가능합니다.</span></div>
		<div style="height: 100%; padding-left: 50px; margin-bottom: 30px;"> 
			<c:forEach items="${pluse }" var="p_name">
				<div style="font-family: 'Noto Sans KR', sans-serif; width: 200px; display: inline-block;  margin-bottom: 5px;"><input type="checkbox" name="pluse" value="${p_name }" id="${p_name }">${p_name }</div>
			</c:forEach>
		<script>
			$("input:checkbox[name=pluse]").click(function(){
				var count = $("input:checkbox[name=pluse]:checked").length;
				if(count > 5) {
					$(this).prop('checked',false);
					swal({
						  title: "선택 제한!",
						  text: "최대 5개까지만 선택이 가능합니다.",
						  icon: "warning",
						  button: true,
					});
				}
			});
		</script>
		</div>
		<div style="padding-left: 10px; font-size: 30px; font-family:'Do Hyeon', sans-serif; color: #333c;">지역 <span style="font-size: 17px; color: #D5D5D5;">최대 5개까지만 선택이 가능합니다.</span></div>
		<div style="height: 100%; padding-left: 50px; margin-bottom: 30px;"> 
			<c:forEach items="${location }" var="l_name">
				<div style="font-family: 'Noto Sans KR', sans-serif; width: 200px; display: inline-block;  margin-bottom: 5px;"><input type="checkbox" name="location" value="${l_name }" id="${l_name }">${l_name }</div>
			</c:forEach>
		<script>
			$("input:checkbox[name=location]").click(function(){
				var count = $("input:checkbox[name=location]:checked").length;
				if(count > 5) {
					$(this).prop('checked',false);
					swal({
						  title: "선택 제한!",
						  text: "최대 5개까지만 선택이 가능합니다.",
						  icon: "warning",
						  button: true,
					});
				}
			});
		</script>
		</div>
		<div style="padding-left: 10px; font-size: 30px; font-family:'Do Hyeon', sans-serif; color: #333c;">직종 <span style="font-size: 17px; color: #D5D5D5;">최대 5개까지만 선택이 가능합니다.</span></div>
		<div style="height: 100%; padding-left: 50px; margin-bottom: 30px;"> 
			<c:forEach items="${job }" var="j_name">
				<div style="font-family: 'Noto Sans KR', sans-serif; width: 200px; display: inline-block;  margin-bottom: 5px;"><input type="checkbox" name="job" value="${j_name }" id="${j_name }">${j_name }</div>
			</c:forEach>
		<script>
			$("input:checkbox[name=job]").click(function(){
				var count = $("input:checkbox[name=job]:checked").length;
				if(count > 5) {
					$(this).prop('checked',false);
					swal({
						  title: "선택 제한!",
						  text: "최대 5개까지만 선택이 가능합니다.",
						  icon: "warning",
						  button: true,
					});
				}
			});
		</script>
		</div>
		<div style="display: inline-block; margin-right: 200px;">
		<div style="padding-left: 10px; font-size: 30px; font-family:'Do Hyeon', sans-serif; color: #333c;">급여</div>
		<div style="height: 100%; padding-left: 50px; margin-bottom: 30px;">
		<select name="minpay" class="w3-button">
			<option>----</option>
			<c:forEach var="min_pay" begin="1800" end="5000" step="100">
				<option value="${min_pay }" id="${min_pay }">${min_pay }</option>				
			</c:forEach>
		</select>
		<span>~</span> 
		<select name="maxpay" class="w3-button">
			<option>----</option> 
			<c:forEach var="max_pay" begin="1800" end="5000" step="100">
				<option value="${max_pay }" id="${max_pay }">${max_pay }</option>				
			</c:forEach>
		</select>
		</div>
		</div>
		<div style="display: inline-block;"> 
		<div style="padding-left: 10px; font-size: 30px; font-family:'Do Hyeon', sans-serif; color: #333c;">학력</div>
		<div style="height: 100%; padding-left: 50px; margin-bottom: 30px;">
		<select name="education" class="w3-button">
			<option>----</option>
			<c:forEach items="${education }" var="e_name">
				<option value="${e_name }" id="${e_name }">${e_name }</option>
			</c:forEach>
		</select>
		</div>
		</div>
		<div style="padding-left: 10px; font-size: 30px; font-family:'Do Hyeon', sans-serif; color: #333c;">근무형태</div>
		<div style="height: 100%; padding-left: 50px; margin-bottom: 30px;"> 
			<div style="font-family: 'Noto Sans KR', sans-serif; width: 200px; display: inline-block;  margin-bottom: 5px;"><input type="checkbox" name="workform" value="정규직" id="정규직">정규직</div>
			<div style="font-family: 'Noto Sans KR', sans-serif; width: 200px; display: inline-block;  margin-bottom: 5px;"><input type="checkbox" name="workform" value="계약직" id="계약직">계약직</div>
		</div>
	</div>
	<input type="submit" class="btn btn-secondary" style="float: right;" value="설정하기">
	<div style="height: 200px;"></div>
</div>
<div class="col-sm-3"></div>
</div>
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
<c:forTokens items="${setting.minpay }" delims="," var="minpay">
	<script>
		$(document).ready(function(){
			$('#${minpay }').attr('selected','selected');
		});
	</script>
</c:forTokens>
<c:forTokens items="${setting.maxpay }" delims="," var="maxpay">
	<script>
		$(document).ready(function(){
			$('#${maxpay }').attr('selected','selected');
		});
	</script>
</c:forTokens>
<c:forTokens items="${setting.workform }" delims="," var="workform">
	<script>
		$(document).ready(function(){
			$('#${workform }').attr('checked','checked');
		});
	</script>
</c:forTokens>
</c:if>


>>>>>>> refs/remotes/CGH/CGH
</body>
</html>