<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<security:authorize var="isAdmin" access="hasRole('ADMIN')" />

<%@ include file="../header.jsp" %>

   <!-- 상단 -->    
   <div class="hero-wrap hero-wrap-2" style="background-image: url('${contextPath}/resources/skillhunt-master/images/header-back.jpg');" data-stellar-background-ratio="0.8">
     <div class="overlay"></div>
     <div class="container">
       <div class="row no-gutters slider-text align-items-end justify-content-start">
         <div class="col-md-12 ftco-animate text-center mb-5">
           <h2 class="mb-3 bread">테마 / 상세</h2>
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
						            			<c:choose>
													<c:when test="${questDetail.difficulty == 1}">
														<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/starhaf.png">
													</c:when>
													<c:otherwise>
														<c:forEach begin="1" end="${(questDetail.difficulty) / 2}">
															<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/star.png">
														</c:forEach>
														<c:if test="${(questDetail.difficulty) % 2 == 1}">
															<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/starhaf.png">
														</c:if>
													</c:otherwise>
												</c:choose>
											</span>
											&nbsp;&nbsp;&nbsp;
											<span>인원: <c:out value="${questDetail.minPlayerNum}"/> ~ <c:out value="${questDetail.maxPlayerNum}"/> </span> 
											&nbsp;&nbsp;&nbsp;
											<span>제한시간: <c:out value="${questDetail.questTime}"/> 분</span>
										</div><hr>				  
										<p class="form-control" id="bcontent" name="bcontent" data-detailcontent='<c:out value="${questDetail.detailComment}"/>'></p>
										<div>
											<button type="button" class="btn btn-primary" id="btnToBooking">예약하기</button>
											&nbsp;&nbsp;&nbsp;
											<security:authorize access="hasAnyRole('ADMIN', 'BMANAGER')">
												<c:if test="${BmanagerLocation == questDetail.branchLocation || principal.username == 'admin'}">
													<button type="button" class="btn btn-danger" id="btnToModify">수정</button>
													&nbsp;&nbsp;&nbsp;
													<button type="button" class="btn btn-danger" id="btnToDelete" data-questname="${questDetail.questName}" 
													                                                       		  data-location="${questDetail.branchLocation}"
																										>삭제</button>
												</c:if>													
											</security:authorize>										
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
			            		&nbsp;<span id="replyAvg"></span><br><br>
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
				            	<br><button id="btnRegCmt" class="btn btn-primary" style="vertical-align" type="button">리뷰작성</button>
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


<script type="text/javascript" src="${contextPath }/resources/skillhunt-master/js/review.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">

var frmSendValue = $("#frmSendValue") ;
var bwriter = '<c:out value="${board.bwriter }"/>' ;
var loginUser = "" ;

var detailcontent=$("#bcontent").data("detailcontent").replaceAll("\n","<br>");
console.log(detailcontent);
$("#bcontent").html(detailcontent);

<security:authorize access="isAuthenticated()">
	loginUser = '<security:authentication property="principal.username"/>' ;
</security:authorize>
	
	<%-- 예약 페이지로 이동 --%>
	$("#btnToBooking").on("click", function(){
		
		frmSendValue.attr("action", "${contextPath}/booking");
		frmSendValue.attr("method", "get") ;
		frmSendValue.submit() ;
	}) ;


	<%-- 수정 페이지로 이동 --%>
	$("#btnToModify").on("click", function(){
		
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
		
		frmSendValue.attr("action", "${contextPath}/quest/delete");
		frmSendValue.attr("method", "get");
		frmSendValue.submit();
		
	});	


	//---------------------------------------------------------댓글-----------------------

	// csrf 토큰값 요청 헤더에 설정됨
	var csrfHeaderName = "${_csrf.headerName}" ;
	var csrfTokenValue = "${_csrf.token}" ;
	$(document).ajaxSend(function(e, xhr, options){
		xhr.setRequestHeader(csrfHeaderName, csrfTokenValue) ;
	});


	var frmSendValue=$("#frmSendValue");
	var qVal='<c:out value="${questDetail.questName}"/>';
	var locationVal='<c:out value="${questDetail.branchLocation}"/>';
	var frmCmtPagingValue=$("#frmCmtPagingValue");
	var replyUL=$("#replyul");

	//댓글표시 및 수정삭제버튼
	function showReplyList(page) {
		reviewJs.getReviewList(
			{questName:qVal,branchLocation:locationVal,page:page||1},
			function(reviewCreatorDTO){
				$("#replyTotal").html("<strong>리뷰수:&nbsp;"+reviewCreatorDTO.rowAmountTotal+"</strong>");
				frmCmtPagingValue.find("input[name='pageNum']").val(reviewCreatorDTO.reviewDTO.pageNum);
				var result="";
				if(!reviewCreatorDTO.reviewList||reviewCreatorDTO.reviewList.length==0){
					result+= '<li class="left clearfix replyli" '
					    +  ' >' 
					    +  '  <strong>등록된 리뷰가 없습니다.</strong></li>' ;
					replyUL.html(result);
					return;
				}
				for(var a=0, leng=reviewCreatorDTO.reviewList.length;a<leng;a++){
					result+= '<li class="left clearfix replyli" data-questName="' + qVal + '" data-branchLocation="'+locationVal+'"' 
						    + '    data-rno="' + reviewCreatorDTO.reviewList[a].rno +'" data-rwriter="' + reviewCreatorDTO.reviewList[a].rwriter + '" data-ratingstar="'+reviewCreatorDTO.reviewList[a].ratingStar+'"'	
						    + ' 	data-rcontent="'+reviewCreatorDTO.reviewList[a].rcontent+'">'
						    + '   <div>'
							+ '        <span class="header info-rwriter">';
							
					if(reviewCreatorDTO.reviewList[a].ratingStar!=0){
						switch (reviewCreatorDTO.reviewList[a].ratingStar) {
						case 1:
							result+= '<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/starhaf.png">';
							break;
						case 2:
							result+= '<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/star.png">';
							break;
						case 3:
							result+= '<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/star.png">'
									+'<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/starhaf.png">';
							break;
						case 4:
							result+= '<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/star.png">'
									+'<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/star.png">';
							break;
						case 5:
							result+= '<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/star.png">'
									+'<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/star.png">'
									+'<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/starhaf.png">';
							break;
						case 6:
							result+= '<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/star.png">'
									+'<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/star.png">'
									+'<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/star.png">';
							break;
						case 7:
							result+= '<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/star.png">'
									+'<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/star.png">'
									+'<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/star.png">'
									+'<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/starhaf.png">';
							break;
						case 8:
							result+= '<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/star.png">'
									+'<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/star.png">'
									+'<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/star.png">'
									+'<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/star.png">';
							break;
						case 9:
							result+= '<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/star.png">'
									+'<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/star.png">'
									+'<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/star.png">'
									+'<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/star.png">'
									+'<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/starhaf.png">';
							break;
						case 10:
							result+= '<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/star.png">'
									+'<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/star.png">'
									+'<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/star.png">'
									+'<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/star.png">'
									+'<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/star.png">';
							break;
						default:
							result+='';
							break;
						}
					}
					result += '        <strong class="primary-font">'
							+ reviewCreatorDTO.reviewList[a].rwriter + '</strong>&nbsp;'
							+ '		<small class="text-muted">수정일: ' 
							+       reviewCreatorDTO.reviewList[a].rmodDate
							+ '     </small>&nbsp;&nbsp;&nbsp;'
							+ '       <a class="btnsReply">';
			if (loginUser === reviewCreatorDTO.reviewList[a].rwriter){
					 result+= "          <button type='button' class='btn btn-warning btn-sm btnModCmt'>수정</button> "
							+ "          <button type='button' class='btn btn-danger btn-sm btnDelCmt'>삭제</button>";	
			} else{
				<c:if test="${isAdmin}">
					 result+= "          <button type='button' class='btn btn-danger btn-sm btnDelCmt'>삭제</button>";
				</c:if>
			}
					 result+= '		     <p data-questName="' + reviewCreatorDTO.reviewList[a].questName + '"'
							+ '             data-branchLocation="' + reviewCreatorDTO.reviewList[a].branchLocation + '"'
							+ '             data-rno="' + reviewCreatorDTO.reviewList[a].rno + '"'
							+ '             data-rwriter="' + reviewCreatorDTO.reviewList[a].rwriter + '"' 
							+ '             >';
					 replace=reviewCreatorDTO.reviewList[a].rcontent.replaceAll("\n","<br>");
					 result+= replace
							+ '             <a class="modifyreply"></a></p>'	
							+ '    </a> </span>'
							+ '    </div>'
							+ '</li>';	
				}	//for
				replyUL.html(result);
				replyPagingNums(reviewCreatorDTO.reviewDTO.pageNum ,
									reviewCreatorDTO.startPagingNum , 
									reviewCreatorDTO.endPagingNum ,
									reviewCreatorDTO.prev ,
						          	reviewCreatorDTO.next ,
						          	reviewCreatorDTO.lastPageNum) ;
			});
		
	};
	//리뷰평균점수 
	function reviewavgnum() {
		var comment={questName:qVal,branchLocation:locationVal};
		reviewJs.getReviewAvg(comment,
			function (avg) {
				$("#replyAvg").html("<strong>리뷰평균:&nbsp;"+avg+"&nbsp;/&nbsp;10</strong>");		
			}
		);
	}

	//댓글 페이징
	function replyPagingNums(pageNum,startPagingNum,endPagingNum,prev,next,lastPageNum){
		if(endPagingNum>=lastPageNum){
			endPagingNum=lastPageNum;
		}
		var result='<ul class="pagination pagination-sm" style="justify-content:center;">';
		if(prev) {
		result += '    <li class="page-item" >'
			    +  '         <a class="page-link" href="1" >'
			    +  '             <span aria-hidden="true" >&laquo;</span>'
			    +  '         </a>'
			    +  '    </li>' 
			    +  '    <li class="page-item" >'
			    +  '         <a class="page-link" href="' + (startPagingNum - 1) + '" >'
			    +  '             <span aria-hidden="true" >이전</span>'
			    +  '         </a>'
			    +  '    </li>' ;
		}
		for(var i = startPagingNum ; i <= endPagingNum ; i++){
			var active = ((pageNum == i) ? "active" : "" );
		result +='     <li class="page-item ' + active + '">'
			    + '         <a class="page-link" href="' + i + '" >'
		        + '             <span aria-hidden="true" >' + i + '</span>'
		        + '         </a>'
		        + '     </li>' ;
		}
		if(next) {
		result += '    <li class="page-item" >'
			    +  '         <a class="page-link" href="' + (endPagingNum + 1) + '" >'
			    +  '             <span aria-hidden="true" >다음</span>'
			    +  '         </a>'
			    +  '    </li>'
				+  '    <li class="page-item" >'
			    +  '         <a class="page-link" href="' + lastPageNum + '" >'
			    +  '             <span aria-hidden="true" >&raquo;</span>'
			    +  '         </a>'
			    +  '    </li>' 
				+  '</ul>' ;
		}
		$("#replyPagingNums").html(result);
	}
	//페이징 : 댓글 목록 가져오는 함수
	$("#replyPagingNums").on("click","li a",function(e){
		e.preventDefault();
		var targetPageNum = $(this).attr("href")  ;
		showReplyList(targetPageNum) ;
	});
	//댓글 등록처리
	$("#btnRegCmt").on("click",function(e){
		if(!loginUser){
			alert("로그인 후, 댓글 등록이 가능합니다.");
			return;
		}
		var txtBoxCmt=$(".txtBoxCmt").val();
		var ratingStar=$("#selectStar").val();
		var comment={questName:qVal,branchLocation:locationVal,ratingStar:ratingStar,rcontent:txtBoxCmt,rwriter:loginUser};
		reviewJs.registerReview(
			comment,
			function(svresult){
				if(svresult=="RegisterReply"){
					alert("리뷰가 등록되었습니다.");
				}
				showReplyList(-10);
			});
	});

	//수정창 초기화 함수
	function chgBeforeCmtRepBtns(){
		$(".txtBoxMod").remove() ;
		$(".mobtnModCmt").remove() ;
		$(".mobtnCancelCmt").remove() ;
		$("#modispanStar").remove();
		$(".btnModCmt").attr("style", "display:in-block;") ;
	}
	// 댓글 수정입력창 표시
	$("#replyul").on("click",".btnModCmt",function(){
		chgBeforeCmtRepBtns();
		var rwriter = $(this).closest("li").data("rwriter") ;
		if(loginUser != rwriter) {
			alert("로그인한 작성자만 수정이 가능합니다.") ;
			return ;	
		}
		var content=$(this).parents("li").data("rcontent");
		var rcontent=$(this).text();
		var replytxtbox= 
			  '<span id="modispanStar"><select id="modiselectStar" name="Star">'
			+		'<option value="">기존점수</option>'
			+		'<option value="1">☆</option>'
			+		'<option value="2">★</option>'
			+		'<option value="3">★☆</option>'
			+		'<option value="4">★★</option>'
			+		'<option value="5">★★☆</option>'
			+		'<option value="6">★★★</option>'
			+		'<option value="7">★★★☆</option>'
			+		'<option value="8">★★★★</option>'
			+		'<option value="9">★★★★☆</option>'
			+		'<option value="10">★★★★★</option>'
			+ '	</select>'
			+ '</span>'
			+ "<textarea class='form-control txtBoxMod' name='rcontent' style='margin-bottom:10px;'>"+content+"</textarea>"
			+ "<button type='button' class='btn btn-warning btn-sm mobtnModCmt'>수정</button> "
			+ "<button type='button' class='btn btn-info btn-sm mobtnCancelCmt' style='margin-left: 4px;'>취소</button>";
		$(this).parents("li").after(replytxtbox);
		$("#modifyreply").val(rcontent);
		$(this).attr("style","display:none;");
	});

	//수정창 취소
	$("#replyul").on("click", ".mobtnCancelCmt",function(){
		if(!confirm("수정을 취소하시겠습니까?")){
			return;
		}
		chgBeforeCmtRepBtns();
	});

	//수정 처리
	$("#replyul").on("click",".mobtnModCmt",function(){
		var rwriterVal=$(this).prev().prev().prev().closest("li").data("rwriter") ;
		var pageNum=frmCmtPagingValue.find("input[name='pageNum']").val();
		var mocomment=$(this).prev().val();
		var rnoVal=$(this).prev().prev().prev().closest("li").data("rno");
		if($("#modiselectStar").val()==""||$("#modiselectStar").val()==null){
			ratingStar=$(this).prev().prev().prev().closest("li").data("ratingstar");
		}else {
			ratingStar=$("#modiselectStar").val();	
		}
		var comment={questName:qVal,branchLocation:locationVal,rno:rnoVal,ratingStar:ratingStar,rcontent:mocomment,rwriter:rwriterVal};
		reviewJs.modifyReview(comment,function(svrResult){
			alert("수정되었습니다.");
			showReplyList(pageNum);
		});
	});
	//댓글 삭제
	$("#replyul").on("click",".btnDelCmt",function(){
		var rwriterVal=$(this).closest("li").data("rwriter") ;
		if(loginUser!="admin"){
			if(loginUser!=rwriterVal){
				alert("로그인한 작성자만 삭제 할 수 있습니다.");
				return;
			}	
		}
		if(!confirm("삭제하시겠습니까?")){
			return;
		}
		var pageNum=frmCmtPagingValue.find("input[name='pageNum']").val();
		var rnoVal=$(this).closest("li").data("rno");
		var comment={rno:rnoVal};
		reviewJs.removeReview(comment,function(svrResult){
			alert("댓글이 삭제되었습니다.");
			showReplyList(pageNum);
		});
	});

	$(document).ready(function(){
		showReplyList(1);
		reviewavgnum();
	});
	</script>
	<%@ include file="../footer.jsp" %>