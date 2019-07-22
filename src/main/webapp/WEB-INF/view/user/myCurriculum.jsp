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
<script>
	$(document).change(function() {
		if ($('#bohun').val() == 'isbohun') {
			$('#bohunres1').css('display', '');
			$('#bohunres2').css('display', '');
		} else {
			$('#bohunres1').css('display', 'none');
			$('#bohunres2').css('display', 'none');
			$('#bohunrea').val('');
		}

		if ($('#army').val() == 'gunfill') {
			$('#meefillsau').css('display', 'none');
			$('#myeonjesau').css('display', 'none');
			$('#armyreason2').css('display', 'none');
			$('#reasontext').val('');
			$('#gunbok').css('display', '');
			$('#armyreason1').css('display', '');
			$('#armyreason1').css('display', 'inline-block');

		} else if ($('#army').val() == 'meefill') {
			$('#myeonjesau').css('display', 'none');
			$('#meefillsau').css('display', '');
			$('#armyreason2').css('display', '');
			$('#reasontext').val('');
			$('#reasontext').attr('placeholder', '미필 사유');
			$('#myeonjesau').css('display', 'none');
			$('#gunbok').css('display', 'none');

		} else if ($('#army').val() == 'myeonje') {
			$('#meefillsau').css('display', 'none');
			$('#myeonjesau').css('display', '');
			$('#armyreason2').css('display', '');
			$('#reasontext').val('');
			$('#reasontext').attr('placeholder', '면제 사유');
			$('#gunbok').css('display', 'none');

		} else if ($('#army').val() == 'bokmu') {
			$('#meefillsau').css('display', 'none');
			$('#myeonjesau').css('display', 'none');
			$('#armyreason1').css('display', 'none');
			$('#armyreason2').css('display', 'none');
			$('#reasontext').val('');
			$('#gunbok').css('display', '');

		} else {
			$('#meefillsau').css('display', 'none');
			$('#myeonjesau').css('display', 'none');
			$('#gunbok').css('display', 'none');
			$('#armyreason1').css('display', 'none');
			$('#armyreason2').css('display', 'none');
			$('#reasontext').val('');

		}
	});
	
	$(document).ready(function() {
		$('#posiradio').hide();
		$('#posi').click(function() {
			$('#posiradio').slideToggle();
		});
		
		$('#jobradio').hide();
		$('#job').click(function() {
			$('#jobiradio').slideToggle();
		});
	});
	
	function addcareer() {
	      $('#career-parent').clone().appendTo('#career-clone');
	     					      
	      $('#career-clone:last-child > #career-parent').attr("id","career-parent-add");
	      $('#career-clone:last-child #del').attr('id','del-add');
	      $('#career-clone:last-child #btn-group').attr('id','btn-group-add');
	      $('#career-clone:last-child #del-add').css('display','');
	      $('#career-clone:last-child #btn-group-add').addClass('btn-group');
	      $('#career-add:last-child select option').val('');
	      $('#career-add:last-child input').val('');
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
	}
	function ca2() {
		$('#ca2').addClass('btn-info');
		$('#ca2').removeClass('btn-outline-info');
		$('#ca1').removeClass('btn-info');
		$('#ca1').addClass('btn-outline-info');
		
		$('#career').css('display','');
		$('#hr').css('display','');
		$('#careerbtn').css('display','');
	}
</script>
<meta charset="EUC-KR">
<title>이력서</title>
</head>
<body>
	<form:form action="curriculum.shop" modelAttribute="cv" enctype="multipart/form-data" name="f">
		<div class="container-fluid text-center"
			style="padding: 5rem 0; background-color: #F6F6F6;">
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
										<h3>
											<input class="form-control" type="text"
												style="padding: 5px 10px;" name="addr" value=""
												placeholder="상세 주소">
										</h3>
									</div>
								</div>
							</div>
							<div class="col-sm-3 sidenav" style="margin-top: 64px;">
								<img class="img-thumbnail" src="#"
									style="width: 190px; height: 220px;" id="pic">
							</div>
						</div>
					</div>
					
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
											<input class="form-control" type="text"
												style="padding: 5px 10px;" name="school" value=""
												placeholder="학교">
										</h3>
										<h3>
											<input class="form-control" type="text"
												style="padding: 5px 10px;" name="schoolname" value=""
												placeholder="학교명">
										</h3>
										<h3>
											<input class="form-control" type="text"
												style="padding: 5px 10px;" name="schoollocation" value=""
												placeholder="지역">
										</h3>
										<h3>
											<input class="form-control" type="text"
												style="padding: 5px 10px;" name="major" value=""
												placeholder="전공 및 전공계열">
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
												<option value="isbohun">대상</option>
											</select>
										</h3>
										<h3 id="bohunres2" style="display: none;">
											<input class="form-control" type="text"
												style="padding: 5px 10px; width: 600px;" name="bohunreason"
												value="" placeholder="대상사유" id="bohunrea">
										</h3>
										<h3>
											<select class="form-control" name="army"
												style="width: 350px;" id="army">
												<option>병역대상 선택</option>
												<option value="gunfill">군필</option>
												<option value="meefill">미필</option>
												<option value="myeonje">면제</option>
												<option value="bokmu">복무중</option>
											</select>
										</h3>
										<h3 id="gunbok" style="display: none;">
											<select class="form-control" name="armytype"
												style="display: inline-block; width: 111px;" id="armytype">
												<option>군별 선택</option>
												<option value="yukgun">육군</option>
												<option value="haegun">해군</option>
												<option value="gonggun">공군</option>
												<option value="haebyeong">해병</option>
												<option value="uigyeong">의경</option>
												<option value="jungueong">전경</option>
												<option value="gongik">공익</option>
												<option value="gita">기타</option>
											</select> 
											<select class="form-control" name="armyclass"
												style="display: inline-block; width: 111px;" id="armyclass">
												<option>계급 선택</option>
												<option value="ebyeong">이병</option>
												<option value="ilbyeong">일병</option>
												<option value="sangbyeong">상병</option>
												<option value="byeongjang">병장</option>
												<option value="hasa">하사</option>
												<option value="jungsa">중사</option>
												<option value="sangsa">상사</option>
												<option value="onesa">원사</option>
												<option value="junwi">준위</option>
												<option value="sowi">소위</option>
												<option value="jungwi">중위</option>
												<option value="daewi">대위</option>
												<option value="solyeong">소령</option>
												<option value="junglyeong">중령</option>
												<option value="daelyeong">대령</option>
												<option value="junjang">준장</option>
												<option value="sojang">소장</option>
												<option value="jungjang">중장</option>
												<option value="daejang">대장</option>
												<option value="gita">기타</option>
											</select> 
											<select class="form-control" name="armyreason"
												style="display: none; width: 150px;" id="armyreason1">
												<option>전역 사유 선택</option>
												<option value="mangi">만지제대</option>
												<option value="uigasa">의가사제대</option>
												<option value="uibyeong">의병제대</option>
												<option value="sojib">소집해제</option>
												<option value="bul">불명예제대</option>
												<option value="sange">상이제대</option>
												<option value="gita">기타</option>
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
					
					<!-- 경력 -->
					<div class="container-fluid w3-card"
						style="background-color: white;">
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
									<div class="col-sm-6">
										<h3>
											<input type="text" name="cename" class="form-control"
												placeholder="회사명" style="width: 350px;">
										</h3>
										<h3>
											<input type="date" name="cworkstart" class="form-control"
												style="width: 158px; display: inline-block;"
												placeholder="YYYYMMDD"> <span>~</span> 
											<input type="date" name="cworkend" class="form-control"
												style="width: 158px; display: inline-block;"
												placeholder="YYYYMMDD">
										</h3>
										<h3>
											<input type="text" name="creason" class="form-control" style="width: 350px;"
												placeholder="퇴사 사유">
										</h3>
										<div style="margin-bottom: 10px; height: 42px;">
											<select name="cposition" class="form-control" style="display: inline; width: 133px;">
												<option>직급 선택</option>
											</select>
											<select name="cposition" class="form-control" style="display: inline; width: 133px;">
												<option>직책 선택</option>
											</select>
											<input type="text" name="cpyear" class="form-control" style="width: 73px; height: 35.75px; border: 1px #D6D6D6 solid; 
											border-radius: 5px; display: inline;" placeholder="년차">
										</div>
										<div style="margin-bottom: 10px; height: 42px; width: 100px;">
											<select name="cjob" class="form-control" style="width: 350px;">
												<option>직종 선택</option>
												<c:forEach var="job" items="${job }">
													<option value="${job }">${job }</option>
												</c:forEach>
											</select>
										</div>
										<div style="margin-bottom: 10px; height: 42px;">
											<select name="clocation" class="form-control" style="width: 350px;">
												<option>지역 선택</option>
												<c:forEach var="location" items="${location }">
													<option value="${location }">${location }</option>
												</c:forEach>
											</select>
										</div>
										<div style="margin-bottom: 10px; height: 42px;">
											<input type="text" name="cdept" class="form-control" placeholder="근무부서" style="width: 350px;">
										</div>
										<div style="margin-bottom: 10px; height: 42px;">
											<input type="text" name="csalary" class="form-control" placeholder="연봉" style="width: 315px; display: inline;">
											<span style="display: inline; width: 70px;">만원</span>
										</div>
										<div style="margin-bottom: 10px; height: 42px;">
											<input type="text" name="ctask" class="form-control" placeholder="담당업무" style="width: 430px;">
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
					
					<!-- 대외활동 -->
					<div class="container-fluid w3-card"
						style="background-color: white;">
							<div class="row content">
								<div class="col-sm-12" style="height: 100%;"> 
								<h1><small>대외활동</small></h1>
								<div class="row content">
									<div class="col-sm-3" style="padding-left: 35px;">
										<h3><small>활동구분</small></h3>
										<h3><small>기관/장소</small></h3>
										<h3><small>활동기간</small></h3>
										<h3><small>활동내용</small></h3>
									</div>
									<div class="col-sm-6">
										<h3>
											<select name="actype" class="form-control" style="width: 350px;">
												<option>활동구분 선택</option>
												<option value="intern">활동구분 선택</option>
												<option value="bongsa">자원봉사</option>
												<option value="dongari">동아리</option>
												<option value="ptj">아르바이트</option>
												<option value="sahoe">사회활동</option>
												<option value="soohaeng">수행과제</option>
												<option value="haeoe">해외연수</option>
												<option value="gyoyuk">교육이수내역</option>
											</select>
										</h3>
										<h3>
											<input type="text" name="aclocation" class="form-control"
												placeholder="기관/장소" style="width: 350px;">
										</h3> 
										<h3>
											<input type="date" name="acstart" class="form-control"
												style="width: 158px; display: inline-block;"> 
											<span>~</span> 
											<input type="date" name="acend" class="form-control"
												style="width: 158px; display: inline-block;">
										</h3>
										<h3>
											<input type="text" name="accontent" class="form-control"
												placeholder="활동내역" style="width: 430px;">
										</h3>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<!-- 자격증/어학 -->
					<div class="container-fluid w3-card"
						style="background-color: white;">
						<div class="row content">
							<div class="col-sm-9" style="height: 100%;">
								<h1>
									<small>자격증/어학시험</small>
								</h1>
								<div class="row content">
									<div class="col-sm-4">
										<h3><small>항목선택</small></h3>
										<h3><small>자격증명</small></h3>
										<h3><small>발행처/기관</small></h3>
										<h3><small>언어</small></h3>
										<h3><small>시험종류</small></h3>
										<h3><small>급수</small></h3>
										<h3><small>취득여부</small></h3>
										<h3><small>협격구분</small></h3>
										<h3><small>취득일</small></h3>
									</div>
									<div class="col-sm-8">
										<h3>
											<select name="lltype" class="form-control" style="width: 350px;">
												<option id="li" value="license">자격증/면허증</option>
												<option id="lang" value="lang">어학시험</option>
											</select>
										</h3>
										<h3>
											<input class="form-control" type="text"
												style="padding: 5px 10px;" name="llname" value=""
												placeholder="자격증명">
										</h3>
										<h3>
											<input class="form-control" type="text"
												style="padding: 5px 10px;" name="llplace" value=""
												placeholder="발행처/기관">
										</h3>
										<h3>
											<select name="lllang" class="form-control" style="width: 350px;">
												<option>언어 선택</option>
												<c:forEach var="lang" items="${language }">
													<option value="${lang }">${lang }</option>
												</c:forEach>
											</select>
										</h3>
										<h3>
											<input class="form-control" type="text"
												style="padding: 5px 10px;" name="lltesttype" value=""
												placeholder="시험종류">
										</h3>
										<h3>
											<select name="lllevel" class="form-control" style="width: 350px;">
												<option>급수 선택</option>
												<c:forEach var="lv" items="${level }">
													<option value="${lv }">${lv }</option>
												</c:forEach>
											</select>	
										</h3>
										<h3>
											<select name="lltesttype" class="form-control" style="width: 350px;">
												<option>취득여부 선택</option>
												<option value="pass">취득(pass)</option>
											</select>
										</h3>
										<h3>
											<select name="lltesttype" class="form-control" style="width: 350px;">
												<option>합격구분 선택</option>
												<option value="1cha">1차합격</option>
												<option value="2cha">2차합격</option>
												<option value="filgi">필기합격</option>
												<option value="silgi">실기합격</option>
												<option value="final">최종합격</option>
											</select>
										</h3>
										<h3>
											<input class="form-control" type="date"
												style="padding: 5px 10px;" name="llpassdate" value=""
												placeholder="취득일">
										</h3>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- 보유기술 -->
					<div class="container-fluid w3-card"
						style="background-color: white;" id="haveskill">
						<div class="row content">
							<div class="col-sm-9" style="height: 100%;">
								<h1><small>보유기술</small></h1>
								<div class="row content">
									<div class="col-sm-4">
										<h3><small>보유능력</small></h3>
										<h3><small>수준</small></h3>
										<h3><small>상세내용</small></h3>
									</div>
									<div class="col-sm-8">
										<h3>
											<input class="form-control" type="text"
												style="padding: 5px 10px;" name="hsability" value=""
												placeholder="보유능력">
										</h3>
										<h3>
											<input class="form-control" type="text"
												style="padding: 5px 10px;" name="hslevel" value=""
												placeholder="수준">
										</h3>
										<h3>
											<input class="form-control" type="text"
												style="padding: 5px 10px;" name="hscontent" value=""
												placeholder="상세내용">
										</h3>
									</div>
								</div>
							</div>
						</div>
					</div>					
					
					<!-- 경력 기술서 -->
					<div class="container-fluid w3-card"
						style="background-color: white; min-height: 385px;">
						<div class="row content" style="padding: 0 15px;">
							<h1><small>경력 기술서</small></h1>
							<textarea class="form-control" name="skillcontent" rows="5"
								style="height: 250px; padding: .5rem 1rem;"></textarea>
						</div>
					</div>
					
					<!-- 포트폴리오 -->
					<div class="container-fluid w3-card"
						style="background-color: white;">
						<div class="row content">
							<div class="col-sm-9" style="height: 100%;">
								<h1><small>포트폴리오</small></h1>
								<div class="row content">
									<div class="col-sm-4">
										<h3><small></small></h3>
									</div>
									<div class="col-sm-8">
										<h3>
											
										</h3>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<!-- 자소서 -->
					<div class="container-fluid w3-card"
						style="background-color: white;">
							<div class="row content">
								<div class="col-sm-12" style="height: 100%;"> 
								<h1><small>자소서</small></h1>
								<input type="text" name="jemok" value="" class="form-control" 
								style="margin-bottom: 10px; font-size: 20px;" placeholder="자기소개서 제목"><hr>
								<div class="row content">
									<div class="col-sm-12">
										<input type="text" name="rsubject" value="" class="form-control" 
										placeholder="자소서 제목" style="height: 60px; padding: 0 25px;">
										<textarea id="resume" name="rcontent" style="resize: none; min-height: 240px;
										border-radius: 5px; width: 100%; padding: 20px 25px; letter-spacing: -1px;
										border: 1px #D6D6D6 solid;" placeholder="자소서 내용"></textarea>
									</div>
								</div>
								<!--  -->
								<script>
									
								</script>
								<!--  -->
							</div>
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
										<h3>지역</h3>
										<div style="margin-bottom: 10px; height: 42px; border: 1px #d6d6d6 solid; padding: 12px 1rem; font-size: 11px;">
											<a style="float: right; color: blue; font-size: 12px; cursor: pointer;" id="cdtjob">수정·추가하기</a>
											<script>
												$(document).ready(function(){
													$('#cdtjob-box').hide();
													$('#cdtjob').click(function(){
														$('#cdtjob-box').slideToggle();
													});
												});
											</script>
										</div>
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
					<button class="btn btn-primary btn-lg">저장하기</button>
				</div>
			</div>
		</div>
</form:form>
</body>
</html>