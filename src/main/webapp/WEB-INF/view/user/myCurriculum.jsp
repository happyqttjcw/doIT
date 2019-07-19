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
</script>
<meta charset="EUC-KR">
<title>이력서</title>
</head>
<body data-spy="scroll" data-target="#myScrollspy" data-offset="20">
	<form:form action="" modelAttribute="cv" enctype="multipart/form-data"
		name="f">
		<div class="container-fluid text-center"
			style="padding: 5rem 0; background-color: #F6F6F6;">
			<div class="row content">
				<div class="col-sm-3"></div>
				<div class="col-sm-6 text-left"
					style="background-color: #f6f6f6; padding: 1rem; min-width: 950px; height: 100%;">
					<div class="container-fluid w3-card"
						style="background-color: white;">
						<div class="row content">
							<div class="col-sm-9" style="height: 100%;">
								<h1>
									<small>기본 사항</small>
								</h1>
								<div class="row content">
									<div class="col-sm-4">
										<h3>
											<small>이름 <span class="red">필수</span></small>
										</h3>
										<h3>
											<small>생년월일 <span class="red">필수</span></small>
										</h3>
										<h3>
											<small>이메일 <span class="red">필수</span></small>
										</h3>
										<h3>
											<small>핸드폰 <span class="red">필수</span></small>
										</h3>
										<h3>
											<small>주소 <span class="red">필수</span></small>
										</h3>
									</div>
									<div class="col-sm-8">
										<h3>
											<input class="form-control" type="text"
												style="padding: 5px 10px;" name="name" value=""
												placeholder="이름">
										</h3>
										<h3>
											<input class="form-control" type="text"
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
					<!-- 기준 -->
					<div class="container-fluid w3-card"
						style="background-color: white;">
						<div class="row content">
							<div class="col-sm-9" style="height: 100%;">
								<h1>
									<small>학력사항</small>
								</h1>
								<div class="row content">
									<div class="col-sm-4">
										<h3>
											<small>학교 <span class="red">필수</span></small>
										</h3>
										<h3>
											<small>학교명 <span class="red">필수</span></small>
										</h3>
										<h3>
											<small>지역 <span class="red">필수</span></small>
										</h3>
										<h3>
											<small>전공 및 계열 <span class="red">필수</span></small>
										</h3>
										<h3>
											<small>주/야간</small>
										</h3>
										<h3>
											<small>학점</small>
										</h3>
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
					<!-- 기준 -->
					<div class="container-fluid w3-card"
						style="background-color: white; min-height: 385px;">
						<div class="row content" style="padding: 0 15px;">
							<h1>
								<small>경력 기술서</small>
							</h1>
							<textarea class="form-control" name="skillcontent" rows="5"
								style="height: 250px; padding: .5rem 1rem;"></textarea>
						</div>
					</div>
					<!-- 기준 -->
					<div class="container-fluid w3-card"
						style="background-color: white;">
						<div class="row content">
							<div class="col-sm-9" style="height: 100%;">
								<h1>
									<small>학력사항</small>
								</h1>
								<div class="row content">
									<div class="col-sm-4">
										<h3>
											<small>보훈대상</small>
										</h3>
										<h3 id="bohunres1" style="display: none;">
											<small>대상사유</small>
										</h3>
										<h3>
											<small>병역대상</small>
										</h3>
										<h3>
											<small id="meefillsau" style="display: none;">미필 사유</small> <small
												id="myeonjesau" style="display: none;">면제 사유</small>
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
											</select> <select class="form-control" name="armyclass"
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
											</select> <select class="form-control" name="armyreason"
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

					<!-- 기준 -->
					<div class="container-fluid w3-card"
						style="background-color: white;">
						<div class="row content">
							<div class="col-sm-9" style="height: 100%;">
								<h1>
									<small>희망 근무조건 선택</small>
								</h1>
								<div class="row content">
									<div class="col-sm-4">
										<h3>
											<small>희망 연봉 <span class="red">필수</span></small>
										</h3>
										<h3>
											<small>희망 지역 <span class="red">필수</span></small>
										</h3>
										<h3>
											<small>희망 직종 <span class="red">필수</span></small>
										</h3>
									</div>
									<div class="col-sm-8">
										<h3>
											<select name="cdtsalary" class="form-control"
												style="width: 350px;">
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
										<h3>직역</h3>
										<h3>직종</h3>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- 경력 -->
					<div class="container-fluid w3-card"
						style="background-color: white;">
						<div class="row content">
							<div class="col-sm-12" style="height: 100%;">
								<h1>
									<small>경력 사항</small>
								</h1>
								<h1 style="text-align: center;">
									<a href="javascript:ca1()" class="btn btn-info btn-lg" id="ca1">신입</a>
									<a href="javascript:ca2()" class="btn btn-info btn-lg" id="ca2">경력</a>
								</h1>
								<hr>
								<div class="row content">
									<div class="col-sm-3">
										<h3>
											<small>회사명</small>
										</h3>
										<h3>
											<small>재직기간</small>
										</h3>
										<h3 id="carea">
											<small>퇴사 사유</small>
										</h3>
										<h3>
											<small>직급/직책</small>
										</h3>
										<h3>
											<small>직종</small>
										</h3>
										<h3>
											<small>근무지역</small>
										</h3>
										<h3>
											<small>근무부서</small>
										</h3>
										<h3>
											<small>연봉</small>
										</h3>
										<h3>
											<small>담당업무</small>
										</h3>
									</div>
									<div class="col-sm-6">
										<h3>
											<input type="text" name="ename" class="form-control"
												placeholder="회사명">
										</h3>
										<h3>
											<input type="text" name="ename" class="form-control"
												placeholder="회사명">
										</h3>
										<h3>직종</h3>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- 보유기술, 대외활동, 자격증/언어, 포트폴리오, 자소서 -->

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
				<div class="col-sm-3 sidenav"></div>
			</div>
		</div>
	</form:form>
</body>
</html>