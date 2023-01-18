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
    table {
    	width: 100%;
    }
	tr {
		border-bottom: 1px solid #dbdbdb;
	}
	td {
		height: 40px;
	}
</style>
<div id="page-wrapper">
    <div class="row col-lg-12">
        <div class="board0">
            <div class="panel panel-default" style="padding-top:100px; padding-bottom:100px; padding-left:10%; padding-right: 10%;">
                <div class="panel-heading">
					<div class="container">
						<h2 style="text-align: center;">예약이 완료되었습니다</h2>
						<br><br>
						<div class="row">
							<div class="col-md-6" style="padding-right: 20px; text-align: center;">
																				<%--여기 테마 사진 링크로 변경 --%>
								<img style="max-width: 100%" height="330px;" src="${contextPath}/resources/skillhunt-master/images/image_2.jpg">
							</div>
							<div class="col-md-6" style="padding-left: 20px;">
								<table>
									<thead>
										<tr>
											<th style="width: 150px; text-align: center;">구분</th>
											<th style="text-align: center;">회원 내용</th>
										</tr>
									</thead>
									<tbody>
										
										<tr>
											<td>예약번호</td>
											<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${bookingAndPaymentData.bookingNum}" /></td>
										</tr>
										<tr>
											<td>예약자 성함</td>
											<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${bookingAndPaymentData.userName}" /></td>
										</tr>
										<tr>
											<td>연락처</td>
											<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${bookingAndPaymentData.phoneNumber}" /></td>
										</tr>
									</tbody>
								</table>
								<br><br>
								<table>
									<thead>
										<tr>
											<th style="width: 150px; text-align: center;">구분</th>
											<th style="text-align: center;">테마 내용</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>일시</td>
											<td id="selectTime">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${bookingAndPaymentData.selectTime}" /></td>
										</tr>
										<tr>
											<td>테마</td>
											<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${bookingAndPaymentData.questName}" /></td>
										</tr>
										<tr>
											<td>예약 지점명</td>
											<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${bookingAndPaymentData.branchLocation}" /></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>	<!-- row -->
						<div style="text-align: center;">
							<br>
							<%--각각 링크 넣기 (button click event or href) --%>
							<button id="btnMainPage" class="btn btn-primary">메인페이지</button>&nbsp;&nbsp;&nbsp;&nbsp;
							<security:authorize access="hasRole('MEMBER')">
								<security:authentication var="principal" property="principal" />
								<button id="btnMemberDetailPage" class="btn btn-danger">내정보</button>
							</security:authorize>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<script>

	$(document).ready(function() {
		
		$("#selectTime").text($("#selectTime").text().substring(0,22));

		$("#btnMainPage").click(function() {
			window.location.href = "${pageContext.request.contextPath}/";
		})
		
		$("#btnMemberDetailPage").click(function() {
			window.location.href = "${pageContext.request.contextPath}/member/detail?userId=" + '<c:out value="${bookingAndPaymentData.userId}" />';
		})
	});

</script>

<%@ include file="../footer.jsp" %>