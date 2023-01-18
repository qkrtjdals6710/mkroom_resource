<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="contextPath" value="<%=request.getContextPath() %>" />

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
</style>

<div id="page-wrapper">
	<div class="row col-lg-12">
        <div class="board0">
	        <form id="frmModify" method="post">
	            <div class="panel panel-default">
	                <div class="panel-heading">
	
	
							<input type="hidden" name="bno" value='<c:out value="${faq.bno}"/>'>
						
						<div class="row">
							
							<div class="form-group board1">
								<div class="container">
									<div class="row">
									    <div class="col-lg-10" >
								  			      <label>제목</label>
								    <textarea name="btitle" placeholder="제목 입력란" rows="1" style="width:100%; resize:none;"><c:out value="${faq.btitle}"/></textarea>
												    </div>
									<div class="col-lg-2" style="text-align:right;"><%-- vertical-align: middle; --%>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div><%-- .panel-heading 끝 --%>
	
	
				  <div class="panel-body form-horizontal">
						<div class="form-group">
							<div class="col-sm-12 board3">
											  
							<label>글내용</label>
								<textarea class="form-control" name="bcontent" rows="3"  rows="6" style="width:100%" placeholder="내용 입력란"
								><c:out value="${faq.bcontent}" /></textarea>
						
								<br><br>					
						
	
				<br>
				<div class="faqBtn">
				<button type="button" class="btn btn-primary" id="btnModify" data-oper="modify" ><span>수정</span></button> 
				<button type="button" class="btn btn-danger" id="btnRemove" data-oper="remove">삭제</button>
				<button type="button" class="btn btn-info" id="btnList"	data-oper="list">취소</button>
				</div>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		
							
	
							</div>
						</div>
					</div><%-- /.panel-body --%>
	            </div><%-- /.panel --%>
			</form>
		</div><%-- /.col-lg-12 --%>
	</div><%-- 게시물 상태 표시 끝 /.row --%>
</div><%-- /#page-wrapper --%>





<script>



//기존 내용 삭제 후, 아래의 내용 추가 작성(오타, 대소문자 주의!!!)
//form의 수정/삭제/목록보기 버튼 클릭 이벤트 처리
var frmModify = $("#frmModify");

$('.faqBtn').on("click","button", function(e){
	//e.preventDefault(); //버튼 유형이 submit가 아니므로 설정할 필요 없음
	var operation = $(this).data("oper"); //각 버튼의 data-xxx 속성에 설정된 값을 저장
	//alert("operation: "+ operation);
	
	if(operation == "modify"){ //게시물 수정 요청

	  frmModify.attr("action", "${contextPath}/qna/faqmodify");

	} else if(operation == "remove"){ //게시물 삭제 요청
		
		frmModify.attr("action", "${contextPath}/qna/faqdelete");

	} else if(operation == "list"){ //게시물 목록 화면 요청
		
	
	    
	    frmModify.empty();
	    
		frmModify.attr("action", "${contextPath}/qna/qnalist").attr("method","get");
		

		
	}
	
	frmModify.submit() ; //요청 전송
});



</script>






<%@ include file="../footer.jsp" %>
