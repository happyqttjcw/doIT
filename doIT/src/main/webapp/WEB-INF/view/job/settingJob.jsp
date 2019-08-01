<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 맞춤 설정 페이지</title>
</head>
<body>
<div class="container-fluid">
	<div class="row content">
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
			<div class="container">
			  <h1>회원님이 설정하신 <font style="color: #7F8BA5;">'맞춤'</font>입니다.</h1>
			  <p>맞춤 설정으로 좀 더 편한 검색을 지원해드립니다.</p>
			  <h3 style="color: #919DB7;">
			  <c:if test="${setting.skill != null }">
				  <c:forTokens items="${setting.skill }" delims="," var="skill">
				  	<span>#${skill }</span>
				  </c:forTokens>
			  </c:if>
			  </h3>
			  <h3 style="color: #919DB7;">
			  <c:if test="${setting.welfare != null }">
				  <c:forTokens items="${setting.welfare }" delims="," var="welfare">
				  	<span>#${welfare }</span>
				  </c:forTokens>
			  </c:if>
			  </h3>
			  <h3 style="color: #919DB7;">
			  <c:if test="${setting.pluse != null }">
				  <c:forTokens items="${setting.pluse }" delims="," var="pluse">
				  	<span>#${pluse }</span>
				  </c:forTokens>
			  </c:if>
			  </h3>
			  <h3 style="color: #919DB7;">
			  <c:if test="${setting.location != null }">
				  <c:forTokens items="${setting.location }" delims="," var="location">
				  	<span>#${location }</span>
				  </c:forTokens>
			  </c:if>
			  </h3>
			  <h3 style="color: #919DB7;">
			  <c:if test="${setting.job != null }">
				  <c:forTokens items="${setting.job }" delims="," var="job">
				  	<span>#${job }</span>
				  </c:forTokens>
			  </c:if>
			  </h3>
			  <c:if test="${setting.salary != null}">
			  <h3 style="color: #919DB7;"><span>#${setting.salary }</span></h3>
			  </c:if>
			  <c:if test="${setting.education != null }">
			  <h3 style="color: #919DB7;"><span>#${setting.education }</span></h3>
			  </c:if>
			  <c:if test="${setting.workform != null }">
			  <h3 style="color: #919DB7;"><span>#${setting.workform }</span></h3>
			  </c:if>
			</div>
			<div style="height: 35.25px; margin-bottom: 10px;"><a href="${path }/user/settingForm.shop?userno=${sessionScope.loginUser.userno }" class="btn btn-secondary" style="float: right;">설정하기</a></div>
			<div class="row content">
			<div class="col-sm-12">
				<div class="col-sm-12 row content" style="margin: 0; padding: 0 19px; border-bottom: 1px #d6d6d6 solid; border-top: 1px #d6d6d6 solid; background-color: #F6F6F6;">
					<div class="col-sm-4" style="text-align: center;">기업명</div>
					<div class="col-sm-3" style="text-align: center;">제목</div>
					<div class="col-sm-2" style="text-align: center;">지원가격</div>
					<div class="col-sm-1" style="text-align: center;">근무조건</div>
					<div class="col-sm-2" style="text-align: center; font-size: 14px;">마감등록일</div>
				</div>
				</div>
				<div class="col-sm-12" style="min-height: 500px;">
				<c:forEach var="list" items="${list }">
				<div class="col-sm-12 row content" style="margin: 0; padding: 0 19px; min-height: 88px; max-height: 88px; border-bottom: 1px #d6d6d6 solid;">
					<div class="col-sm-3">
						<div class="row content" style="height: 100%;">
						<div class="col-sm-5"><img src="${path }/comImg/${list.com.compic }" style="width: 100%; height: 100%;"></div>
						<div class="col-sm-7" style="font-size: 14px; padding: 22px 0;">
						<div style="font-size: 13px;">${list.com.comname }</div>
						<div style="font-size: 16px;">${list.com.combrand }</div>
						</div>
						</div>
					</div>
					<div class="col-sm-4" style="font-size: 20px; padding: 13px 0;">
					<div><a href="${path }/job/jobdetail.shop?jobno=${list.jobno }&&comno=${list.com.comno }">${list.subject }</a></div>
					<div>
						<c:forTokens items="${list.field }" delims="," var="field" begin="0" end="3">
							<font style="color: #6A84B7; font-size: 1rem;">#${field }</font>&nbsp;
						</c:forTokens>
					</div>
					</div>
					<div class="col-sm-2" style="font-size: 14px; text-align: center; padding: 22px 0;">
					<div>
					<c:set var="sinip" value=""/>	
					<c:set var="gr" value=""/>
					<c:forTokens items="${list.position }" delims="," var="position">
						<c:if test="${position == '신입'}"><c:set var="sinip" value="${position }"/>	</c:if>
						<c:if test="${position == '경력' }"><c:set var="gr" value="${position }"/></c:if>						
					</c:forTokens>
					<c:if test="${sinip != '' and gr == '' }">신입</c:if>
					<c:if test="${sinip != '' and gr != '' }">신입·경력</c:if>
					<c:if test="${sinip == '' and gr != '' }">경력</c:if>
					</div>
					<div>${list.education }</div>
					</div>
					<div class="col-sm-1" style="font-size: 14px; text-align: center; padding: 22px 0;">
					<div>${list.employ }</div>
					<div style="font-size:13px;">${list.worklocation }</div>
					</div>
					<div class="col-sm-2" style="font-size: 14px; text-align: center; padding: 20px 0;">
						<fmt:parseDate var="enddate" value="${list.enddate }" pattern="yyyy-MM-dd" />
						<fmt:formatDate var="enddate" value="${enddate }" pattern="MM-dd (E)"/>
						<div style="color: #9F9F9F;">~ ${enddate }</div>
						<div><div style="display: inline-block; border-radius: 3px; border: 1px #FF8383 solid;">
						<font style="color: #FF7171;"><c:if test="${list.receivetype == 'e'}">이메일 지원</c:if>
						<c:if test="${list.receivetype != 'e' }">${list.receivetype }</c:if></font></div></div>
					</div>
				</div>
				</c:forEach>
			</div>
			</div>
		</div>
		<div class="col-sm-2"></div>
	</div>
</div>
</body>
</html>