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
		  <input type="text" name="userId" placeholder="?????? ID ??????" title="Enter the User ID">
		  <button type="submit" title="?????? ID ??????"><i class="bi bi-search"></i></button>
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
      <li class="nav-heading">??? ????????????</li>
      <li class="nav-item"> 
        <a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-journal-text"></i><span>?????????</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="components-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="${pageContext.request.contextPath}/member/reviewList?userId=${param.userId}&pageNum=1&rowAmountPerPage=10">
              <i class="bi bi-circle"></i><span>??? ??? ????????????</span>
            </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/member/eventReplyList?userId=${param.userId}&pageNum=1&rowAmountPerPage=10">
              <i class="bi bi-circle"></i><span>??? ?????? ????????????</span>
            </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/member/qnaList?userId=${param.userId}&pageNum=1&rowAmountPerPage=10">
              <i class="bi bi-circle"></i><span>??? ?????? ????????????</span>
            </a>
          </li>
          
        </ul>
      </li><!-- End Components Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-menu-button-wide"></i><span>?????? ??? ??????</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="forms-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="${pageContext.request.contextPath}/member/bookingList?userId=${param.userId}&pageNum=1&rowAmountPerPage=10">
              <i class="bi bi-circle"></i><span>??? ?????? ????????????</span>
            </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/member/paymentDataList?userId=${param.userId}&pageNum=1&rowAmountPerPage=10">
              <i class="bi bi-circle"></i><span>??? ?????? ????????????</span>
            </a>
          </li>
          
        </ul>
      </li><!-- End Forms Nav -->


      <li class="nav-heading">????????????</li>
      

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
	    <li class="nav-heading">??????????????????</li>
        <li class="nav-item">
          <a class="nav-link collapsed" href="${pageContext.request.contextPath}/member/list_admin?pageNum=1&rowAmountPerPage=10">
            <i class="bi bi-person"></i>
            <span>????????????</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link collapsed" href="${pageContext.request.contextPath}/admin/bookingAndPaymentDataList?pageNum=1&rowAmountPerPage=10">
            <i class="bi bi-menu-button-wide"></i>
            <span>????????????</span>
          </a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link collapsed" data-bs-target="#charts-nav" data-bs-toggle="collapse" href="#">
            <i class="bi bi-bar-chart"></i>
            <span>??????</span>
            <i class="bi bi-chevron-down ms-auto"></i>
          </a>
          
          <ul id="charts-nav" class="nav-content collapse" data-bs-parent="#sidebar-nav">
            <li>
              <a href="${pageContext.request.contextPath}/admin/charts">
                <i class="bi bi-circle"></i><span>????????????</span>
              </a>
            </li>
            <li>
              <a href="${pageContext.request.contextPath}/admin/sales">
                <i class="bi bi-circle"></i><span>??????</span>
              </a>
            </li>
            
          </ul>	
        </li>
        
        <security:authorize access="hasRole('ADMIN')">
	        <li class="nav-item">
	          <a class="nav-link collapsed" data-bs-target="#delete-nav" data-bs-toggle="collapse" href="#">
	            <i class="bi bi-dash-circle"></i>
	            <span>????????????</span>
	            <i class="bi bi-chevron-down ms-auto"></i>
	          </a>
	          
	          <ul id="delete-nav" class="nav-content collapse" data-bs-parent="#sidebar-nav">
	            <li>
	              <a href="${pageContext.request.contextPath}/admin/deleteQna">
	                <i class="bi bi-circle"></i><span>Qna ????????? ??????</span>
	              </a>
	            </li>
	            <li>
	              <a href="${pageContext.request.contextPath}/admin/deleteEvent">
	                <i class="bi bi-circle"></i><span>????????? ????????? ??????</span>
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
      <h1>??????????????????</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/">Home</a></li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section profile">
      <div class="row">
        <div class="col-xl-4">

          <div class="card">
            <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">

              <img src="${pageContext.request.contextPath}/resources/NiceAdmin/assets/img/profile-img.jpg" alt="Profile" class="rounded-circle">
              <h2><c:out value="${member.userName }" /></h2>
              <h3><c:out value="${member.userId }" /></h3>
              <c:forEach  var="auth" varStatus="authStatus" items="${member.authorityList}">
                <c:if test="${authStatus.first}">
                  <h6 class="text-muted"><c:out value="${auth.authority }" /></h6>
                </c:if>
              </c:forEach>
            </div>
          </div>
		  
		  <security:authorize access="hasRole('ADMIN')">
			  <div  style="text-align: center;">
			  	<a href="${pageContext.request.contextPath}/admin/bookingBoard"><button class="btn btn-danger">?????? ??????</button></a>
			  </div>
		  </security:authorize>
        </div>

        <div class="col-xl-8">

          <div class="card">
            <div class="card-body pt-3">
              <!-- Bordered Tabs -->
              <ul class="nav nav-tabs nav-tabs-bordered">

                <li class="nav-item">
                  <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#profile-overview">??????</button>
                </li>

                <li class="nav-item">
                  <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-edit">????????? ??????</button>
                </li>

                <li class="nav-item">
                  <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-change-password">???????????? ??????</button>
                </li>

                <li class="nav-item">
                  <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-delete">????????????</button>
                </li>

              </ul>
              <div class="tab-content pt-2">

                <div class="tab-pane fade show active profile-overview" id="profile-overview">
                  <h5 class="card-title">??????</h5>
                  <p class="small fst-italic">"?????? ????????????, ????????? ???????????? ????????? ????????? ?????? ???????????? ????????? ?????? ????????? ?????? ?????? ?????? ????????? ?????? ????????? ????????? ????????? ??? ?????? ???????????? ????????? ????????? ???????????? ???????????????. ????????? ????????? ????????? ????????? ????????? ?????? ?????? ?????????, ?????? ????????? ???????????? ???????????? ????????? ?????? ????????????. ????????? ????????? ?????? ???????????? ???????????? ????????????. ????????? ?????? ???????????? ?????? ??? ??? ?????? ?????? ???????????? ?????? ???????????? ?????? ??? ?????? ????????? ???????????? ?????? ????????? ????????? ?????????.????????? ?????? ???????????? ????????? ?????? ?????? ???????????? ????????? ?????? ????????? ???????????? ?????? ????????? ?????? ???????????????. ????????? ???????????? ?????? ???????????????.???????????? ????????? ????????? ??? ???????????? ?????? ??? ????????? ????????? ???????????????: ?????? ?????? ??? ??? ????????? ?????? ?????? ????????? ???????????????, ????????? ????????? ??? ?????? ????????? ????????? ?????? ????????? ????????????."</p>

                  <h5 class="card-title">????????? ??????</h5>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label ">?????????</div>
                    <div class="col-lg-9 col-md-8"><c:out value="${member.userId }" /></div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label ">??????</div>
                    <div class="col-lg-9 col-md-8"><c:out value="${member.userName }" /></div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label ">????????????</div>
                    <div class="col-lg-9 col-md-8"><c:out value="${member.phoneNumber }" /></div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label ">?????????</div>
                    <div class="col-lg-9 col-md-8"><c:out value="${member.email }" /></div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label ">?????? ??????</div>
                    <div class="col-lg-9 col-md-8"><c:out value="${member.discountCoupon }" /></div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label ">????????? ?????????</div>
                    <div class="col-lg-9 col-md-8"><c:out value="${member.questPoint }" /></div>
                  </div>
                  
                  
                  <div class="row">
                    <div class="col-lg-3 col-md-4 label ">??????</div>

                    <c:forEach var="auth" varStatus="authStatus" items="${member.authorityList}">
                      <div class="col-lg-9 col-md-8"><c:out value="${auth.authority }" /></div>
                      <c:if test="${!authStatus.last}">
                        <div class="col-lg-3 col-md-4 label "></div>
                      </c:if>
                    </c:forEach>
                    
                    </div>
                    
                </div>

                <div class="tab-pane fade profile-edit pt-3" id="profile-edit">

                  <!-- Profile Edit Form -->
                  <form action="${pageContext.request.contextPath}/member/update" method="POST">
                    <div class="row mb-3">
                      <label for="profileImage" class="col-md-4 col-lg-3 col-form-label">????????? ?????????</label>
                      <div class="col-md-8 col-lg-9">
                        <img src="${pageContext.request.contextPath}/resources/NiceAdmin/assets/img/profile-img.jpg" alt="Profile" id="output">
                        <div class="pt-2">
                          <a class="btn btn-primary btn-sm" title="Upload new profile image" id="btnChangeProfile"><i class="bi bi-upload"></i></a>
                          <a href="#" class="btn btn-danger btn-sm" title="Remove my profile image"><i class="bi bi-trash"></i></a>
                        </div>
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="userId" class="col-md-4 col-lg-3 col-form-label">?????????</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="userId" type="text" class="form-control text-muted" id="userId" value="${member.userId }" readonly>
                      </div>
                    </div>
                    
                    
                    <div class="row mb-3">
                      <label for="userName" class="col-md-4 col-lg-3 col-form-label">??????</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="userName" type="text" class="form-control" id="userName" value="${member.userName }">
                      </div>
                    </div>
                    
                    <div class="row mb-3">
                      <label for="phoneNumber" class="col-md-4 col-lg-3 col-form-label">????????????</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="phoneNumber" type="text" class="form-control" id="phoneNumber" value="${member.phoneNumber }">
                      </div>
                    </div>
                    
                    <div class="row mb-3">
                      <label for="email" class="col-md-4 col-lg-3 col-form-label">?????????</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="email" type="text" class="form-control" id="email" value="${member.email }">
                      </div>
                    </div>

                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

                    <div class="text-center">
                      <button type="submit" class="btn btn-primary">???????????? ????????????</button>
                    </div>
                  </form><!-- End Profile Edit Form -->

                </div>

                <div class="tab-pane fade pt-3" id="profile-change-password">
                  <!-- Change Password Form -->
                  <form action="${pageContext.request.contextPath}/member/updatePw" method="POST">


                    <div class="row mb-3">
                      <label for="newPw" class="col-md-4 col-lg-3 col-form-label">????????? ????????????</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="newPw" type="password" class="form-control" id="newPw">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="reEnterPw" class="col-md-4 col-lg-3 col-form-label">???????????? ??????</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="reEnterPw" type="password" class="form-control" id="reEnterPw">
                      </div>
                    </div>

                    <div class="text-center">
                      <button type="submit" class="btn btn-primary">???????????? ??????</button>
                    </div>
                    <input type="hidden" name="userId" id="userId" value="${member.userId }" />
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                  </form><!-- End Change Password Form -->

                </div>


                <div class="tab-pane fade pt-3" id="profile-delete">
                  <!-- Change Password Form -->
                  <form id="deleteForm" action="${pageContext.request.contextPath}/member/delete" method="POST">


             

                    <div class="text-center">
                      <button id="btnDeleteMember" type="button" class="btn btn-danger">?????? ????????????</button>
                    </div>
                    <input type="hidden" name="userId" id="userId" value="${member.userId }" />
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                  </form><!-- End Change Password Form -->

                </div>



              </div><!-- End Bordered Tabs -->

            </div>
          </div>

        </div>
      </div>
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
  
  <script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
  <script>
    function AlertafterChangingPw() {
        const urlParams = new URLSearchParams(window.location.search);

        if (urlParams.get("updatePw") === "reEnterError") {
          alert('???????????? ??????????????? ??????????????? ??????????????????');
        }

        if (urlParams.get("updatePw") === "Success") {
          alert('??????????????? ?????????????????????');
        }

    }
    function clickSignOut() {
        const form = $("<form action='${pageContext.request.contextPath }/logout' method='POST'>");
        form.append('<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />')
        $("body").append(form);
        $(".sign-out").click(function() {
            if (!confirm('???????????? ???????????????????')) {
              return;
            }
          
            form.submit();
        });
  
    }

    function deleteMember() {
      $("#btnDeleteMember").click(function() {
        if (!confirm("?????? ????????? ?????????????????????????")) {
          return;
        }

        $("#deleteForm").submit();
      });
    }
    
    
    
    
    $(document).ready(function () {
        AlertafterChangingPw();
        clickSignOut()
        deleteMember()
    });
  </script>

</body>

</html>