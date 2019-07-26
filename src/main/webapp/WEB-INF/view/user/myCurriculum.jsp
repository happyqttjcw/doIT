<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<style>
ul.nav-pills {
	top: 20px;
	position: fixed;
}

div.col-sm-9 div {
	height: 250px;
	font-size: 28px;
}

.inline-block {
	display: inline-block;
}

span>input {
	border-style: none;
	padding: 0 15px;
	height: 40px;
}

div.col-sm-9 div {
	height: 100%;
}

div.col-sm-8 input {
	width: 350px;
}

h3 {
	height: 42px;
}

.col-sm-4 h3 {
	padding: 5px 15px;
}

.container-fluid {
	margin-bottom: 30px;
}

.red {
	font-size: 15px;
	color: red;
	display: none;
}

h1>a {
	width: 250px;
}

#posi1 > div, #posi2 > div {
	display: inline-block;
	width: 63px;
}
</style>
<meta charset="EUC-KR">
<title>이력서</title>
</head>
<body>
	<form:form action="curriculum.shop" modelAttribute="cv" enctype="multipart/form-data" name="f">
	<input type="hidden" value="${param.userno }">
		<div class="container-fluid text-center" style="padding: 5rem 0; background-color: #F6F6F6;">
			<div class="row content">
				<div class="col-sm-3"></div>
				<div class="col-sm-6 text-left"
					style="background-color: #f6f6f6; padding: 1rem; min-width: 950px; height: 100%;">
					
					<input class="form-control w3-card" type="text" name="subject" placeholder="제목 입력"
					style="border-style: none; width: 940px; margin-bottom: 20px; height: 80px; padding: 10px 30px; font-size: 30px;">
					
					<!-- 기본사항 -->
					<div class="container-fluid w3-card" style="background-color: white;">
						<div class="row content">
							<div class="col-sm-9" style="height: 100%;">
								<h1><small>기본 사항</small></h1>
								<div class="row content">
									<div class="col-sm-4">
										<h3><small>이름 <span class="red">필수</span></small></h3>
										<h3><small>생년월일 <span class="red">필수</span></small></h3>
										<h3><small>이메일 <span class="red">필수</span></small>	</h3>
										<h3><small>핸드폰 <span class="red">필수</span></small>	</h3>
										<h3><small>주소 <span class="red">필수</span></small></h3>
									</div>
									<div class="col-sm-8">
										<h3>
											<input class="form-control" type="text"
												style="padding: 5px 10px;" name="name" value=""
												placeholder="이름">
										</h3>
										<h3>
											<input class="form-control" type="date"
												style="padding: 5px 10px;" name="birth" value=""
												placeholder="생년월일">
										</h3>
										<h3>
											<input class="form-control" type="text"
												style="padding: 5px 10px;" name="email" value=""
												placeholder="이메일">
										</h3>
										<h3>
											<input class="form-control" type="text"
												style="padding: 5px 10px;" name="phone" value=""
												placeholder="핸드폰">
										</h3>
										<h3>
											<input class="form-control" type="text"
												style="padding: 5px 10px;" name="addr" value=""
												placeholder="주소">
										</h3>
									</div>
								</div>
							</div>
							<div class="col-sm-3 sidenav" style="margin-top: 64px;">
								<input type="hidden" name="picture" id="picture">
								<img class="img-thumbnail" src="" style="width: 190px; height: 220px;" id="pic">
								<input type="file" name="pictureUrl" id="file">
							</div>
						</div>
					</div>
					<script>
						function readURL(input) {
						    if (input.files && input.files[0]) {
						        var reader = new FileReader();
						        reader.onload = function(e) {
						            $('#pic').attr('src', e.target.result);
						            $('#picture').attr('value',e.target.result);
						            $('#pictureUrl').attr('value',e.target.result);
						        }
						        reader.readAsDataURL(input.files[0]);
						    }
						}
						
						$("#file").change(function() {
						    readURL(this);
						});
					</script>
					
					<!-- 학력사항 -->
					<div class="container-fluid w3-card"
						style="background-color: white;">
						<div class="row content">
							<div class="col-sm-9" style="height: 100%;">
								<h1><small>학력사항</small></h1>
								<div class="row content">
									<div class="col-sm-4">
										<h3><small>학교</small></h3>
										<h3><small>학교명</small></h3>
										<h3><small>지역</small></h3>
										<h3><small>전공 및 계열</small></h3>
										<h3><small>주/야간</small></h3>
										<h3><small>학점</small></h3>
									</div>
									<div class="col-sm-8">
										<h3>
											<select name="school" class="form-control" style="width: 350px;">
												<option>학력 선택</option>
												<c:forEach var="school" items="${education }">
													<option value="${school }">${school }</option>
												</c:forEach>
											</select>
										</h3>
										<h3>
											<input class="form-control" type="text"
												style="padding: 5px 10px;" name="schoolname" value="" placeholder="학교명">
										</h3>
										<h3>
											<input class="form-control" type="text"
												style="padding: 5px 10px;" name="schoollocation" value="" placeholder="지역">
										</h3>
										<h3>
											<input class="form-control" type="text"
												style="padding: 5px 10px;" name="major" value="" placeholder="전공 및 전공계열">
										</h3>
										<h3>
											<select name="daynight" class="form-control"
												style="width: 350px;">
												<option>선택</option>
												<option value="day">주간</option>
												<option value="night">야간</option>
											</select>
										</h3>
										<h3>
											<input class="form-control" type="text"
												style="padding: 5px 10px; width: 293px; display: inline-block;"
												name="score" value="" placeholder="학점"> <input
												style="padding: 5px 10px; width: 50px; border-style: groove; color: #7777; display: inline-block; text-align: center;"
												class="form-control" type="text" readonly="readonly"
												value="4.5">
										</h3>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<!-- 취업우대사항 -->
					<div class="container-fluid w3-card"
						style="background-color: white;">
						<div class="row content">
							<div class="col-sm-9" style="height: 100%;">
								<h1>
									<small>취업우대사항</small>
								</h1>
								<div class="row content">
									<div class="col-sm-4">
										<h3><small>보훈대상</small></h3>
										<h3 id="bohunres1" style="display: none;">
											<small>대상사유</small>
										</h3>
										<h3><small>병역대상</small></h3>
										<h3>
											<small id="meefillsau" style="display: none;">미필 사유</small> 
											<small id="myeonjesau" style="display: none;">면제 사유</small>
										</h3>
									</div>
									<div class="col-sm-8">
										<h3>
											<select class="form-control" style="width: 350px;"
												name="bohun" id="bohun">
												<option value="none">비대상</option>
												<option value="보훈">대상</option>
											</select>
										</h3>
										<h3 id="bohunres2" style="display: none;">
											<input class="form-control" type="text"
												style="padding: 5px 10px; width: 600px;" name="bohunreason"
												value="" placeholder="대상사유" id="bohunrea">
										</h3>
										<h3>
											<select class="form-control" name="army" style="width: 350px;" id="army">
												<option>병역대상 선택</option>
												<option value="군필">군필</option>
												<option value="미필">미필</option>
												<option value="면제">면제</option>
												<option value="복무중">복무중</option>
											</select>
										</h3>
										<h3 id="gunbok" style="display: none;">
											<select class="form-control" name="armytype" style="display: inline-block; width: 111px;" id="armytype">
												<option>군별 선택</option>
												<option value="육군">육군</option>
												<option value="해군">해군</option>
												<option value="공군">공군</option>
												<option value="해병">해병</option>
												<option value="의경">의경</option>
												<option value="전경">전경</option>
												<option value="공익">공익</option>
												<option value="기타">기타</option>
											</select> 
											<select class="form-control" name="armyclass"
												style="display: inline-block; width: 111px;" id="armyclass">
												<option>계급 선택</option>
												<option value="이병">이병</option>
												<option value="일병">일병</option>
												<option value="상병">상병</option>
												<option value="병장">병장</option>
												<option value="하사">하사</option>
												<option value="중사">중사</option>
												<option value="상사">상사</option>
												<option value="원사">원사</option>
												<option value="준위">준위</option>
												<option value="소위">소위</option>
												<option value="중위">중위</option>
												<option value="대위">대위</option>
												<option value="소령">소령</option>
												<option value="중령">중령</option>
												<option value="대령">대령</option>
												<option value="준장">준장</option>
												<option value="소장">소장</option>
												<option value="중장">중장</option>
												<option value="대장">대장</option>
												<option value="기타">기타</option>
											</select> 
											<select class="form-control" name="armyreason"
												style="display: none; width: 150px;" id="armyreason1">
												<option>전역 사유 선택</option>
												<option value="만기제대">만기제대</option>
												<option value="의가사제대">의가사제대</option>
												<option value="의병제대">의병제대</option>
												<option value="소집해제">소집해제</option>
												<option value="불명예제대">불명예제대</option>
												<option value="상이제대">상이제대</option>
												<option value="기타">기타</option>
											</select>
										</h3>
										<h3 id="armyreason2" style="display: none;">
											<input type="text" class="form-control" name="armyreason"
												placeholder="" value="" id="reasontext"
												style="width: 650px;">
										</h3>
									</div>
								</div>
							</div>
						</div>
					</div>
					<script>
						$(document).change(function() {
							if ($('#bohun').val() == '보훈') {
								$('#bohunres1').css('display', '');
								$('#bohunres2').css('display', '');
								$('#bohunrea').val('');
								
								$('#bohun input').val('');
							} else {
								$('#bohunres1').css('display', 'none');
								$('#bohunres2').css('display', 'none');
								$('#bohunrea').val('');
								
								$('#bohun input').val('');
							}
							$('#army').click(function(){
								if ($(this).val() == '군필') {
									$('#meefillsau').css('display', 'none');
									$('#myeonjesau').css('display', 'none');
									$('#armyreason2').css('display', 'none');
									$('#reasontext').val('');
									$('#gunbok').css('display', '');
									$('#armyreason1').css('display', '');
									$('#armyreason1').css('display', 'inline-block');
									
									$('#armytype').children('option:first').attr('selected','selected');
									$('#armyclass').children('option:first').attr('selected','selected');
									$('#armyreason1').children('option:first').attr('selected','selected');
								} else if ($(this).val() == '미필') {
									$('#myeonjesau').css('display', 'none');
									$('#meefillsau').css('display', '');
									$('#armyreason2').css('display', '');
									$('#reasontext').val('');
									$('#reasontext').attr('placeholder', '미필 사유');
									$('#myeonjesau').css('display', 'none');
									$('#gunbok').css('display', 'none');
									
									$('#armytype').children('option:first').attr('selected','selected');
									$('#armyclass').children('option:first').attr('selected','selected');
									$('#armyreason1').children('option:first').attr('selected','selected');
								} else if ($(this).val() == '면제') {
									$('#meefillsau').css('display', 'none');
									$('#myeonjesau').css('display', '');
									$('#armyreason2').css('display', '');
									$('#reasontext').val('');
									$('#reasontext').attr('placeholder', '면제 사유');
									$('#gunbok').css('display', 'none');
		
									$('#armytype').children('option:first').attr('selected','selected');
									$('#armyclass').children('option:first').attr('selected','selected');
									$('#armyreason1').children('option:first').attr('selected','selected');
								} else if ($(this).val() == '복무중') {
									$('#meefillsau').css('display', 'none');
									$('#myeonjesau').css('display', 'none');
									$('#armyreason1').css('display', 'none');
									$('#armyreason2').css('display', 'none');
									$('#reasontext').val('');
									$('#gunbok').css('display', '');
									
									$('#armytype').children('option:first').attr('selected','selected');
									$('#armyclass').children('option:first').attr('selected','selected');
									$('#armyreason1').children('option:first').attr('selected','selected');
								} else {
									$('#meefillsau').css('display', 'none');
									$('#myeonjesau').css('display', 'none');
									$('#gunbok').css('display', 'none');
									$('#armyreason1').css('display', 'none');
									$('#armyreason2').css('display', 'none');
									$('#reasontext').val('');
									
									$('#armytype').children('option:first').attr('selected','selected');
									$('#armyclass').children('option:first').attr('selected','selected');
									$('#armyreason1').children('option:first').attr('selected','selected');
								}
							});
							$('#armytype').click(function(){
								$(this).children('option:first').removeAttr('selected');
							});
							$('#armyclass').click(function(){
								$(this).children('option:first').removeAttr('selected');
							});
							$('#armyreason1').click(function(){
								$(this).children('option:first').removeAttr('selected');
							});
						});
					</script>
					
					<!-- 경력 -->
					<div class="container-fluid w3-card" style="background-color: white;">
					<input type="hidden" value="신입" name="career[0].cename" id="careerHidden">
						<h1><small>경력 사항</small></h1>
						<h1 style="text-align: center;">
							<a href="javascript:ca1()" class="btn btn-info btn-lg" id="ca1">신입</a>
							<a href="javascript:ca2()" class="btn btn-outline-info btn-lg" id="ca2">경력</a>
						</h1>
						<div class="row content" id="career-parent">
							<div class="col-sm-12" style="height: 100%;">
								<hr>
								<div class="row content" id="career" style="display: none;">
									<div class="col-sm-3" style="padding-left: 35px;">
										<h3><small>회사명</small></h3>
										<h3><small>재직기간</small></h3>
										<h3 id="carea"><small>퇴사 사유</small></h3>
										<h3><small>직급/직책</small></h3>
										<h3><small>직종</small></h3>
										<h3><small>근무지역</small></h3>
										<h3><small>근무부서</small></h3>
										<h3><small>연봉</small></h3>
										<h3><small>담당업무</small></h3>
									</div>
									<div class="col-sm-6" id="career-smallParent">
										<h3>
											<input type="text" name="career[0].cename" class="form-control"
												placeholder="회사명" style="width: 350px;" id="cename">
										</h3>
										<h3>
											<input type="date" name="career[0].cworkstart" class="form-control"
												style="width: 158px; display: inline-block;" id="cworkstart">
											<span>~</span> 
											<input type="date" name="career[0].cworkend" class="form-control"
												style="width: 158px; display: inline-block;" id="cworkend">
										</h3>
										<h3>
											<input type="text" name="career[0].creason" class="form-control" 
											style="width: 350px;" id="creason"
												placeholder="퇴사 사유">
										</h3>
										<div style="margin-bottom: 10px; height: 42px;">
											<select name="career[0].cposition1" class="form-control" style="display: inline; width: 133px;" id="cposition1">
												<option>직급 선택</option>
												<c:forEach var="position1" items="${position1 }">
													<option value="${position1 }">${position1 }</option>
												</c:forEach>
											</select>
											<select name="career[0].cposition2" class="form-control" style="display: inline; width: 133px;" id="cposition2">
												<option>직책 선택</option>
												<c:forEach var="position2" items="${position2 }">
													<option value="${position2 }">${position2 }</option>
												</c:forEach>
											</select>
											<input type="text" name="career[0].cpyear" class="form-control" id="cpyear"
											style="width: 73px; height: 35.75px; border: 1px #D6D6D6 solid; border-radius: 5px; display: inline;" placeholder="년차">
										</div>
										<div style="margin-bottom: 10px; height: 42px; width: 100px;">
											<select name="career[0].cworktype" class="form-control" style="width: 350px;" id="cworktype">
												<option>직종 선택</option>
												<c:forEach var="job" items="${job }">
													<option value="${job }">${job }</option>
												</c:forEach>
											</select>
										</div>
										<div style="margin-bottom: 10px; height: 42px;">
											<select name="career[0].cworklocation" class="form-control" style="width: 350px;" id="cworklocation">
												<option>지역 선택</option>
												<c:forEach var="location" items="${location }">
													<option value="${location }">${location }</option>
												</c:forEach>
											</select>
										</div>
										<div style="margin-bottom: 10px; height: 42px;">
											<input type="text" name="career[0].cdept" class="form-control" placeholder="근무부서" style="width: 350px;" id="cdept">
										</div>
										<div style="margin-bottom: 10px; height: 42px;">
											<input type="text" name="career[0].csalary" class="form-control" placeholder="연봉" style="width: 315px; display: inline;" id="csalary">
											<span style="display: inline; width: 70px;">만원</span>
										</div>
										<div style="margin-bottom: 10px; height: 42px;">
											<input type="text" name="career[0].ctask" class="form-control" placeholder="담당업무" style="width: 430px;" id="ctask">
										</div>
									</div>
									<div class="col-sm-3"></div>
								</div>
								<hr id="hr" style="display: none;" id="hr">
								<div class="col-sm-12" style="min-height: 65px; display: none;" id="careerbtn">
									<div class="" style="float: right;" id="btn-group">
										<div class="btn btn-success btn-lg" onclick="addcareer()">경력 추가 +</div>
										<div class="btn btn-success btn-lg" onclick="delcareer(this)" style="display: none;" id="del">삭제-</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 복사 -->
						<div id="career-clone"></div>
					</div>
					<script>
					var i = 0;
							function addcareer() {
							      $('#career-parent').clone().appendTo('#career-clone');
							     
							      i = $('#career-clone').children().length;
							      $('#career-clone:last-child #career-parent').attr("id","career-parent-add");
							      $('#career-clone:last-child #career-smallParent').attr("id","career-smallParent-"+i);
							      $('#career-clone:last-child #del').attr('id','del-add');
							      $('#career-clone:last-child #btn-group').attr('id','btn-group-add');
							      $('#career-clone:last-child #del-add').css('display','');
							      $('#career-clone:last-child #btn-group-add').addClass('btn-group');
							      $('#career-smallParent-'+i+' select').find('option:first').attr('selected','selected');
							      $('#career-smallParent-'+i+' input').val('');
									
							      $('#career-clone:last-child #cename').attr('id','cename'+i);
							      $('#career-clone:last-child #cworkstart').attr('id','cworkstart'+i);
							      $('#career-clone:last-child #cworkend').attr('id','cworkend'+i);
							      $('#career-clone:last-child #creason').attr('id','creason'+i);
							      $('#career-clone:last-child #cposition1').attr('id','cposition1'+i);
							      $('#career-clone:last-child #cposition2').attr('id','cposition2'+i);
							      $('#career-clone:last-child #cpyear').attr('id','cpyear'+i);
							      $('#career-clone:last-child #cworktype').attr('id','cworktype'+i);
							      $('#career-clone:last-child #cworklocation').attr('id','cworklocation'+i);
							      $('#career-clone:last-child #cdept').attr('id','cdept'+i);
							      $('#career-clone:last-child #csalary').attr('id','csalary'+i);
							      $('#career-clone:last-child #ctask').attr('id','ctask'+i);
							      
							      $('#career-clone:last-child #cename'+i).attr('name','career['+i+'].cename');
							      $('#career-clone:last-child #cworkstart'+i).attr('name','career['+i+'].cworkstart');
							      $('#career-clone:last-child #cworkend'+i).attr('name','career['+i+'].cworkend');
							      $('#career-clone:last-child #creason'+i).attr('name','career['+i+'].creason');
							      $('#career-clone:last-child #cposition1'+i).attr('name','career['+i+'].cposition1');
							      $('#career-clone:last-child #cposition2'+i).attr('name','career['+i+'].cposition2');
							      $('#career-clone:last-child #cpyear'+i).attr('name','career['+i+'].cpyear');
							      $('#career-clone:last-child #cworktype'+i).attr('name','career['+i+'].cworktype');
							      $('#career-clone:last-child #cworklocation'+i).attr('name','career['+i+'].cworklocation');
							      $('#career-clone:last-child #cdept'+i).attr('name','career['+i+'].cdept');
							      $('#career-clone:last-child #csalary'+i).attr('name','career['+i+'].csalary');
							      $('#career-clone:last-child #ctask'+i).attr('name','career['+i+'].ctask');
							}
							function delcareer(b) {
								$(b).closest('#career-parent-add').remove();
							}
							
							function ca1() {
								$('#ca1').addClass('btn-info');
								$('#ca1').removeClass('btn-outline-info');
								$('#ca2').removeClass('btn-info');
								$('#ca2').addClass('btn-outline-info');
								
								$('#career').css('display','none');
								$('#hr').css('display','none');
								$('#careerbtn').css('display','none');
								
								$('#career-clone').css('display','none');
							}
							function ca2() {
								$('#ca2').addClass('btn-info');
								$('#ca2').removeClass('btn-outline-info');
								$('#ca1').removeClass('btn-info');
								$('#ca1').addClass('btn-outline-info');
								
								$('#career').css('display','');
								$('#hr').css('display','');
								$('#careerbtn').css('display','');
								
								$('#career-clone').css('display','');
								
								$('#careerHidden').attr('disabled','disabled');
							}
						</script>
					
					<!-- 대외활동 -->
					<div class="container-fluid w3-card" style="background-color: white;">
						<h1><small>대외활동</small></h1>
							<div class="row content" id="activity-parent">
								<div class="col-sm-12" style="height: 100%;"> 
									<div class="row content">
										<div class="col-sm-3" style="padding-left: 35px;">
											<h3><small>활동구분</small></h3>
											<h3><small>기관/장소</small></h3>
											<h3><small>활동기간</small></h3>
											<h3><small>활동내용</small></h3>
										</div>
										<div class="col-sm-6" id="activity-smallParent">
											<h3>
												<select name="activity[0].actype" class="form-control" style="width: 350px;" id="actype">
													<option>활동구분 선택</option>
													<option value="교내활동">교내활동</option>
													<option value="인턴">인턴</option>
													<option value="자원봉사">자원봉사</option>
													<option value="동아리">동아리</option>
													<option value="아르바이트">아르바이트</option>
													<option value="사회활동">사회활동</option>
													<option value="수행과제">수행과제</option>
													<option value="해외연수">해외연수</option>
													<option value="교육이수내역">교육이수내역</option>
												</select>
											</h3>
											<h3>
												<input type="text" name="activity[0].aclocation" class="form-control"
													placeholder="기관/장소" style="width: 350px;" id="aclocation">
											</h3> 
											<h3>
												<input type="date" name="activity[0].acstart" class="form-control" id="acstart"
													style="width: 158px; display: inline-block;"> 
												<span>~</span> 
												<input type="date" name="activity[0].acend" class="form-control" id="acend"
													style="width: 158px; display: inline-block;">
											</h3>
											<h3>
												<input type="text" name="activity[0].accontent" class="form-control" id="accontent"
													placeholder="활동내역" style="width: 430px;">
											</h3>
										</div>
										<div class="col-sm-3"></div>
									</div>
								<hr>
								<div class="col-sm-12" style="min-height: 65px;" id="activitybtn">
									<div class="" style="float: right;" id="btn-group-activity">
										<div class="btn btn-success btn-lg" onclick="addactivity()">대외활동 추가 +</div>
										<div class="btn btn-success btn-lg" onclick="delactivity(this)" style="display: none;" id="del-activity">삭제-</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 복사 -->
						<div id="activity-clone"></div>
					</div>
					<script>
					var i = 0;
						function addactivity() {
						      $('#activity-parent').clone().appendTo('#activity-clone');
						     
						      i = $('#activity-clone').children().length;
						      $('#activity-clone:last-child #activity-parent').attr("id","activity-parent-add");
						      $('#activity-clone:last-child #activity-smallParent').attr("id","activity-smallParent-"+i);
						      $('#activity-clone:last-child #del-activity').attr('id','del-activity-add');
						      $('#activity-clone:last-child #btn-group-activity').attr('id','btn-group-activity-add');
						      $('#activity-clone:last-child #del-activity-add').css('display','');
						      $('#activity-clone:last-child #btn-group-activity-add').addClass('btn-group');
						      $('#activity-smallParent-'+i+' select').find('option:first').attr('selected','selected');
						      $('#activity-smallParent-'+i+' input').val('');
								
						      $('#activity-clone:last-child #actype').attr('id','actype'+i);
						      $('#activity-clone:last-child #aclocation').attr('id','aclocation'+i);
						      $('#activity-clone:last-child #acstart').attr('id','acstart'+i);
						      $('#activity-clone:last-child #acend').attr('id','acend'+i);
						      $('#activity-clone:last-child #accontent').attr('id','accontent'+i);
						    
						      $('#activity-clone:last-child #actype'+i).attr('name','activity['+i+'].actype');
						      $('#activity-clone:last-child #aclocation'+i).attr('name','activity['+i+'].aclocation');
						      $('#activity-clone:last-child #acsatrt'+i).attr('name','activity['+i+'].acstart');
						      $('#activity-clone:last-child #acend'+i).attr('name','activity['+i+'].acend');
						      $('#activity-clone:last-child #accontent'+i).attr('name','activity['+i+'].accontent');
						}
						function delactivity(b) {
							$(b).closest('#activity-parent-add').remove();
						}
					</script>
					

					<!-- 자격증/어학 -->
					<div class="container-fluid w3-card" style="background-color: white;">
						<h1><small>자격증/어학시험</small></h1>
						<div class="row content" id="ll-parent">
							<div class="col-sm-12" style="height: 100%;">
								<div class="row content">    
									<div class="col-sm-3">
										<h3><small>항목 선택</small></h3>   
										<h3 class="li"><small>자격증명</small></h3>
										<h3 class="li"><small>발행처/기관</small></h3>
										<h3 style="display: none;" class="lang"><small>언어</small></h3>
										<h3 style="display: none;" class="lang"><small>시험 종류</small></h3>
										<h3 style="display: none;" class="lang"><small>점수</small></h3>
										<h3 style="display: none;" class="lang"><small>급수</small></h3>
										<h3 style="display: none;" class="lang"><small>취득 여부</small></h3>
										<h3 class="li"><small>협격 구분</small></h3>
										<h3 class="li lang"><small>취득일</small></h3>
									</div>
									<div class="col-sm-6" id="ll-smallParent">
										<h3>
											<select name="ll[0].lltype" class="form-control" style="width: 350px;" id="lltype">
												<option id="none">항목 선택</option>   
												<option value="li" id="li">자격증/면허증</option>
												<option value="lang" id="lang">어학시험</option>
											</select>
										</h3>
										<h3 class="li">
											<input class="form-control" type="text" id="llname"
												style="padding: 5px 10px; width: 350px;" name="ll[0].llname" value=""
												placeholder="자격증명">
										</h3>
										<h3 class="li">
											<input class="form-control" type="text" id="llplace"
												style="padding: 5px 10px; width: 350px;" name="ll[0].llplace" value=""
												placeholder="발행처/기관">
										</h3>
										<h3 style="display: none;" class="lang">
											<select name="ll[0].lllang" class="form-control" style="width: 350px;" id="lllang">
												<option>언어 선택</option>
												<c:forEach var="lang" items="${language }">
													<option value="${lang }">${lang }</option>
												</c:forEach>
											</select>
										</h3>
										<h3 style="display: none;" class="lang">
											<input class="form-control" type="text" id="lltesttype"
												style="padding: 5px 10px; width: 350px;" name="ll[0].lltesttype" value=""
												placeholder="시험종류">
										</h3>
										<h3 style="display: none;" class="lang">
											<input class="form-control" type="text" id="llscore"
												style="padding: 5px 10px; width: 350px;" name="ll[0].llscore" value=""
												placeholder="점수">
										</h3>
										<h3 style="display: none;" class="lang">
											<select name="ll[0].lllevel" class="form-control" style="width: 350px;" id="lllevel">
												<option>급수 선택</option>
												<c:forEach var="lv" items="${level }">
													<option value="${lv }">${lv }</option>    
												</c:forEach>
											</select>	
										</h3>
										<h3 style="display: none;" class="lang">
											<select name="ll[0].llpass" class="form-control" style="width: 350px;" id="llpass">
												<option>취득여부 선택</option>
												<option value="pass">취득(pass)</option>
											</select>
										</h3>
										<h3 class="li">
											<select name="ll[0].llpass" class="form-control" style="width: 350px;" id="llpass">
												<option>합격구분 선택</option>
												<option value="1cha">1차합격</option>
												<option value="2cha">2차합격</option>
												<option value="filgi">필기합격</option>
												<option value="silgi">실기합격</option>
												<option value="final">최종합격</option>
											</select>
										</h3>
										<h3 class="li-lang">
											<input class="form-control" type="date" id="llpassdate"
												style="padding: 5px 10px; width: 350px;" name="ll[0].llpassdate" value=""
												placeholder="취득일">
										</h3>
									</div>
									<div class="col-sm-3"></div>
								</div>
								<hr>
								<div class="col-sm-12" style="min-height: 65px;" id="llbtn">
									<div class="" style="float: right;" id="btn-group-ll">
										<div class="btn btn-success btn-lg" onclick="addll()">자격증/어학시험 추가 +</div>
										<div class="btn btn-success btn-lg" onclick="delll(this)" style="display: none;" id="del-ll">삭제-</div>
									</div>
								</div>	       
							</div>	
						</div>
						<div id="ll-clone"></div>
					</div>    
					<script>
					var i = 0;
						function addll() {
						      $('#ll-parent').clone().appendTo('#ll-clone');
						     
						      i = $('#ll-clone').children().length;
						      $('#ll-clone:last-child #ll-parent').attr("id","ll-parent-add");
						      $('#ll-clone:last-child #ll-smallParent').attr("id","ll-smallParent-"+i);
						      
						      $('#ll-clone:last-child .li').attr("class","li"+i);
						      $('#ll-clone:last-child .lang').attr("class","lang"+i);
						      $('#ll-clone:last-child .li-lang').attr("class","li-lang"+i);
						      
						      $('#ll-clone:last-child #del-ll').attr('id','del-ll-add');
						      $('#ll-clone:last-child #btn-group-ll').attr('id','btn-group-ll-add');
						      $('#ll-clone:last-child #del-ll-add').css('display','');
						      $('#ll-clone:last-child #btn-group-ll-add').addClass('btn-group');
						      $('#ll-smallParent-'+i+' select').find('option:first').attr('selected','selected');
						      $('#ll-smallParent-'+i+' input').val('');
								
						      $('#ll-clone:last-child #lltype').attr('id','lltype'+i);
						      $('#ll-clone:last-child #llname').attr('id','llname'+i);
						      $('#ll-clone:last-child #llplace').attr('id','llplace'+i);
						      $('#ll-clone:last-child #lllang').attr('id','lllang'+i);
						      $('#ll-clone:last-child #lltesttype').attr('id','lltesttype'+i);
						      $('#ll-clone:last-child #llscore').attr('id','llscore'+i);
						      $('#ll-clone:last-child #llpass').attr('id','llpass'+i);
						      $('#ll-clone:last-child #llpassdate').attr('id','llpassdate'+i);
						      
						      $('#ll-clone:last-child #lltype'+i).attr('name','ll['+i+'].lltype');
						      $('#ll-clone:last-child #llname'+i).attr('name','ll['+i+'].llname');
						      $('#ll-clone:last-child #llplace'+i).attr('name','ll['+i+'].llplace');
						      $('#ll-clone:last-child #lllang'+i).attr('name','ll['+i+'].lllang');
						      $('#ll-clone:last-child #lltesttype'+i).attr('name','ll['+i+'].lltesttype');
						      $('#ll-clone:last-child #llscore'+i).attr('name','ll['+i+'].llscore');
						      $('#ll-clone:last-child #llpass'+i).attr('name','ll['+i+'].llpass');
						      $('#ll-clone:last-child #llpassdate'+i).attr('name','ll['+i+'].llpassdate');
						}
						function delll(b) {
							$(b).closest('#ll-parent-add').remove();
						}
						var val = '';
						var id = '';
						$(document).click(function(){
							$("[id^='lltype']").click(function(){
								val = $(this).val();
								id = $(this).attr('id');
								id = id.indexOf('');
								console.log(id);
							});
						});
					</script>
					
					<!-- 보유기술 -->
					<div class="container-fluid w3-card" style="background-color: white;">
					<h1><small>보유기술</small></h1>
						<div class="row content" id="hs-parent">
							<div class="col-sm-12" style="height: 100%;">		
								<div class="row content" id="hs-smallParent">
									<div class="col-sm-3">
										<h3><small>보유능력</small></h3>
										<h3><small>수준</small></h3>
										<h3><small>상세내용</small></h3>
									</div>
									<div class="col-sm-6" style="min-height: 300px;">
										<h3>
											<input class="form-control" type="text" id="hsability"
												style="padding: 5px 10px; width: 350px;" name="haveskill[0].hsability" value=""
												placeholder="보유능력">
										</h3>
										<h3>
											<input class="form-control" type="text" id="hslevel"
												style="padding: 5px 10px; width: 350px;" name="haveskill[0].hslevel" value=""
												placeholder="수준">
										</h3>
										<h3>
											<textarea class="form-control" id="hscontent"
												style="padding: 5px 10px; resize: none; height: 180px;" name="havekill[0].hscontent"
												placeholder="상세내용"></textarea>
										</h3>
									</div>
									<div class="col-sm-3"></div>   
								</div>
								<hr>
								<div class="col-sm-12" style="min-height: 65px;" id="hsbtn">
									<div class="" style="float: right;" id="btn-group-hs">
										<div class="btn btn-success btn-lg" onclick="addhs()">보유기술 추가 +</div>
										<div class="btn btn-success btn-lg" onclick="delhs(this)" style="display: none;" id="del-hs">삭제-</div>
									</div>
								</div>
							</div>
						</div>
						<div id="hs-clone"></div>
					</div>
					<script>
					var i = 0;
						function addhs() {
						      $('#hs-parent').clone().appendTo('#hs-clone');
						     
						      i = $('#hs-clone').children().length;
						      $('#hs-clone:last-child > #hs-parent').attr("id","hs-parent-add");
						      $('#hs-clone:last-child > #hs-smallParent').attr("id","hs-smallParent-"+i);
						      $('#hs-clone:last-child #del-hs').attr('id','del-hs-add');
						      $('#hs-clone:last-child #btn-group-hs').attr('id','btn-group-hs-add');
						      $('#hs-clone:last-child #del-hs-add').css('display','');
						      $('#hs-clone:last-child #btn-group-hs-add').addClass('btn-group');
						      $('#hs-smallParent-'+i+' select').find('option:first').attr('selected','selected');
						      $('#hs-smallParent-'+i+' input').val('');
								
						      $('#hs-clone:last-child #hsability').attr('id','hsability'+i);
						      $('#hs-clone:last-child #hslevel').attr('id','hslevel'+i);
						      $('#hs-clone:last-child #hscontent').attr('id','hscontent'+i);
						      
						      $('#hs-clone:last-child #hsability'+i).attr('name','haveskill['+i+'].hsability');
						      $('#hs-clone:last-child #hslevel'+i).attr('name','haveskill['+i+'].hslevel');
						      $('#hs-clone:last-child #hscontent'+i).attr('name','haveskill['+i+'].hscontent');
						}
						function delhs(b) {
							$(b).closest('#hs-parent-add').remove();
						}
					</script>							
					
					<!-- 포트폴리오 -->
					<div class="container-fluid w3-card" style="background-color: white;">
					<h1><small>포트폴리오</small></h1>
						<div class="row content" id="port-parent">
							<div class="col-sm-12" style="height: 100%;">
								<div class="row content" id="port-smallParent">
									<div class="col-sm-3">
										<h3><small></small></h3>
									</div>
									<div class="col-sm-6">
										<h3>
											
										</h3>
									</div>
									<div class="col-sm-3"></div>
								</div>
								<hr>
								<div class="col-sm-12" style="min-height: 65px;" id="portbtn">
									<div class="" style="float: right;" id="btn-group-port">
										<div class="btn btn-success btn-lg" onclick="addport()">포트폴리오 추가 +</div>
										<div class="btn btn-success btn-lg" onclick="delport(this)" style="display: none;" id="del-port">삭제-</div>
									</div>
								</div>
							</div>
						</div>
						<div id="port-clone"></div>
					</div>
					<script>
					var i = 0;
						function addport() {
						      $('#port-parent').clone().appendTo('#port-clone');
						     
						      i = $('#port-clone').children().length;
						      $('#port-clone:last-child > #port-parent').attr("id","port-parent-add");
						      $('#port-clone:last-child > #port-smallParent').attr("id","port-smallParent-"+i);
						      $('#port-clone:last-child #del-port').attr('id','del-port-add');
						      $('#port-clone:last-child #btn-group-port').attr('id','btn-group-port-add');
						      $('#port-clone:last-child #del-port-add').css('display','');
						      $('#port-clone:last-child #btn-group-port-add').addClass('btn-group');
						      /* $('#port-smallParent-'+i+' select').find('option:first').attr('selected','selected');
						      $('#port-smallParent-'+i+' input').val('');
								
						      $('#port-clone:last-child #porturl').attr('id','porturl'+i);
						      $('#port-clone:last-child #portcontent').attr('id','portcontent'+i);
						      
						      $('#port-clone:last-child #porturl'+i).attr('name','portfolio['+i+'].porturl');
						      $('#port-clone:last-child #portcontent'+i).attr('name','portfolio['+i+'].portcontent'); */
						}
						function delport(b) {
							$(b).closest('#port-parent-add').remove();
						}
					</script>
					
					<!-- 자소서 -->
					<div class="container-fluid w3-card" style="background-color: white;">
					<h1><small>자소서</small></h1>
							<div class="row content" id="resume-parent">
								<div class="col-sm-12" style="height: 100%;"> 
								<div class="row content" id="resume-smallParent">
									<div class="col-sm-12">
										<input type="text" name="resume[0].rsubject" value="" class="form-control" 
										placeholder="자소서 제목" style="height: 60px; padding: 0 25px;">
										<textarea id="resume" name="resume[0].rcontent" style="resize: none; min-height: 240px;
										border-radius: 5px; width: 100%; padding: 20px 25px; letter-spacing: -1px;
										border: 1px #D6D6D6 solid;" placeholder="자소서 내용"></textarea>
									</div>
								</div>
								<hr>
								<div class="col-sm-12" style="min-height: 65px;" id="rebtn">
									<div class="" style="float: right;" id="btn-group-re">
										<div class="btn btn-success btn-lg" onclick="addre()">자소서 추가 +</div>
										<div class="btn btn-success btn-lg" onclick="delre(this)" style="display: none;" id="del-re">삭제-</div>
									</div>
								</div>
							</div>
						</div>
						<div id="resume-clone"></div>
					</div>
					<script>
					var i = 0;
						function addre() {
						      $('#resume-parent').clone().appendTo('#resume-clone');
						     
						      i = $('#resume-clone').children().length;
						      $('#resume-clone:last-child > #resume-parent').attr("id","resume-parent-add");
						      $('#resume-clone:last-child > #resume-smallParent').attr("id","re-smallParent-"+i);
						      $('#resume-clone:last-child #del-re').attr('id','del-re-add');
						      $('#resume-clone:last-child #btn-group-re').attr('id','btn-group-re-add');
						      $('#resume-clone:last-child #del-re-add').css('display','');
						      $('#resume-clone:last-child #btn-group-re-add').addClass('btn-group');
						      $('#re-smallParent-'+i+' select').find('option:first').attr('selected','selected');
						      $('#re-smallParent-'+i+' input').val('');
								
						      $('#resume-clone:last-child #rsubject').attr('id','rsubject'+i);
						      $('#resume-clone:last-child #rcontent').attr('id','rcontent'+i);
						      
						      $('#resume-clone:last-child #rsubject'+i).attr('name','resume['+i+'].resubject');
						      $('#resume-clone:last-child #rcontent'+i).attr('name','resume['+i+'].rcontent');
						}
						function delre(b) {
							$(b).closest('#resume-parent-add').remove();
						}
					</script>
					
					<!-- 경력 기술서 -->
					<div class="container-fluid w3-card"
						style="background-color: white; min-height: 385px;">
						<div class="row content" style="padding: 0 15px;">
							<h1><small>경력 기술서</small></h1>
							<textarea class="form-control" name="skillcontent" rows="5"  
								style="height: 250px; padding: .5rem 1rem; resize: none;"></textarea>
						</div>
					</div>
					
					<!-- 희망근무조건 -->
					<div class="container-fluid w3-card" style="background-color: white;">
						<div class="row content">
							<div class="col-sm-9" style="height: 100%;">
								<h1><small>희망 근무조건 선택</small></h1>
								<div class="row content">
									<div class="col-sm-4">
										<h3><small>희망 연봉</small></h3>
										<h3><small>희망 지역</small></h3>
										<h3><small>희망 직종</small></h3>
									</div>
									<div class="col-sm-8">
										<h3>
											<select name="cdtsalary" class="form-control" style="width: 350px;">
												<option value="rule~rule">회사내규에 따름</option>
												<option value="0~1400">1400만원 이하</option>
												<c:forEach var="salary" begin="1400" end="3800" step="200">
													<option value="${salary }~${salary+200 }">${salary }만원~${salary+200 }만원</option>
												</c:forEach>
												<c:forEach var="salary2" begin="4000" end="9000" step="1000">
													<option value="${salary2 }~${salary2+1000 }">${salary2 }만원~${salary2+1000 }만원</option>
												</c:forEach>
												<option value="10000~">1억원 이상</option>
												<option value="interview~interview">면접후 결정</option>
											</select>
										</h3>
										<div style="margin-bottom: 10px; height: 42px; border: 1px #d6d6d6 solid; padding: 12px 1rem; font-size: 11px;">
											<a style="float: right; color: blue; font-size: 12px; cursor: pointer;" id="cdtjob">수정·추가하기</a>
										</div>
										<h3>직종</h3>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- 기준 제일 마지막 -->
					<div class="container-fluid w3-card"
						style="background-color: white;">
						<div class="row content">
							<div class="col-sm-9" style="height: 100%;">
								<h1>
									<small>이력서 공개 여부</small>
								</h1>
								<div class="row content">
									<div class="col-sm-4">
										<h3>
											<small>공개여부 <span class="red">필수</span></small>
										</h3>
									</div>
									<div class="col-sm-8">
										<h3>
											<select name="publicornot" class="form-control"
												style="width: 350px;">
												<option value="1">공개</option>
												<option value="2">비공개</option>
											</select>
										</h3>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<!-- 기준 -->
					</div>
					<div class="col-sm-3 sidenav">
						<input type="submit" value="저장하기" class="btn btn-primary">
					</div>
			</div>
		</div>
</form:form>
</body>
</html>