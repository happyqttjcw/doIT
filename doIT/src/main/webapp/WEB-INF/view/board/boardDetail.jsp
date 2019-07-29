<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>자소서 첨삭 상세보기</title>
<style>
	.content1 {
		padding: 0 25px;
		text-align: left;
		margin-bottom: 5px;
		color: #969696;
	}
	.ta1 {
		 padding: 10px 15px; 
		 width: 100%; 
		 min-height: 400px; 
		 resize: none;"
	}
	.ta2 {
		 padding: 10px 15px; 
		 width: 100%; 
		 min-height: 200px; 
		 resize: none;"
	}
	.comment {
		padding: 10px 25px;
	}
	.naeyong {
		padding: 15px 0;
		border-top: 1px #d6d6d6 solid;
	}
	.naeyong > div {
		text-align: left;
		margin-bottom: 3px;
	}
	.naeyong > img {
		width: 25px;
		height: 25px;
	}
	.btns {
		display: inline-block;
	}
	.date {
		font-size: 14px;
		color: #969696;
		
	}
	#reply {
		min-height: 80px;
	}
</style>
<script>
	$(document).ready(function(){
		$('#comment-box').hide();
	});
	
	function reply(num) {
		$('#comment-box'+num).toggle();
		$('#comment-box'+num+' textarea').text('');
		
		$('#form').attr('action','reply.shop');
	}
	
	function edit(num) {
		$('#comment-box').toggle();
		
		$('#comment-box textarea').text('');
		$('#comment-box textarea').text($('#commentcontent').val());
		
		$('#form').attr('action','commentEdit.shop?commentno='+i);
	}
</script>
</head>
<body>
<div class="container-fluid text-center" style="min-height: 1000px;">
	<div class="row content">
		<div class="col-sm-2"></div>
		<div class="col-sm-8" style="padding: 35px 20px;">
			<div class="w3-card" style="min-height: 800px; padding: 25px 20px;">
				<div style="padding: 0 15px; text-align: left; font-size: 30px; border-bottom: 1px #d6d6d6 solid; margin-bottom: 10px;">${re.subject }</div>
				<div class="content1">${re.name }</div>
				<div style="padding: 10px 25px; text-align: left;">${re.content }</div>
				<div class="content1" style="border-bottom: 1px #d6d6d6 solid;">${re.date }</div>
				
				<h2>***님의 자소서를 첨삭해 주세요.</h2>
				<p>***님의 자소서를 첨삭해 주세요.***님의 자소서를 첨삭해 주세요.***님의 자소서를 첨삭해 주세요.***님의 자소서를 첨삭해 주세요.***님의 자소서를 첨삭해 주세요.</p> 

				<div class="comment">
					<!-- 반복 -->
					<c:set var="num" value="0"/> 
					<c:forEach var="comment" items="${rc }">
					<form:form action="reply.shop" modelAttribute="resumecomment" method="post" id="form">
					<input type="hidden" value="${comment.editno }" name="editno">
					<input type="hidden" value="${sessionScope.loginUser.name }" name="name">
					<input type="hidden" value="${sessionScope.loginUser.userno }" name="userno">
					<input type="hidden" value="${comment.ref }" name="ref">
					<div class="naeyong">
						<div id="reply" <c:if test="${comment.refstep > 0 }">style="background-color: #EAEAEA;"</c:if> >
							<input type="hidden" value="${comment.content }" id="commentcontent">
							<div><span>${comment.name }</span></div>
							<div>${comment.content }</div>
							<div class="date" style="margin-bottom: 5px;">${comment.date }</div>
						</div>  
						<div style="width: 100%; margin-bottom: 10px;">
						<c:if test="${comment.refstep < 1 }">
							<div class="btns" style="width: 6.2%;"><a class="btn btn-secondary btn-sm" href="javascript:reply(${num })">답글달기</a></div>
						</c:if>	
							<div class="btns" style="float: right; width: 8.1%; margin-bottom: 5px;">
								<c:if test="${comment.userno == sessionScope.loginUser.userno }">
									<a class="btn btn-secondary btn-sm" id="edit" href="javascript:edit(${num })">수정</a>
									<a class="btn btn-secondary btn-sm" id="del" href="commentDel.shop?commentno=${comment.commentno }&editno=${comment.editno }">삭제</a>
								</c:if>
							</div>
						</div>
						<c:if test="${comment.refstep <= 0 }">
						<div id="comment-box${num }">
							<textarea style="resize: none; width: 100%; height: 150px; padding: 15px 20px;" name="content"></textarea>
							<div style="text-align: right;"><input type="submit" value="작성" class="btn btn-secondary btn-sm"></div>
						</div>
						</c:if>
					</div>
					</form:form>
					<c:set var="num" value="${num+1 }"/>
					</c:forEach>
					<!--  -->
				</div>
				
				<form:form modelAttribute="resumecomment" method="post" action="comment.shop">
					<input type="hidden" value="${param.editno }" name="editno">
					<input type="hidden" value="${sessionScope.loginUser.name }" name="name">
					<input type="hidden" value="${sessionScope.loginUser.userno }" name="userno">
					<div class="content1" style="font-size: 25px; margin-bottom: 10px;"><div style="border-bottom: 1px #d6d6d6 solid; color: #555555;"></div></div>
					<div class="content1" style="min-height: 150px;">
						<div style="padding: 10px 15px;">
							<textarea class="ta2" name="content"></textarea>
						</div>
					</div>
					<div style="text-align: right; padding: 0 20px;">
						<input type="submit" class="btn btn-secondary btn-sm" value="댓글달기"> 
					</div>
				</form:form>
			</div>
		</div>
		<div class="col-sm-2"></div>
	</div>
</div>
</body>
</html>
