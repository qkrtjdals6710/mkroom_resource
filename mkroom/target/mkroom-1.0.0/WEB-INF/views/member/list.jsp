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
  
	<title>Tables / General - MasterKey Room</title>
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
		  <img src="${pageContext.request.contextPath}/resources/NiceAdmin/assets/img/logo.png" alt="">
		  <span class="d-none d-lg-block">MasterKey Room</span>
		</a>
		<i class="bi bi-list toggle-sidebar-btn"></i>
	  </div><!-- End Logo -->
  
	  <div class="search-bar">
		<form class="search-form d-flex align-items-center" method="GET" action="${pageContext.request.contextPath}/member/detail">
		  <input type="text" name="userId" placeholder="Search" title="Enter the User ID">
		  <button type="submit" title="Search"><i class="bi bi-search"></i></button>
		</form>
	  </div><!-- End Search Bar -->
  
	  <nav class="header-nav ms-auto">
		<ul class="d-flex align-items-center">
  
		  <li class="nav-item d-block d-lg-none">
			<a class="nav-link nav-icon search-bar-toggle " href="#">
			  <i class="bi bi-search"></i>
			</a>
		  </li><!-- End Search Icon-->
  
		  <li class="nav-item dropdown">
  
			<a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
			  <i class="bi bi-bell"></i>
			  <span class="badge bg-primary badge-number">4</span>
			</a><!-- End Notification Icon -->
  
			<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications">
			  <li class="dropdown-header">
				You have 4 new notifications
				<a href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View all</span></a>
			  </li>
			  <li>
				<hr class="dropdown-divider">
			  </li>
  
			  <li class="notification-item">
				<i class="bi bi-exclamation-circle text-warning"></i>
				<div>
				  <h4>Lorem Ipsum</h4>
				  <p>Quae dolorem earum veritatis oditseno</p>
				  <p>30 min. ago</p>
				</div>
			  </li>
  
			  <li>
				<hr class="dropdown-divider">
			  </li>
  
			  <li class="notification-item">
				<i class="bi bi-x-circle text-danger"></i>
				<div>
				  <h4>Atque rerum nesciunt</h4>
				  <p>Quae dolorem earum veritatis oditseno</p>
				  <p>1 hr. ago</p>
				</div>
			  </li>
  
			  <li>
				<hr class="dropdown-divider">
			  </li>
  
			  <li class="notification-item">
				<i class="bi bi-check-circle text-success"></i>
				<div>
				  <h4>Sit rerum fuga</h4>
				  <p>Quae dolorem earum veritatis oditseno</p>
				  <p>2 hrs. ago</p>
				</div>
			  </li>
  
			  <li>
				<hr class="dropdown-divider">
			  </li>
  
			  <li class="notification-item">
				<i class="bi bi-info-circle text-primary"></i>
				<div>
				  <h4>Dicta reprehenderit</h4>
				  <p>Quae dolorem earum veritatis oditseno</p>
				  <p>4 hrs. ago</p>
				</div>
			  </li>
  
			  <li>
				<hr class="dropdown-divider">
			  </li>
			  <li class="dropdown-footer">
				<a href="#">Show all notifications</a>
			  </li>
  
			</ul><!-- End Notification Dropdown Items -->
  
		  </li><!-- End Notification Nav -->
  
		  <li class="nav-item dropdown">
  
			<a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
			  <i class="bi bi-chat-left-text"></i>
			  <span class="badge bg-success badge-number">3</span>
			</a><!-- End Messages Icon -->
  
			<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow messages">
			  <li class="dropdown-header">
				You have 3 new messages
				<a href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View all</span></a>
			  </li>
			  <li>
				<hr class="dropdown-divider">
			  </li>
  
			  <li class="message-item">
				<a href="#">
				  <img src="${pageContext.request.contextPath}/resources/NiceAdmin/assets/img/messages-1.jpg" alt="" class="rounded-circle">
				  <div>
					<h4>Maria Hudson</h4>
					<p>Velit asperiores et ducimus soluta repudiandae labore officia est ut...</p>
					<p>4 hrs. ago</p>
				  </div>
				</a>
			  </li>
			  <li>
				<hr class="dropdown-divider">
			  </li>
  
			  <li class="message-item">
				<a href="#">
				  <img src="${pageContext.request.contextPath}/resources/NiceAdmin/assets/img/messages-2.jpg" alt="" class="rounded-circle">
				  <div>
					<h4>Anna Nelson</h4>
					<p>Velit asperiores et ducimus soluta repudiandae labore officia est ut...</p>
					<p>6 hrs. ago</p>
				  </div>
				</a>
			  </li>
			  <li>
				<hr class="dropdown-divider">
			  </li>
  
			  <li class="message-item">
				<a href="#">
				  <img src="${pageContext.request.contextPath}/resources/NiceAdmin/assets/img/messages-3.jpg" alt="" class="rounded-circle">
				  <div>
					<h4>David Muldon</h4>
					<p>Velit asperiores et ducimus soluta repudiandae labore officia est ut...</p>
					<p>8 hrs. ago</p>
				  </div>
				</a>
			  </li>
			  <li>
				<hr class="dropdown-divider">
			  </li>
  
			  <li class="dropdown-footer">
				<a href="#">Show all messages</a>
			  </li>
  
			</ul><!-- End Messages Dropdown Items -->
  
		  </li><!-- End Messages Nav -->
  
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
				<a class="dropdown-item d-flex align-items-center" href="users-profile.html">
				  <i class="bi bi-gear"></i>
				  <span>Account Settings</span>
				</a>
			  </li>
			  <li>
				<hr class="dropdown-divider">
			  </li>
  
			  <li>
				<a class="dropdown-item d-flex align-items-center" href="pages-faq.html">
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
			<li class="nav-heading">Pages1</li>
			<li class="nav-item"> 
				<a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
				<i class="bi bi-menu-button-wide"></i><span>Components</span><i class="bi bi-chevron-down ms-auto"></i>
				</a>
				<ul id="components-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
				<li>
					<a href="components-alerts.html">
					<i class="bi bi-circle"></i><span>Alerts</span>
					</a>
				</li>
				<li>
					<a href="components-accordion.html">
					<i class="bi bi-circle"></i><span>Accordion</span>
					</a>
				</li>
				<li>
					<a href="components-badges.html">
					<i class="bi bi-circle"></i><span>Badges</span>
					</a>
				</li>
				<li>
					<a href="components-breadcrumbs.html">
					<i class="bi bi-circle"></i><span>Breadcrumbs</span>
					</a>
				</li>
				<li>
					<a href="components-buttons.html">
					<i class="bi bi-circle"></i><span>Buttons</span>
					</a>
				</li>
				<li>
					<a href="components-cards.html">
					<i class="bi bi-circle"></i><span>Cards</span>
					</a>
				</li>
				<li>
					<a href="components-carousel.html">
					<i class="bi bi-circle"></i><span>Carousel</span>
					</a>
				</li>
				<li>
					<a href="components-list-group.html">
					<i class="bi bi-circle"></i><span>List group</span>
					</a>
				</li>
				<li>
					<a href="components-modal.html">
					<i class="bi bi-circle"></i><span>Modal</span>
					</a>
				</li>
				<li>
					<a href="components-tabs.html">
					<i class="bi bi-circle"></i><span>Tabs</span>
					</a>
				</li>
				<li>
					<a href="components-pagination.html">
					<i class="bi bi-circle"></i><span>Pagination</span>
					</a>
				</li>
				<li>
					<a href="components-progress.html">
					<i class="bi bi-circle"></i><span>Progress</span>
					</a>
				</li>
				<li>
					<a href="components-spinners.html">
					<i class="bi bi-circle"></i><span>Spinners</span>
					</a>
				</li>
				<li>
					<a href="components-tooltips.html">
					<i class="bi bi-circle"></i><span>Tooltips</span>
					</a>
				</li>
				</ul>
			</li><!-- End Components Nav -->
		
			<li class="nav-item">
				<a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
				<i class="bi bi-journal-text"></i><span>Forms</span><i class="bi bi-chevron-down ms-auto"></i>
				</a>
				<ul id="forms-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
				<li>
					<a href="forms-elements.html">
					<i class="bi bi-circle"></i><span>Form Elements</span>
					</a>
				</li>
				<li>
					<a href="forms-layouts.html">
					<i class="bi bi-circle"></i><span>Form Layouts</span>
					</a>
				</li>
				<li>
					<a href="forms-editors.html">
					<i class="bi bi-circle"></i><span>Form Editors</span>
					</a>
				</li>
				<li>
					<a href="forms-validation.html">
					<i class="bi bi-circle"></i><span>Form Validation</span>
					</a>
				</li>
				</ul>
			</li><!-- End Forms Nav -->
		
			<li class="nav-item">
				<a class="nav-link collapsed" data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#">
				<i class="bi bi-layout-text-window-reverse"></i><span>Tables</span><i class="bi bi-chevron-down ms-auto"></i>
				</a>
				<ul id="tables-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
				<li>
					<a href="tables-general.html">
					<i class="bi bi-circle"></i><span>General Tables</span>
					</a>
				</li>
				<li>
					<a href="tables-data.html">
					<i class="bi bi-circle"></i><span>Data Tables</span>
					</a>
				</li>
				</ul>
			</li><!-- End Tables Nav -->
		
			<li class="nav-heading">Pages2</li>
			
		
			<li class="nav-item">
				<a class="nav-link collapsed" href="pages-faq.html">
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
			<li class="nav-heading">Pages3</li>
			<security:authorize access="hasRole('ADMIN')">
				<li class="nav-item">
				<a class="nav-link " href="${pageContext.request.contextPath}/member/list_admin?pageNum=1&rowAmountPerPage=10">
					<i class="bi bi-person"></i>
					<span>Member List</span>
				</a>
				</li><!-- End Profile Page Nav -->
			</security:authorize>
			
		
		</ul>
  
	</aside><!-- End Sidebar-->
  
	<main id="main" class="main">
  
	  <div class="pagetitle">
		<h1>Member Dashboard</h1>
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
						<h5 class="card-title">Member List</h5>
						<select name="scope" id="scope">
							<option value="I">User ID</option>
							<option value="N">User Name</option>
							<option value="P">Phone</option>
							<option value="E">Email</option>
						</select>
						<input type="text" name="keyword" id="keyword" placeholder="keyword">
						<button type="button" id="btnKeywordSearch">Search</button>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">#</th>
									<th scope="col">ID</th>
									<th scope="col">Name</th>
									<th scope="col">Phone</th>
									<th scope="col">Email</th>
									<th scope="col">Discount Coupon</th>
									<th scope="col">Quest Point</th>
								</tr>
							</thead>
							<tbody id="memberTbody">
								<c:forEach var="member" varStatus="memberStatus" items="${memberList}">
	
									<tr>
										<th scope="row">
											<c:out value="${memberStatus.index+1}" />
										</th>
										<td class="userId">
											<c:out value="${member.userId}" />
										</td>
										<td class="userName">
											<c:out value="${member.userName}" />
										</td>
										<td class="phoneNumber">
											<c:out value="${member.phoneNumber}" />
										</td>
										<td class="email">
											<c:out value="${member.email}" />
										</td>
										<td class="discountCoupon">
											<c:out value="${member.discountCoupon}" />
										</td>
										<td class="questPoint">
											<c:out value="${member.questPoint}" />
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
					<a class="page-link" href="?pageNum=1&rowAmountPerPage=${param.rowAmountPerPage}&scope=${param.scope}&keyword=${param.keyword}">First</a>
				</li>
			</c:if>
			<c:if test="${pagingCreator.prev }">
				<li class="page-item">
					<a class="page-link" href="${pageContext.request.contextPath}/member/list_admin?pageNum=${pagingCreator.startPagingNum - 1}&rowAmountPerPage=${param.rowAmountPerPage}&scope=${param.scope}&keyword=${param.keyword}">Previous</a>
				</li>
			</c:if>
			
			<c:forEach var="pageNum" begin="${pagingCreator.startPagingNum }" end="${pagingCreator.endPagingNum }">
				<li class="page-item">
					<a class="page-link" href="${pageContext.request.contextPath}/member/list_admin?pageNum=${pageNum}&rowAmountPerPage=${param.rowAmountPerPage}&scope=${param.scope}&keyword=${param.keyword}">${pageNum}</a>
				</li>
			</c:forEach>
			
			<c:if test="${pagingCreator.next }">
				<li class="page-item">
					<a class="page-link" href="${pageContext.request.contextPath}/member/list_admin?pageNum=${pagingCreator.endPagingNum + 1}&rowAmountPerPage=${param.rowAmountPerPage}&scope=${param.scope}&keyword=${param.keyword}">Next</a>
				</li>
			</c:if>
			
			<c:if test="${pagingCreator.next }">
				<li class="page-item">
					<a class="page-link" href="${pageContext.request.contextPath}/member/list_admin?pageNum=${pagingCreator.lastPageNum}&rowAmountPerPage=${param.rowAmountPerPage}&scope=${param.scope}&keyword=${param.keyword}">End</a>
				</li>
			</c:if>
		  </ul>
		</nav>
		
		<select name="rowAmountPerPage" id="rowAmountPerPage">
			<option value="10">10개</option>
			<option value="20">20개</option>
			<option value="50">50개</option>
			<option value="100">100개</option>
		</select>


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

		}

		$(document).ready(function() {
		
			clickSignOut()

			$("#memberTbody tr").hover(function() {
				$(this).css({ "color" : "red", "text-decoration-line" : "underline" })
					   .click(function() {
							var userId = $(this).children(".userId").text();
							window.location.href = "${pageContext.request.contextPath}/member/detail?userId=" + userId;
					   })	
			}, function() {
				$(this).css({ "color" : "black", "text-decoration-line" : "none"  });
			});


			retainSelectedParams()

			$("#rowAmountPerPage").change(function() {
				window.location.href = "${pageContext.request.contextPath}/member/list_admin?pageNum=1&rowAmountPerPage=" + $(this).val() + "&scope=" +$("#scope").val() + "&keyword=" + $("#keyword").val();
			})


			$("#btnKeywordSearch").click(function() {
				window.location.href = "${pageContext.request.contextPath}/member/list_admin?pageNum=1&rowAmountPerPage=" + $("#rowAmountPerPage").val() + "&scope=" +$("#scope").val() + "&keyword=" + $("#keyword").val();
			})

		});

	</script>




  </body>
  
  </html>