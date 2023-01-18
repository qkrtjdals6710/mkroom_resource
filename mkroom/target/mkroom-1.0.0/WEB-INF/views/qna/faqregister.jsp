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
            <div class="panel panel-default">
                <div class="panel-heading">
               	<div class="row">
			<div class="form-group board1">
				<h4>FAQ 등록</h4>
					<div class="container">
						<div class="row">
							<div class="col-lg-12" >
							   	<form role="form" action="${contextPath}/qna/faqregister" method="post" name="frmBoard">
											<div class="form-group">
												<label>제목</label> 
						 							<textarea class="form-control" name="btitle" placeholder="제목 입력란" rows="1" style="width:100%; resize:none;"></textarea>
											<div class="form-group">
												<label>내용</label>
													<textarea  class="form-control" name="bcontent" rows="6" style="width:100%" placeholder="내용 입력란"></textarea>
											</div>
									
									<div class="button-group">
										<button type="submit" id="btnRegister" class="btn btn-primary"><span>작성</span></button> 
										<button type="button" id="btnToList" class="btn btn-warning" data-oper="list" onclick="location.href='${contextPath}/qna/qnalist'"><span>취소</span></button>
									</div>
								</form>
									
									</div>
								</div>
							</div>
					  	 </div>
					</div>
				</div><%-- /.panel-body --%>
            </div><%-- /.panel --%>
        </div><%-- /.col-lg-12 --%>
    </div><%-- 게시물 상태 표시 끝 /.row --%>
</div><%-- /#page-wrapper --%>


<script>


//수정된 게시물 입력값 유무 확인 함수
function sendBoard() {
	var frmBoard=document.frmBoard;

	var btitle=frmBoard.btitle.value;
	var bcontent=frmBoard.bcontent.value;


	if( (btitle.length==0 ||btitle=="") ||
		(bcontent.length==0 ||bcontent=="")){
		
		return false ;
		
	} else {
		//frmBoard.method="post";
		//frmBoard.action="${contextPath}/faq/faqregister";
		//frmBoard.submit();
		return true ;
	}
}








</script>




<%@ include file="../footer.jsp" %>


