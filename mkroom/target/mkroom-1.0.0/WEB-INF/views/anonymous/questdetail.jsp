<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%@ include file="../myinclude/testheader.jsp" %>

<br><br>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-4">
			<c:set var="thumbnailPath" value='${questImageDetail.repoPath += "/" 
											 += questImageDetail.uploadPath += "/s_"
											 += questImageDetail.uuid += "_" 
											 += questImageDetail.fileName}'/>
			
			<img alt="-" style="height: 408px; width: 290px" src='${contextPath += "/displayThumbnail?fileName=" += thumbnailPath}'/>	
			<!-- 이미지 저장하고 가져올 때 크기 잘 조절하자. -->
		</div>
		<div class="col-md-8">
			<c:out value="${questDetail.questName}"/> 
			<hr><hr>
			<div style="height: 200px;">
				<c:out value="${questDetail.detailComment}"/> 
			</div>
			<hr>
			<div style="height: 70px;" >
				<span>난이도:</span> 
				<c:forEach begin="1" end="5" step="1" var="i">
					<c:choose>
						<c:when test="${questDetail.difficulty >= i}">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="red" class="bi bi-star-fill" viewBox="0 0 16 16">
							  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
							</svg>
						</c:when>
						<c:otherwise>
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="red" class="bi bi-star" viewBox="0 0 16 16">
							  <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/>
							</svg>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				&nbsp;&nbsp;&nbsp;
				<span>인원: </span> <c:out value="${questDetail.minPlayerNum}"/> ~ <c:out value="${questDetail.maxPlayerNum}"/> 
				&nbsp;&nbsp;&nbsp;
				<span>제한시간: </span> <c:out value="${questDetail.questTime}"/>
				<br><br>
				<button type="button" class="btn btn-danger">
					<div>예약하기</div>
				</button>
				
				<%-- 시큐리티 적용 시작 --%>
				<button type="button" class="btn btn-danger moveModify">
					<div>퀘스트 수정</div>
				</button>
				
				<button type="button" class="btn btn-danger delFlagActive">
					<div>퀘스트 삭제</div>
				</button>
				<%-- 시큐리티 적용 끝 --%>
			</div>
		</div>
		<div class="col-md-12">
			<br>
		</div>
	</div>
</div>
<hr>
<%-- 댓글 화면 표시 시작 --%>
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default" >
			<div class="panel-heading">
				<p style="margin-bottom: 0px; font-size: 16px;">
					<strong style="padding-top: 2px;"><%-- 
						<span id="replyCnt">댓글&nbsp;<c:out value="${board.breplyCnt}"/>개</span>  --%>
						<span id="replyCnt">댓글&nbsp;</span>
						<span>&nbsp;</span>
						<!-- 
						<sec:authorize access="isAuthenticated()"> -->
						
						<button type="button" id="btnChgCmtReg" class="btn btn-info btn-sm">댓글 작성</button>
						<button type="button" id="btnRegCmt" class="btn btn-warning btn-sm"
								style="display:none">댓글 등록</button>
						<button type="button" id="btnCancelRegCmt" class="btn btn-warning btn-sm"
								style="display:none">취소</button>
						<!-- 
						</sec:authorize>	 -->	
					</strong>
				</p>
			</div> <%-- /.panel-heading --%>
			
			<div class="panel-body">
			<!-- 
				<sec:authorize access="isAuthenticated()"> -->
			
				<%-- 댓글 입력창 div 시작 --%>
				<div class="form-group" style="margin-bottom: 5px;">
					<textarea class="form-control txtBoxCmt" name="rcontent"
							  placeholder="댓글작성을 원하시면,&#10;댓글 작성 버튼을 클릭해주세요."
							  readonly="readonly"
							  ></textarea>
				</div>
				<hr style="margin-top: 10px; margin-bottom: 10px;">
				<%-- 댓글 입력창 div 끝 --%><!-- 
				</sec:authorize> -->
				
				
				<ul class="chat">
					<%-- 댓글 목록 표시 영역 - JavaScript 로 내용이 생성되어 표시됩니다.--%>
					<li class="left clearfix commentLi" data-bno="123456" data-rno="12">
						<div>
							<div>
								<span class="header info-rwriter">
									<strong class="primary-font">user00</strong>
									<span>&nbsp;</span>
									<small class="text-muted">2018-01-01 13:13</small>
								</span>
								<p>앞으로 사용할 댓글 표시 기본 템플릿입니다.</p>
							</div>
							<div class="btnsComment" style="margin-bottom:10px">
								<button type="button" style="display:in-block"
										class="btn btn-primary btn-xs btnChgReg">답글 작성</button>
								<button type="button" style="display:none" 
										class="btn btn-warning btn-xs btnRegCmt">답글 등록</button>
								<hr class="txtBoxCmtHr" style="margin-top:10px; margin-bottom:10px">
								<textarea class="form-control txtBoxCmtMod" name="rcontent" style="margin-bottom:10px"
										  placeholder="답글작성을 원하시면,&#10;답글 작성 버튼을 클릭해주세요."
										  ></textarea>
							</div>
						</div>
					</li>
				</ul><%-- /.chat --%>
			</div><%-- /.panel-body --%>

			<div class="panel-footer text-center" id="showCmtPagingNums">
				<%-- 댓글 목록의 페이징 번호 표시 영역 - JavaScript 로 내용이 생성되어 표시됩니다.--%>
			</div>
		</div><%-- /.panel --%>
	</div><%-- .col-lg-12 --%>
</div><%-- .row : 댓글 화면 표시 끝 --%>

<%-- hidden 값 들고가는 폼. --%>
<form id="frm">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">

	var csrfHeaderName = "${_csrf.headerName}"
	var csrfTokenValue = "${_csrf.token}"

	var frm_bookingCheck = $("#frm_bookingCheck");
	var frm_booking = $("#frm_booking");
	var frm = $("#frm");
	
	var checkInput = "";
	var bookingInput = "";
	
	//frm_booking.find("input").val(); 
// 	$(".bookingCheck").on("click", function(e) {
		
// 		checkInput = $("#frm_bookingCheck #usernameInput1").val();
		
// 		frm_bookingCheck.append("<input type='hidden' name='username' value='" + checkInput + "'/>");
// 		frm_bookingCheck.attr("action", "${contextPath}/booking/info");
// 		frm_bookingCheck.attr("method", "get");
// 		frm_bookingCheck.submit();
		
// 	});
	
	
// 	$(".booking").on("click", function(e) {
		
// 		bookingInput = $("#frm_booking #usernameInput2").val();
		
// 		frm_booking.append("<input type='hidden' name='username' value='" + bookingInput + "'/>");
// 		frm_booking.attr("action", "${contextPath}/booking/info");
// 		frm_booking.attr("method", "get");
// 		frm_booking.submit();
		
// 	});
	
	<%-- 퀘스트 수정할 곳으로 필요한 데이터 받아서 이동. --%>
	$(".moveModify").on("click", function(e) {
		
		frm.attr("action", "${contextPath}/quest/input");
		frm.attr("method", "get");
		frm.submit();
		
	});
	
	<%-- 퀘스트 삭제 --%>
	$(".delFlagActive").on("click", function(e) {
		
		var encodingQuery = encodeURI('${"questName=" += questDetail.questName += "&branchLocation=" += questDetail.branchLocation}');
		
		alert(encodingQuery);
		frm.attr("action", "${contextPath}/quest/delFlagActive?" + encodingQuery);
		frm.attr("method", "post");
		frm.submit();
		
	});
	
	
</script>
<%@ include file="../myinclude/testfooter.jsp" %>