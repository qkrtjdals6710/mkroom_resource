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
										<button type="button" class="btn btn-danger">삭제</button>
									</div>
								</div>
							</div>
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
	<input type='hidden' name='pageNum' value='' />
	<input type='hidden' name='rowAmountPerPage' value='' />
</form>

<form id="frmCmtPagingValue">
	<input type='hidden' name='pageNum' value='' />
	<input type='hidden' name='rowAmountPerPage' value='' />
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


//목록 페이지로 이동
$("#btnToList").on("click", function(){

	frmSendValue.attr("action", "${contextPath}/quest/list");
	frmSendValue.attr("method", "get") ;
	frmSendValue.submit() ;
	
});

var result = '<c:out value="${result}"/>';

function checkModifyOperation(result) {
	if (result === ''|| history.state) {
		return;
	} else if (result === 'successModify'){
		var myMsg = "글이 수정되었습니다";
	}
	
	//alert(myMsg);
	$(".modal-body").html(myMsg) ;
	$("#yourModal").modal("show");
	myMsg='';
}


//첨부파일 처리 시작
//DB 정보를 이용 첨부파일 정보 표시 함수: uploadResult 매개변수에서 DB로 부터 전달된 첨부파일 정보가 저장됨
function showUploadedFiles(uploadResult) {
	
	if(!uploadResult || uploadResult.length == 0) {
		return ;	
	}
	
	var fileUploadResult = $(".fileUploadResult ul") ;
	
	var str = "";
	
	
	$(uploadResult).each(function(i, obj){
	
		
		//calledPathFileName = encodeURI(calledPathFileName.replace(new RegExp(/\\/g), "/")) ;
	
		if (obj.fileType == "F") {
		
			var calledPathFileName =  obj.repoPath + "/" + obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName ;
			//console.log("calledPathFileName: "+ calledPathFileName);
			
			str += "<li data-repopath='" + obj.repoPath + "'" 
			    +  "    data-uploadpath='" + obj.uploadPath + "'" 
			    +  "    data-uuid='" + obj.uuid + "'"
			    +  "    data-filename='" + obj.fileName + "' data-filetype='F'>" 
			    +  "    <img src='${contextPath}/resources/skillhunt-master/img/icon-attach.png'"
			    +  "         alt='No icon' style='height:18px; width: 18px;' />&nbsp;"
			    +       obj.fileName
			    +  "</li>" ;
			
		} else  {  //if(obj.fileType == "I")

			var thumbnailPath =  obj.repoPath + "/" + obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName ;
		
			
			str += "<li data-repopath='" + obj.repoPath + "'" 
		    	+  "    data-uploadpath='" + obj.uploadPath + "'" 
			    +  "    data-uuid='" + obj.uuid + "'"
			    +  "    data-filename='" + obj.fileName + "' data-filetype='I'>"
			    +  "    <img src='${contextPath}/displayThumbnail?fileName=" + encodeURI(thumbnailPath) + "'"
			    +  "         alt='No Image' style='height:18px; width: 18px;'/>&nbsp;" 
			    +       obj.fileName
			    +  "</li>" ;
		}
		
	});

	fileUploadResult.append(str) ;
}


$(".fileUploadResult ul").on("click", "li", function(){
	var objLi = $(this);
	
	var downloadFileName = objLi.data("repopath") + "/" + objLi.data("uploadpath") + "/" + objLi.data("uuid") + "_" + objLi.data("filename") ;
	downloadFileName = downloadFileName.replace(new RegExp(/\\/g), "/") ;
	
	if(objLi.data("filetype") == "I") {
		$(".attachModalDiv").html(
				"<img src='${contextPath}/fileDownloadAjax?fileName=" + encodeURI(downloadFileName) + "' width='100%' />"
		);
		
		$("#attachModal").modal("show") ;
		
	} else {
		self.location.href = "${contextPath}/fileDownloadAjax?fileName=" + encodeURI(downloadFileName) ;
	}
	
}) ;

//이미지 표시 모달 감추기
$("#attachModal").on("click", function(){
	$("#attachModal").modal("hide") ;
});
//---------------------------------------------------------댓글-----------------------

// csrf 토큰값 요청 헤더에 설정됨
var csrfHeaderName = "${_csrf.headerName}" ;
var csrfTokenValue = "${_csrf.token}" ;

$(document).ajaxSend(function(e, xhr, options){
	xhr.setRequestHeader(csrfHeaderName, csrfTokenValue) ;
	
});

var frmSendValue=$("#frmSendValue");
var bnoVal='<c:out value="${eventboard.bno}"/>';
var frmCmtPagingValue=$("#frmCmtPagingValue");
var replyUL=$("#replyul");

//댓글표시 및 수정삭제버튼
function showReplyList(page) {
	replyJs.getReplyList(
		{bno:bnoVal,page:page||1},
		function(eventReplyCreatorDTO){
			$("#replyTotal").html("<strong>리뷰수: "+eventReplyCreatorDTO.rowAmountTotal+"</strong>");
			frmCmtPagingValue.find("input[name='pageNum']").val(eventReplyCreatorDTO.eventReplyDTO.pageNum);
			var result="";
			if(!eventReplyCreatorDTO.replyList||eventReplyCreatorDTO.replyList.length==0){
				result+= '<li class="left clearfix replyli" '
				    +  ' >' 
				    +  '  <strong>등록된 댓글이 없습니다.</strong></li>' ;
				replyUL.html(result);
				return;
			}
			for(var a=0, leng=eventReplyCreatorDTO.replyList.length;a<leng;a++){
				result+= '<li class="left clearfix replyli" data-bno="' + bnoVal + '"' 
					    + '    data-rno="' + eventReplyCreatorDTO.replyList[a].rno +'" data-rwriter="' + eventReplyCreatorDTO.replyList[a].rwriter + '">'	
					    + '   <div>' ;
		//답글들여쓰기
				for(var b=2;b<=10;b++){
					if(eventReplyCreatorDTO.replyList[a].lvl==b){
						result+= '<div style="padding-left:'+(b*20)+'px;">'
								+'<img style="width: 15px;" src="https://static.thenounproject.com/png/88514-200.png">';
					}
				}
				result+= '        <span class="header info-rwriter">';
				
				//리뷰점수 : 테이블 및 컬럼 생성 후 주석 풀 예정
// 				if(questReplyCreatorDTO.replyList[a].star!=0||questReplyCreatorDTO.replyList[a].star!=null){
// 					switch (questReplyCreatorDTO.replyList[a].star) {
// 					case 1:
// 						result+= '<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/starhaf.png">';						
// 					case 2:
// 						result+= '<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/star.png">';
// 					case 3:
// 						result+= '<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/star.png">'
// 								+'<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/starhaf.png">';
// 					case 4:
// 						result+= '<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/star.png">'
// 								+'<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/star.png">';
// 					case 5:
// 						result+= '<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/star.png">'
// 								+'<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/star.png">'
// 								+'<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/starhaf.png">';
// 					case 6:
// 						result+= '<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/star.png">'
// 								+'<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/star.png">'
// 								+'<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/star.png">';
// 					case 7:
// 						result+= '<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/star.png">'
// 								+'<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/star.png">'
// 								+'<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/star.png">'
// 								+'<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/starhaf.png">';
// 					case 8:
// 						result+= '<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/star.png">'
// 								+'<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/star.png">'
// 								+'<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/star.png">'
// 								+'<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/star.png">';
// 					case 9:
// 						result+= '<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/star.png">'
// 								+'<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/star.png">'
// 								+'<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/star.png">'
// 								+'<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/star.png">'
// 								+'<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/starhaf.png">';
// 					case 10:
// 						result+= '<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/star.png">'
// 								+'<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/star.png">'
// 								+'<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/star.png">'
// 								+'<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/star.png">'
// 								+'<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/star.png">';
// 					default:
// 						return;
// 					}
// 				}
				result +='        <strong class="primary-font">'
						+ eventReplyCreatorDTO.replyList[a].rwriter + '</strong>&nbsp;'
						+ '		<small class="text-muted">수정일: ' 
						+       eventReplyCreatorDTO.replyList[a].rmodDate
// 						+       replyJs.showDatetime(eventReplyCreatorDTO.replyList[a].rmodDate)
						+ '     </small>&nbsp;&nbsp;&nbsp;'
			     		+ '       <a class="btnsReply">'
					    + '<button type="button" class="btn btn-primary btn-sm btnChgReplyReg" id="btnChgReplyReg">답글</button>'
						+ " <button type='button' class='btn btn-warning btn-sm btnModCmt'>수정</button> "
						+" <button type='button' class='btn btn-danger btn-sm btnDelCmt'>삭제</button>"
						+ '		   <p data-bno="' + eventReplyCreatorDTO.replyList[a].bno + '"' 
						+ '           data-rno="' + eventReplyCreatorDTO.replyList[a].rno + '"'
						+ '           data-rwriter="' + eventReplyCreatorDTO.replyList[a].rwriter + '"' 
						+ '           >' + eventReplyCreatorDTO.replyList[a].rcontent
						+ '<a class="rereply"></a><a class="modifyreply"></a></p>'	
						+ '    </a> </span>' 
						+ '       </div>'//답글 들여쓰기 for문
						+ '    </div>'
						+ '</li>';	
			}	//for
			
			replyUL.html(result);
			replyPagingNums(eventReplyCreatorDTO.eventReplyDTO.pageNum ,
								eventReplyCreatorDTO.startPagingNum , 
								eventReplyCreatorDTO.endPagingNum ,
								eventReplyCreatorDTO.prev ,
					          	eventReplyCreatorDTO.next ,
					          	eventReplyCreatorDTO.lastPageNum) ;
		});
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
	console.log("----------targetPageNum: "+targetPageNum);
	showReplyList(targetPageNum) ;
});


//댓글 등록처리
$("#btnRegCmt").on("click",function(){
	var loginUser='jsTestUser1';
// 	if(!loginUser){
// 		alert("로그인 후, 댓글 등록이 가능합니다.");
// 		return;
// 	}
	var txtBoxCmt=$(".txtBoxCmt").val();
	var comment={bno:bnoVal,rcontent:txtBoxCmt,rwriter:loginUser};
	
	console.log("댓글등록: "+comment);
	replyJs.registerReply(
		comment,
		function(svresult){
			if(svresult=="RegisterReply"){
				alert("댓글이 등록되었습니다.");
			}
			showReplyList(-10);
		}
	)
});
//대댓글창 초기화 함수
function chgBeforeReplyBtn(){
	$(".txtBoxReply").remove();
	$(".btnRegReply").remove();
	$(".btnCancelRegReply").remove();
	$(".btnChgReplyReg").attr("style", "display:in-block") ;
}
//수정창 초기화 함수
function chgBeforeCmtRepBtns(){
	$(".txtBoxMod").remove() ;
	$(".mobtnModCmt").remove() ;
	$(".mobtnCancelCmt").remove() ;
	$(".btnModCmt").attr("style", "display:in-block;") ;
}
// 대댓글창 구현
$("#replyul").on("click","#btnChgReplyReg",function(){
	$(".rereply").attr("style","display:in-block;");
// 	if(!loginUser){
//		alert("로그인 후, 댓글 등록이 가능합니다.");
//		return;
//	}
	chgBeforeReplyBtn();
	chgBeforeCmtRepBtns();
	var replytxtbox=
		  "<textarea class='form-control txtBoxReply' name='rcontent' style='margin-bottom:10px;' "
		+ "        placeholder='답글입력란'></textarea>"
		+ "<button type='button' class='btn btn-warning btn-sm btnRegReply'>등록</button>"
		+ "<button type='button' class='btn btn-danger btn-sm btnCancelRegReply' style='margin-left: 4px;'>취소</button>";
	$(this).parents("li").after(replytxtbox);
	$(this).attr("style","display:none;");
});

// 대댓글취소
$("#replyul").on("click",".btnCancelRegReply",function(){
	if(!confirm("답글 입력을 취소하시겠습니까?")){
		return;
	}
	chgBeforeReplyBtn();	
});

// 대댓글등록
$("#replyul").on("click",".btnRegReply",function(){
	var loginUser='jsTestUser1';
// 	if(!loginUser){
// 		alert("로그인 후, 댓글 등록이 가능합니다.");
// 		return;
// 	}
	var pageNum=frmCmtPagingValue.find("input[name='pageNum']").val();
	console.log("----------대댓글 추가 pageNum : "+pageNum);
	var txtBoxReply=$(this).prev().val();
	var datarno=$(this).prev().prev().data("rno");
	console.log("----------대댓글 추가 datarno : "+datarno);
	var rereply={bno: bnoVal, rcontent:txtBoxReply, rwriter:loginUser, prno:datarno};
	
	replyJs.registerRereply(rereply, function(svrresult){
		if(svrresult=="RegisterReply"){
			alert("답글이 등록되었습니다");
		}
		chgBeforeReplyBtn();
		chgBeforeCmtRepBtns();
		showReplyList(pageNum);
	});
});


// 댓글/대댓글 수정입력창 표시
$("#replyul").on("click",".btnModCmt",function(){
	chgBeforeReplyBtn();
	chgBeforeCmtRepBtns();
	var rwriter = $(this).data("rwriter") ;
// 	if(loginUser != rwriter) {
// 		alert("로그인한 작성자만 수정이 가능합니다.") ;
// 		return ;	
// 	}
	$(this).parents("li").find(".btnRegReply").attr("style","display:none");
	var rcontent=$(this).text();
	var replytxtbox=  "<textarea class='form-control txtBoxMod' name='rcontent' style='margin-bottom:10px;'></textarea>"
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
	chgBeforeReplyBtn();
});

$(document).ready(function(){
	showReplyList(1);
});
//수정 처리
$("#replyul").on("click",".mobtnModCmt",function(){
	var rwriterVal=$(this).prev().prev().find("p").data("rwriter");
	console.log("수정처리------------------가져온 rwriter: "+rwriterVal);

	var pageNum=frmCmtPagingValue.find("input[name='pageNum']").val();
	var mocomment=$(this).prev().val();
	var rnoVal=$(this).prev().prev().data("rno");
	
	var comment={bno:bnoVal,rno:rnoVal,rcontent:mocomment,rwriter:rwriterVal};
	replyJs.modifyReply(comment,function(svrResult){
		alert("수정되었습니다.");
		showReplyList(pageNum);
	});
});
//댓글/대댓글 삭제
$("#replyul").on("click",".btnDelCmt",function(){
	var rwriterVal=$(this).closest("li").data("rwriter") ;
	console.log("삭제처리------------------가져온 rwriter: "+rwriterVal);
// 	if(loginUser!=rwriterVal){
//		alert("로그인한 작성자만 삭제 할 수 있습니다.");
//		return;
//	}
	if(!confirm("삭제하시겠습니까?")){
		return;
	}
	var pageNum=frmCmtPagingValue.find("input[name='pageNum']").val();
	var rnoVal=$(this).closest("li").data("rno");
	console.log("삭제처리------------------가져온 rno: "+rnoVal);
	var  comment={bno:bnoVal,rno:rnoVal,rwriter:rwriterVal};
	replyJs.removeReply(comment,function(svrResult){
		alert("댓글이 삭제되었습니다.");
		showReplyList(pageNum);
	});
});
</script>
<%@ include file="../footer.jsp" %>