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
           <h2 class="mb-3 bread">예약</h2>
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
						    <div class="col-lg-7" style="padding-right:20px; height: 600px;">
						    	<div id="calendar"></div>
						    </div>
					    	<div class="col-lg-5" style="padding-left:20px; display: flex; align-items: center;"><br>
							    <form>
							    	<div>
							    		<br>
                                        <span id="selectedDateinfo">캘린더에서 날짜를 선택해주세요</span>
                                        <span id="selectedDate"></span>
							    		&nbsp;&nbsp;
								    	<select name="timepicker" id="timepicker">
									        <option value="9:00 AM">9:00 AM</option>
									        <option value="10:00 AM">10:00 AM</option>
									        <option value="11:00 AM">11:00 AM</option>
									        <option value="12:00 PM">12:00 PM</option>
									        <option value="1:00 PM">1:00 PM</option>
									        <option value="2:00 PM">2:00 PM</option>
									        <option value="3:00 PM">3:00 PM</option>
									        <option value="4:00 PM">4:00 PM</option>
									        <option value="5:00 PM">5:00 PM</option>
									        <option value="6:00 PM">6:00 PM</option>
									    </select>
								    </div>
								    <hr>
								    <select name="branchLocation" id="branchLocation" style="text-align:center; width:120px;">
							            <option value="">지점명</option>
							            <option value="구로점">구로점</option>
							            <option value="신도림점">신도림점</option>
							            <option value="신촌점">신촌점</option>
							        </select>&nbsp;&nbsp;
							        <select name="questName" id="questName" style="text-align:center; width:200px;">
							            <option value="">퀘스트명</option>
							            <option value="지구탈출">지구탈출</option>
							            <option value="셜록홈즈">셜록홈즈</option>
							            <option value="황금열쇠">황금열쇠</option>
							        </select>
								    <hr>
							        <input type="text" style="text-align: center; width: 80px;" name="teamMember" id="teamMember" placeholder="인원수">&nbsp;&nbsp;

                                    <security:authorize access="hasRole('MEMBER')">
                                        <security:authentication var="principal" property="principal" />
                                        <input type="text" style="text-align: center; width: 120px;" name="userId" id="userId" readonly value="${principal.username}">
                                    </security:authorize>
							        <hr>
							        <button type="button" id="gopay" class="btn btn-danger"><span>예약/결제하기</span></button>
						        </form>
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
    

    function deleteBooking() {
        $.ajax({
            url: "${pageContext.request.contextPath}/deleteBooking",
            method: "DELETE",
            data: JSON.stringify({
                questName: $("#questName").val(),
                branchLocation: $("#branchLocation").val(),
                selectTime: new Date($("#selectedDate").text() + ' ' + $("#timepicker").val()),
                teamMember: $("#teamMember").val(),
                userId: $("#userId").val()
            }),
            contentType: "application/json",
            beforeSend: function(xhr) {
                xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
            },
            success: function(response) {

            },
            error: function(xhr, status) {
                
            }
        })
    }
    
    function clickCalendarAndDoBooking(calendar) {
        
        // Click Calendar And Do Booking
        calendar.on('dateClick', function(info) {
            $("#selectedDateinfo").text("선택날짜: ");
            $("#selectedDate").text(info.dateStr);
        });

        $("#gopay").on("click", function name() {
            if (!$("#selectedDate").text()) {
                alert("날짜를 선택해주세요");
                return;
            }
            if (new Date().getTime() > new Date($("#selectedDate").text() + ' ' + $("#timepicker").val() + " GMT+0900").getTime()) {
                alert("현재보다 이전 날짜는 예약할 수 없습니다")
                return;
            }
            if (!$("#questName").val() || !$("#branchLocation").val()) {
                alert("퀘스트와 지점을 선택해주세요");
                return;
            }
            if (Number.isNaN(parseInt($("#teamMember").val())) || (parseInt($("#teamMember").val())) <= 0) {
                alert("인원수를 확인해주세요"); 
                return;
            }

            if (confirm($("#selectedDate").text() + " " + $("#timepicker").val() + "에 예약하시겠습니까?")) {
                
                $.ajax({
                    url: "${pageContext.request.contextPath}/validateBooking",
                    method: "POST",
                    data: JSON.stringify({
                        questName: $("#questName").val(),
                        branchLocation: $("#branchLocation").val(),
                        selectTime: new Date($("#selectedDate").text() + ' ' + $("#timepicker").val()),
                        teamMember: $("#teamMember").val(),
                        userId: $("#userId").val()
                    }),
                    contentType: "application/json",
                    beforeSend: function(xhr) {
                        xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
                    },
                    success: function(response) {
                        if (!confirm("결제하시겠습니까?")) {
                            deleteBooking();
                            return;
                        }
                        requestPay();   
                    },
                    error: function(xhr, status) {
                        alert('이미 존재하는 예약건입니다');
                    }
                })
            }

        });
    }
    

    function selectQuestAndBranchLocation() {
        var params = new URLSearchParams(window.location.search);
        var questName = params.get("questName");
        var branchLocation = params.get("branchLocation");
        for (let i = 1; i < $("#questName").find("option").length; i++) {
            if ($("#questName").find("option")[i].text === questName) {
                $("#questName").val(questName);
               
                break;
            }
            
        }
        for (let i = 1; i < $("#branchLocation").find("option").length; i++) {
            if ($("#branchLocation").find("option")[i].text === branchLocation) {
                $("#branchLocation").val(branchLocation);

                break;
            }
            
        }
        
    }
    
    $(document).ready(function() {
         
		selectQuestAndBranchLocation();

    	// Create Calendar
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          	locale:"ko",
        	initialView: 'dayGridMonth'
        });
        calendar.render();
        clickCalendarAndDoBooking(calendar);
        
    });
</script>
<!--  references: https://chai-iamport.gitbook.io/iamport/auth/guide/1. -->
<!-- 1. 아임포트 라이브러리 추가하기 -->
<!-- iamport.payment.js -->
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script>

// 2. 결제준비하기
// 가맹점 식별코드
const IMP = window.IMP;
IMP.init("imp72426407") // 관리자콘솔에서 확인가능

// 3. 결제요청하기
function requestPay() {
    IMP.request_pay({ // object
        // 관리자콘솔
        // https://admin.iamport.kr/integration
        // 아이디: mkroom@mkroom.com
        // 비밀번호: QWERqwer123

        // api-setting 
        // PG사 코드표 참조 
        // https://chai-iamport.gitbook.io/iamport/tip/pg-2  
        // 결제채널 이름: kakaopay 가맹점코드(CID): TC0ONETIME
        pg: "kakaopay.TC0ONETIME",  // 관리자 콘솔에서 확인가능
        pay_method: "card",
        // 제품
        merchant_uid: new Date().getTime().toString(), 
        m_redirect_url : "http://localhost:8080/mkroom/booking",
        name: $("#questName").val() + "_" + $("#branchLocation").val() + "_" + $("#selectedDate").text() + ' ' + $("#timepicker").val() + " GMT+0900", 
        amount: 50000 + (parseInt($("#teamMember").val()) - 1) * 10000
        
    }, function(rsp) { // callback
        if (rsp.success) {
            // 결제 성공시
            // 요청이 성공했을 경우
            // 결제번호(imp_uid)와 금액을 서버에 전달하여 클라이언트단에서 위조를 검증합니다
            $.ajax({
	        	url: "${pageContext.request.contextPath}/payment/verify/" + rsp.imp_uid + "/" + rsp.paid_amount,
                method: "GET",
                beforeSend: function(xhr) {
                    xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
              	},
              	success: function(payment) {
                    insertPaymentData(payment);
                    
                },

                error: function(xhr, staus) {
                    deleteBooking();
                	alert("검증되지 않은 결제입니다");
                }
	        });
            
            
            
        } else {
            // 결제 실패로직
            deleteBooking();
        	alert("결제가 실패했습니다");
            window.location.href = window.location.href;
        }

    })
}

function insertPaymentData(payment) {
    $.ajax({
        url: "${pageContext.request.contextPath}/payment/insert",
        method: "POST",
        data: JSON.stringify({
            impUid: $(payment).find("impUid").text(),
            merchantUid: $(payment).find("merchantUid").text(),
            productName: $(payment).find("name").text().split("_")[0],
            branchLoaction: $(payment).find("name").text().split("_")[1],
            selectTime: new Date($(payment).find("name").text().split("_")[2]),
            amount: $(payment).find("amount").text(),
            paidAt: new Date(Number($(payment).find("paidAt").text())),
            buyerId: $("#userId").val()
        }),
        contentType: "application/json",
        beforeSend: function(xhr) {
            xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
        },
        success: function(response) {
            sendEmailAfterPayment(payment);
            window.location.href = "${pageContext.request.contextPath}/bookingcompl?impUid=" + $(payment).find("impUid").text();
        },
        error: function(xhr, status) {
        }
    })
}
</script>

<script>

function sendEmailAfterPayment(payment) {
    $.ajax({
        url: "${pageContext.request.contextPath}/sendEmailAfterPayment",
        method: "POST",
        data: JSON.stringify({
            userId: $("#userId").val(),
            questName: $(payment).find("name").text().split("_")[0],
            branchLocation: $(payment).find("name").text().split("_")[1],
            selectTime: $(payment).find("name").text().split("_")[2].substring(0, 18),
            amount: $(payment).find("amount").text(),
            teamMember: $("#teamMember").val(),
        }),
        contentType: "application/json",
        beforeSend: function(xhr) {
            xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
        },
        success: function(response) {

        },
        error: function(xhr, status) {
        }

    })    
}

</script>
<%@ include file="../footer.jsp" %>