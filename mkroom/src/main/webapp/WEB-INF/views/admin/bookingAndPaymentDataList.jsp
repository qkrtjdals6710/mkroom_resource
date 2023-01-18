<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
  
	<title>mkroom</title>
	<meta content="" name="description">
	<meta content="" name="keywords">
  
	<!-- Favicons -->
	<link href="${pageContext.request.contextPath}/resources/NiceAdmin/assets/img/favicon.png" rel="icon">
	<link href="${pageContext.request.contextPath}/resources/NiceAdmin/assets/img/apple-touch-icon.png" rel="apple-touch-icon">
  
	<!-- Google Fonts -->
	<link href="https://fonts.gstatic.com" rel="preconnect">
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
  
	<!-- Vendor CSS Files -->
	<link href="${pageContext.request.contextPath}/resources/NiceAdmin/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/NiceAdmin/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/NiceAdmin/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/NiceAdmin/assets/vendor/quill/quill.snow.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/NiceAdmin/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/NiceAdmin/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/NiceAdmin/assets/vendor/simple-datatables/style.css" rel="stylesheet">
  
	<!-- Template Main CSS File -->
	<link href="${pageContext.request.contextPath}/resources/NiceAdmin/assets/css/style.css" rel="stylesheet">
  
	<!-- =======================================================
	* Template Name: NiceAdmin - v2.4.1
	* Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
	* Author: BootstrapMade.com
	* License: https://bootstrapmade.com/license/
	======================================================== -->
	<style>
		/* 
		.card {
			
			height: 600px;
			overflow: hidden;
			align-items: stretch;
			
		} */

		
	</style>

  </head>
  
  <body>
  
	<!-- ======= Header ======= -->
	<header id="header" class="header fixed-top d-flex align-items-center">
  
	  <div class="d-flex align-items-center justify-content-between">
		<a href="${pageContext.request.contextPath}/" class="logo d-flex align-items-center">
		  <span class="d-none d-lg-block">mkroom</span>
		</a>
		<i class="bi bi-list toggle-sidebar-btn"></i>
	  </div><!-- End Logo -->
  	  <security:authorize access="hasRole('ADMIN')">
  	  
		  <div class="search-bar">
			<form class="search-form d-flex align-items-center" method="GET" action="${pageContext.request.contextPath}/member/detail">
			  <input type="text" name="userId" placeholder="직접 ID 검색" title="Enter the User ID">
			  <button type="submit" title="직접 ID 검색"><i class="bi bi-search"></i></button>
			</form>
		  </div><!-- End Search Bar -->
  	  </security:authorize>
  
	  <nav class="header-nav ms-auto">
		<ul class="d-flex align-items-center">
  
		  <li class="nav-item d-block d-lg-none">
			<a class="nav-link nav-icon search-bar-toggle " href="#">
			  <i class="bi bi-search"></i>
			</a>
		  </li><!-- End Search Icon-->
  
		  
  
		  <li class="nav-item dropdown pe-3">
  
			<a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
			  <img src="${pageContext.request.contextPath}/resources/NiceAdmin/assets/img/profile-img.jpg" alt="Profile" class="rounded-circle">
			  <security:authorize access="hasRole('MEMBER')">
				<security:authentication var="principal" property="principal" />
				<span class="d-none d-md-block dropdown-toggle ps-2"><c:out value="${principal.username}" /></span>
			  </security:authorize>
			</a><!-- End Profile Iamge Icon -->
  
			<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
			  <security:authorize access="hasRole('MEMBER')">
				<security:authentication var="principal" property="principal" />
				  <li class="dropdown-header">
					<h6><c:out value="${principal.username}" /></h6>
				  </li>
			  </security:authorize>
			  <li>
				<hr class="dropdown-divider">
			  </li>
				
			  <security:authorize access="hasRole('MEMBER')">
				<security:authentication var="principal" property="principal" />
				  <li>
				    <a class="dropdown-item d-flex align-items-center" href="${pageContext.request.contextPath}/member/detail?userId=${principal.username}">
						<i class="bi bi-person"></i>
						<span>My Profile</span>
					</a>
				  </li>
			  </security:authorize>


			  <li>
				<hr class="dropdown-divider">
			  </li>
  
			  <li>
				<a class="dropdown-item d-flex align-items-center" href="${pageContext.request.contextPath}/member/detail?userId=${principal.username}">
				  <i class="bi bi-gear"></i>
				  <span>Account Settings</span>
				</a>
			  </li>
			  <li>
				<hr class="dropdown-divider">
			  </li>
  
			  <li>
				<a class="dropdown-item d-flex align-items-center" href="${pageContext.request.contextPath }/qna/qnalist">
				  <i class="bi bi-question-circle"></i>
				  <span>Need Help?</span>
				</a>
			  </li>
			  <li>
				<hr class="dropdown-divider">
			  </li>
  
			  <li>
				<a class="dropdown-item d-flex align-items-center sign-out">
				  <i class="bi bi-box-arrow-right"></i>
				  <span>Sign Out</span>
				</a>
			  </li>
  
			</ul><!-- End Profile Dropdown Items -->
		  </li><!-- End Profile Nav -->
  
		</ul>
	  </nav><!-- End Icons Navigation -->
  
	</header><!-- End Header -->
  
	<!-- ======= Sidebar ======= -->
	<aside id="sidebar" class="sidebar">
  
		<ul class="sidebar-nav" id="sidebar-nav">
	      <li class="nav-heading">내 활동기록</li>
	      <li class="nav-item"> 
	        <a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
	          <i class="bi bi-journal-text"></i><span>작성글</span><i class="bi bi-chevron-down ms-auto"></i>
	        </a>
	        <ul id="components-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
	          <li>
	            <a href="${pageContext.request.contextPath}/member/reviewList?userId=${param.userId}&pageNum=1&rowAmountPerPage=10">
	              <i class="bi bi-circle"></i><span>내 글 보러가기</span>
	            </a>
	          </li>
	          <li>
	            <a href="${pageContext.request.contextPath}/member/eventReplyList?userId=${param.userId}&pageNum=1&rowAmountPerPage=10">
	              <i class="bi bi-circle"></i><span>내 댓글 보러가기</span>
	            </a>
	          </li>
	          <li>
	            <a href="${pageContext.request.contextPath}/member/qnaList?userId=${param.userId}&pageNum=1&rowAmountPerPage=10">
	              <i class="bi bi-circle"></i><span>내 질문 보러가기</span>
	            </a>
	          </li>
	          
	        </ul>
	      </li><!-- End Components Nav -->
	
	      <li class="nav-item">
	        <a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
	          <i class="bi bi-menu-button-wide"></i><span>예약 및 결제</span><i class="bi bi-chevron-down ms-auto"></i>
	        </a>
	        <ul id="forms-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
	          <li>
	            <a href="${pageContext.request.contextPath}/member/bookingList?userId=${param.userId}&pageNum=1&rowAmountPerPage=10">
	              <i class="bi bi-circle"></i><span>내 예약 보러가기</span>
	            </a>
	          </li>
	          <li>
	            <a href="${pageContext.request.contextPath}/member/paymentDataList?userId=${param.userId}&pageNum=1&rowAmountPerPage=10">
	              <i class="bi bi-circle"></i><span>내 결제 보러가기</span>
	            </a>
	          </li>
	          
	        </ul>
	      </li><!-- End Forms Nav -->
	
	      <li class="nav-heading">고객센터</li>
	      
	
	      <li class="nav-item">
	        <a class="nav-link collapsed" href="${pageContext.request.contextPath }/qna/qnalist">
	          <i class="bi bi-question-circle"></i>
	          <span>F.A.Q</span>
	        </a>
	      </li><!-- End F.A.Q Page Nav -->
	
	      <li class="nav-item">
	        <a class="nav-link collapsed" href="${pageContext.request.contextPath }/contact">
	          <i class="bi bi-envelope"></i>
	          <span>Contact</span>
	        </a>
	      </li><!-- End Contact Page Nav -->
	      
	      <security:authorize access="hasRole('ADMIN') or hasRole('BMANAGER')">
	    <li class="nav-heading">관리자페이지</li>
        <li class="nav-item">
          <a class="nav-link collapsed" href="${pageContext.request.contextPath}/member/list_admin?pageNum=1&rowAmountPerPage=10">
            <i class="bi bi-person"></i>
            <span>회원목록</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/admin/bookingAndPaymentDataList?pageNum=1&rowAmountPerPage=10">
            <i class="bi bi-menu-button-wide"></i>
            <span>예약현황</span>
          </a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link collapsed" data-bs-target="#charts-nav" data-bs-toggle="collapse" href="#">
            <i class="bi bi-bar-chart"></i>
            <span>차트</span>
            <i class="bi bi-chevron-down ms-auto"></i>
          </a>
          
          <ul id="charts-nav" class="nav-content collapse" data-bs-parent="#sidebar-nav">
            <li>
              <a href="${pageContext.request.contextPath}/admin/charts">
                <i class="bi bi-circle"></i><span>최근동향</span>
              </a>
            </li>
            <li>
              <a href="${pageContext.request.contextPath}/admin/sales">
                <i class="bi bi-circle"></i><span>매출</span>
              </a>
            </li>
            
          </ul>	
        </li>
        
        <security:authorize access="hasRole('ADMIN')">
        <li class="nav-item">
          <a class="nav-link collapsed" data-bs-target="#delete-nav" data-bs-toggle="collapse" href="#">
            <i class="bi bi-dash-circle"></i>
            <span>삭제요청</span>
            <i class="bi bi-chevron-down ms-auto"></i>
          </a>
          
          <ul id="delete-nav" class="nav-content collapse" data-bs-parent="#sidebar-nav">
            <li>
              <a href="${pageContext.request.contextPath}/admin/deleteQna">
                <i class="bi bi-circle"></i><span>Qna 게시글 삭제</span>
              </a>
            </li>
            <li>
              <a href="${pageContext.request.contextPath}/admin/deleteEvent">
                <i class="bi bi-circle"></i><span>이벤트 게시글 삭제</span>
              </a>
            </li>
            
          </ul>	
        </li>
        </security:authorize>
      </security:authorize>
	     
	
	    </ul>
  
	</aside><!-- End Sidebar-->
  
	<main id="main" class="main">
  
	  <div class="pagetitle">
		<nav>
		  <ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}">Home</a></li>
			
		  </ol>
		</nav>
	  </div><!-- End Page Title -->
  
	<section class="section">
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						
						<h5 class="card-title">예약현황</h5>
						<p>
							<select name="rowAmountPerPage" id="rowAmountPerPage">
								<option value="10">10개</option>
								<option value="20">20개</option>
								<option value="50">50개</option>
								<option value="100">100개</option>
							</select>
						</p>
				
						<select name="scope" id="scope">
							<option value="I">아이디</option>
							<option value="Q">퀘스트</option>
							<option value="B">지점</option>
							<option value="P">결제번호</option>
						</select>
						<input type="text" name="keyword" id="keyword" placeholder="keyword">
						
		                
						<label for="fromDate">시작날짜:</label>
						<input type="date" id="fromDate" name="fromDate">
						<label for="toDate">끝날짜:</label>
						<input type="date" id="toDate" name="toDate">
						
						<button type="button" id="btnKeywordSearch">Search</button>
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">#</th>
									<th scope="col">아이디</th>
									<th scope="col">이름</th>
									<th scope="col">전화번호</th>
									<th scope="col">이메일</th>
									<th scope="col">퀘스트</th>
									<th scope="col">지점</th>
									<th scope="col">선택시간</th>
									<th scope="col">인원수</th>
									<th scope="col">결제아이디</th>
									<th scope="col">금액</th>
									<th scope="col">결제시간</th>
								</tr>
							</thead>
							<tbody id="memberTbody">
								<c:forEach var="bookingAndPaymentData" varStatus="bookingAndPaymentDataStatus" items="${bookingAndPaymentDataList}">
	
									<tr>
										<th scope="row">
											<c:out value="${bookingAndPaymentDataStatus.index+1}" />
										</th>
										<td class="userId">
											<c:out value="${bookingAndPaymentData.userId}" />
										</td>
										<td class="userName">
											<c:out value="${bookingAndPaymentData.userName}" />
										</td>
										<td class="phoneNumber">
											<c:out value="${bookingAndPaymentData.phoneNumber}" />
										</td>
										<td class="email">
											<c:out value="${bookingAndPaymentData.email}" />
										</td>
										<td class="questName">
											<c:out value="${bookingAndPaymentData.questName}" />
										</td>
										<td class="branchLocation">
											<c:out value="${bookingAndPaymentData.branchLocation}" />
										</td>
										<td class="selectTime">
											<c:out value="${bookingAndPaymentData.selectTime}" />
										</td>
										<td class="teamMember">
											<c:out value="${bookingAndPaymentData.teamMember}" />
										</td>
										<td class="impUid">
											<c:out value="${bookingAndPaymentData.impUid}" />
										</td>
										<td class="amount">
											<c:out value="${bookingAndPaymentData.amount}" />
										</td>
										<td class="paidAt">
											<c:out value="${bookingAndPaymentData.paidAt}" />
										</td>
										
									</tr>
	
								</c:forEach>
	
							</tbody>
						</table>
						<!-- End Default Table Example -->
					</div>
				</div>
	
	
	
			</div>
		</div>
		
		<nav aria-label="Page navigation example">
		  <ul class="pagination" style="justify-content:center;">
		    <c:if test="${pagingCreator.prev }">
				<li class="page-item">
					<a class="page-link" href="?pageNum=1&rowAmountPerPage=${param.rowAmountPerPage}&scope=${param.scope}&keyword=${param.keyword}&fromDate=${param.fromDate}&toDate=${param.toDate}">First</a>
				</li>
			</c:if>
			<c:if test="${pagingCreator.prev }">
				<li class="page-item">
					<a class="page-link" href="?pageNum=${pagingCreator.startPagingNum - 1}&rowAmountPerPage=${param.rowAmountPerPage}&scope=${param.scope}&keyword=${param.keyword}&fromDate=${param.fromDate}&toDate=${param.toDate}">Previous</a>
				</li>
			</c:if>
			
			<c:forEach var="pageNum" begin="${pagingCreator.startPagingNum }" end="${pagingCreator.endPagingNum }">
				<li class="page-item">
					<a class="page-link" href="?pageNum=${pageNum}&rowAmountPerPage=${param.rowAmountPerPage}&scope=${param.scope}&keyword=${param.keyword}&fromDate=${param.fromDate}&toDate=${param.toDate}">${pageNum}</a>
				</li>
			</c:forEach>
			
			<c:if test="${pagingCreator.next }">
				<li class="page-item">
					<a class="page-link" href="?pageNum=${pagingCreator.endPagingNum + 1}&rowAmountPerPage=${param.rowAmountPerPage}&scope=${param.scope}&keyword=${param.keyword}&fromDate=${param.fromDate}&toDate=${param.toDate}">Next</a>
				</li>
			</c:if>
			
			<c:if test="${pagingCreator.next }">
				<li class="page-item">
					<a class="page-link" href="?pageNum=${pagingCreator.lastPageNum}&rowAmountPerPage=${param.rowAmountPerPage}&scope=${param.scope}&keyword=${param.keyword}&fromDate=${param.fromDate}&toDate=${param.toDate}">End</a>
				</li>
			</c:if>
		  </ul>
		</nav>
		



	</section>
		

	
  
	</main><!-- End #main -->
  
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
  
	<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
  
	<!-- Vendor JS Files -->
	<script src="${pageContext.request.contextPath}/resources/NiceAdmin/assets/vendor/apexcharts/apexcharts.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/NiceAdmin/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/NiceAdmin/assets/vendor/chart.js/chart.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/NiceAdmin/assets/vendor/echarts/echarts.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/NiceAdmin/assets/vendor/quill/quill.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/NiceAdmin/assets/vendor/simple-datatables/simple-datatables.js"></script>
	<script src="${pageContext.request.contextPath}/resources/NiceAdmin/assets/vendor/tinymce/tinymce.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/NiceAdmin/assets/vendor/php-email-form/validate.js"></script>
	
	<!-- Template Main JS File -->
	<script src="${pageContext.request.contextPath}/resources/NiceAdmin/assets/js/main.js"></script>
  
	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
	<script>

		function clickSignOut() {
			const form = $("<form action='${pageContext.request.contextPath }/logout' method='POST'>");
			form.append('<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />')
			$("body").append(form);
			$(".sign-out").click(function() {
				if (!confirm('로그아웃 하시겠습니까?')) {
					return;
				}
			
				form.submit();
			});
  
		}
		function retainSelectedParams() {
			var currentUrl = window.location.search;
			var searchParams = new URLSearchParams(currentUrl);

			var rowAmountPerPage = searchParams.get("rowAmountPerPage");
			var scope = searchParams.get("scope");
			var keyword = searchParams.get("keyword");
			var fromDate = searchParams.get("fromDate");
			var toDate = searchParams.get("toDate");
			
			if (rowAmountPerPage) {
				$("#rowAmountPerPage").val(rowAmountPerPage);
			} else {
				$("#rowAmountPerPage").val(10);
			}

			if (scope) {
				$("#scope").val(scope);
			} else {
				$("#scope").val("I");
			}

			if (keyword) {
				$("#keyword").val(keyword);
			} else {
				$("#keyword").val("");
			}

			if (fromDate) {
				$("#fromDate").val(fromDate);
			} else {
				$("#fromDate").val("");
			}

			if (toDate) {
				$("#toDate").val(toDate);
			} else {
				$("#toDate").val("");
			}

			

		}

		$(document).ready(function() {
			
			$("a.page-link").filter(function() {
				return $(this).text() == new URLSearchParams(window.location.search).get("pageNum");
			}).parent("li").addClass("active");
			

			clickSignOut()

			$("#memberTbody tr").hover(function() {
				$(this).css({ "opacity" : 0.5 })
					   .click(function() {
							var userId = $(this).children(".userId").text();
							var impUid = $(this).children(".impUid").text();
							window.location.href = "${pageContext.request.contextPath}/member/bookingAndPaymentDataDetail?userId=" + userId + "&impUid=" + impUid;
					   })	
			}, function() {
				$(this).css({ "opacity" : 1  });
			});


			retainSelectedParams()

			$("#rowAmountPerPage").change(function() {
				window.location.href = "?pageNum=1&rowAmountPerPage=" + $(this).val() + "&scope=" +$("#scope").val() + "&keyword=" + $("#keyword").val() 
					+ "&fromDate=" + $("#fromDate").val() + "&toDate=" + $("#toDate").val();
			})


			$("#btnKeywordSearch").click(function() {
				
				window.location.href = "?pageNum=1&rowAmountPerPage=" + $("#rowAmountPerPage").val() + "&scope=" +$("#scope").val() + "&keyword=" + $("#keyword").val() 
					+ "&fromDate=" + $("#fromDate").val() + "&toDate=" + $("#toDate").val();
			})

		});

	</script>




  </body>
  
  </html>