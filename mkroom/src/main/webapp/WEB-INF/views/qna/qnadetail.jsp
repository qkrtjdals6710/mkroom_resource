<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>


<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<security:authentication property="principal" var="principal"/>
<security:authorize var="isAdmin" access="hasRole('ADMIN')" />


<%@ include file="../header.jsp" %>


   <!-- 상단 -->    
   <div class="hero-wrap hero-wrap-2" style="background-image: url('${contextPath}/resources/skillhunt-master/images/header-back.jpg');" data-stellar-background-ratio="0.8">
     <div class="overlay"></div>
     <div class="container">
       <div class="row no-gutters slider-text align-items-end justify-content-start">
         <div class="col-md-12 ftco-animate text-center mb-5">
           <h2 class="mb-3 bread">FAQ / QnA</h2>
         </div>
       </div>
     </div>
   </div>
  <!-- 상단 끝-->


<style>
.txtBoxCmt, .txtBoxComment {
	overflow: hidden;
	resize: vertical;
	min-height: 100px;
	color: black;
}
</style>



<div id="page-wrapper">
    <div class="row col-lg-12">
              <div class="panel panel-default">
                <div class="panel-heading">
					<div class="row">
						<div class="form-group board1">
										<div class="container">
							
								<div class="row">
								    <div class="col-lg-10" style="font-size: 25px;">제목 - <c:out value="${qna.btitle }"/></div>
									<div class="col-lg-2" style="text-align:right;"><%-- vertical-align: middle; --%>
										<div class="button-group">
											
											<security:authorize access="isAuthenticated()" >
			 									<security:authentication property="principal" var="principal"/> 
			 										<c:if test="${principal.username eq qna.bwriter}"> 
														<button type="button" id="btnToModify" data-oper="modify" class="btn btn-primary"><span>수정</span></button> 
													</c:if>
		 									</security:authorize>
											
											<button type="button" id="btnToList" data-oper="list" class="btn btn-info"><span>목록</span></button>
											
											<security:authorize access="isAuthenticated()" >
			 									<security:authentication property="principal" var="principal"/> 
			 										<c:if test="${principal.username eq qna.bwriter}"> 		
														<button type="button" class="btn btn-danger" id="btnToDelete" data-bno="${qna.bno}" >삭제</button>
													</c:if>
		 									</security:authorize>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-12 board2">
						<span class="text-primary" style="font-size: smaller;">
								작성자:&nbsp;<strong><c:out value="${qna.bwriter}"/></strong>&nbsp;&nbsp;
								글번호:&nbsp;<strong><c:out value="${qna.bno}"/></strong>&nbsp;&nbsp;
								등록일:&nbsp;<strong><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${qna.bregDate}"/></strong>&nbsp;&nbsp;
								조회수:&nbsp;<strong><c:out value="${qna.bviewCnt}"/></strong>
						</span>
					</div>
				</div><%-- .panel-heading 끝 --%>
                <div class="panel-body form-horizontal">
					<div class="form-group">
						<div class="col-sm-12 board3">						  
							<h5>내용</h5>

								<p class="form-control" rows="3" name="bcontent" >
									<pre><c:out value="${qna.bcontent}" /></pre>
								</p>
								
								<%-- 첨부파일 목록 넣는곳 --%>
							<div class="form-group fileUploadResult">
							<ul>
								<%-- 업로드 후, 업로드 처리결과가 표시될 영역 --%>
							</ul>
							</div>
						</div>
					</div>
				</div>	
					
				
						
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


<form id="frmSendValue">
	<input type='hidden' name='bno' id="bno" value='<c:out value="${qna.bno}"/>'> 
	<input type='hidden' name='pageNum' value='${qnaPagingDTO.pageNum}'> 
	<input type='hidden' name='rowAmountPerPage' value='${qnaPagingDTO.rowAmountPerPage}'> 
	<input type='hidden' name='scope' value='${qnaPagingDTO.scope}'>
	<input type='hidden' name='keyword' value='${qnaPagingDTO.keyword}'>
</form>

				
<%-- 댓글 화면 표시 시작 -------------------------%>
<div class="repl">
	<div class="panel-heading">
		<div>&nbsp;
			<span id="replyTotal"></span><br>	<!-- 총 댓글수 표시 -->
				<security:authorize access="hasRole('ADMIN')">
				<textarea style="width:100%" id="frmreply txtBoxCmt" class="txtBoxCmt" name="rcontent" placeholder="댓글입력란" ></textarea>
	          		<br>
				 	<button id="btnRegCmt" class="btn btn-primary" style="vertical-align" type="button">댓글 작성</button>
					</security:authorize>
          		 	<hr>
	    </div>
	</div> <%-- /.panel-heading --%>
		<div class="panel-body">
			<ul class="chat">	<!-- 댓글 목록 표시 영역 시작 -->
				
			</ul><%-- /.chat --%>
		</div><%-- /.panel-body --%>
	<div class="panel-footer text-center" id="showCmtPagingNums"></div>	<!-- 댓글 페이징 -->
</div><%-- /.panel-body --%>
          
<%-- 댓글 페이징 데이터 저장 form --%>
<form id="frmCmtPagingValue">
	<input type='hidden' name='pageNum' value='' /> 
	<input type='hidden'name='rowAmountPerPage' value='' />
</form>

		</div><%-- /.panel --%>
	</div><%-- 게시물 상태 표시 끝 /.row col-lg-12 --%>
</div><%-- /#page-wrapper --%>



<script type="text/javascript">
	$(document).ready(function() {
		 $.ajaxSetup({
            headers: {
                '${_csrf.headerName}': '${_csrf.token}'
            }
         });
		 
	})
</script>

<script type="text/javascript" src="${contextPath}/resources/js/mycomment.js"></script>
<script type="text/javascript">



var frmSendValue = $("#frmSendValue");

	//게시물 수정 페이지로 이동
	$("#btnToModify").on("click", function(){
	// location.href='${contextPath}/qna/qnamodify?bno=<c:out value="${qna.bno}"/>';
	 frmSendValue.attr("action", "${contextPath}/qna/qnamodify");
	 frmSendValue.attr("method", "get");
	 frmSendValue.submit();
	})
	//게시물 목록 페이지로 이동
	$("#btnToList").on("click", function(){
	// location.href="${contextPath}/qna/qnalist";
	 frmSendValue.find("#bno").remove();// 목록화면 이동 시, bno 값 삭제
	 frmSendValue.attr("action", "${contextPath}/qna/qnalist");
	 frmSendValue.attr("method", "get");
	 frmSendValue.submit();
	})


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






//게시물 번호 저장
var bnoValue = '<c:out value="${qna.bno}"/>'; 

var commentUL = $(".chat");

var frmCmtPagingValue = $("#frmCmtPagingValue");

var loginUser = "";

<security:authorize access="isAuthenticated()">
	loginUser = '<security:authentication property="principal.username"/>' ;
</security:authorize>

<%-- 삭제 --%>
$("#btnToDelete").on("click", function(e) {
	
	frmSendValue.append("<input type='hidden' name='bno' value='" + $(this).data("bno") + "'/>");
	frmSendValue.attr("action", "${contextPath}/qna/qnadelete");
	frmSendValue.attr("method", "get");
	frmSendValue.submit();
	
});	


//댓글 목록표시 함수 선언: ajax 클로저 모듈 함수를 호출함
function showCmtList(page){

myCommentClsr.getCmtList(
		{bno: bnoValue, page: page || 1 } ,
		function (replyPagingCreator) {
			//console.log("서버로부터 전달된 pageNum(replyPagingCreator.qnaRelyPaging.pageNum): "
			//			+ replyPagingCreator.qnaReplyPagingDTO.pageNum);
			
			
			$("#replyTotal").html("댓글:&nbsp;" + replyPagingCreator.rowAmountTotal + "개");
			
			
			frmCmtPagingValue.find("input[name='pageNum']").val(replyPagingCreator.qnaReplyPagingDTO.pageNum);
			
			//console.log("폼에 저장된 페이징번호 pageNum(): "
			//			+ frmCmtPagingValue.find("input[name='pageNum']").val());
			
			var str = "" ;
			
			//댓글이 없으면, if 문의 블록이 실행되고, 함수 실행이 중지됨(return), 따라서, for문 실행 않됨
			if( !replyPagingCreator.replyList || replyPagingCreator.replyList.length == 0 ) {
				//alert(typeof replyPagingCreator.replyList) ;
				
				str += '<li class="left clearfix commentLi" '
				    +  '    style="text-align: center; background-color: #CC7C38; height: 35px; margin:bottom: 0px; padding-bottom; 0px; padding-top: 6px;border: 1px dotted;">' 
				    +  '  <strong>등록된 댓글이 없습니다.</strong></li>' ;
				
				commentUL.html(str);
				return ;
 				
			}
			
			for(var i = 0, len = replyPagingCreator.replyList.length; i < len ; i++){
				str += '<li class="left clearfix commentLi" data-bno="' + bnoValue + '"' 
				    + '    data-rno="' + replyPagingCreator.replyList[i].rno +'">'
				    + '   <div>' ;
				
				//댓글에 대한 답글 들여쓰기
			if(replyPagingCreator.replyList[i].lvl == 1){
				str += '       <div>' ;
				
			} else if (replyPagingCreator.replyList[i].lvl == 2) {
				str += '       <div style="padding-left: 25px;">' ;
			} else if (replyPagingCreator.replyList[i].lvl == 3) {
				str += '       <div style="padding-left: 50px;">' ;
			} else if (replyPagingCreator.replyList[i].lvl == 4) {
				str += '       <div style="padding-left: 75px;">' ;
			} else {
				str += '       <div style="padding-left: 100px;">' ;
			}
				    
				str +='        <span class="header info-rwriter">'
					+ '             <strong class="primary-font">';
					
			if(replyPagingCreator.replyList[i].lvl > 1) {
				str +='             <i class="fa fa-reply fa-fw"></i>' ;
			}
					
					
				str	+= replyPagingCreator.replyList[i].rwriter + '</strong>'
					+ '             <span>&nbsp;</span>'
					+ '             <small class="text-muted">수정일: ' 
					//+               replyPagingCreator.replyList[i].rmodDate
					+               myCommentClsr.showDatetime(replyPagingCreator.replyList[i].rmodDate)
					+ '             </small>'
					+ '        </span>' 
					+ '		   <p data-bno="' + replyPagingCreator.replyList[i].bno + '"' 
					+ '           data-rno="' + replyPagingCreator.replyList[i].rno + '"'
					+ '           data-rwriter="' + replyPagingCreator.replyList[i].rwriter + '"' 
					+ '           >' + replyPagingCreator.replyList[i].rcontent + '</p>'
				    + '       </div>';
				    
				    <security:authorize access="hasRole('MEMBER')">
					<security:authentication property="principal" var="principal"/> 
			
				str +='       <div class="btnsReply" style="margin-bottom:10px">'
				    + '           <button type="button" style="display:in-block"'
					+ '                   class="btn btn-secondary btn-xs btnChgReplyReg"><span>답글 작성</span></button>'
				    + '       </div>' ;
				    
				    </security:authorize>
				    
				    
				str +='    </div>'
					+ '</li>' ;
					
			}  //for-end
			
			commentUL.html(str); //html() 사용 시, 새로운 내용으로 교체.
			//commentUL.append(str);  //append 사용 시, 기존 내용 밑에 새로운 내용 추가 (페이징 대신 사용).
			
			showCmtPagingNums(replyPagingCreator.qnaReplyPagingDTO.pageNum ,
					          replyPagingCreator.startPagingNum , 
					          replyPagingCreator.endPagingNum ,
					          replyPagingCreator.prev ,
					          replyPagingCreator.next ,
					          replyPagingCreator.lastPageNum) ;
			
			
		} //callback-함수 end
	
	); //매개변수 선언 end

} //showCmtList 함수 end 


//댓글 목록에 표시할 페이징번호 생성 함수: ReplyPagingCreator로 부터 받아온 값들을 이용
function showCmtPagingNums(pageNum, startPagingNum, endPagingNum, prev, next, lastPageNum) {
	if (endPagingNum >= lastPageNum) {
		endPagingNum = lastPageNum ;
	}
	
	var str  = '<ul class="pagination pagination-sm" >' ;
	//맨 앞으로
	if(prev) {
		//맨 앞으로
		str += '    <li class="page-item" >'
		    +  '         <a class="page-link" href="1" >'
		    +  '             <span aria-hidden="true" >&laquo;</span>'
		    +  '         </a>'
		    +  '    </li>' ;
		//이전 페이지    
		str += '    <li class="page-item" >'
		    +  '         <a class="page-link" href="' + (startPagingNum - 1) + '" >'
		    +  '             <span aria-hidden="true" >이전</span>'
		    +  '         </a>'
		    +  '    </li>' ;
	}
		    
		//선택된 페이지 번호 Bootstrap의 색상표시
	for(var i = startPagingNum ; i <= endPagingNum ; i++){
		//active는 Bootstrap 클래스 이름
		var active = ((pageNum == i) ? "active" : "" );
			
		str +='     <li class="page-item ' + active + '">'
		    + '         <a class="page-link" href="' + i + '" >'
	        + '             <span aria-hidden="true" >' + i + '</span>'
	        + '         </a>'
	        + '     </li>' ;
	}
		
	if(next) {
		//다음 페이지
		str += '    <li class="page-item" >'
		    +  '         <a class="page-link" href="' + (endPagingNum + 1) + '" >'
		    +  '             <span aria-hidden="true" >다음</span>'
		    +  '         </a>'
		    +  '    </li>' ;
		//맨마지막으로     
		str += '    <li class="page-item" >'
		    +  '         <a class="page-link" href="' + lastPageNum + '" >'
		    +  '             <span aria-hidden="true" >&raquo;</span>'
		    +  '         </a>'
		    +  '    </li>' ;

		    
		str += '</ul>' ;
		
	}
	
	$("#showCmtPagingNums").html(str);
	
}
	
//선택된 페이징 번호의 게시물목록 가져오는 함수: 이벤트 전파 이용
$("#showCmtPagingNums").on("click", "ul li a" ,function(e){
	e.preventDefault() ;
	
	var targetPageNum = $(this).attr("href")  ;
	console.log("targetPageNum: " + targetPageNum);
	
	showCmtList(targetPageNum) ;
});

<%--댓글등록 버튼 클릭 이벤트 처리 --%>
$("#btnRegCmt").on("click", function(){
	var loginUser = "";
	<security:authorize access="isAuthenticated()" >
		loginUser = '<c:out value="${principal.username}"></c:out>';	
	</security:authorize>
	var txtBoxCmt = $(".txtBoxCmt").val() ;
	
	var comment = {bno: bnoValue, rcontent: txtBoxCmt, rwriter: loginUser} ;
	
	console.log("댓글등록: 서버전송 객체내용: " + comment);
	
	myCommentClsr.registerCmt(
		comment,
		function(serverResult) {
			
			if(serverResult == "RegisterSuccess"){
				alert("댓글이 등록되었습니다.") ;
			}
			
			chgBeforeCmtBtn() ;
			
			showCmtList(-10) ;
			
			
		}
		
	)
	
}) ;

<%--댓글 추가 요소 초기화 함수 --%>
function chgBeforeCmtBtn() {
	$(".txtBoxCmt").val("");

}


<%--댓글답글 수정의 취소 버튼 클릭 이벤트 --%>
$(".chat").on("click", "li .btnCancelCmt",function(){
	chgBeforeCmtRepBtns() ;
	chgBeforeReplyBtn()
});



<%--답글 작성 버튼 클릭 이벤트: 이벤트 전파이용 --%>

$(".chat").on("click", "li div div .btnChgReplyReg", function(){
	$("p").attr("style", "display:in-block;") ;
	
	chgBeforeReplyBtn() ;
	chgBeforeCmtBtn() ;
	chgBeforeCmtRepBtns();
	
	var strTxtBoxReply =
		  "<textarea class='form-control txtBoxReply' name='rcontent' style='margin-bottom:10px;'"
		+ "        placeholder='답글 입력란 &#10;답글 등록 버튼을 클릭해주세요.'"
		+ "       ></textarea>"
		+ "<button type='button' class='btn btn-warning btn-xs btnRegReply'>답글 등록</button>"
		+ "<button type='button' class='btn btn-danger btn-xs btnCancelRegReply'"
		+ " style='margin-left:4px;'>취소</button>";
	
	$(this).after(strTxtBoxReply) ;
	$(this).attr("style", "display: none")
	
});


<%--답글 관련 화면 상태 초기화--%>
function chgBeforeReplyBtn(){
	$(".btnRegReply").remove() ;
	$(".btnCancelRegReply").remove() ;
	$(".txtBoxReply").remove() ;
	$(".btnChgReplyReg").attr("style", "display:in-block") ;
	
}


<%--답글등록 취소 클릭--%>
$(".chat").on("click", ".commentLi .btnCancelRegReply", function(){
	
	if(!confirm("답글 입력을 취소하시겠습니까?")) {
		return ;
	}
	
	chgBeforeReplyBtn() ;
	
});

<%--댓글/답글 수정 입력창 초기화 함수--%>
function chgBeforeCmtRepBtns(){
	
	$("p").attr("style", "display:in-block;") ;
	
	$(".btnModCmt").remove() ;
	$(".btnDelCmt").remove() ;
	$(".btnCancelCmt").remove() ;
	$(".txtBoxMod").remove() ;
	
}


<%--답글 등록 버튼 클릭 이벤트 처리: 답글이 달린 댓글이 있는 페이지 표시--%>
$(".chat").on("click", ".commentLi .btnRegReply", function(){
	var loginUser = "";
	<security:authorize access="isAuthenticated()" >
		loginUser = '<c:out value="${principal.username}"></c:out>';
	</security:authorize>
	var pageNum = frmCmtPagingValue.find("input[name='pageNum']").val() ;
	console.log("답글 추가가 발생된 댓글 페이지 번호: "+ pageNum);
	
	var txtBoxReply = $(this).prev().val() ;
	
	var prnoVal = $(this).closest("li").data("rno") ;
	console.log("prnoVal: " + prnoVal) ;
	
	var reply = { bno: bnoValue, 
				  rcontent: txtBoxReply,
				  rwriter: loginUser, 
				  prno: prnoVal } ;
	
	console.log("답글등록: 서버전송 객체내용: " + reply);
	
	myCommentClsr.registerReply(reply,
		function(serverResult){
		
			if(serverResult == "RegisterSuccess"){
				alert("답글이 등록되었습니다.") ;
			}
			
			chgBeforeReplyBtn() ;
			
			showCmtList(pageNum) ;
			
	});
	
});


<%--댓글-답글 수정/삭제 화면 요소 표시: p 태그 클릭 이벤트 --%>
$(".chat").on("click", "li p", function(){
	chgBeforeCmtBtn();<%--댓글 등록 상태 초기화--%>
	chgBeforeReplyBtn()<%--다른 답글 등록 상태 초기화--%>
	chgBeforeCmtRepBtns(); <%--다른 답글/댓글 수정 상태 초기화--%>
	
	$(this).parents("li").find(".btnChgReplyReg").attr("style","display: none");
	
	var rcontent = $(this).text() ;
	console.log("선택된 댓글내용: " + rcontent);
	
	var strTxtBoxReply =
						  "<textarea class='form-control txtBoxMod' name='rcontent' style='margin-bottom:10px;'"
						+ " placeholder='답글작성을 원하시면,&#10;답글 작성 버튼을 클릭해주세요.'"
						+ "></textarea>";

	var rwriter = $(this).attr("data-rwriter");
	
	var userId = "";
	<security:authorize access="isAuthenticated()" >
		userId = '${principal.username}'
	</security:authorize>
	
	if (userId === rwriter) {
		 strTxtBoxReply	+="<button type='button' class='btn btn-warning btn-sm btnModCmt'>수정</button> "
						+ "<button type='button' class='btn btn-danger btn-sm btnDelCmt'>삭제</button>"
						+ "<button type='button' class='btn btn-info btn-sm btnCancelCmt' style='margin-left: 4px;'>취소</button>";
		
	} else {
		<c:if test="${isAdmin}">
		 strTxtBoxReply	+="<button type='button' class='btn btn-warning btn-sm btnModCmt'>수정</button> "
						+ "<button type='button' class='btn btn-danger btn-sm btnDelCmt'>삭제</button>"
						+ "<button type='button' class='btn btn-info btn-sm btnCancelCmt' style='margin-left: 4px;'>취소</button>";
		</c:if>
	}

			
	
		
		
	
	$(this).after(strTxtBoxReply) ;
	$(".txtBoxMod").val(rcontent) ;
	$(this).attr("style", "display: none;") ;
		
}) ;


<%--댓글답글 수정의 취소 버튼 클릭 이벤트 --%>
$(".chat").on("click", "li .btnCancelCmt",function(){
	chgBeforeCmtRepBtns() ;
	chgBeforeReplyBtn()
});

<%-- 댓글-답글 수정 처리: 수정 버튼 클릭 이벤트 --%>
$(".chat").on("click", "li .btnModCmt",function(){
	var rwriterVal = $(this).siblings("p").data("rwriter") ;
	var pageNum = frmCmtPagingValue.find("input[name='pageNum']").val() ;
	
	var txtBoxComment = $(this).prev().val() ;
	
	var rnoVal = $(this).closest("li").data("rno") ;
	
	var comment = {bno: bnoValue ,
			       rno: rnoVal ,
			       rcontent: txtBoxComment , 
			       rwriter: rwriterVal } ;
	
	myCommentClsr.modifyCmtReply(
		comment,
		function(serverResult){
			alert("수정되었습니다.") ;
			
			showCmtList(pageNum) ;
			
		}
	
	);
});



<%-- 댓글-답글 수정 처리: 수정 버튼 클릭 이벤트 --%>
$(".chat").on("click", "li .btnDelCmt",function(){
	
	var delConfirm = confirm('삭제하시겠습니까?');
	
	if (!delConfirm) {
		alert("삭제가 취소되었습니다.") ;
		return ;
	}
	
	var rwriterVal = $(this).siblings("p").data("rwriter") ;
			
	var pageNum = frmCmtPagingValue.find("input[name='pageNum']").val() ;
	
	var rnoVal = $(this).closest("li").data("rno") ;
	
	var comment = {bno: bnoValue ,
			       rno: rnoVal ,
			       rwriter: rwriterVal } ;
	
	myCommentClsr.removeCmtReply(
		comment,
		function(serverResult){
			alert("삭제 되었습니다.") ;
			
			showCmtList(pageNum) ;
			
		}
	
	);
	
		
});	






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
			    +  "    <img src='${contextPath}/resources/images/icon-attach.png'"
			    +  "         alt='No icon' style='height:18px; width: 18px;' />&nbsp;"
			    +       obj.fileName
			    +  "    <span data-filename='" + calledPathFileName + "' data-filetype='F'></span>"	
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
			    +  "    <span data-filename='" + thumbnailPath + "' data-filetype='I'></span>"	
			    +  "</li>" ;
		}
		
		$(".fileUploadResult").html(str);
	});

	fileUploadResult.append(str) ;
}





	
	
//모달 동작 후, 아래의 history.pushState() 동작과 popstate 이벤트 리스너에 의해 뒤로가기 방지됨.
checkModifyOperation(result);
//popstate 이벤트를 처리하는 자바스크립트 리스너 추가, popstate는 간단히 브라우저의 뒤로가기 버튼 클릭 이벤트 이름입니다.
window.addEventListener('popstate', function(event) {
	history.pushState(null, null, location.href); //뒤로가기 Block.
})
//페이지 로딩 시에, 실행되어 현재 목록페이지의 URL을 강제로 최근 URL로서 히스토리 객체에 다시 추가
history.pushState(null, null, location.href);



$(document).ready(function(){//페이지 로딩 시 함수 실행 전체 JavaScript 내용 중 제일 마지막에 위치해야 함
	 //첨부파일 정보를 가져오는 Ajax.
	 $.ajax({ 
	 type: "get",
	 url: "${contextPath}/qna/qnagetFiles/" + bnoValue,
	 success: function(fileList, status){
		 var objectList = [];

			for (var i = 0; i < $(fileList).find("List attachFileList uuid").length; i++) {
				objectList.push({
					uuid: $($(fileList).find("List attachFileList uuid").get(i)).text(),
					repoPath: "C:/myupload",
					uploadPath: $($(fileList).find("List attachFileList uploadPath").get(i)).text(), 
					fileName: $($(fileList).find("List attachFileList fileName").get(i)).text()
				});
		 }
		 console.log("첨부파일 목록 수집: " + status);
		showUploadedFiles(objectList) ;
	
		 },
			error: function(xhr, status) {
				
			}
	 }); //ajax end

$(document).on("click", "div.panel-body.form-horizontal li", function() {
         

		var fileType = $(this).attr("data-fileType");
         
		var calledPathFileName = 
            encodeURIComponent($(this).attr("data-repopath") + "/" + $(this).attr("data-uploadPath") + "/" + $(this).attr("data-uuid") + "_" + $(this).attr("data-fileName"));
                
		window.location.href = "${pageContext.request.contextPath}/fileDownloadAjax?fileName=" + calledPathFileName;

		
        
       
	}) ;
	
	showCmtList(1) ;
	
});


</script>





<%@ include file="../footer.jsp" %>


