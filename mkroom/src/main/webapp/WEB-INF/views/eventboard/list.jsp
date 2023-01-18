<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>    



<%@ include file="../header.jsp" %>
<style>
	a p{
	border-bottom : none !important;
	}
</style>
	<%-- 상단 --%>    
    <div class="hero-wrap hero-wrap-2" style="background-image: url('${contextPath}/resources/images/header-back.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-start">
          <div class="col-md-12 ftco-animate text-center mb-5">
            <h2 class="mb-3 bread">공지 / 이벤트</h2>
          </div>                
        </div>
      </div>			
    </div>
	<%-- 상단 끝--%>
	
	
	<%--페이징 값 보냄 --%>
	<form class="form-inline" id="frmSendValue" name="frmSendValue" action="${contextPath}/eventboard/list" method="get">
		<input type="hidden" name="pageNum" id="pageNum" value="${pagingCreator.eventBoardPagingDTO.pageNum }"/>
		<input type="hidden" name="rowAmountPerPage" id="rowAmountPerPage"  value="${pagingCreator.eventBoardPagingDTO.rowAmountPerPage }"/>
		<input type="hidden" name="lastPageNum" id="lastPageNum" value="${pagingCreator.lastPageNum }"/>
	</form>
	

								 
	<%-- 이벤트 게시물 영역 --%>
	<section class="ftco-section" >
		<div class="board0">
			<div class="panel">
			
			<%--어드민 권한만 등록가능 --%>
			<security:authorize access="hasAnyRole('ADMIN', 'BMANAGER')">
				<div style="padding-top:10px; padding-left:30px; padding-right:30px; text-align: right;">
					<button type="button" id="btnMoveRegister" class="btn btn-danger pull-right">새 글 등록</button>
				</div>
			</security:authorize>
			<%--어드민 권한만 등록가능 --%>
				
				<%--게시물 리스트 표시 영역 --%>
				<div class="container">
					<div class="row d-flex justify-content-start">
														
						<%--게시글들의 파일 정보를 가져와서 포문돌림--%>	
						<c:forEach items="${eventBoardList}" var="eventboard" varStatus="eventStatus">
							
								 						 					
							<div class="col-md-4 ftco-animate">
								<div class="blog-entry">
									<a href="${contextPath}/eventboard/detail?bno=${eventboard.bno}">
										<!-- 이미지 -->
									 	<c:if test="${eventboard.fileInfos[0] eq null}">
									 		<img style="max-width:100%; height: 217px;" src="${contextPath}/resources/image/error.png" alt="이미지가 없습니다."><br>
									 	</c:if>
									 	<c:if test="${eventboard.fileInfos[0] ne null}">
									 	<c:set var="imagePath" value='${ contextPath			+= "/displayThumbnail?fileName=C:/myupload/"
 	 														 += eventboard.fileInfos[0].uploadPath 	+= "/" 
									 						 += eventboard.fileInfos[0].uuid 		+= "_"  
 									 						 += eventboard.fileInfos[0].fileName }'/>	
									 		<img style="max-width:100%; height: 217px;" src='${imagePath}' alt="이미지가 없습니다."/><br>
									 	</c:if>
										<small>
											No.<c:out value="${eventboard.bno}" />&nbsp;<fmt:formatDate pattern="yyyy/MM/dd" value="${eventboard.bregDate}" />&nbsp;&nbsp;조회:<c:out value="${eventboard.bviewCnt}" /><br>			
										</small>
										
										<%--bdelFlag가 0이면 진행중 이벤트로 타이틀 표시 --%>
										<c:if test="${eventboard.bdelFlag==0}">
											<c:out value="${eventboard.btitle }" /><small>(<c:out value="${eventboard.breplyCnt }" />)</small>
										</c:if>
										<%--bdelFlag가 1이면 종료된 이벤트로 타이틀 표시 --%>				
										<c:if test="${eventboard.bdelFlag==1}">				
											<p style="color: red !important; ">종료된 이벤트 입니다.</p>
										</c:if>
											
									</a>
								</div>
							</div>
				        	
						</c:forEach>			
					</div>				
		    	</div>
		    	<%--게시물 표시 영역 끝 --%>
		    		    	
			    <%-- 이벤트 게시판 페이징 --%>
				<div class="row mt-5">
					<div class="col text-center">
						<div class="block-27">
							<ul>
								<c:if test="${pagingCreator.prev}">
									<li class="paginate_button previous"><a href="1">&laquo;</a></li>
								</c:if>
			
								<c:if test="${pagingCreator.prev}">
									<li class="paginate_button previous"><a href="${pagingCreator.startPagingNum - 1}">이전</a></li>
								</c:if>
								
								<c:forEach var="pageNum" begin="${pagingCreator.startPagingNum}"
									end="${pagingCreator.endPagingNum}">
									<li class='paginate_button ${pagingCreator.eventBoardPagingDTO.pageNum == pageNum ? "active" : ""}'>
										<a href="${pageNum}">${pageNum}</a>
									</li>
								</c:forEach>
								
								<c:if test="${pagingCreator.next}">
									<li class="paginate_button next"><a href="${pagingCreator.endPagingNum + 1}">다음</a></li>
								</c:if>
								
								<c:if test="${pagingCreator.next}">
									<li class="paginate_button next"><a href="${pagingCreator.lastPageNum}">&raquo;</a></li>
								</c:if>
							</ul>
						</div>	
					</div>
				</div>
				<%-- 이벤트 게시판 페이징 끝--%>
				
			</div><%--board1 --%>
		</div><%--board0 --%>
	</section><%-- 이벤트 게시물 영역 끝--%>



<script type="text/javascript" src="${contextPath }/resources/js/mycomment.js"></script>
<script>

$("#btnMoveRegister").on("click", function() {
	location.href = "${contextPath}/eventboard/register";
});

<%--게시물 행(제목) 클릭 이벤트 처리: 게시물 상세 화면 이동//////////////////////////////// --%>
var frmSendValue = $("#frmSendValue");

<%--tr 태그 클릭 시 form의 데이터를 전달하고 detail 화면 요청 --%>
$(".moveDetail").on( "click", function(e) {
	<%-- bno 값이 값이 설정된 hidden 유형의 input 요소를 form에 추가 --%>
	<%-- tr 태그의 data-bno 속성의 값을 data() 함수로 값을 읽어와 value 속성에 지정 --%>
	frmSendValue.append("<input type='hidden' name='bno' value='" + $(this).data("bno") + "'/>");
	frmSendValue.attr("action", "${contextPath}/eventboard/detail");<%-- form에 action 속성 지정 --%>
	frmSendValue.attr("method", "get");<%-- form에 method 속성 지정 --%>
	frmSendValue.submit();<%-- form 전송 --%>
});



<%-- 페이징 버튼 --%>
$(".paginate_button a").on("click", function(e) {
	e.preventDefault() ;
	
	frmSendValue.find("input[name='pageNum']").val($(this).attr("href")) ; 
	frmSendValue.attr("action", "${contextPath}/eventboard/list") ;
	frmSendValue.attr("method", "get") ;
	frmSendValue.submit() ;
	
});


<%--표시행수 변경 이벤트 처리--%>
$("#selectAmount").on("change", function(){
	frmSendValue.find("input[name='pageNum']").val(1) ;
	frmSendValue.attr("action","${contextPath}/eventboard/list") ;
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



</script>

<%@ include file="../footer.jsp" %>
