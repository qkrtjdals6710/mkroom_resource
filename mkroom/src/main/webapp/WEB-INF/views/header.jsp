<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>


    
<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>mkroom</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta id="_csrf" name="_csrf" th:content="${_csrf.token}"/>
	<meta id="_csrf_header" name="_csrf_header" th:content="${_csrf.headerName}"/>
    
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${contextPath}/resources/skillhunt-master/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="${contextPath}/resources/skillhunt-master/css/animate.css">
    <link rel="stylesheet" href="${contextPath}/resources/skillhunt-master/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${contextPath}/resources/skillhunt-master/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${contextPath}/resources/skillhunt-master/css/magnific-popup.css">
    <link rel="stylesheet" href="${contextPath}/resources/skillhunt-master/css/aos.css">
    <link rel="stylesheet" href="${contextPath}/resources/skillhunt-master/css/ionicons.min.css">
    <link rel="stylesheet" href="${contextPath}/resources/skillhunt-master/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="${contextPath}/resources/skillhunt-master/css/jquery.timepicker.css">
    <link rel="stylesheet" href="${contextPath}/resources/skillhunt-master/css/flaticon.css">
    <link rel="stylesheet" href="${contextPath}/resources/skillhunt-master/css/icomoon.css">
    <link rel="stylesheet" href="${contextPath}/resources/skillhunt-master/css/style.css">
    
	<script src="${contextPath}/resources/skillhunt-master/js/jquery.min.js"></script>
	<script src="${contextPath}/resources/skillhunt-master/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="${contextPath}/resources/skillhunt-master/js/popper.min.js"></script>
	<script src="${contextPath}/resources/skillhunt-master/js/bootstrap.min.js"></script>
	<script src="${contextPath}/resources/skillhunt-master/js/jquery.easing.1.3.js"></script>
	<script src="${contextPath}/resources/skillhunt-master/js/jquery.waypoints.min.js"></script>
	<script src="${contextPath}/resources/skillhunt-master/js/jquery.stellar.min.js"></script>
	<script src="${contextPath}/resources/skillhunt-master/js/owl.carousel.min.js"></script>
	<script src="${contextPath}/resources/skillhunt-master/js/jquery.magnific-popup.min.js"></script>
	<script src="${contextPath}/resources/skillhunt-master/js/aos.js"></script>
	<script src="${contextPath}/resources/skillhunt-master/js/jquery.animateNumber.min.js"></script>
	<script src="${contextPath}/resources/skillhunt-master/js/scrollax.min.js"></script>
	<script src="${contextPath}/resources/skillhunt-master/js/main.js"></script>
	<style>
		.replyli {
/* 			text-align:center; */
			border-bottom: 1px solid #BDBDBD;
			margin-top: 10px;
		}
		.btn-submit{
			background: #ffffff; color:#A9BCF5;
		}
		.main{
			color: #1C1C1C;
		}
	</style>
  </head>
  
  <body>
    
	  <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container-fluid px-md-4">
	      <a class="navbar-brand main" href="${contextPath}/">mkroom</a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item"><a href="${contextPath}/eventboard/list" class="nav-link"><strong>공지/이벤트</strong></a></li>
	          <li class="nav-item"><a href="${contextPath}/quest/list" class="nav-link"><strong>테마/예약하기</strong></a></li>
	          <li class="nav-item"><a href="${contextPath}/qna/qnalist" class="nav-link"><strong>FAQ/QnA</strong></a></li>
	          <li class="nav-item"><a href="${contextPath}/contact" class="nav-link"><strong>사업문의/오시는길</strong></a></li>
			  
			  <!-- 로그인 전 -->
			  <security:authorize access="isAnonymous()">
              	<li class="nav-item cta mr-md-1"><a href="${pageContext.request.contextPath}/login" class="nav-link"><strong>로그인</strong></a></li>
			  </security:authorize>

			  <!-- 로그인 후 -->
	          <security:authorize access="hasRole('MEMBER')">
				<security:authentication var="principal" property="principal" />
				<li class="nav-item cta mr-md-1"><a class="nav-link" href="${pageContext.request.contextPath}/member/detail?userId=${principal.username}"><strong>내정보</strong></a></li>
			  </security:authorize>
			  
	          <security:authorize access="hasRole('MEMBER')">
				<li class="nav-item cta mr-md-1"><a class="nav-link" id="logoutLink"><strong>로그아웃</strong></a></li>
			  </security:authorize>
	
	        </ul>
	      </div>
	    </div>
	  </nav>
	  
	  <script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
 	  <script type="text/javascript">
		function logOut() {
			var form = $('<form action="${pageContext.request.contextPath }/logout" method="POST">');
			form.append('<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />');
			$("body").append(form);
			if (!confirm("로그아웃 하시겠습니까?")) {
				return;
			}
			form.submit();
		}
		$(document).ready(function() {
			$("#logoutLink").click(function() {
				logOut();
			});
		
		});
	  	

 	  </script>
	
    <!-- END nav -->