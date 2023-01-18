<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>    



<%@ include file="../header.jsp" %>

	<form class="form-inline" id="frmSendValue" name="frmSendValue" action="${contextPath}/eventboard/list" method="get">
		<input type="hidden" name="pageNum" id="pageNum" value="${pagingCreator.eventBoardPagingDTO.pageNum }"/>
		<input type="hidden" name="rowAmountPerPage" id="rowAmountPerPage"  value="${pagingCreator.eventBoardPagingDTO.rowAmountPerPage }"/>
		<input type="hidden" name="lastPageNum" id="lastPageNum" value="${pagingCreator.lastPageNum }"/>
	</form>

	<!-- 상단 -->    
    <div class="hero-wrap hero-wrap-2" style="background-image: url('${contextPath}/resources/images/bg_1.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-start">
          <div class="col-md-12 ftco-animate text-center mb-5">
            <h1 class="mb-3 bread">이벤트 안내</h1>
          </div>                
        </div>
      </div>			
    </div>
	<!-- 상단 끝-->

	<!-- 이벤트 게시물 표시 영역 -->
	<section class="ftco-section" >
		<div class="board0">
			<div class="panel">
				<div style="padding-top:10px; padding-left:30px; padding-right:30px; text-align: right;">
					<button type="button" id="btnMoveRegister" class="btn btn-danger pull-right">새 글 등록</button>
				</div>
				<div class="container">
					<div class="row d-flex justify-content-start">
						<c:forEach items="${eventBoardList}" var="eventboard">
							<%--bdelFlag가 1이면 종료된 이벤트로 표시 --%>
							<c:if test="${eventboard.bdelFlag==0}">
								<div class="col-md-4 ftco-animate">
									<div class="blog-entry ">
										<a href="${contextPath}/eventboard/detail?bno=${eventboard.bno}" class="block-20" style="background-image: url('${contextPath}/resources/images/image_1.jpg');"></a>
										<a href="${contextPath}/eventboard/detail?bno=${eventboard.bno}">
											<small>No.<c:out value="${eventboard.bno}" /> 작성일:<fmt:formatDate pattern="yyyy/MM/dd" value="${eventboard.bregDate}" />&nbsp;&nbsp;조회수:<c:out value="${eventboard.bviewCnt}" /></small><br>
											 <span><c:out value="${eventboard.btitle }" /> <small>댓글(<c:out value="${eventboard.breplyCnt }" />)</small></span>
										</a>
									</div>
								</div>
							</c:if>
							<%--bdelFlag가 1이면 종료된 이벤트로 표시 --%>
					        <c:if test="${eventboard.bdelFlag==1}">
					          <div class="col-md-4 ftco-animate">
					            <div class="blog-entry ">
					            	<a href="${contextPath}/eventboard/detail?bno=${eventboard.bno}" class="block-20" style="background-image: url('${contextPath}/resources/images/image_1.jpg');"></a>                       	       		
					              	<small>No.<c:out value="${eventboard.bno}"/> 작성일:<fmt:formatDate pattern="yyyy/MM/dd" value="${eventboard.bregDate}"/>&nbsp;&nbsp;조회수: <c:out value="${eventboard.bviewCnt}"/></small>                    
					                <p style="color: red;">종료된 이벤트 입니다.</p>     
					            </div>
					          </div>
				        	</c:if>
						</c:forEach>
					</div>
		    	</div>
			    <!-- 이벤트 게시판 페이징 -->
				<div class="row mt-5">
					<div class="col text-center">
						<div class="block-27">
							<ul>
								<c:if test="${pagingCreator.prev }">
									<li class="paginate_button previous"><a href="1">&laquo;</a></li>
								</c:if>
			
								<c:if test="${pagingCreator.prev }">
									<li class="paginate_button previous"><a href="${pagingCreator.startPagingNum - 1}">이전</a></li>
								</c:if>
								<c:forEach var="pageNum" begin="${pagingCreator.startPagingNum }"
									end="${pagingCreator.endPagingNum }">
									<li class='paginate_button ${pagingCreator.eventBoardPagingDTO.pageNum == pageNum ? "active" : "" }'>
										<a href="${pageNum}">${pageNum}</a>
									</li>
								</c:forEach>
								<c:if test="${pagingCreator.next }">
									<li class="paginate_button next"><a href="${pagingCreator.endPagingNum + 1} ">다음</a></li>
								</c:if>
								<c:if test="${pagingCreator.next }">
									<li class="paginate_button next"><a href="${pagingCreator.lastPageNum} ">&raquo;</a></li>
								</c:if>
							</ul>
						</div>	
					</div>
				</div><!-- 이벤트 게시판 페이징 끝 -->
			</div><%--board1 --%>
		</div><%--board0 --%>
	</section><!-- 이벤트 게시물 표시 영역 끝 -->



<script type="text/javascript" src="${contextPath }/resources/js/mycomment.js"></script>


<script>

$("#btnMoveRegister").on("click", function() {
	//아래에서 self는 window 객체를 의미합니다.
	//self.location.href = "${contextPath}/myboard/register" ;
	location.href = "${contextPath}/eventboard/register";
	//self.location = "${contextPath}/myboard/register" ;
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
	//alert("선택된 페이지: " + frmSendValue.find("input[name='pageNum']").val()) ; 
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


		
<%@ include file="../footer.jsp" %>
