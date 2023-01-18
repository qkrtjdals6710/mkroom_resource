<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>


    
<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>mkroom</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
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
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="${contextPath}/resources/skillhunt-master/js/google-map.js"></script>
	<script src="${contextPath}/resources/skillhunt-master/js/main.js"></script>
  </head>
  
  <body>
    
	  <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container-fluid px-md-4	">
	      <a class="navbar-brand" href="index.html">mkroom</a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item"><a href="index.html" class="nav-link">메인</a></li>
	          <li class="nav-item"><a href="browsejobs.html" class="nav-link">소개</a></li>
	          <li class="nav-item"><a href="candidates.html" class="nav-link">테마</a></li>
	          <li class="nav-item active"><a href="blog.html" class="nav-link">문의</a></li>
	          <li class="nav-item"><a href="contact.html" class="nav-link">지점</a></li>
	          <li class="nav-item cta mr-md-1"><a href="new-post.html" class="nav-link">Post a Job</a></li>
	          <li class="nav-item cta cta-colored"><a href="job-post.html" class="nav-link">Want a Job</a></li>

	        </ul>
	      </div>
	    </div>
	  </nav>
	  
 
	
    <!-- END nav -->