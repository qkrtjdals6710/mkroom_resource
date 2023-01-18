<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="contextPath" value="<%=request.getContextPath() %>" />

<%@ include file="../myinclude/testheader.jsp" %>

<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header">Q&A 게시판</h3>
        </div><%-- /.col-lg-12 --%>
    </div><%-- /.row --%>
    
    
    
    <c:forEach items="${qnaNoticeList}" var="qnaNotice"><%-- 컨트롤러에서 보낸 목록객체 이름: qnaList --%>
	

	
	<tr class="moveDetail" data-bno='<c:out value="${qnaNotice.bno}"/>' >
		 <td><c:out value="${qnaNotice.bno}" /></td>
			 <td style="text-align:left;" ><c:out value="${qnaNotice.btitle}"/>
			 </td>
		 <td><fmt:formatDate pattern="yyyy/MM/dd" value="${qnaNotice.bregDate}" /><br></td>
	 </tr>
	
	 

	
	 
	</c:forEach>
    
    
    
    
    
    
    
    
    
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading"><!-- <h4>게시물 목록</h4>  -->
             	   
                    
                    <div class="row">
						<div class="col-md-6" style="font-size:20px; height: 45px; padding-top:10px;">게시글 목록</div>
						<div class="col-md-6" style="padding-top:8px;">
							<button type="button" id="btnMoveRegister" class="btn btn-primary btn-sm pull-right">새글 등록</button>
						</div>
					</div>
				</div><%-- /.panel-heading --%>	
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
 <input class="form-control" id="inputKeyword" name="keyword" type="text" placeholder="검색어를 입력하세요"
 value='<c:out value="${pagingCreator.qnaPagingDTO.keyword}" />' />
 <span class="input-group-btn"><!-- 전송버튼 -->
 <button class="btn btn-info" type="button" id="btnSearchGo">
 검색 &nbsp;<i class="fa fa-search"></i>
 </button>
 </span>
 </div>
 
 <div class="input-group"><!-- 검색 초기화 버튼 -->
 <button id="btnReset" class="btn btn-warning" type="reset">검색초기화</button>
 </div>
 </div><%-- /.form-group --%>

	     <input type='hidden' name='pageNum' value='${pagingCreator.qnaPagingDTO.pageNum}'> 
		 <input type='hidden' name='rowAmountPerPage' value='${pagingCreator.qnaPagingDTO.rowAmountPerPage}'>
		 <input type='hidden' name='lastPageNum' value='${pagingCreator.lastPageNum}'>
		 	
	
	</form>          
    
    

                
<table class="table table-striped table-bordered table-hover" style="width:100%;text-align:center;" >
<thead>
	<tr>
		<th style="text-align:center;">번호</th>
		<th style="text-align:center;">제목</th>
		<th style="text-align:center;">작성자</th>
		<th style="text-align:center;">작성일</th>
		<th style="text-align:center;">조회수</th>
	</tr>
</thead>
<tbody>

</tbody>
	<c:forEach items="${qnaList}" var="qna"><%-- 컨트롤러에서 보낸 목록객체 이름: qnaList --%>
	
	<c:choose> 
	<c:when test="${qna.bdelFlag == 0 && qna.breplyCnt == 0}">
	<tr class="moveDetail" data-bno='<c:out value="${qna.bno}"/>' >
		 <td><c:out value="${qna.bno}" /></td>
			 <td style="text-align:left;" ><c:out value="${qna.btitle}"/>
			 <small>[댓글수: <strong><c:out value="${qna.breplyCnt }"/></strong>]</small>
			 </td>
				 <td><c:out value="${qna.bwriter}" /></td>
					 <td><fmt:formatDate pattern="yyyy/MM/dd" value="${qna.bregDate}" /><br></td>
				  <td><c:out value="${qna.bviewCnt}"/></td>
	 </tr>
	 </c:when>
	 
	 <c:when test="${qna.bdelFlag == 0 && qna.breplyCnt > 0}">
	<tr class="moveDetail" style="background-color:yellow;" data-bno='<c:out value="${qna.bno}"/>' >
		 <td ><c:out value="${qna.bno}" /></td>
			 <td style="text-align:left;" ><c:out value="${qna.btitle}"/>
			 <small>[댓글수: <strong><c:out value="${qna.breplyCnt }"/></strong>]</small>
			 </td>
				 <td ><c:out value="${qna.bwriter}" /></td>
					 <td ><fmt:formatDate pattern="yyyy/MM/dd" value="${qna.bregDate}" /><br></td>
				  <td ><c:out value="${qna.bviewCnt}"/></td>
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
	 				</table><%-- /.table-responsive --%>
	 				
	 <%-- Pagination 시작 --%>
		<div class='pull-right'> 
		 <ul class="pagination pagination-sm">
			 <%-- 페이징 버튼 클릭 시, jQuery로 페이지 번호를 전달하도록 a 태그에 전달된 pagingCreator 객체의 필드 지정 --%>
			 <c:if test="${pagingCreator.prev}">
				 <li class="paginate_button previous">
				 	<a href="1">&laquo;</a><%-- 맨 앞으로 페이지로 이동 --%>
				 </li>
			 </c:if>
			 <c:if test="${pagingCreator.prev}">
				 <li class="paginate_button previous">
					 <a href="${pagingCreator.startPagingNum - 1}">이전</a><%-- 이전 페이징 그룹 끝 페이지로 이동 --%>
				 </li>
			 </c:if>
			 <%-- 페이징 그룹의 페이징 숫자(10개 표시) --%>
			 <c:forEach var="pageNum" begin="${pagingCreator.startPagingNum}" end="${pagingCreator.endPagingNum}">
			 <%-- 선택된 숫자의 경우, Bootstrap의 active 클래스 이름 추가 --%>
				 <li class='paginate_button ${pagingCreator.qnaPagingDTO.pageNum == pageNum ? "active":"" }'>
				 <a href="${pageNum}">${pageNum}</a>
				 </li>
			 </c:forEach>
			 <c:if test="${pagingCreator.next}">
				 <li class="paginate_button next">
				 <a href="${pagingCreator.endPagingNum +1}">다음</a><%-- 다음 페이징 그룹의 첫 페이지로 이동 --%>
						 </li>
		 	</c:if>
    		<c:if test="${pagingCreator.next}">
				 <li class="paginate_button next">
				 <a href="${pagingCreator.lastPageNum}">&raquo;</a><%-- 맨 마지막으로 페이지로 이동 --%>
				 </li>
			</c:if>
		 </ul>
		</div><%-- Pagination 끝 --%>				
	 				
	 				
	 				
	
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
	 				

	 			</div><%-- /.panel-body --%>
	 		</div><%-- /.panel --%>
		 </div><%-- /.col-lg-12 --%>
	 </div><%-- /.row --%>
</div><%-- /#page-wrapper --%>




<script>

	


	$("#btnMoveRegister").on("click", function(){
		location.href = "${contextPath}/qna/qnaregister";
	})
	

	var frmSendValue = $("#frmSendValue");	
	
	$(".moveDetail").on( "click", function(e) {
		 frmSendValue.append("<input type='hidden' name='bno' value='" + $(this).data("bno") + "'/>");
		 frmSendValue.attr("action", "${contextPath}/qna/qnadetail");
		 frmSendValue.attr("method", "get");
		 frmSendValue.submit();
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
	alert("선택된 페이지: " + frmSendValue.find("input[name='pageNum']").val()) ; 
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



</script>







<%@ include file="../myinclude/testfooter.jsp" %>
        
        
