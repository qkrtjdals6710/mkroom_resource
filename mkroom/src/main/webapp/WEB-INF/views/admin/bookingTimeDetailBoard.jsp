<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="contextPath" value="<%=request.getContextPath() %>"/>

<%@ include file="../header.jsp" %>
	
   <!-- 상단 -->    
   <div class="hero-wrap hero-wrap-2" style="background-image: url('${contextPath}/resources/skillhunt-master/images/header-back.jpg');" data-stellar-background-ratio="0.8">
     <div class="overlay"></div>
     <div class="container">
       <div class="row no-gutters slider-text align-items-end justify-content-start">
         <div class="col-md-12 ftco-animate text-center mb-5">
           <h2 class="mb-3 bread">예약 현황 / 시간</h2>
         </div>
       </div>
     </div>
   </div>
   <!-- 상단 끝-->

<div id="page-wrapper">  
    <form id="bookingForm" name="bookingForm">
	    <div class="row col-lg-12">
	        <div class="board0">
	            <div class="panel panel-default" style="padding-top:100px; padding-bottom:100px; padding-left:10%; padding-right: 10%;">
	                <div class="panel-heading">
	                	<div class="col-md-4">
						</div>
						<div class="col-md-4">
							<div class="card bg-default">
								<h5 class="card-header">
									<div>예약 상세 조회</div>
								</h5>
								<div class="card-body">
									<p class="card-text">
										<div>예약 장소: <c:out value="${bookingInfo.branchLocation}"/></div>
										<div>예약 시간: <c:out value="${getDate}"/></div>
				              			<div>예약 인원: <c:out value="${bookingInfo.teamMember}"/></div>
				              			<div>예약자 이름: <c:out value="${bookingInfo.userId}"/></div>
				              			<div>결제 imp: <c:out value="${paymentInfo.impuId}"/></div>
				              			<div>결제 가격: <c:out value="${paymentInfo.AMOUNT}"/></div>
				              			<div>결제 날짜: <c:out value="${paymentInfo.PAIDAT}"/></div>
									</p>
								</div>
							</div>
						</div>
						<div class="col-md-4">
						</div>

						
					</div>
				</div>
			</div>
		</div>
	

	</form>
</div>





  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">
    <div class="copyright">
      &copy; Copyright <strong><span>NiceAdmin</span></strong>. All Rights Reserved
    </div>
    <div class="credits">
      <!-- All the links in the footer should remain intact. -->
      <!-- You can delete the links only if you purchased the pro version. -->
      <!-- Licensing information: https://bootstrapmade.com/license/ -->
      <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
      Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
    </div>
  </footer><!-- End Footer -->


<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>


<script>
    
    var bookingForm = $("#bookingForm");
    
	<%-- 분점 선택 이벤트 처리--%>
	$("#wrapLocation").on("change", "#selectLocation", function() {
		bookingForm.attr("action", "${contextPath}/admin/bookingDetailBoard");
		bookingForm.attr("method", "get");
		bookingForm.submit();
	});
    
    
    //현재 날짜 가져오기. ISO 형식: yyyy-MM-ddThh:mm:ss.sssZ 으로 받아오고 앞의 8+2 자리 가져오기. 
	//document.getElementById('dateSelect').value = new Date().toISOString().substring(0, 10);

	
    $("#dateSelect").on("change", function() {
		
    	var dateValue = $("#dateSelect").val();
    	var splitDateValue = dateValue.split("-");
    	var date = splitDateValue.join("/");
    	var bookingForm = $("#bookingForm");
		
    	bookingForm.append("<input type='hidden' name='dateScope' value='" + date + "'/>");
    	
    	bookingForm.attr("action", "${contextPath}/admin/bookingDetailBoard");
    	bookingForm.attr("method", "get");
    	bookingForm.submit();
    	
	});
    
	
//     $(document).ready(function() {
    	
		
//     });
    
</script>