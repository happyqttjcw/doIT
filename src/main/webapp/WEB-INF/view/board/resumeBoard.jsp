<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>자소서 첨삭 게시판</title>
<style>
	.header {
		text-align: left; 
		font-size: 35px; 
		padding: 0 15px; 
		border-bottom: 1px #d6d6d6 solid;
		margin-bottom: 25px;
	}
	.column {
		height: 40px; 
		width: 100%; 
		background-color: #6D7993;
		padding: 7px 0;
	}
	.content {
		height: 100%;
		width: 100%;
		padding: 7px 0;
	}
	.ib {
		display: inline-block;
		font-size: 18px;
	}
	.rb {
		border-right: 1px #d6d6d6 solid;
	}
	.bb {
		border-bottom: 1px #d6d6d6 solid; 
	}
	.fw {
		color: #ffffff;
	}
</style>
</head>
<body>
<div class="container-fluid text-center">
	<div class="row content">
		<div class="col-sm-2"></div>
		<div class="col-sm-8" style="padding: 30px 20px; min-height: 1000px;">
			<div class="w3-card" style="height: 100%; width: 100%; padding: 15px 20px; min-width: 1200px;">
				<div class="container mt-3" style="margin-bottom: 15px;">
				  <h3>자소서를 첨삭 받아보세요.</h3>
				  <p>자소서를 첨삭 받아보세요.자소서를 첨삭 받아보세요.자소서를 첨삭 받아보세요.자소서를 첨삭 받아보세요.자소서를 첨삭 받아보세요.</p>
				  <div style="text-align: right; padding: 0 25px;">
				  <form class="form-inline" style="display: inline-block;">
				  	<select class="btn btn-outline-secondary dropdown-toggle" data-toggle="dropdown" name="search-select" style="margin-right: 7.5px;">
				  		<option>검색어 설정</option>
				  		<option value="subject">제목</option>
				  		<option value="writer">작성자</option>
				  		<option value="content">내용</option>
				  	</select>
				    <input class="form-control mr-sm-2" type="text" placeholder="검색어" name="search">
    				<button class="btn btn-secondary" type="submit">검색</button>     
				  </form>
				  </div>
				</div>
				<div class="col-sm-12" style="width: 100%; min-height: 100px; padding: 0 39px;">
					<div class="container">      
					  <table class="table table-striped">
					    <thead>
					      <tr>
					        <th class="rb" style="width:  5%; min-width: 55px;">번호</th>
					        <th class="rb" style="width: 65%; min-width: 700px;">제목</th>
					        <th class="rb" style="width: 10%; min-width: 100px;">작성자</th>
					        <th class="rb" style="width: 10%; min-width: 100px;">작성일</th>
					        <th style="width: 8%; min-width: 90px;">조회수</th>
					      </tr>
					    </thead>
					    <tbody>
					    <c:set var="num" value="1"/>
					    <c:forEach var="list" items="${list }">
					      <tr>
					        <td class="rb bb">${num }</td>
					        <td class="rb bb" style="text-align: left;">
					        <a href="${path }/board/boardDetail.shop?editno=${list.editno }">${list.subject }</a>
					        <span class="badge text-danger">New</span></td>
					        <td class="rb bb">${list.name }</td>
					        <td class="rb bb">${list.date }</td>
					        <td class="bb">${list.count }</td>
					      </tr>
					      <c:set var="num" value="${num+1 }"/>
					    </c:forEach>
					    </tbody>
					  </table>
					</div>
				</div>
				<div style="float: right; margin-right: 40px;" class="btn btn-secondary"><a href="boardWrite.shop">글쓰기</a></div>
				<!-- Center-aligned -->
				<ul class="pagination justify-content-center">
			    	<li class="page-item"><a class="page-link text-secondary" href="javascript:void(0);"><</a></li>
			    	<li class="page-item"><a class="page-link text-secondary" href="javascript:void(0);">1</a></li>
			    	<li class="page-item"><a class="page-link text-secondary" href="javascript:void(0);">2</a></li>
			    	<li class="page-item"><a class="page-link text-secondary" href="javascript:void(0);">></a></li>
			    </ul>
			</div>
		</div>
		<div class="col-sm-2"></div>
	</div>
</div>
</body>
</html>