<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%@ include file="./myinclude/testheader.jsp" %>


			<div class="carousel slide" id="carousel-box">
				<ol class="carousel-indicators">
					<li data-slide-to="0" data-target="#carousel-box" class="active">
					</li>
					<li data-slide-to="1" data-target="#carousel-box">
					</li>
					<li data-slide-to="2" data-target="#carousel-box">
					</li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img class="d-block w-100" alt="Carousel Bootstrap First" src="https://www.layoutit.com/img/sports-q-c-1600-500-1.jpg">
						<div class="carousel-caption">
							<h4>
								제목1
							</h4>
							<p>
								내용1
							</p>
						</div>
					</div>
					<div class="carousel-item">
						<img class="d-block w-100" alt="Carousel Bootstrap Second" src="https://www.layoutit.com/img/sports-q-c-1600-500-2.jpg">
						<div class="carousel-caption">
							<h4>
							 	제목2
							</h4>
							<p>
								내용2
							</p>
						</div>
					</div>
					<div class="carousel-item">
						<img class="d-block w-100" alt="Carousel Bootstrap Third" src="https://www.layoutit.com/img/sports-q-c-1600-500-3.jpg">
						<div class="carousel-caption">
							<h4>
								제목3
							</h4>
							<p>
								내용3
							</p>
						</div>
					</div>
				</div> <a class="carousel-control-prev" href="#carousel-box" data-slide="prev"><span class="carousel-control-prev-icon"></span> <span class="sr-only">Previous</span></a> <a class="carousel-control-next" href="#carousel-box" data-slide="next"><span class="carousel-control-next-icon"></span> <span class="sr-only">Next</span></a>
			</div>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item">
						<a href="#">1</a>
					</li>
					<li class="breadcrumb-item">
						<a href="#">2</a>
					</li>
					<li class="breadcrumb-item active">
						3
					</li>
				</ol>
			</nav>
		
		<br><br>	
	  	<div id="visual" class="text-center" style="border: solid 1px;">
	  		<h1> 테마 </h1>
	  		<div style="font-size: 15px" class="text-right">
	  			<a href="${contextPath}/quest/info">VIEW MORE></a>
	  		</div>
	  		<div style="height: 20px"></div>
	  		<ul class="slide_wrap">
		  		<c:forEach items="${questList}" var="qList">
		  			<li class="slide_li">
			    		<img alt="dd" src="${contextPath}/resources/image/img_main3.jpg" style="height: 300px; width: 300px;">
			    		<div><c:out value="${qList.questName}"/></div>
			    		<div><c:out value="${qList.genre}"/></div>
			    		<div><c:out value="${qList.difficulty}"/></div>
		    		</li>
		  		</c:forEach>
	  		</ul> 
		</div>
		<br><br>
		<!-- 사용 경고문 -->
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12 text-center" >
					<div>10분전 도착하기 / 누설 금지 / 사진 촬영 금지 / 음주자 이용금지 / 위험물품 반입 금지</div>
				</div>
			</div>
		</div>
		<br><br>
		
    <script>
    $( document ).ready( function() {
    	
    	$('.slide_wrap').slick({
    	  	  dots : true,
    	  	  autoplay : true,
    	  	  autoplaySpeed : 4000,
			  infinite: true,
			  speed: 200,
			  pauseOnHover : true,
			  slidesToShow: 3,
			  slidesToScroll: 1,
			  arrows : true,
			  draggable : true,
			  dotsClass : "custom-dots",

			  responsive: [
			    {
			      breakpoint: 1024,
			      settings: {
			        slidesToShow: 3,
			        slidesToScroll: 3,
			        infinite: true,
			        dots: true
			      }
			    },
			    {
			      breakpoint: 600,
			      settings: {
			        slidesToShow: 2,
			        slidesToScroll: 2
			      }
			    },
			    {
			      breakpoint: 480,
			      settings: {
			        slidesToShow: 1,
			        slidesToScroll: 1
			      }
			    }
			    // You can unslick at a given breakpoint now by adding:
			    // settings: "unslick"
			    // instead of a settings object
			  ]
			});
    	
      } );
	
</script>

<script>/* 
	$(function(){
		$('#slider-div').slick({
			slide: 'div',		//슬라이드 되어야 할 태그 ex) div, li 
			infinite : true, 	//무한 반복 옵션	 
			slidesToShow : 4,		// 한 화면에 보여질 컨텐츠 개수
			slidesToScroll : 1,		//스크롤 한번에 움직일 컨텐츠 개수
			speed : 100,	 // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
			arrows : true, 		// 옆으로 이동하는 화살표 표시 여부
			dots : true, 		// 스크롤바 아래 점으로 페이지네이션 여부
			autoplay : true,			// 자동 스크롤 사용 여부
			autoplaySpeed : 10000, 		// 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
			pauseOnHover : true,		// 슬라이드 이동	시 마우스 호버하면 슬라이더 멈추게 설정
			vertical : false,		// 세로 방향 슬라이드 옵션
			prevArrow : "<button type='button' class='slick-prev'>Previous</button>",		// 이전 화살표 모양 설정
			nextArrow : "<button type='button' class='slick-next'>Next</button>",		// 다음 화살표 모양 설정
			dotsClass : "slick-dots", 	//아래 나오는 페이지네이션(점) css class 지정
			draggable : true, 	//드래그 가능 여부 
			
			responsive: [ // 반응형 웹 구현 옵션
				{  
					breakpoint: 960, //화면 사이즈 960px
					settings: {
						//위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
						slidesToShow:3 
					} 
				},
				{ 
					breakpoint: 768, //화면 사이즈 768px
					settings: {	
						//위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
						slidesToShow:2 
					} 
				}
			]
		
		});
	}) */
  	
	//슬라이더 동적 추가
	//$('#slider-div').slick('slickAdd',"<div>새로운 아이템</div>");
	
	//슬라이더 파괴(다른 슬라이더가 있는데 슬라이더를 다시 생성하는 경우 오류. 제거하고 생성할 것)
	//$('#slider-div').slick("unslick")
	
	//슬라이더 특정 아이템 삭제
	//$('#slider-div').slick('slickRemove',0);	//특정 인덱스 번호에 있는 slider 삭제
	//$('#slider-div').slick('slickRemove',false);	//false이면 맨 마지막 슬라이더 삭제
	//$('#slider-div').slick('slickRemove',true);	// true이면 맨 앞 슬라이더 삭제
	
	//원하는 슬라이더로 이동
	//$('#slider-div').slick('goTo', 1);
	
</script>




<%@ include file="./myinclude/testfooter.jsp" %>