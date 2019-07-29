<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>기업 공고 등록</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<style type="text/css">
#title {
	font-family:'Noto Sans KR', sans-serif;
	padding-left: 10px; 
	font-size: 30px; 
	color: #333c; 
	text-align:left;
}
hr{
	height: 1px;
  	color: #333c;
  	background-color: #333c;
  	border: none;
}
table {
	border:0.1px solid #333c;
	max-width: 80%;
	margin-left: 10%;
}
table td{
	width:20%;
}
input,select{
	margin:5px;
}
#condition tr{
	border:0.1px solid #333c;
		margin-left: 10%;
	
}
</style>
<script type="text/javascript">
function addrecruit() {
		$('#rtable').clone().appendTo('#rtable-container');
		$('#rtable-container > #rtable:last-child').attr("id","rtable-add");
		$('#rtable-add:last-child input').val('');
		$('#rtable-add:last-child textarea').val('');
		$('<br>').appendTo("#rtable-container")
}
function delrecruit(b) {
	var cnt = $('#rtable-container').children('table').length;
	if(cnt == 1){
		alert('최소 한 개 이상의 모집요강을 입력하세요.');
	}else{
		$(b).closest('table').remove();
	}
}

$(function() {
    //input을 datepicker로 선언
    $("#datepicker").datepicker({
        dateFormat: 'yy-mm-dd' //Input Display Format 변경
        ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
        ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
        ,changeYear: true //콤보박스에서 년 선택 가능
        ,changeMonth: true //콤보박스에서 월 선택 가능                
        ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
        ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
        ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
        ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
        ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
        ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
        ,minDate: "0" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
        ,maxDate: "+2M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
    });                    
    
    //초기값을 오늘 날짜로 설정
    $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)     
    
    $("#datepicker2").datepicker({
        dateFormat: 'yy-mm-dd' //Input Display Format 변경
        ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
        ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
        ,changeYear: true //콤보박스에서 년 선택 가능
        ,changeMonth: true //콤보박스에서 월 선택 가능                
        ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
        ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
        ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
        ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
        ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
        ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
        ,minDate: "0" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
        ,maxDate: "+2M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
    });                    
    
    //초기값을 오늘 날짜로 설정
    $('#datepicker2').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
});
</script>
</head>

<body>

<div class="w3-container w3-center" style="min-width: 1000px;"><br>
<h1>어떤 인재를 뽑을 계획이세요?</h1>
<br>
<form:form modelAttribute="job" method="post" action="writejob.shop?comid=${sessionScope.logincom.comid}" >
	<form:hidden path="comno" value="${sessionScope.logincom.comno }"/>
	<spring:hasBindErrors name="job">
		<font color="red"> <c:forEach items="${errors.globalErrors}" var="error">
				<spring:message code="${error.code}" />
			</c:forEach>
		</font>
	</spring:hasBindErrors>
	<span id="title">공고제목&nbsp;&nbsp;</span>
		<form:input path="subject" style="width:500px; height:40px;"/>
		<font color="red"><form:errors path="subject" /></font>
	<br><br><br>
	<div id="title">모집요강</div>
	<hr>
	<div class="w3-container " id="rtable-container">
		<table id="rtable" class="w3-center" >
		<tr><td>직종/직무</td><td>
			<select name="field" style="width:400px; height:40px;">
				<c:forEach items="${joblist}" var="jobs" varStatus="stat">
					<option value="${jobs }" <c:if test="${stat.index == 0 }"> selected="selected"</c:if>>${jobs }</option>
				</c:forEach>
			</select>
			<font color="red"><form:errors path="field" /></font></td></tr>
		<tr><td>모집인원</td><td>
			<input type="text" name="num" style="width:100px; height:40px;">
			<font color="red"><form:errors path="num" /></font>명</td></tr>
		<tr><td>담당업무</td><td>
			<textarea name="task" style="width:400px; height:200px;"></textarea>
			<font color="red"><form:errors path="task" /></font></td></tr>
		<tr><td>근무부서</td><td>
			<input type="text" name="dept" style="width:400px; height:40px;">
			<font color="red"><form:errors path="dept" /></font></td></tr>
		<tr><td>직급/직책</td><td>
			<select name="position" style="width:400px; height:40px;">
				<option value="신입">신입
				<option value="경력">경력
			</select>
			<font color="red"><form:errors path="position" /></font></td></tr>
		<tr><td>자격요건</td><td>
			<textarea name="cdt" style="width:400px; height:200px;"></textarea>
			<font color="red"><form:errors path="cdt" /></font></td></tr>
		<tr><td colspan="2">
			<a href="javascript:addrecruit()" class="w3-button w3-blue" id="abutton">+추가</a>
			<div class="w3-button w3-blue" id="dbutton" onclick="delrecruit(this)">-삭제</div>		  
</td></tr>
 		</table><br>
	</div><br>
	
	<div id="title">자격요건 및 우대사항</div>
	<hr>
	<div class="w3-container w3-center w3-centered" id="condition-container">
	<table id="condition" class="w3-center w3-table" >
		<tr><td>학력</td><td>
			<select name="education" style="width:400px; height:40px;">
				<c:forEach items="${education}" var="edu" varStatus="stat">
					<option value="${edu }" <c:if test="${stat.index == 0 }"> selected="selected"</c:if>>${edu }</option>
				</c:forEach>
			</select>
			<font color="red"><form:errors path="education" /></font></td></tr>
		<tr><td>IT전공여부</td><td>
			<input type="radio" checked="checked" value="전공" name="major">전공자&nbsp;&nbsp;
			<input type="radio" value="비전공" name="major">비전공자
			<input type="radio" value="전공무관" name="major">전공무관
			<font color="red"><form:errors path="major" /></font></td></tr>
		<tr><td>우대사항</td><td>
			<div style="w3-center">
			<input type="checkbox" value="해당직무 근무경험" name="likecdt">해당직무 근무경험&nbsp;&nbsp;	
			<input type="checkbox" value="인근거주자" name="likecdt" >인근거주자&nbsp;&nbsp;<br>
			<input type="checkbox" value="엑셀고급능력자" name="likecdt">엑셀고급능력자&nbsp;&nbsp;
			<input type="checkbox" value="운전가능자" name="likecdt">운전가능자&nbsp;&nbsp;
			<input type="checkbox" value="정보처리기사" name="likecdt">정보처리기사&nbsp;&nbsp;</div>
			<font color="red"><form:errors path="likecdt" /></font></td></tr>
		<tr><td>외국어</td><td>
			<c:forEach items="${language }" var="lang" varStatus="stat">
        		<input type="checkbox" name="language" value="${lang }">${lang }
        		<c:if test="${stat.count%5==0 }"><br></c:if>
         	</c:forEach>
			<font color="red"><form:errors path="language" /></font></td></tr>
		<tr><td>요구기술</td><td>
			<c:forEach items="${skill }" var="skill" varStatus="stat">
        		<input type="checkbox" name="skill" value="${skill }">${skill }
        		<c:if test="${stat.count%5==0 }"><br></c:if>
         	</c:forEach>
			<font color="red"><form:errors path="skill" /></font></td></tr>
		<tr><td>우대 성별</td><td>
			<select name="gender">
				<option value="성별무관">성별무관
				<option value="남자">남자
				<option value="여자">여자
			</select>
			<font color="red"><form:errors path="gender" /></font></td></tr>
		<tr><td>우대 연령</td><td>
			<input type="radio" checked="checked" value="연령무관" name="age-check" id="b">연령무관&nbsp;&nbsp;
			<input type="radio" value="제한" name="age-check" id="a">제한
			<div id="ab"></div>
			<script>
				$('#a').on('click',function(){
					var h = '<input type="text" name="startage" style="width:100px;"> ~ <input type="text" name="endage" style="width:100px;">세'
					if($('#a').is(':checked')) {
						$('#ab').html(h);
					}
				});
				$('#b').on('click',function(){
					$('#ab').html('');
				});
			</script>
			<font color="red"><form:errors path="gender" /></font></td></tr>
	</table>
	</div><br><br>
	
	<div id="title">근무조건</div>
	<hr>
	<div class="w3-container w3-center w3-centered" id="work-container">
	<table id="work" class="w3-center" >
		<tr><td>연봉</td><td>
			<select name="salary" style="width: 400px;">
                <option value="회사내규에 따름">회사내규에 따름</option>
                <option value="면접후 결정">면접후 결정</option>
                <option value="1400만원 이하">1400만원 이하</option>
                <c:forEach var="salary" begin="1400" end="3800" step="200">
                   <option value="${salary }~${salary+200 }">${salary }만원~${salary+200 }만원</option>
                </c:forEach>
                <c:forEach var="salary2" begin="4000" end="9000" step="1000">
                   <option value="${salary2 }~${salary2+1000 }">${salary2 }만원~${salary2+1000 }만원</option>
                </c:forEach>
                <option value="1억원 이상">1억원 이상</option>
             </select><font color="red"><form:errors path="gender" /></font></td></tr>
    	<tr><td>근무지역</td><td>
			<input type="text" name="worklocation"  style="width:400px;"></td></tr>   		
    	<tr><td>근무요일</td><td>
    		<select name="workday" style="width: 400px;">
    			<option value="주 5일 근무">주 5일 근무
    			<option value="주 6일 근무">주 6일 근무
    			<option value="주말 근무">주말 근무
    			<option value="스케줄 근무">스케줄 근무
    		</select>
       	<tr><td>근무시간</td><td>
    		<input type="text" name="worktime" style="width: 400px;" >
       	<tr><td>고용형태</td><td>
    		<input type="radio" name="employ" checked="checked" value="정규직">정규직
    		<input type="radio" name="employ" value="비정규직">비정규직
	</table></div><br><br>
	
	<div id="title">접수기간 및 방법</div>
	<hr>
	<div class="w3-container w3-center w3-centered" id="receive-container">
	<table id="receive" class="w3-center" >
    	<tr><td>접수기간</td><td>
			<input type="text" id="datepicker" name="startdate" style="width:100px;"> ~ <input type="text" name="enddate" id="datepicker2" style="width:100px;">
    	<tr><td>접수방법</td><td>
    		<input type="radio" name="receivetype" checked="checked" value="d">doIT 지원
    		<input type="radio" name="receivetype" value="h">본사 홈페이지 지원
    		<input type="radio" name="receivetype" value="e">이메일 지원</td></tr>
	</table></div><br><br>

	<div id="title">담당자</div>
	<hr>
	<div class="w3-container w3-center w3-centered" id="manager-container">
	<table id="manager" class="w3-center" >
   		<tr><td>담당자 이름</td><td>
			<input type="text" name="name" style="width: 400px;"></td></tr>  
   		<tr><td>담당자 전화</td><td>
			<input type="text" name="phone" style="width: 400px;"></td></tr>  
   		<tr><td>담당자 휴대전화</td><td>
			<input type="text" name="mobile" style="width: 400px;"></td></tr>  
   		<tr><td>담당자 이메일</td><td>
			<input type="text" name="email" style="width: 400px;"></td></tr>  
	</table></div>
	<br><br>
	<input type="submit" value="공고등록" class="w3-button w3-blue"><br><br><br>
</form:form>
</div>
</body>
</html>