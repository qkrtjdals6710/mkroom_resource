<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<c:set var="contextPath" value="<%=request.getContextPath() %>" />
<security:authorize access="hasRole('MEMBER')">
	<security:authentication var="principal" property="principal" />

</security:authorize>


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
.txtBoxCmt, .txtBoxComment { overflow: hidden ; resize: vertical; min-height: 100px ; color: black ; }
.questQ { color : #df723e}
.questA { color : #666}
</style>



<div id="page-wrapper">
    <div class="row col-lg-12">
        <div class="board0">
            <div class="panel panel-default">
                <div class="panel-heading">
					<div id="faq_wrap" class="faq_1 board1">
				        <section id="faq_con" >
				        <div class="container">
							<div class="row">
							    <div class="col-lg-10" style="font-size: 25px;"><h3>FAQ 자주 묻는 질문</h3></div>
							    <security:authorize access="hasRole('ADMIN')">
								  
									<div class="col-lg-2" style="text-align:right;"><%-- vertical-align: middle; --%>
										<div class="button-group">
											<button type="button" id="btnMoveNoticeRegister" class="btn btn-primary btn-sm pull-right"><span>FAQ 관리자 작성</span></button> 
										</div>
									</div>
							  	</security:authorize>
							</div>
						</div>
				        
				        <div class="button-group" style="padding-right:10px; text-align: right;">	<%-- 아래 3줄은 관리자 시큐리티 처리 --%> 
							
						</div>
				        <ol>
				       	 <c:forEach items="${faqList}" var="faq"><%-- 컨트롤러에서 보낸 목록객체 이름: qnaList --%>
				            <li>	<%-- 첫행만 펼쳐놓은 이유 : for문으로 구현하셔야되는데 어떤 구조인지 알기 쉽기 위해 --%>
				                <h3><%-- 다른행 냅둔 이유 : 게시글 데이터 넣을때 쓰시라고 --%>
				                	<a href="#none" onclick="return faq_open(this);">
				                		<p>
				                			<span class = "questQ">Q&nbsp;</span><span style="font-size:12pt;">
				                			<td><c:out value="${faq.btitle}"/></td>&nbsp;&nbsp;&nbsp;
				                				  <security:authorize access="hasRole('ADMIN')">
				                				<button type="button" class="btn btn-sm btn-danger" onclick="location.href='${contextPath}/qna/faqdetail?bno=<c:out value="${faq.bno}"/>'">상세</button></span>
				                					 </security:authorize>
				                		</p>
				                	</a>
				                </h3>
				                <div class="con_inner">
				                    <span class = "questA">A</span>
				                    <p><pre><c:out value="${faq.bcontent}"/>&nbsp;</pre></p>
				                </div>
				            </li>
				          </c:forEach>
	                    </ol>
				    </section>
    				</div>
					<div class="row">
						<div class="form-group board1">
							<div class="container">
								<div class="row">
								    <div class="col-lg-10" style="font-size: 25px;"><h3>QnA</h3></div>
									<div class="col-lg-2" style="text-align:right;"><%-- vertical-align: middle; --%>
										<div class="button-group" style="padding-right:10px; text-align: right;">
											<button type="button" id="btnMoveRegister" class="btn btn-primary btn-sm pull-right"><span>QnA 작성</span></button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div><%-- .panel-heading 끝 --%>
			
              <div class="panel-body form-horizontal">
					<div class="form-group">
						<div class="col-sm-12 board3">						  
							<div class="container-fluid">
								<div class="row">
									<div class="col-md-12">
										<div class="panel-body">
      										<form class="form-inline" id="frmSendValue" action="${contextPath}/qna/qnalist" method="get" name="frmSendValue">									
												<div class="form-group">
	 												<label class="sr-only">frmSendValues</label>
														<select class="form-control" id="selectAmount" name="rowAmountPerPage"><!-- 표시 게시물 수 선택 -->
															<option value="10" <c:out value="${pagingCreator.qnaPagingDTO.rowAmountPerPage eq '10' ? 'selected' : ''}" /> >10개</option>
															<option value="20" <c:out value="${pagingCreator.qnaPagingDTO.rowAmountPerPage eq '20' ? 'selected' : ''}" /> >20개</option>
															<option value="50" <c:out value="${pagingCreator.qnaPagingDTO.rowAmountPerPage eq '50' ? 'selected' : ''}" /> >50개</option>
															<option value="100" <c:out value="${pagingCreator.qnaPagingDTO.rowAmountPerPage eq '100' ? 'selected' : ''}" /> >100개</option>
														</select>
														<select class="form-control" id="selectScope" name="scope"><!-- 검색 범위 선택 -->
															<option value="" <c:out value="${pagingCreator.qnaPagingDTO.scope == null ? 'selected':''}" /> >검색범위</option>
															<option value="T" <c:out value="${pagingCreator.qnaPagingDTO.scope eq 'T' ? 'selected' : ''}" /> >제목</option>
															<option value="C" <c:out value="${pagingCreator.qnaPagingDTO.scope eq 'C' ? 'selected' : ''}" /> >내용</option>
															<option value="W" <c:out value="${pagingCreator.qnaPagingDTO.scope eq 'W' ? 'selected' : ''}" /> >작성자</option>
															<option value="TC" <c:out value="${pagingCreator.qnaPagingDTO.scope eq 'TC' ? 'selected' : ''}" /> >제목 + 내용</option>
															<option value="TW" <c:out value="${pagingCreator.qnaPagingDTO.scope eq 'TW' ? 'selected' : ''}" /> >제목 + 작성자</option>
															<option value="TCW" <c:out value="${pagingCreator.qnaPagingDTO.scope eq 'TCW' ? 'selected' : ''}" /> >제목 + 내용 + 작성자</option>
														</select>
  														<div class="input-group"><!-- 검색어 입력 -->
															<input class="form-control" id="inputKeyword" name="keyword" type="text" placeholder="검색어를 입력하세요"	value='<c:out value="${pagingCreator.qnaPagingDTO.keyword}" />' />
															<span class="input-group-btn"><!-- 전송버튼 -->
															<button class="btn btn-info" type="button" id="btnSearchGo">검색 &nbsp;<i class="fa fa-search"></i></button>
															</span>
														</div> 
														<div class="input-group"><!-- 검색 초기화 버튼 -->
															<button id="btnReset" class="btn btn-warning" type="reset">검색초기화</button>
														</div>
 												</div><%-- /.form-group --%>

												<input type='hidden' name='pageNum' value='${pagingCreator.qnaPagingDTO.pageNum}'> 
												<input type='hidden' name='rowAmountPerPage' value='${pagingCreator.qnaPagingDTO.rowAmountPerPage}'>
												<input type='hidden' name='lastPageNum' value='${pagingCreator.lastPageNum}'>
												<input type='hidden' name='loginUserName' value='${principal.username}'>
										</form> 	
    					
	<table class="table table-hover">	
			<thead>
				<tr style="text-align:center;">
					<th style="width:10%;">글번호</th>
					<th style="text-align:left;">제&nbsp;&nbsp;목</th>
					<th style="width:15%;">작성자</th>
					<th style="width:15%;">작성일</th>
					<th style="width:10%;" >조회수</th>
					<th style="width:15%;">관리자 답변</th>
				</tr>
			</thead>
		<tbody>
			<c:forEach items="${qnaList}" var="qna"><%-- 컨트롤러에서 보낸 목록객체 이름: qnaList --%>
				<c:choose> 
					<c:when test="${qna.bdelFlag == 0 && qna.breplyCnt == 0}">
						<tr style="text-align:center;" class="moveDetail" data-bno='<c:out value="${qna.bno}"/>' >
							<td><c:out value="${qna.bno}" /></td>
							<td style="text-align:left;"><c:out value="${qna.btitle}"/>
							<td><c:out value="${qna.bwriter}" /></td>
							<td><fmt:formatDate pattern="yyyy/MM/dd" value="${qna.bregDate}" /></td>
							<td><c:out value="${qna.bviewCnt}"/></td>
							<td>X</td>
						</tr>
					 </c:when>
	 				 <c:when test="${qna.bdelFlag == 0 && qna.breplyCnt > 0}">
						<tr style="text-align:center; background-color:#A9F5D0;" class="moveDetail" data-bno='<c:out value="${qna.bno}"/>' >
		 					<td><c:out value="${qna.bno}" /></td>
							<td style="text-align:left;" ><c:out value="${qna.btitle}"/></td>
				 			<td><c:out value="${qna.bwriter}" /></td>
						    <td><fmt:formatDate pattern="yyyy/MM/dd" value="${qna.bregDate}" /></td>
				  			<td><c:out value="${qna.bviewCnt}"/></td>
				  			<td>√</td>
						 </tr>
					 </c:when>					
					 <c:when test="${qna.bdelFlag == 1}">
						<tr style="background-color:Moccasin; text-align:center">
							<td><c:out value="${qna.bno}" /></td>
							<td colspan="5"><em>작성자에 의하여 삭제된 게시글입니다.</em></td>
						</tr>							
					 </c:when>
 	     		</c:choose>
			</c:forEach>
		</tbody>
	</table>
							

					<!-- 페이징 -->
					<div class="row mt-5">
						<div class="col text-center">
							<div class="block-27">
								<ul>
									<c:if test="${pagingCreator.prev}">
									<li class="paginate_button previous"><a href="1">&laquo;</a></li>
									</c:if>
									<%-- 화면에 보이는 시작 번호가 1보다 크면 true. --%>
									<c:if test="${pagingCreator.prev}">
										<li class="paginate_button previous"><a href="${pagingCreator.startPagingNum - 1}">이전</a></li>
									</c:if>
									<%-- 번호 표시 반복 추가. 시작페이징 번호부터 끝 페이징 번호 까지 긁는다. --%>
									<c:forEach var="pageNum" begin="${pagingCreator.startPagingNum }"
										end="${pagingCreator.endPagingNum }">
										
										<%-- 현재 페이지 번호인 pageNum에 for 문자를 순차로 대입하여 li를 생성. 눌러서 페이지 갱신했을 때 번호와 같으면 active로 표시 아니면 그대로. --%>
										<li class='paginate_button ${pagingCreator.qnaPagingDTO.pageNum == pageNum ? "active" : "" }'>
											<a href="${pageNum}">${pageNum}</a>
										</li>
									</c:forEach>
									<%-- 화면에 보이는 끝 번호가 마지막 페이지 번호보다 작으면 true. --%>
									<c:if test="${pagingCreator.next }">
										<li class="paginate_button next"><a href="${pagingCreator.endPagingNum + 1} ">다음</a></li>
									</c:if>
									<c:if test="${pagingCreator.next }">
										<li class="paginate_button next"><a href="${pagingCreator.lastPageNum} ">&raquo;</a></li>
									</c:if>
								</ul>
							</div>	
						</div>
					</div><!-- 페이징 끝 -->	
	
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
	 			
	 				
			 							</div>	
									</div>		
								</div>
							</div><%-- /.panel-body form-horizontal --%>
						</div><%-- /.form-group --%>
					</div><%-- /.panel-body --%>
		 		</div><%-- /.panel --%>
			 </div><%-- /.col-lg-12 --%>
		 </div><%-- /.row --%>
	</div> 
</div><%-- /#page-wrapper --%>




<script>


$("#btnMoveRegister").on("click", function(){
	var userId = '<c:out value="${principal.username}"></c:out>';
	location.href = "${contextPath}/qna/qnaregister?userId=" + userId;
})

$("#btnMoveNoticeRegister").on("click", function(){
	location.href = "${contextPath}/qna/faqregister";
})


var frmSendValue = $("#frmSendValue");	

$(".moveDetail").on( "click", function(e) {
	 frmSendValue.append("<input type='hidden' name='bno' value='" + $(this).data("bno") + "'/>");
	 /* frmSendValue.append('<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />'); */
	 frmSendValue.attr("action", "${contextPath}/qna/qnadetail");
	 frmSendValue.attr("method", "get");
	 frmSendValue.submit();
});

var frmNoticeSendValue = $("#frmNoticeSendValue");

$("#faqList tr").on( "click", function(e) {
	frmNoticeSendValue.append("<input type='hidden' name='noticebno' value='" + $(this).data("noticebno") + "'/>");
// 	frmNoticeSendValue.append('<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />');
	frmNoticeSendValue.attr("action", "${contextPath}/qna/faqdetail");
	frmNoticeSendValue.attr("method", "get");
	frmNoticeSendValue.submit();
});


	
var result = '<c:out value="${result}" />' ;

function checkModal(result) {
	if (result === ''|| history.state) {
		return;
		
	} else if(result === 'successRemove'){
		var myMsg = "글이 삭제되었습니다";
		
	} else if (parseInt(result) > 0) {
		var myMsg = "게시글 " + parseInt(result) + " 번이 등록되었습니다.";
		
	}
	
	$(".modal-body").html(myMsg) ;
	$("#yourModal").modal("show");
	
	myMsg='';
}
	

//checkModal(result);


$(".paginate_button a").on("click", function(e) {
	e.preventDefault() ;
	
	frmSendValue.find("input[name='pageNum']").val($(this).attr("href")) ; 
	frmSendValue.attr("action", "${contextPath}/qna/qnalist") ;
	frmSendValue.attr("method", "get") ;
	frmSendValue.submit() ;
	
});


<%--표시행수 변경 이벤트 처리--%>
$("#selectAmount").on("change", function(){
	frmSendValue.find("input[name='pageNum']").val(1) ;
	frmSendValue.attr("action","${contextPath}/qna/qnalist") ;
	frmSendValue.attr("method", "get");
	frmSendValue.submit();
});









<%--검색버튼 클릭 이벤트 처리 --%>
$("#btnSearchGo").on("click", function(e){
	if(!$("#selectScope").find("option:selected").val()) {
		alert("검색 범위를 선택하세요.");
		return false ;
	}
	
	if(      !( (frmSendValue.find("input[name='keyword']").val())  ||
			    (frmSendValue.find("input[name='keyword']").val() !="") )    ){
		alert("검색어를 입력하세요.") ;
		return false ;
	}
	
	frmSendValue.find("input[name='pageNum']").val(1) ;
	frmSendValue.submit() ;
	
});


<%--검색초기화 버튼 이벤트처리, 버튼 초기화 시, 1페이지에 목록 정보 다시 표시 --%>
$("#btnReset").on("click", function(){
	
	$("#selectAmount").val(10);
	$("#selectScope").val("");
	$("#inputKeyword").val("");
	$("#pageNum").val(1);
	
	frmSendValue.submit();
	
});





$(document).ready(function(){
	//모달 동작 후, 아래의 history.pushState() 동작과 popstate 이벤트 리스너에 의해 뒤로가기 방지됨.
	checkModal(result);
	//popstate 이벤트를 처리하는 자바스크립트 리스너 추가, popstate는 간단히 브라우저의 뒤로가기 버튼 클릭 이벤트 이름입니다.
	window.addEventListener('popstate', function(event) {
		history.pushState(null, null, location.href); //뒤로가기 Block.
	})
	//페이지 로딩 시에, 실행되어 현재 목록페이지의 URL을 강제로 최근 URL로서 히스토리 객체에 다시 추가
	history.pushState(null, null, location.href);
});


//faq
function faq_open(el){
    var $con = $(el).closest("li").find(".con_inner");
    if($con.is(":visible")) {
        $con.slideUp();
    } else {
        $("#faq_con .con_inner:visible").css("display", "none");
        $con.slideDown();
    }
    return false;
}

</script>







<%@ include file="../footer.jsp" %>
        
        
