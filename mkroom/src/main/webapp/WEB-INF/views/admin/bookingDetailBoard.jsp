<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="contextPath" value="<%=request.getContextPath() %>"/>

<%@ include file="../header.jsp" %>
	
	<style>
		.txtBoxCmt, .txtBoxComment { overflow: hidden ; resize: vertical; min-height: 100px ; color: black ; }
	</style>
	
   <!-- 상단 -->    
   <div class="hero-wrap hero-wrap-2" style="background-image: url('${contextPath}/resources/skillhunt-master/images/header-back.jpg');" data-stellar-background-ratio="0.8">
     <div class="overlay"></div>
     <div class="container">
       <div class="row no-gutters slider-text align-items-end justify-content-start">
         <div class="col-md-12 ftco-animate text-center mb-5">
           <h2 class="mb-3 bread">예약 현황</h2>
         </div>
       </div>
     </div>
   </div>
   <!-- 상단 끝-->
   
<style>
    #calendar {
        width: 100%;
        height: 600px;
        color: #151515;
    }
    .fc .fc-button:disabled {
    opacity: .7;
	}
	.fc .fc-button-primary {
    background-color: #3c0000 !important;
    border-color: #3c0000 !important;
    color: #fff;
	}
	.swiper-container {
		height:440px;
		margin-top: 20px;
		margin-bottom: 20px;
		padding-left:40px !important;
		padding-right:40px !important; 
	}
	.swiper-slide {
		text-align:center;
		display:flex;
		align-items:center;
		justify-content:center;
	}
	.swiper-slide img {
		max-width:100%;
	}
	.swiper-slide a > span {
		color: #fff !important;
		text-align: left !important;
	}
    .txtBoxCmt, .txtBoxComment { overflow: hidden ; resize: vertical; min-height: 100px ; color: black ; }
</style>
<div id="page-wrapper">
    
    <form id="bookingForm" name="bookingForm">
	    <div class="row col-lg-12">
	        <div class="board0">
	            <div class="panel panel-default" style="padding-top:100px; padding-bottom:100px; padding-left:10%; padding-right: 10%;">
	                <div class="panel-heading">
	                	<div class="row">
		                	<div class="col-md-2" style="text-align: right;">
		                		<label for="date">지점별 조회</label><br>
			              		<span id="wrapLocation">	
									<select id="selectLocation" name="locationScope" style="height: 34.8px;">
										<option value=""><c:out value="${BmanagerLocation}"/></option>
									</select>
		                		</span>
		                	</div>
		              		<div class="col-md-10">
								&nbsp;&nbsp;&nbsp;&nbsp;<label for="date">날짜별 예약 조회</label><br>
								&nbsp;&nbsp;&nbsp;&nbsp;<input type="date" id="dateSelect" name="dateSelect" value="">
							</div>
						</div>
						<div class="swiper-container">
							<div class="swiper-wrapper">
								<%--이곳에 c:foreach문을 넣으세용 --%>
								<c:forEach items="${questInfoList}" var="questInfo" varStatus="status">
									<div class="swiper-slide">
										<a class="aClass">
											<c:set var="imagePath" value='${questInfo.fileInfos[0].uploadPath += "/"
																			 += questInfo.fileInfos[0].uuid += "_" 
																			 += questInfo.fileInfos[0].fileName}'/>
											<img alt="-" style="max-width: 100%; height: 165px;" src='${contextPath += "/displayThumbnail?fileName=C:/myupload/" += imagePath}'/><br><br>
											<div style="min-width:200px; background-color: #202020; color: #fff;">
												<span><c:out value="${questInfo.questName}"/></span>
											</div>
											<c:forEach items="${questInfo.selectTime}" var="questTime" varStatus="status2">
												<div style="background-color: #606060; color: #fff !important; margin-top:10px; border-radius: 10px;">
													<span data-bl="${questInfo.branchLocation}" data-questname="${questInfo.questName}"><c:out value="${questTime}"/></span>
												</div>
											</c:forEach>
										</a>
									</div>
								</c:forEach>
							</div>
							<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
							<div class="swiper-button-prev"></div><!-- 이전 버튼 -->
						</div> <!-- questslider -->
						
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
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<link rel="stylesheet" href="${contextPath}/resources/skillhunt-master/css/swiper.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>


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
    
    
    $(".aClass div").on("click", function(e) {
    	
    	var selectTime = $(this).find("span").text();
    	var questName = $(this).find("span").data("questname").trim();
    	var branchLocation = $(this).find("span").data("bl").trim();
    	
    	bookingForm.append("<input type='hidden' name='selectTime' value='" + selectTime + "'/>");
    	bookingForm.append("<input type='hidden' name='questName' value='" + questName + "'/>");
    	bookingForm.append("<input type='hidden' name='branchLocation' value='" + branchLocation + "'/>");
    	
    	bookingForm.attr("action", "${contextPath}/admin/bookingTimeDetailBoard");
    	bookingForm.attr("method", "get");
    	bookingForm.submit();
    	
	});
    
	
    $(document).ready(function() {
    	
    	var getPagingDate = "${pagingCreator.questPagingDTO.dateScope}";
    	var splitPagingDate = getPagingDate.split("/");
    	var dateValue = splitPagingDate.join("-");
    	
    	document.getElementById('dateSelect').value = dateValue;
    });
    
    
//quest slider--------------------------------------------------------------------
  new Swiper('.swiper-container', {

  	slidesPerView : 3, // 동시에 보여줄 슬라이드 갯수
  	spaceBetween : 30, // 슬라이드간 간격
  	slidesPerGroup : 3, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음
  	touchRatio: 0,
  	// 그룹수가 맞지 않을 경우 빈칸으로 메우기
  	// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
  	loopFillGroupWithBlank : true,
	
  	loop : true, // 무한 반복
	
  	navigation : { // 네비게이션
  		nextEl : '.swiper-button-next', // 다음 버튼 클래스명
  		prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
  	},
});
</script>