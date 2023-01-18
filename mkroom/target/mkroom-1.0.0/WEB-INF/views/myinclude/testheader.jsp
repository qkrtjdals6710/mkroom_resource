<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>mkroom</title>
    
	<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
	<link rel="icon" href="/favicon.ico" type="image/x-icon">

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/bootstrap-grid.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/bootstrap-reboot.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/slick/slick.css" rel="stylesheet">
    <link href="${contextPath}/resources/slick/slick-theme.css" rel="stylesheet"><!-- 
	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/> -->

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
    <script src="${contextPath}/resources/js/bootstrap.bundle.min.js"></script>
    <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
    <script src="${contextPath}/resources/slick/slick.min.js"></script><!-- 
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script> -->
    
    
    
    <style type="text/css">
    
    	html, body {
    		width: 100%; height: 100%;
    	}
    	body{
    		background-repeat: no-repeat;
    		background-position: center;
    		margin: 0 auto;/* 
    		position: relative; *//* 
    		background-color: #D3D3D3; */
 
    	}
    	.container {
    		width: 100%;
    	}
    	/* 
    	body::before{
	        content: ""; 
	        background-image: url('${contextPath}/resources/image/img_main4.jpg');
	        background-size: cover;
	        opacity: 0.7;
	        position: absolute;
	        top: 0px;
	        left: 0px;
	        right: 0px;
	        bottom: 0px;
    	} */
    	
    	.custom-dots{
			bottom: -25px;
			width: 100%;
			list-style: none;
			text-align: end;
			position: absolute;
			right: 15px;
			padding: 0;
    	}
    	
    	.custom-dots li {
			position: relative;
			display: inline-block;
			width: 20px;
			height: 20px;
			/*margin: 1px;*/
			padding: 0;
			cursor: pointer;
		}

		.custom-dots li button {
			font-size: 0;
			line-height: 0;
			display: block;
			width: 20px;
			height: 20px;
			padding: 5px;
			cursor: pointer;
			color: transparent;
			border: 0;
			outline: 0;
			background: 0 0;
		}
	
		.custom-dots li button:before {
			font-size: 2.7rem;
			line-height: 20px;
			position: absolute;
			top: 0;
			left: 0;
			width: 20px;
			height: 20px;
			content: '•';
			text-align: center;
			opacity: .75;
			color: #6D6968;
		}
		
		.custom-dots li.slick-active button:before {
			opacity: .75;
			color: #0081cc;
		}
    	
    	
    	.slick-wrap {
		  	margin-right: 30px; 
		}
		.slick-li {
		  	margin-right: -30px; 
		}
    	
    	
    	/* 
.visual{position:relative; width:100%; height:960px; }
.visual .slide_wrap{position:relative; width:100%; }
.visual .slide_wrap li{position:relative; }   */  	
    	
/* prev, next 버튼 css*//* 
.visual button.slick-arrow{font-size:0; position:absolute; left:50%; top:50%;  margin-top:-33px;  width:66px; height:66px; z-index:999; outline:0;}
.visual button.slick-prev{margin-left:-700px; background:url("${contextPath}/resources/image/nextArrow_ini") center no-repeat;}
.visual button.slick-prev:hover{margin-left:-700px; background:url("${contextPath}/resources/image/nextArrow_on") center no-repeat;}
.visual button.slick-next{margin-left:643px; background:url("${contextPath}/resources/image/nextArrow_ini") center no-repeat;}
.visual button.slick-next:hover{margin-left:643px; background:url("${contextPath}/resources/image/nextArrow_on") center no-repeat;}
.visual .slide_wrap .slide_txt{position:absolute; left:50%; top:50%; transform:translate(-50% , -50%); font-size:50px; line-height:1.8; font-weight:bold; color:red; text-align:center;  z-index:900;}
 */
    </style>

  </head>
  <body style="padding-top: 70px">

    <div class="container">
	<div class="row">
		<div class="col-md-12">
			
			<nav class="navbar navbar-expand-lg bg-dark navbar-dark fixed-top">

				<button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="navbar-toggler-icon"></span>
				</button> <a class="navbar-brand" href="${contextPath}/">mkroom</a>
				<div class="navbar-collapse collapse" id="bs-example-navbar-collapse-1">
					
					<ul class="navbar-nav ml-md-auto">
						<li class="nav-item active">
							 <a class="nav-link" href="#">mkroom 소개</a>
						</li>
						<li class="nav-item active">
							 <a class="nav-link" href="#">지점안내</a>
						</li>
						<li class="nav-item active">
							 <a class="nav-link" href="#">테마소개</a>
						</li>
						<li class="nav-item active">
							 <a class="nav-link" href="#">예약하기</a>
						</li>
						<li class="nav-item active">
							 <a class="nav-link" href="#">공지/이벤트</a>
						</li>
						
						<li class="nav-item dropdown">
							 <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown">밑으로 열리는 버튼</a>
							<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
								 <a class="dropdown-item" href="#">1</a> 
								 <a class="dropdown-item" href="#">2</a> 
								 <a class="dropdown-item" href="#">3</a>
								<div class="dropdown-divider">
								</div> 
								<a class="dropdown-item" href="#">4</a>
							</div>
						</li>
					</ul>
				</div>
			</nav>
	  
 
	
    <!-- END nav -->