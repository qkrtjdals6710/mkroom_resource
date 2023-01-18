<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:set var="contextPath" value="<%=request.getContextPath() %>"/>


<%@ include file="../header.jsp" %>

   <!-- 상단 -->    
   <div class="hero-wrap hero-wrap-2" style="background-image: url('${contextPath}/resources/skillhunt-master/images/header-back.jpg');" data-stellar-background-ratio="0.8">
     <div class="overlay"></div>
     <div class="container">
       <div class="row no-gutters slider-text align-items-end justify-content-start">
         <div class="col-md-12 ftco-animate text-center mb-5">
           <h2 class="mb-3 bread">테마 / 예약</h2>
         </div>
       </div>
     </div>
   </div>
   <!-- 상단 끝-->


<style>
.txtBoxCmt, .txtBoxComment { overflow: hidden ; resize: vertical; min-height: 100px ; color: black ; }
</style>


<div id="page-wrapper">
    <div class="row col-lg-12">
        <div class="board0">
            <div class="panel panel-default">
                <div class="panel-heading">
					<div class="row">
						<div class="form-group board1">
							<div class="button-group" style="text-align:right;">
								<button type="button" id="btnToList" data-oper="list" class="btn btn-info"><span>목록</span></button>
							</div>
						</div>
					</div>
				</div><%-- .panel-heading 끝 --%>
                <div class="panel-body form-horizontal">
					<div class="form-group">
						<div class="col-sm-12 board3">
							<div class="container">
								<div class="row">
									<div class="col-md-4">
										<c:set var="imagePath" value='${questImageDetail.uploadPath += "/"
																		 += questImageDetail.uuid += "_" 
																		 += questImageDetail.fileName}'/>						 
										<img alt="-" style="height: 203px;" src='${contextPath += "/displayThumbnail?fileName=C:/myupload/" += imagePath}'/>	
										<!-- 이미지 크기 조절하자 -->
									</div>
								
									<div class="col-md-8" style="padding-left: 40px;">
										<h3><c:out value="${questDetail.questName}"/></h3>
										<hr>
										<span>장르: <c:out value="${questDetail.genre}"/></span>
										<div>
											<span>
												난이도:
												<c:forEach begin="1" end="${questDetail.difficulty}" step="1">
													<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/star.png">
												</c:forEach>
											</span>
											&nbsp;&nbsp;&nbsp;
											<span>인원: <c:out value="${questDetail.minPlayerNum}"/> ~ <c:out value="${questDetail.maxPlayerNum}"/> </span> 
											&nbsp;&nbsp;&nbsp;
											<span>제한시간: <c:out value="${questDetail.questTime}"/> 분</span>
										</div><hr>				  
										<p class="form-control" name="bcontent">
											<c:out value="${questDetail.detailComment}"/>
										</p>
										<div>
											<button type="button" class="btn btn-primary">예약하기</button>
											&nbsp;&nbsp;&nbsp;
											<button type="button" class="btn btn-danger" id="btnToModify">수정</button>
											&nbsp;&nbsp;&nbsp;
											<button type="button" class="btn btn-danger" id="btnToDelete" data-questname="${questDetail.questName}" 
											                                                       		  data-location="${questDetail.branchLocation}"
																								>삭제</button>
										</div>
									</div>
								</div> <%-- row - end --%>
							</div> <%-- container - end --%>
						</div>
					<%-- 댓글 화면 표시 시작 --------------------------------------------------------------------------------%>
					<div class="repl">
						<div class="panel-heading">
			            	<div>
			            		&nbsp;<span id="replyTotal"></span><br>
			            		&nbsp;<span id="replyStar"><strong>리뷰평균점수 넣을 예정<strong></strong></span><br><br>
			            		<span id="spanStar">
									<select id="selectStar" name="Star">
										<option value="">점수주기</option>
										<option value="1">☆</option>
										<option value="2">★</option>
										<option value="3">★☆</option>
										<option value="4">★★</option>
										<option value="5">★★☆</option>
										<option value="6">★★★</option>
										<option value="7">★★★☆</option>
										<option value="8">★★★★</option>
										<option value="9">★★★★☆</option>
										<option value="10">★★★★★</option>
									</select>
								</span>
				            	<textarea style="width:100%" id="frmreply txtBoxCmt" class="txtBoxCmt" name="rcontent" placeholder="댓글입력란" ></textarea>
				            	<br><button id="btnRegCmt" class="btn btn-primary" style="vertical-align" type="button">댓글작성</button>
				            	<hr>
			            	</div>
			            </div> <%-- /.panel-heading --%>
			           	<div class="panel-body">
					        <ul id="replyul"></ul>	<!-- 댓글표시 -->
						</div><%-- /.panel-body --%>
						<div class="panel-footer text-center" id="replyPagingNums"></div>	<!-- 댓글 페이징 -->
					</div><%-- .row : 댓글 화면 표시 끝 --------------------------------------------------------------------%>
				
					<%-- Modal 시작 --%>
					<div class="modal fade" id="yourModal" tabindex="-1" role="dialog" aria-labelledby="yourModalLabel" aria-hidden="true">
					    <div class="modal-dialog">
					        <div class="modal-content">
					            <div class="modal-header">
					                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					                <h4 class="modal-title" id="yourModalLabel">처리결과</h4>
					            </div>
					            <div class="modal-body">처리가 완료되었습니다.</div>
					            <div class="modal-footer">
					                <button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
					            </div>
					        </div><%-- /.modal-content --%>
					    </div><%-- /.modal-dialog --%>
					</div><%-- /.modal 끝 --%>
					


					<%-- Modal 시작 --%>
					<div class="modal fade" id="attachModal" tabindex="-1" role="dialog" aria-labelledby="attachModalLabel" aria-hidden="true">
					    <div class="modal-dialog">
					        <div class="modal-content">
					            <div class="modal-body attachModalDiv">
					            	<!-- 이미지 표시 -->
					            </div>
					        </div><%-- /.modal-content --%>
					    </div><%-- /.modal-dialog --%>
					</div><%-- /.modal 끝 --%>

                </div><%-- /.panel-body --%>
            </div><%-- /.panel --%>
        </div><%-- /.col-lg-12 --%>
    </div><%-- 게시물 상태 표시 끝 /.row --%>

<form id="frmSendValue">
	<input type="hidden" name="questName" value="${questDetail.questName}">
	<input type="hidden" name="branchLocation" value="${questDetail.branchLocation}">
</form>

</div><%-- /#page-wrapper --%>


<script type="text/javascript" src="${contextPath }/resources/skillhunt-master/js/replycomment.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">

var frmSendValue = $("#frmSendValue") ;
var bwriter = '<c:out value="${board.bwriter }"/>' ;
var loginUser = "" ;

// <sec:authorize access="isAuthenticated()">
// 	loginUser = '<sec:authentication property="principal.username"/>' ;
// </sec:authorize>

//수정 페이지로 이동
$("#btnToModify").on("click", function(){
	
// 	if(!loginUser || loginUser != bwriter){
// 		alert("글 작성자만 수정페이지로 이동할 수 있습니다") ;
// 		return ;
// 	}
	
	frmSendValue.attr("action", "${contextPath}/quest/modify");
	frmSendValue.attr("method", "get") ;
	frmSendValue.submit() ;
}) ;


	<%-- 목록 페이지로 이동 --%>
	$("#btnToList").on("click", function(){
	
		frmSendValue.attr("action", "${contextPath}/quest/list");
		frmSendValue.attr("method", "get") ;
		frmSendValue.submit() ;
		
	});
	
	<%-- 삭제 --%>
	$("#btnToDelete").on("click", function(e) {
		
		frmSendValue.append("<input type='hidden' name='questName' value='" + $(this).data("questname") + "'/>");
		frmSendValue.append("<input type='hidden' name='branchLocation' value='" + $(this).data("location") + "'/>");
		frmSendValue.attr("action", "${contextPath}/quest/delete");
		frmSendValue.attr("method", "get");
		frmSendValue.submit();
		
	});	

//---------------------------------------------------------댓글-----------------------


$(document).ajaxSend(function(e, xhr, options){
	xhr.setRequestHeader(csrfHeaderName, csrfTokenValue) ;
	
});




</script>
<%@ include file="../footer.jsp" %>