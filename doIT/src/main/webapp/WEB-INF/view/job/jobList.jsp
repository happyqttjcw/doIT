<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>기업 공고</title>
<script type="text/javascript" src="${path }/js/ajax.js"></script>
<script type="text/javascript">  
	function startxml(rtype,tag) {
		requestType = rtype;
		requestTag = tag;
		sendRequest("${path}/job.xml",null,parseXml,"GET");
	}
	function parseXml() {
		if(ajax.readyState == 4) {
			if(ajax.status == 200) {
				if(requestType == 'all')
					listAllStates();
				else listPartStates();
			} else {
				alert("서버 오류:" + ajax.status);
			}
		}
	}
	function listPartStates() {
		var xmlDoc = ajax.responseXML;
		var node = xmlDoc.getElementsByTagName(requestTag)[0];
		var states = node.getElementsByTagName("state");
		var divTag = document.getElementById("result");
		var divTag2 = document.getElementById("checkbox");
		divTag.innerHTML = requestType;
		divTag2.innerHTML = "";
		for(var i=0;i<states.length;i++) {
			divTag2.innerHTML += "<div style='width: 180px; display: inline-block; margin-bottom: 10px;'><input type='checkbox' style='margin-right: 5px;'>"+states[i].childNodes[0].nodeValue+"</div>";
		}
	}
</script>
</head>
<body>
<div class="container-fluid">
<div class="row content">
<div class="col-sm-2"></div>
<div class="col-sm-8">
	<div class="container-fluid">
		<div class="row content">
			<div class="col-sm-12" style="min-height: 400px;">
				<div class="container mt-3" style="padding-bottom: 15px;">
				  <h2>기업별 채용 공고</h2>
				  <p>전국 각지에 IT 기업들이 올린 채용 공고들 입니다. 원하는 기업을 선택하여 지원하세요.</p>  
				  
				  <!-- Nav tabs -->
				  <ul class="nav nav-tabs">
				    <li class="nav-item">
				      <a class="nav-link active" href="#home">직종별 공고</a>
				    </li>
				    <li class="nav-item">
				      <a class="nav-link" href="#menu1">지역별 공고</a>
				    </li>
				  </ul>
					<script>
						$(document).ready(function(){
						  $(".nav-tabs a").click(function(){
						    $(this).tab('show');
						  });
						  $('.nav-tabs a').on('shown.bs.tab', function(event){
						    var x = $(event.target).text();         // active tab
						    var y = $(event.relatedTarget).text();  // previous tab
						    $(".act span").text(x);
						    $(".prev span").text(y);
						  });
						});
					</script>
				  <!-- Tab panes -->
				  <div class="tab-content border mb-3">
				    <div id="home" class="container tab-pane active" style="padding: 10px;">
				      <div style="min-height: 300px; padding: 10px;">
				      	<div class="container-fluid">
				      		<div class="row content">
				      			<div class="col-sm-3"> <!-- 직종 선택 -->
				      				<div style="font-size:20px; text-align: center; border: 1px #d6d6d6 solid;">직종별</div>
									<div class="list-group" style="overflow: auto; max-height: 350px;" id="jobselect">
									<c:forEach var="job" items="${job }">
									  <a href="javascript:search_job('${job }')" class="list-group-item list-group-item-action" onclick="startxml('${job }','${job }')" >${job }</a>
									</c:forEach>
									<script>
										function search_job(e) {
											$('#search').attr('href','searchjob.shop?search='+e+'&&type=field');
										}
									  </script>
									</div>
				      			</div>
				      			<div class="col-sm-9">
				      				<div style="font-size:20px; text-align: center; border: 1px #d6d6d6 solid; min-height: 32px;" id="result"></div>
									<div class="list-group" style="overflow: auto; max-height: 350px; border: 1px #d6d6d6 solid; padding: 10px 15px; min-height: 350px;" id="checkbox">
									</div>
				      			</div>
				      		</div>
				      	</div>
				      </div>
				    </div>
				    <div id="menu1" class="container tab-pane fade">
				      <div style="min-height: 300px; padding: 10px;">
				      	<div class="container-fluid">
				      		<div class="row content">
				      			<div class="col-sm-3"> <!-- 지역 선택 -->
				      				<div style="font-size:20px; text-align: center; border: 1px #d6d6d6 solid;">지역별</div>
									<div class="list-group" style="overflow: auto; max-height: 350px;" id="jobselect">
									<c:forEach var="loc" items="${location }">
									  <a href="javascript:search_loc('${loc }')" class="list-group-item list-group-item-action" onclick="startxml('${loc }','${loc }')" >${loc }</a>
									</c:forEach>
									<script>
										function search_loc(e) {
											$('#search').attr('href','searchjob.shop?search='+e+'&&type=worklocation');
										}
									  </script>
									</div>
				      			</div>
				      			<div class="col-sm-9">
				      				<div style="font-size:20px; text-align: center; border: 1px #d6d6d6 solid; min-height: 32px;" id="result"></div>
									<div class="list-group" style="overflow: auto; max-height: 350px; border: 1px #d6d6d6 solid; padding: 10px 15px; min-height: 350px;" id="checkbox">
									</div>
				      			</div>
				      		</div>
				      	</div>
				      </div>
				    </div>
				  </div>
				  <div style="height: 45px; margin-bottom: 10px;">
				  <a class="form-control" style="float: left; width: 500px; height: 45px; padding: 7.5px 15px; font-size: 1.25rem; text-align: center;"><font style="color: #6A84B7;">${count }</font><span style="font-size: 1rem;">개의 공고가 검색되었습니다.[검색:<font style="color: #58919A; font-size: 1.25rem;">${search }</font>]</span></a>
				  <a class="btn btn-primary btn-lg" style="float: right;" href="" id="search">검색</a></div>       
				</div>
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
	</div>
</div>
<div class="col-sm-2"></div>
</div>
</div>
</body>  
</html>