<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>이력서 상세보기</title>
<style>
	.h100 {
		height: 100%;
	}
	.m-h1000{
		min-height: 1000px;
	}
	.p015{
		padding: 0 15px;
	}
	.p1015{
		padding: 10px 15px;
	}
	.p1025{
		padding: 10px 25px;
	}
	.ib{
		display: inline-block;
		text-align: center;
		height: 100%;
		padding: 7px;
	}
	.border{
		border: 1px #d6d6d6 solid;
	}
	.blue {
		background-color: #B5C1DB;
	}
	.rs {
		border-right: 1px #d6d6d6 solid;
	}
	.bs {
		border-bottom: 1px #d6d6d6 solid;
	}
	.nbs {
		border-bottom: none;
	}
</style>
</head>
<body>
<div class="w3-container">
	<div class="row content">
		<div class="col-sm-2 h100"></div>
		<div class="col-sm-8 h100 m-h1000 p1015" style="min-width: 1000px; padding-top: 30px;">
			<div class="w3-card" style="background-color: #eee1;">
				<div class="p015" style="font-size: 25px; margin-bottom: 35px; padding: 19px 25px; height: 75px;">${cv.subject }<hr></div>
				<div class="p1025 row content" style="min-height: 120px; height: 100%; min-width: 1000px;">
					<div class="col-sm-3" style="text-align: center; min-width: 265px; width: 290px;"><img src="${path }/curriImg/${cv.picture }" style="height: 200px; width: 160px;"></div>
					<div class="col-sm-9" style="padding: 0 78px 0 72px; min-width: 800px;">
						<div style="border: 1px #d6d6d6 solid; min-height: 200px;"><!-- inner div -->
							<div class="blue bs" style="height: 20%; width: 100%;">      
								<div class="ib rs" style="width: 23%;">이름</div>
								<div class="ib rs" style="width: 25%;">생년월일</div>
								<div class="ib rs" style="width: 25%;">이메일</div>
								<div class="ib" style="width: 25%;">핸드폰</div> 
							</div>
							<div class="bs" style="height: 30%; width: 100%;">
								<div class="ib rs" style="width: 23%; padding: 17px 0;">${cv.name }</div>
								<div class="ib rs" style="width: 25%; padding: 17px 0;">${cv.birth }</div>
								<div class="ib rs" style="width: 25%; padding: 17px 0;">${cv.email }</div>
								<div class="ib" style="width: 25%; padding: 17px 0;">${cv.phone }</div>
							</div>
							<div class="blue bs" style="height: 20%; width: 100%;">
								<div class="ib" style="width: 100%;">주소</div>
							</div>
							<div style="height: 30%; width: 100%;">
								<div class="ib" style="width: 100%; padding: 24px 0; min-height: 70px;">${cv.addr }</div>
							</div>
						</div>
					</div>  
				</div>
				<div class="p1025 row content">
					<div class="col-sm-12" style="padding: 0 78px 0 72px; font-size: 30px;">
						학력사항
					</div>
				</div>
				<div class="p1025 row content">
					<div class="col-sm-12" style="padding: 0 78px 0 72px;">   
						<div class="border" style="min-height: 100%; width: 100%;">
							<div class="blue bs" style="height: 20%; width: 100%;">      
								<div class="ib rs" style="width: 16.5%;">최종학력</div>
								<div class="ib rs" style="width: 16.5%;">학교명</div>
								<div class="ib rs" style="width: 16.5%;">학교지역</div>
								<div class="ib rs" style="width: 16.5%;">전공</div>
								<div class="ib rs" style="width: 16.5%;">주/야</div>
								<div class="ib" style="width: 15%;">학점</div>
							</div>
							<div style="height: 30%; width: 100%;">
								<div class="ib rs" style="width: 16.5%; padding: 17px 0;">${cv.school }</div>
								<div class="ib rs" style="width: 16.5%; padding: 17px 0;">${cv.schoolname }</div>
								<div class="ib rs" style="width: 16.5%; padding: 17px 0;">${cv.schoollocation }</div>
								<div class="ib rs" style="width: 16.5%; padding: 17px 0;">${cv.major }</div>
								<div class="ib rs" style="width: 16.5%; padding: 17px 0;">${cv.daynight }</div>
								<div class="ib" style="width: 15%; padding: 17px 0;">
									<c:if test="${empty cv.score }">-</c:if>
									<c:if test="${!empty cv.score }">${cv.score }</c:if>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="p1025 row content">
					<div class="col-sm-12" style="padding: 0 78px 0 72px; font-size: 30px;">
						취업 우대사항
					</div>
				</div>
				<div class="p1025 row content">
					<div class="col-sm-12" style="padding: 0 78px 0 72px;">   
						<div class="border" style="min-height: 100%; width: 100%;">
							<div class="blue bs" style="height: 20%; width: 100%;">
							    <div class="ib rs" style="width: 23.5%;">병역여부</div>
								<div class="ib rs" style="width: 25%;">군별</div>
								<div class="ib rs" style="width: 25%;">계급</div>
								<div class="ib" style="width: 25%;">사유</div>
							</div>
							<div style="height: 30%; width: 100%;">
								<div class="ib rs" style="width: 23.5%;">${cv.army }</div>
								<div class="ib rs" style="width: 25%;">
									<c:if test="${empty cv.armytype }">-</c:if>
									<c:if test="${!empty cv.armytype }">${cv.armytype }</c:if>
								</div>
								<div class="ib rs" style="width: 25%;">
									<c:if test="${empty cv.armyclass }">-</c:if>
									<c:if test="${!empty cv.armyclass }">${cv.armyclass }</c:if>
								</div>
								<div class="ib" style="width: 25%;">${cv.armyreason }</div>
							</div>
							<div class="blue bs" style="height: 20%; width: 100%;">
							    <div class="ib rs" style="width: 23.5%;">보훈대상</div>
								<div class="ib" style="width: 76%;">보훈사유</div>
							</div>
							<div style="height: 30%; width: 100%;">
								<div class="ib rs" style="width: 23.5%;">
									<c:if test="${empty cv.bohun }">-</c:if>
									<c:if test="${!empty cv.bohun }">${cv.bohun }</c:if>
								</div>   
								<div class="ib" style="width: 76%;">
									<c:if test="${empty cv.bohunreason }">-</c:if>
									<c:if test="${!empty cv.bohunreason }">${cv.bohunreason }</c:if>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="p1025 row content">
					<div class="col-sm-12" style="padding: 0 78px 0 72px; font-size: 30px;">
						희망 사항
					</div>
				</div>
				<div class="p1025 row content">
					<div class="col-sm-12" style="padding: 0 78px 0 72px;">   
						<div class="border" style="min-height: 100%; width: 100%;">
							<div class="blue bs" style="height: 20%; width: 100%;">
							    <div class="ib rs" style="width: 24%;">희망연봉</div>
								<div class="ib rs" style="width: 25%;">희망근무지역</div>
								<div class="ib" style="width: 50%;">희망직업</div>
							</div>
							<div style="height: 20%; width: 100%;">
							    <div class="ib rs" style="width: 24%;">
							    <c:choose>
							    	<c:when test="${cv.cdtsalary == '회사내규에 따름' }">회사내규에 따름</c:when>
							    	<c:when test="${cv.cdtsalary == '0~1400' }">1400만원 이하</c:when>
							    	<c:when test="${cv.cdtsalary == '10000~' }">1억이상</c:when>
							    	<c:otherwise>${cv.cdtsalary }</c:otherwise>
							    </c:choose>
							    </div>
								<div class="ib rs" style="width: 25%;">
									<c:if test="${empty cv.cdtlocation1 }">-</c:if>
									<c:if test="${!empty cv.cdtlocation1 }">${cv.cdtlocation1 }</c:if>
									<c:if test="${empty cv.cdtlocation2 }">,-</c:if>
									<c:if test="${!empty cv.cdtlocation2 }">,${cv.cdtlocation2 }</c:if>
									<c:if test="${empty cv.cdtlocation3 }">,-</c:if>
									<c:if test="${!empty cv.cdtlocation3 }">,${cv.cdtlocation3 }</c:if>
								</div>
								<div class="ib" style="width: 50%;">
									<c:if test="${empty cv.cdtjob1 }">-</c:if>
									<c:if test="${!empty cv.cdtjob1 }">${cv.cdtjob1 }</c:if>
									<c:if test="${empty cv.cdtjob2 }">,-</c:if>
									<c:if test="${!empty cv.cdtjob2 }">,${cv.cdtjob2 }</c:if>
									<c:if test="${empty cv.cdtjob3 }">,-</c:if>
									<c:if test="${!empty cv.cdtjob3 }">,${cv.cdtjob3 }</c:if>
									<c:if test="${empty cv.cdtjob4 }">,-</c:if>
									<c:if test="${!empty cv.cdtjob4 }">,${cv.cdtjob4 }</c:if>
									<c:if test="${empty cv.cdtjob5 }">,-</c:if>
									<c:if test="${!empty cv.cdtjob5 }">,${cv.cdtjob5 }</c:if>
								</div>     
							</div>
						</div>
					</div>
				</div>
				<div class="p1025 row content">
					<div class="col-sm-12" style="padding: 0 78px 0 72px; font-size: 30px;">
						경력사항
					</div>
				</div>
				<div class="p1025 row content">
					<div class="col-sm-12" style="padding: 0 78px 0 72px;">   
						<div class="border nbs" style="min-height: 100%; width: 100%;">
							<div class="blue bs" style="height: 20%; width: 100%;">
							    <div class="ib rs" style="width: 20%;">회사명</div>
								<div class="ib rs" style="width: 20%;">재직기간</div>
								<div class="ib rs" style="width: 20%;">퇴사사유</div>
								<div class="ib rs" style="width: 20%;">직급/직책</div>
								<div class="ib" style="width: 18%;">년차</div>
							</div>
							<c:forEach var="cr" items="${cv.career }">
							<div class="bs" style="height: 30%; width: 100%;">
							    <div class="ib rs" style="width: 20%;">${cr.cename }</div>
								<div class="ib rs" style="width: 20%;">${cr.cworkstart }~${cr.cworkend }</div>
								<div class="ib rs" style="width: 20%;">${cr.creason }</div>
								<div class="ib rs" style="width: 20%;">${cr.cposition1 }/${cr.cposition2 }</div>
								<div class="ib" style="width: 18%;">${cr.cpyear }</div>     
							</div>      
							</c:forEach>
							<div class="blue bs" style="height: 20%; width: 100%;">
								<div class="ib rs" style="width: 19%;">직종</div>
								<div class="ib rs" style="width: 19%;">근무지역</div>
								<div class="ib rs" style="width: 20%;">근무부서</div>
								<div class="ib rs" style="width: 20%;">연봉</div>
								<div class="ib" style="width: 20%;">담당업무</div>
							</div>
							<c:forEach var="cr2" items="${cv.career }">
							<div class="bs" style="height: 30%; width: 100%;">
								<div class="ib rs" style="width: 19%;">${cr2.cworktype }</div>
								<div class="ib rs" style="width: 19%;">${cr2.cworklocation }</div>
								<div class="ib rs" style="width: 20%;">${cr2.cdept }</div>
								<div class="ib rs" style="width: 20%;">${cr2.csalary }<c:if test="${!empty cr2.csalary }">만원</c:if></div>
								<div class="ib" style="width: 20%;">${cr2.ctask }</div>
							</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="p1025 row content">
					<div class="col-sm-12" style="padding: 0 78px 0 72px; font-size: 30px;">
						경력기술서
					</div>
				</div>
				<div class="p1025 row content">
					<div class="col-sm-12" style="padding: 0 78px 0 72px;">   
						<textarea readonly="readonly" style="min-height: 200px; width: 100%; resize: none; border: 1px #d6d6d6 solid; padding: 10px 15px;">${cv.skillcontent }</textarea>
					</div>
				</div>
				<div class="p1025 row content">
					<div class="col-sm-12" style="padding: 0 78px 0 72px; font-size: 30px;">
						대외 활동
					</div>
				</div>
				<div class="p1025 row content">
					<div class="col-sm-12" style="padding: 0 78px 0 72px;">   
						<div class="border" style="min-height: 100%; width: 100%;">
							<div class="blue bs" style="height: 20%; width: 100%;">
							    <div class="ib rs" style="width: 24%;">활동 종류</div>
								<div class="ib rs" style="width: 24.5%;">활동 지역</div>
								<div class="ib rs" style="width: 25%;">활동 기간</div>
								<div class="ib" style="width: 25%;">활동 내용</div>
							</div>
							<c:forEach var="ac" items="${cv.activity }">
							<div class="bs" style="height: 20%; width: 100%;">
							    <div class="ib rs" style="width: 24%;">${ac.actype }</div>
								<div class="ib rs" style="width: 24.5%;">${ac.aclocation }</div>
								<div class="ib rs" style="width: 25%;">${ac.acstart }~${ac.acend }</div>
								<div class="ib" style="width: 25%;">${ac.accontent }</div>     
							</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="p1025 row content">
					<div class="col-sm-12" style="padding: 0 78px 0 72px; font-size: 30px;">
						자격증/어학시험
					</div>
				</div>
				<div class="p1025 row content">
					<div class="col-sm-12" style="padding: 0 78px 0 72px;">   
						<div class="border" style="min-height: 100%; width: 100%;">
							<div class="blue bs" style="height: 20%; width: 100%;">      
								<div class="ib rs" style="width: 24%;">자격증명</div>
								<div class="ib rs" style="width: 24.5%;">발행처/기관</div>
								<div class="ib rs" style="width: 25%;">합격 구분</div>
								<div class="ib" style="width: 25%;">취득일</div>
							</div>
							<c:forEach var="li" items="${cv.ll }">
							<div class="bs" style="height: 30%; width: 100%;">
								<div class="ib rs" style="width: 24%;">
									<c:if test="${empty li.llname }">-</c:if>
									<c:if test="${!empty li.llname }">${li.llname }</c:if>
								</div>
								<div class="ib rs" style="width: 24.5%;">
									<c:if test="${empty li.llplace }">-</c:if>
									<c:if test="${!empty li.llplace }">${li.llplace }</c:if>
								</div>
								<div class="ib rs" style="width: 25%;">
									<c:if test="${empty li.llpass }">-</c:if>
									<c:if test="${!empty li.llpass }">
											${(li.llpass==',final')?"최종합격":
									 			(li.llpass==',1cha')?"1차 합격":
									 			(li.llpass==',2cha')?"2차 합격":
									 			(li.llpass==',filgi')?"필기 합격":
									 			(li.llpass==',silgi')?"실기 합격":"최종합격"
									 		}
										</c:if>
								</div>
								<div class="ib" style="width: 25%;">
									<c:if test="${empty li.llpassdate }">-</c:if>
									<c:if test="${!empty li.llpassdate }">${li.llpassdate }</c:if>
								</div>
							</div>
							</c:forEach>
							<div class="blue bs" style="height: 20%; width: 100%;">
								<div class="ib rs" style="width: 16.5%;">언어</div>
								<div class="ib rs" style="width: 16.5%;">시험종류</div>
								<div class="ib rs" style="width: 16.5%;">취득여부</div>
								<div class="ib rs" style="width: 16%;">점수</div>
								<div class="ib rs" style="width: 16%;">급수</div>
								<div class="ib" style="width: 16%;">취득일</div>
							</div>
							<c:forEach var="lang" items="${cv.ll }">
							<div class="bs" style="height: 30%; width: 100%;">
								<div class="ib rs" style="width: 16.5%;">
									<c:if test="${empty lang.llname }">-</c:if>
									<c:if test="${!empty lang.llname }">${lang.llname }</c:if>
								</div>
								<div class="ib rs" style="width: 16.5%;">
									<c:if test="${empty lang.lltesttype }">-</c:if>
									<c:if test="${!empty lang.lltesttype }">${lang.lltesttype }</c:if>
								</div>
								<div class="ib rs" style="width: 16.5%;">
									<c:if test="${empty lang.llpass }">-</c:if>
									<c:if test="${!empty lang.llpass }">${lang.llpass }</c:if>
								</div>
								<div class="ib rs" style="width: 16%;">
									<c:if test="${empty lang.llscore }">-</c:if>
									<c:if test="${!empty lang.llscore }">${lang.llscore }</c:if>
								</div>
								<div class="ib rs" style="width: 16%;">
									<c:if test="${empty lang.lllevel }">-</c:if>
									<c:if test="${!empty lang.lllevel }">${lang.lllevel }</c:if>
								</div>
								<div class="ib" style="width: 16%;">
									<c:if test="${empty lang.llpassdate }">-</c:if>
									<c:if test="${!empty lang.llpassdate }">${lang.llpassdate }</c:if>
								</div>
							</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="p1025 row content">
					<div class="col-sm-12" style="padding: 0 78px 0 72px; font-size: 30px;">
						보유기술
					</div>
				</div>
				<div class="p1025 row content">
					<div class="col-sm-12" style="padding: 0 78px 0 72px;">   
						<div class="border" style="min-height: 100%; width: 100%;">
							<c:forEach var="hs" items="${cv.haveskill }">
							<div class="blue bs" style="height: 20%; width: 100%;">
								<div class="ib rs" style="width: 49.5%;">보유능력</div>
								<div class="ib" style="width: 50%;">수준</div>
							</div>
							<div style="height: 30%; width: 100%;">
								<div class="ib rs" style="width: 49.5%;">
									<c:if test="${empty hs.hsability }">-</c:if>
									<c:if test="${!empty hs.hsability }">${hs.hsability }</c:if>
								</div>
								<div class="ib" style="width: 50%;">
									<c:if test="${empty hs.hslevel }">-</c:if>
									<c:if test="${!empty hs.hslevel }">${hs.hslevel }</c:if>
								</div>   
							</div>
							<div class="blue bs" style="height: 20%; width: 100%;">
								<div class="ib" style="width: 100%;">상세내용</div>
							</div>
							<div style="height: 30%; width: 100%;">
								<div class="ib" style="width: 100%;">
									<textarea readonly="readonly" style="min-height: 200px; width: 100%; resize: none; border: 1px #d6d6d6 solid; padding: 10px 15px;">${hs.hscontent }</textarea>
								</div>
							</div>
							</c:forEach>
						</div>
					</div> 
				</div>
				<div class="p1025 row content">
					<div class="col-sm-12" style="padding: 0 78px 0 72px; font-size: 30px;">
						자소서
					</div>
				</div>
				<div class="p1025 row content">
					<div class="col-sm-12" style="padding: 0 78px 0 72px;">   
						<div class="border" style="min-height: 100%; width: 100%;">
							<c:forEach var="rs" items="${cv.resume }">
							<div style="height: 20%; width: 100%;">
								<div class="ib" style="width: 100%;">
									<div class="ib" style="width: 100%; text-align: left; border: 1px #d6d6d6 solid; padding: 7px 15px;">
										<c:if test="${empty rs.rsubject }">-</c:if>
										<c:if test="${!empty rs.rsubject }">${rs.rsubject }</c:if>
									</div>
								</div>
							</div>
							<div style="height: 30%; width: 100%;">
								<div class="ib" style="width: 100%;">
									<textarea readonly="readonly" style="min-height: 200px; width: 100%; resize: none; border: 1px #d6d6d6 solid; padding: 10px 15px;">${rs.rcontent }</textarea>
								</div>
							</div>
							</c:forEach>
						</div>
					</div><br><br>
					<div class="w3-center">
						<a href="recommenduser.shop?comno=${sessionScope.logincom.comno }" class="w3-button w3-blue w3-round">목록으로</a>
						<a href="#" class="w3-button w3-blue w3-round">인재 찜하기</a>
					</div><br><br>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>