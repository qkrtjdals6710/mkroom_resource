<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="contextPath" value="<%=request.getContextPath()%>" />

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
								    <div class="col-lg-10" style="font-size: 25px;">제목 - <c:out value="${faq.btitle }"/></div>
									<div class="col-lg-2" style="text-align:right;"><%-- vertical-align: middle; --%>
											<button type="button" id="btnToModify" data-oper="modify" class="btn btn-primary"><span>수정</span></button> 
											<button type="button" id="btnToList" class="btn btn-warning" data-oper="list" onclick="location.href='${contextPath}/qna/qnalist'"><span>목록</span></button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-12 board2">
						<span class="text-primary" style="font-size: smaller;">
								글번호:&nbsp;<strong><c:out value="${faq.bno}"/></strong>&nbsp;&nbsp;
						</span>
					</div>
				</div><%-- .panel-heading 끝 --%>
	                <div class="panel-body form-horizontal">
						<div class="form-group">
							<div class="col-sm-12 board3">						  
							<h5>내용</h5>
								<p class="form-control" rows="3" name="bcontent" >
									<c:out value="${faq.bcontent}" />
								</p>
							</div>
						</div>
					</div>	
				<%-- /.panel --%>
		</div>
		<%-- /.col-lg-12 --%>
	</div>
	<%-- 게시물 상태 표시 끝 /.row --%>
	
</div><%-- /#page-wrapper --%>


<form id="frm">
	<input type="hidden" name="bno" id="bno" value='<c:out value="${faq.bno }"/>' />
	</form>



<script type="text/javascript">

	//게시물 수정 페이지로 이동
	$("#btnToModify").on("click", function(){
	 
	 var frm = $("#frm");
	 frm.attr("action", "${contextPath}/qna/faqmodify");
	 frm.attr("method", "GET");		 

	 frm.submit();
	})



</script>





<%@ include file="../footer.jsp" %>


