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
<style type="text/css">
	.nav-link{
		color:#fff;
	}
	.nav-link:hover{
		color:#a80303;
	}
	.nav-pills .nav-link.active{
		background-color: #a80303;
	}
	.card-body{
		color:#fff !important;
	}
	.apexcharts-legend-text{
		color: #fff !important;
	}
	text{
		fill: #fff;
	}
	text title{
		fill: #a80303;
	}
	.apexcharts-menu{
		background: #202020 !important;
		border: 1px solid #202020 !important;
	}
	.apexcharts-tooltip.apexcharts-theme-light .apexcharts-tooltip-title{
	    background: #202020 !important;
   		border-bottom: 1px solid #202020 !important;
	}
	.apexcharts-tooltip.apexcharts-theme-light{
		border: 1px solid #202020 !important;
   		background: #202020 !important;
	}
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
          <a class="nav-link collapsed" href="${pageContext.request.contextPath}/admin/bookingAndPaymentDataList?pageNum=1&rowAmountPerPage=10">
            <i class="bi bi-menu-button-wide"></i>
            <span>예약현황</span>
          </a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link" data-bs-target="#charts-nav" data-bs-toggle="collapse" href="#">
            <i class="bi bi-bar-chart"></i>
            <span>차트</span>
            <i class="bi bi-chevron-down ms-auto"></i>
          </a>
          
          <ul id="charts-nav" class="nav-content collapse show" data-bs-parent="#sidebar-nav">
            <li>
              <a href="${pageContext.request.contextPath}/admin/charts">
                <i class="bi bi-circle"></i><span>최근동향</span>
              </a>
            </li>
            <li>
              <a href="${pageContext.request.contextPath}/admin/sales" class="active">
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
      <h1>통계</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/">Home</a></li>
        </ol>
      </nav>
    </div><!-- End Page Title -->


    <section class="section">
      <div class="row">
        <div class="col-lg-12">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">지점별 퀘스트 작년매출</h5>
    
              <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                <li class="nav-item" role="presentation">
                  <button class="nav-link active" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home"
                    type="button" role="tab" aria-controls="pills-home" aria-selected="true">구로점</button>
                </li>
                <li class="nav-item" role="presentation">
                  <button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile"
                    type="button" role="tab" aria-controls="pills-profile" aria-selected="false"
                    tabindex="-1">신도림점</button>
                </li>
                <li class="nav-item" role="presentation">
                  <button class="nav-link" id="pills-contact-tab" data-bs-toggle="pill" data-bs-target="#pills-contact"
                    type="button" role="tab" aria-controls="pills-contact" aria-selected="false"
                    tabindex="-1">신촌점</button>
                </li>
              </ul>
              <div class="tab-content pt-2" id="myTabContent">
                <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="home-tab">
                  <!-- Column Chart -->
                  <div id="columnChart1"></div>
                  <script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
                  <script>
                    $(document).ready(function () {
                      $.ajax({
                        url: "${pageContext.request.contextPath}/admin/sales/salesByBranchLocationList/" + "구로점",
                        method: "GET",
                        dataType: "json",
                        success: function (response) {

                          const tempList1 = []; // 셜록홈즈
                          const tempList2 = []; // 지구탈출
                          const tempList3 = []; // 황금열쇠

                          for (let i = 0; i < 12 * 3; i++) {
                            const element = response[i];

                            if (element.questName === '셜록홈즈') {
                              tempList1.push(element);
                            } else if (element.questName === '지구탈출') {
                              tempList2.push(element);
                            } else if (element.questName === '황금열쇠') {
                              tempList3.push(element);
                            }
                          }

                          const list1 = tempList1.reverse(); // 셜록홈즈
                          const salesList1 = [];
                          const monthList = [];

                          list1.forEach((element) => {
                            salesList1.push(element.sales / 10000);
                          });
                          list1.forEach((element) => {
                            monthList.push(element.month);
                          });

                          const list2 = tempList2.reverse(); // 지구탈출
                          const salesList2 = [];

                          list2.forEach((element) => {
                            salesList2.push(element.sales / 10000);
                          });

                          const list3 = tempList3.reverse(); // 황금열쇠
                          const salesList3 = [];

                          list3.forEach((element) => {
                            salesList3.push(element.sales / 10000);
                          });

                          new ApexCharts(document.querySelector("#columnChart1"), {
                            series: [{
                              name: list1[0].questName,
                              data: salesList1
                            }, {
                              name: list2[0].questName,
                              data: salesList2
                            }, {
                              name: list3[0].questName,
                              data: salesList3
                            }],
                            chart: {
                              type: 'bar',
                              height: 350
                            },
                            plotOptions: {
                              bar: {
                                horizontal: false,
                                columnWidth: '55%',
                                endingShape: 'rounded'
                              },
                            },
                            dataLabels: {
                              enabled: false
                            },
                            stroke: {
                              show: true,
                              width: 2,
                              colors: ['transparent']
                            },
                            xaxis: {
                              categories: monthList,
                            },
                            yaxis: {
                              title: {
                                text: '(만원)'
                              }
                            },
                            fill: {
                              opacity: 1
                            },
                            tooltip: {
                              y: {
                                formatter: function (val) {
                                  return val + "만원"
                                }
                              }
                            }
                          }).render();
                        }
                      })
                    });

                  </script>
                  <!-- End Column Chart -->
                </div>
    
                <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="profile-tab">
                  <!-- Column Chart -->
                  <div id="columnChart2"></div>
                  <script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
                  <script>
                    $(document).ready(function () {
                      $.ajax({
                        url: "${pageContext.request.contextPath}/admin/sales/salesByBranchLocationList/" + "신도림점",
                        method: "GET",
                        dataType: "json",
                        success: function (response) {

                          const tempList1 = []; // 셜록홈즈
                          const tempList2 = []; // 지구탈출
                          const tempList3 = []; // 황금열쇠

                          for (let i = 0; i < 12 * 3; i++) {
                            const element = response[i];

                            if (element.questName === '셜록홈즈') {
                              tempList1.push(element);
                            } else if (element.questName === '지구탈출') {
                              tempList2.push(element);
                            } else if (element.questName === '황금열쇠') {
                              tempList3.push(element);
                            }
                          }

                          const list1 = tempList1.reverse(); // 셜록홈즈
                          const salesList1 = [];
                          const monthList = [];

                          list1.forEach((element) => {
                            salesList1.push(element.sales / 10000);
                          });
                          list1.forEach((element) => {
                            monthList.push(element.month);
                          });

                          const list2 = tempList2.reverse(); // 지구탈출
                          const salesList2 = [];

                          list2.forEach((element) => {
                            salesList2.push(element.sales / 10000);
                          });

                          const list3 = tempList3.reverse(); // 황금열쇠
                          const salesList3 = [];

                          list3.forEach((element) => {
                            salesList3.push(element.sales / 10000);
                          });

                          new ApexCharts(document.querySelector("#columnChart2"), {
                            series: [{
                              name: list1[0].questName,
                              data: salesList1
                            }, {
                              name: list2[0].questName,
                              data: salesList2
                            }, {
                              name: list3[0].questName,
                              data: salesList3
                            }],
                            chart: {
                              type: 'bar',
                              height: 350
                            },
                            plotOptions: {
                              bar: {
                                horizontal: false,
                                columnWidth: '55%',
                                endingShape: 'rounded'
                              },
                            },
                            dataLabels: {
                              enabled: false
                            },
                            stroke: {
                              show: true,
                              width: 2,
                              colors: ['transparent']
                            },
                            xaxis: {
                              categories: monthList,
                            },
                            yaxis: {
                              title: {
                                text: '(만원)'
                              }
                            },
                            fill: {
                              opacity: 1
                            },
                            tooltip: {
                              y: {
                                formatter: function (val) {
                                  return val + "만원"
                                }
                              }
                            }
                          }).render();
                        }
                      })
                    });

                  </script>
                  <!-- End Column Chart -->
                </div>

                <div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="contact-tab">
                  <!-- Column Chart -->
                  <div id="columnChart3"></div>
                  <script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
                  <script>
                    $(document).ready(function () {
                      $.ajax({
                        url: "${pageContext.request.contextPath}/admin/sales/salesByBranchLocationList/" + "신촌점",
                        method: "GET",
                        dataType: "json",
                        success: function (response) {

                          const tempList1 = []; // 셜록홈즈
                          const tempList2 = []; // 지구탈출
                          const tempList3 = []; // 황금열쇠

                          for (let i = 0; i < 12 * 3; i++) {
                            const element = response[i];

                            if (element.questName === '셜록홈즈') {
                              tempList1.push(element);
                            } else if (element.questName === '지구탈출') {
                              tempList2.push(element);
                            } else if (element.questName === '황금열쇠') {
                              tempList3.push(element);
                            }
                          }

                          const list1 = tempList1.reverse(); // 셜록홈즈
                          const salesList1 = [];
                          const monthList = [];

                          list1.forEach((element) => {
                            salesList1.push(element.sales / 10000);
                          });
                          list1.forEach((element) => {
                            monthList.push(element.month);
                          });

                          const list2 = tempList2.reverse(); // 지구탈출
                          const salesList2 = [];

                          list2.forEach((element) => {
                            salesList2.push(element.sales / 10000);
                          });

                          const list3 = tempList3.reverse(); // 황금열쇠
                          const salesList3 = [];

                          list3.forEach((element) => {
                            salesList3.push(element.sales / 10000);
                          });

                          new ApexCharts(document.querySelector("#columnChart3"), {
                            series: [{
                              name: list1[0].questName,
                              data: salesList1
                            }, {
                              name: list2[0].questName,
                              data: salesList2
                            }, {
                              name: list3[0].questName,
                              data: salesList3
                            }],
                            chart: {
                              type: 'bar',
                              height: 350
                            },
                            plotOptions: {
                              bar: {
                                horizontal: false,
                                columnWidth: '55%',
                                endingShape: 'rounded'
                              },
                            },
                            dataLabels: {
                              enabled: false
                            },
                            stroke: {
                              show: true,
                              width: 2,
                              colors: ['transparent']
                            },
                            xaxis: {
                              categories: monthList,
                            },
                            yaxis: {
                              title: {
                                text: '(만원)'
                              }
                            },
                            fill: {
                              opacity: 1
                            },
                            tooltip: {
                              y: {
                                formatter: function (val) {
                                  return val + "만원"
                                }
                              }
                            }
                          }).render();
                        }
                      })
                    });

                  </script>
                  <!-- End Column Chart -->
                </div>
    
              </div>

          </div>
        </div><!-- End Pills Tabs -->
    
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
	

	$(document).ready(function() {
		

		clickSignOut()


	});

  </script>



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

</body>

</html>