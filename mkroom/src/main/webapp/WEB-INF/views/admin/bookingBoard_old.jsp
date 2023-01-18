<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- <c:set var="contextPath" value="<%=request.getContextPath() %>"/> --%>

<%@ include file="../header.jsp" %>

   <!-- 상단 -->    
   <div class="hero-wrap hero-wrap-2" style="background-image: url('${contextPath}/resources/skillhunt-master/images/header-back.jpg');" data-stellar-background-ratio="0.8">
     <div class="overlay"></div>
     <div class="container">
       <div class="row no-gutters slider-text align-items-end justify-content-start">
         <div class="col-md-12 ftco-animate text-center mb-5">
           <h2 class="mb-3 bread">예약 상세 조회</h2>
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
    .txtBoxCmt, .txtBoxComment { overflow: hidden ; resize: vertical; min-height: 100px ; color: black ; }
</style>
<div id="page-wrapper">
    <div class="row col-lg-12">
        <div class="board0">
            <div class="panel panel-default" style="padding-top:100px; padding-bottom:100px; padding-left:10%; padding-right: 10%;">
                <div class="panel-heading">
					<div class="container">
						<div class="row">
						    <div class="col-lg-12" style="padding-right:20px; height: 600px;">
						    	<div id="calendar"></div>
						    </div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- jQuery CDN -->
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<!-- ref: https://fullcalendar.io/docs/initialize-globals -->
<!-- fullcalendar CDN -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.0.2/index.global.min.js"></script>
<script src="fullcalendar/lib/locales-all.js"></script>
<script>

// 	var a = $('table[role="presentation"]');
// 	alert(a);
	
	
// 	$("#calendar").on('click', 'tr td div div a', function(e){
	    
// 		var date2 = $(this).val();
// 		//var date = $(e).add('div a').css( 'color', 'red' );
	    
// 	    alert(date2);
	    
// 	});


    function clickCalendarEvent(calendar) {
        
        calendar.on('dateClick', function(e) {
        	
//         	frmSendValue.attr("action", "${contextPath}/quest/modify");
//         	frmSendValue.attr("method", "get") ;
//         	frmSendValue.submit() ;
	            var d1 = e.dateStr;
	            
	            alert(d1);
	            
        });

    }
    
    
    $(document).ready(function() {

        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          	locale:"ko",
        	initialView: 'dayGridMonth'

        });
        calendar.render();
        clickCalendarEvent(calendar);
        
    });
    
    /* 
            	dateClick: function(e) {
        		
        		//월자 가져오기 
        		//만들어진 부분에서 일자 써있는 부분이 <td> 안의 <div> 안의 <div> 안의 <a> 내용임. 
        		//var dateObj = $(e, "div, div, a").val();
				//var date = $(e);
				var date2 = new Date($("#selectedDate").text());
				var date = $("#timepicker").val();
        		//클릭 시 데이터 들고 상세로 이동해야 함. 
        		alert(date);
        		alert(date2);
        	}
    
    */
    
    
    
</script>


<%@ include file="../footer.jsp" %>