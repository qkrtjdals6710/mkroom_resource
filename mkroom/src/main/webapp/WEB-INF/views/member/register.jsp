<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>회원가입</title>
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

  <main>
    <div class="container">

      <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

              <div class="d-flex justify-content-center py-4">
                <a href="${pageContext.request.contextPath}/" class="logo d-flex align-items-center w-auto">
                  <span class="d-none d-lg-block">mkroom</span>
                </a>
              </div><!-- End Logo -->

              <div class="card mb-3">

                <div class="card-body">

                  <div class="pt-4 pb-2">
                    <h5 class="card-title text-center pb-0 fs-4">회원가입</h5>
                    <p class="text-center small">계정정보를 입력해주세요</p>
                  </div>

                  <form class="row g-3 needs-validation" novalidate
                        action="${pageContext.request.contextPath}/member/register" method="POST">
                    <div class="col-12">
                      <label for="userId" class="form-label">아이디</label>
                      <input type="text" name="userId" class="form-control" id="userId" required>
                      <div class="invalid-feedback">아이디를 입력해주세요!</div>
                    </div>

                    <div class="col-12">
                      <label for="userPw" class="form-label">비밀번호</label>
                      <input type="text" name="userPw" class="form-control" id="userPw" required>
                      <label class="form-check-label" for="hide" class="form-label">hide password</label>
                      <input class="form-check-input" type="checkbox" name="hide" id="hide">
                      <div class="invalid-feedback">비밀번호를 입력해주세요!</div>
                    </div>

                    <div class="col-12">
                      <label for="userName" class="form-label">이름</label>
                      <input type="text" name="userName" class="form-control" id="userName" required>
                      <div class="invalid-feedback">이름을 입력해주세요!</div>
                    </div>

                    <div class="col-12">
                      <label for="phoneNumber" class="form-label">전화번호</label>
                      <input type="text" name="phoneNumber" class="form-control" id="phoneNumber" required>
                      <div class="invalid-feedback">전화번호를 입력해주세요!</div>
                    </div>

                    <div class="col-12">
                      <label for="email" class="form-label">이메일</label>
                      <input type="text" name="email" class="form-control" id="email" required>
                      <div class="invalid-feedback">이메일을 입력해주세요!</div>
                    </div>


                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

                    <div class="col-12">
                      <div class="form-check">
                        <input class="form-check-input" name="terms" type="checkbox" value="" id="acceptTerms" required>
                        <label class="form-check-label" for="acceptTerms">I agree and accept the <a href="#">terms and conditions</a></label>
                        <div class="invalid-feedback">약관 동의를 하셔야합니다.</div>
                      </div>
                    </div>
                    <div class="col-12">
                      <button class="btn btn-primary w-100" type="submit">회원가입</button>
                    </div>
                    <div class="col-12">
                      <p class="small mb-0">이미 계정이 존재하신가요? <a href="${pageContext.request.contextPath}/login">로그인</a></p>
                    </div>
                  </form>

                </div>
              </div>

              <div class="credits">
                <!-- All the links in the footer should remain intact. -->
                <!-- You can delete the links only if you purchased the pro version. -->
                <!-- Licensing information: https://bootstrapmade.com/license/ -->
                <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
                <a href="${pageContext.request.contextPath}/">Go home</a>
              </div>

            </div>
          </div>
        </div>

      </section>

    </div>
  </main><!-- End #main -->

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

    function validateUserId(userId) {
      $.ajax({
        url: "${pageContext.request.contextPath}/validateUserId/" + userId,
        method: "GET",
        success: function(response) {
          alert(response);
        },
        error: function(xhr, status) {
          alert(xhr.responseText);
          $("input[name=userId]").val("");
        }
      });
          
    }

    function isPhoneNumber(phone) {
      // Use a regular expression to test the phone number against a pattern
      var reg = /^\d{2,3}-?\d{3,4}-?\d{4}$/;
      return reg.test(phone);
    }
    function isEmail(email) {
      var reg = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

      return reg.test(email);
    }
    
    function hidePassword() {
      if ($("#hide")[0].checked === false) {
          $("#userPw").attr("type", "text");
      } else {
          $("#userPw").attr("type", "password");
      }
    }

    $(document).ready(function() {
      $("#hide").click(function() {
          hidePassword()
      });

      $("input[name=userId]").change(function() {
        if ($(this).val()) {
          validateUserId($(this).val());
        }
          
      });

      $("input[name=phoneNumber]").change(function() {
        if (isPhoneNumber($(this).val())) {
          
        } else {
          $(this).val("");
          alert("올바른 전화번호를 입력해주세요");
        }
      });

      $("input[name=email]").change(function() {
        if (isEmail($(this).val())) {
          
        } else {
          $(this).val("");
          alert("올바른 이메일을 입력해주세요");
        }
      });
    });
  </script>

</body>

</html>