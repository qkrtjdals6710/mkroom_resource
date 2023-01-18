<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:set var="contextPath" value="<%=request.getContextPath()%>"/>    

<%@ include file="./header.jsp" %>

	<form class="form-inline" id="frmSendValue" name="frmSendValue" action="${contextPath}/quest/detail" method="get">
		<input type="hidden" name="pageNum" id="pageNum" value="${pagingCreator.questPagingDTO.pageNum }"/>
		<input type="hidden" name="rowAmountPerPage" id="rowAmountPerPage"  value="${pagingCreator.questPagingDTO.rowAmountPerPage }"/>
		<input type="hidden" name="lastPageNum" id="lastPageNum" value="${pagingCreator.lastPageNum }"/>
	</form>
	
<!-- 	상단     -->
<style>
	html{
	overflow-x:hidden; 
	}
	.slide {
	  /* layout */
	  display: flex;
	  flex-wrap: nowrap;
	  /* 컨테이너의 내용물이 컨테이너 크기(width, height)를 넘어설 때 보이지 않도록 하기 위해 hidden을 준다. */
	  overflow: hidden;
	
	  /* position */
	  /* slide_button의 position absolute가 컨테이너 안쪽에서 top, left, right offset이 적용될 수 있도록 relative를 준다. (기본값이 static인데, static인 경우 그 상위 컨테이너로 나가면서 현재 코드에선 html을 기준으로 offset을 적용시키기 때문) */
	  position: relative;
	
	  /* size */
	  width: 100vw;
	
	  /* slide drag를 위해 DOM요소가 드래그로 선택되는것을 방지 */
	  user-select: none;
	  
/* 	  overlay */
	  background: #000000;
	  background: #2d2d2d;
	  opacity: .9;
	}
	.slide_item {
	  /* layout */
	  display: flex;
	  align-items: center;
	  justify-content: center;
	
	  /* position - 버튼 클릭시 left offset값을 적용시키기 위해 */
	  position: relative;
	  left: 0px;
	
	  /* size */
	  width: 100vw;
	  /* flex item의 flex-shrink는 기본값이 1이므로 컨테이너 크기에 맞게 줄어드는데, 슬라이드를 구현할 것이므로 줄어들지 않도록 0을 준다. */
	  flex-shrink: 0;
	
	  /* transition */
	  transition: left 0.15s;
	}
	.slide_button {
	  /* layout */
	  display: flex;
	  justify-content: center;
	  align-items: center;
	
	  /* position */
	  position: absolute;
	  /* 버튼이 중앙에 위치하게 하기위해 계산 */
	  top: calc(50% - 16px);
	
	  /* size */
	  width: 32px;
	  height: 32px;
	
	  /* style */
	  border-radius: 100vw;
	  background-color: #cccc;
	  cursor: pointer;
	}
	
	.slide_prev_button {
	  left: 3%;
	}
	.slide_next_button {
	  right: 3%;
	}
	
	/* 페이지네이션 스타일 */
	ul,
	li {
	  list-style-type: none;
	  padding: 0;
	  margin: 0;
	}
	.slide_pagination {
	  /* layout */
	  display: flex;
	  gap: 5px;
	
	  /* position */
	  position: absolute;
	  bottom: 0;
	  /* left:50%, translateX(-50%)를 하면 가로 가운데로 위치시킬 수 있다. */
	  left: 50%;
	  transform: translateX(-50%);
	}
	.slide_pagination > li {
	  /* 현재 슬라이드가 아닌 것은 투명도 부여 */
	  color: #3c0000;
	  cursor: pointer;
	  font-size: 25px;
	}
	.slide_pagination > li.active {
	  /* 현재 슬라이드 색상은 투명도 없이 */
	  color: #a80303;
	}
	
	.slide_item_duplicate {
	  display: flex;
	  align-items: center;
	  justify-content: center;
	  position: relative;
	  left: 0px;
	  width: 100vw;
	  flex-shrink: 0;
	  transition: left 0.15s;
	}
	.slide_item > img{
		width: 100vw;
	}
	.slide_item > a{
		color: #fff !important;
		position: absolute;
		top: 50%;
		left:50%;
		transform: translate(-50%,-50%);
	}

	/* quest slide css */
	.swiper-container {
		height:440px;
		margin-top: 20px;
		margin-bottom: 20px;
		padding-left:40px !important;
		padding-right:40px !important; 
		position: relative;
	}
	.swiper-slide {
		text-align:center;
		display:flex;
		align-items:center;
		justify-content:center;
	}
	.swiper-slide img {
		max-width:100%;
	}
	.swiper-slide a > span {
		color: #202020 !important;
		text-align: left !important;
	}

	tr{
		border-bottom:1px solid #3c0000 !important; 
		height: 70px;
	}
	.table1{
		display: flex;
		justify-content: center;
		align-items: center;
	}
	
	
	<%-- 팝업 --%>
	.mover {
	  /* width: 100px;
	  height: 125px; */
	  background: #febf00;
	  /* display: flex; */
	  justify-content: center;
	  align-items: center;
	  font-size: 1.3rem;
	  font-weight: bold;
	  
	  position: absolute;
	  left: 50px;
	  top: 50px;
	  
	  user-select: none;
	  
	  /*  drag cursor   */
	  cursor: grab;
	}
	.mover:active {
	  cursor: grabbing;
	}
	<%-- 팝업 끝 --%>
	
	
</style>
<div class="slide slide_wrap">
	<div class="slide_item item1">
		<img src="${contextPath}/resources/skillhunt-master/images/mainimg1.jpg">
		<a href="${contextPath}/eventboard/list"><h2><strong>공지사항/이벤트 가기</strong></h2></a>
	</div>
	<div class="slide_item item2">
		<img src="${contextPath}/resources/skillhunt-master/images/mainimg2.jpg">
		<a href="${contextPath}/quest/list"><h2><strong>테마/예약 가기</strong></h2></a>
 	</div>
	<div class="slide_item item3">
		<img src="${contextPath}/resources/skillhunt-master/images/mainimg3.jpg">
		<a href="${contextPath}/qna/qnalist"><h2><strong>QnA 문의하러 가기</strong></h2></a>
	</div>
	<div class="slide_prev_button slide_button">◀&nbsp;</div>
	<div class="slide_next_button slide_button">&nbsp;▶</div>
	<ul class="slide_pagination"></ul>
</div><!-- 상단 끝 -->
	
<!-- 게시물 표시 영역 -->
<section class="ftco-section" >
	<div class="board0">
		<div class="panel" style="padding-top:50px; padding-left:30px; padding-right:30px; ">
			<div class="container">
				<div class="row">
					<div class="col-md-6" style="font-size:25px; color:#202020;">
						<stong>퀘스트 소개</stong>
					</div>
					<div class="col-md-6">
						<div style="text-align: right;">
							<a href="${contextPath}/quest/list"><button type="button"class="btn btn-danger pull-right">더보기</button></a>
						</div>
					</div>
				</div>
				
				<div class="swiper-container">
					<div class="swiper-wrapper">
						<%--이곳에 c:foreach문을 넣으세용 --%>
						<c:forEach var="questInfo" items="${questList}" varStatus="status">
							<div class="swiper-slide">
								<a href='${contextPath += "/quest/detail?questName=" += questInfo.questName 
								                               += "&branchLocation=" += questInfo.branchLocation}'>										
									<c:set var="imagePath" value='${questInfo.fileInfos[0].uploadPath += "/"
																 += questInfo.fileInfos[0].uuid += "_" 
																 += questInfo.fileInfos[0].fileName}'/>						 
									<img alt="-" style="max-width: 100%; height: 192px;" src='${contextPath += "/displayThumbnail?fileName=C:/myupload/" += imagePath}'/><br>	
									<span><c:out value="${questInfo.questName}"/></span><br>
									<span>장르: <c:out value="${questInfo.genre}"/></span><br>
									<span>난이도: 
										<c:choose>
											<c:when test="${questInfo.difficulty == 1}">
												<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/starhaf.png">
											</c:when>
											<c:otherwise>
												<c:forEach begin="1" end="${(questInfo.difficulty) / 2}">
													<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/star.png">
												</c:forEach>
												<c:if test="${(questInfo.difficulty) % 2 == 1}">
													<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/starhaf.png">
												</c:if>
											</c:otherwise>
										</c:choose>
									</span><br>
									<span>인원: <c:out value="${questInfo.minPlayerNum}"/>~<c:out value="${questInfo.maxPlayerNum}"/></span><br>
									<span>제한시간: <c:out value="${questInfo.questTime}"/>분</span><br>
								</a>
							</div>
						</c:forEach>
					</div>
					<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
					<div class="swiper-button-prev"></div><!-- 이전 버튼 -->
				</div> <!-- questslider -->
				<hr>
				<img style="margin-top: 40px; margin-bottom: 40px;" alt="경고사항오류" width="100%" src="${contextPath}/resources/skillhunt-master/images/warning.png">
				<hr>
				<div style="text-align: center;">
					<h3>오시는길</h3><br>
				</div>
				<div class="row">
					<div class="col-md-6 table1" style="padding-right: 20px;">
						<table class="table" style="width: 500px; height: 210px;">
							<tbody>
							  <tr>
							    <td>영업시간</td>
							    <td>
							    	평일 10:00~17:00<br>
							    	주말 휴무
							    </td>
						      </tr>
							  <tr>
							    <td>전화번호</td>
							    <td>02-837-9922</td>
							  </tr>
							  <tr>
							    <td>주소</td>
							    <td>서울 구로구 시흥대로163길 33, 주호타워 2층,3층</td>
							  </tr> 
							</tbody>
						</table>
					</div>
					<div class="col-md-6" style="padding-left: 20px;">
						<img style="width: 100%;" alt="${contextPath}/resources/skillhunt-master/images/alt.png" src="${contextPath}/resources/skillhunt-master/images/map.png">
				    </div>
			    </div>
			</div><!-- container -->
		</div> <!-- panel -->
	</div> <!-- board0 -->
</section><!-- 게시물 표시 영역 끝 -->



<%-- 팝업 --%>
<div id="mainEventPop" class="mover" style="left: 420px; top: 420px;text-align: right;z-index : 5;">
	<div>
		<img alt="EVENTPOP" src="${contextPath}/resources/image/event_popup.png" style="-webkit-user-drag: none; ">
	</div>
	<div style="width:100%; height:43px; background-color: #6c757d">
		<input type="button" value="닫기" id="closePop">
	</div>
</div>
<%-- 팝업 끝--%>


<link rel="stylesheet" href="${contextPath}/resources/skillhunt-master/css/swiper.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

<script>

<%-- 팝업 --%>
window.onload = () => {
	  const $target = document.querySelector(".mover");
	  
	  draggable($target);
	  
	  document.getElementById('closePop').addEventListener("click", () => {
		  document.getElementById('mainEventPop').style="display:none;";
	  });
	  
	}
	
const draggable = ($target) => {
	  let isPress = false,
	      prevPosX = 0,
	      prevPosY = 0;
	  
	  $target.onmousedown = start;
	  $target.onmouseup = end;
	    
	  // 상위 영역
	  window.onmousemove = move;
	 
	  function start(e) {
	    prevPosX = e.clientX;
	    prevPosY = e.clientY;

	    isPress = true;
	  }

	  function move(e) {
	    if (!isPress) return;

	    const posX = prevPosX - e.clientX; 
	    const posY = prevPosY - e.clientY; 
	    
	    prevPosX = e.clientX; 
	    prevPosY = e.clientY;
	    
	    $target.style.left = ($target.offsetLeft - posX) + "px";
	    $target.style.top = ($target.offsetTop - posY) + "px";
	  }

	  function end() {
	    isPress = false;
	  }
	}

	<%-- 팝업 끝 --%>

	
	

//main slider--------------------------------------------------------------------
//슬라이크 전체 크기(width 구하기)
const slide = document.querySelector(".slide");
let slideWidth = 100;

// 버튼 엘리먼트 선택하기
const prevBtn = document.querySelector(".slide_prev_button");
const nextBtn = document.querySelector(".slide_next_button");

// 슬라이드 전체를 선택해 값을 변경해주기 위해 슬라이드 전체 선택하기
let slideItems = document.querySelectorAll(".slide_item");
// 현재 슬라이드 위치가 슬라이드 개수를 넘기지 않게 하기 위한 변수
const maxSlide = slideItems.length;

// 버튼 클릭할 때 마다 현재 슬라이드가 어디인지 알려주기 위한 변수
let currSlide = 1;

// 페이지네이션 생성
const pagination = document.querySelector(".slide_pagination");

for (let i = 0; i < maxSlide; i++) {
  if (i === 0) pagination.innerHTML += '<li class="active">•</li>';
  else pagination.innerHTML += '<li>•</li>';
}

const paginationItems = document.querySelectorAll(".slide_pagination > li");

// 무한 슬라이드를 위해 start, end 슬라이드 복사하기
const startSlide = slideItems[0];
const endSlide = slideItems[slideItems.length - 1];
const startElem = document.createElement("div");
const endElem = document.createElement("div");

endSlide.classList.forEach((c) => endElem.classList.add(c));
endElem.innerHTML = endSlide.innerHTML;

startSlide.classList.forEach((c) => startElem.classList.add(c));
startElem.innerHTML = startSlide.innerHTML;

// 각 복제한 엘리먼트 추가하기
slideItems[0].before(endElem);
slideItems[slideItems.length - 1].after(startElem);

// 슬라이드 전체를 선택해 값을 변경해주기 위해 슬라이드 전체 선택하기
slideItems = document.querySelectorAll(".slide_item");
//
let offset = slideWidth * currSlide;
slideItems.forEach((i) => {
  i.setAttribute("style", 'left: -'+offset+'vw');
});

function nextMove() {
  currSlide++;
  // 마지막 슬라이드 이상으로 넘어가지 않게 하기 위해서
  if (currSlide <= maxSlide) {
    // 슬라이드를 이동시키기 위한 offset 계산
    const offset = slideWidth * currSlide;
    // 각 슬라이드 아이템의 left에 offset 적용
    slideItems.forEach((i) => {
      i.setAttribute("style", 'left: -'+offset+'vw');
    });
    // 슬라이드 이동 시 현재 활성화된 pagination 변경
    paginationItems.forEach((i) => i.classList.remove("active"));
    paginationItems[currSlide - 1].classList.add("active");
  } else {
    // 무한 슬라이드 기능 - currSlide 값만 변경해줘도 되지만 시각적으로 자연스럽게 하기 위해 아래 코드 작성
    currSlide = 0;
    let offset = slideWidth * currSlide;
    slideItems.forEach((i) => {
      i.setAttribute("style", 'transition: ${0}s; left: -'+offset+'vw');
    });
    currSlide++;
    offset = slideWidth * currSlide;
    // 각 슬라이드 아이템의 left에 offset 적용
    setTimeout(() => {
      // 각 슬라이드 아이템의 left에 offset 적용
      slideItems.forEach((i) => {
        // i.setAttribute("style", 'transition: ${0}s; left: ${-offset}vw');
        i.setAttribute("style", 'transition: ${0.15}s; left: -'+offset+'vw');
      });
    }, 0);
    // // 슬라이드 이동 시 현재 활성화된 pagination 변경
    paginationItems.forEach((i) => i.classList.remove("active"));
    paginationItems[currSlide - 1].classList.add("active");
  }
}
function prevMove() {
  currSlide--;
  // 1번째 슬라이드 이하로 넘어가지 않게 하기 위해서
  if (currSlide > 0) {
    // 슬라이드를 이동시키기 위한 offset 계산
    const offset = slideWidth * currSlide;
    // 각 슬라이드 아이템의 left에 offset 적용
    slideItems.forEach((i) => {
      i.setAttribute("style", 'left: ${-offset}vw');
    });
    // 슬라이드 이동 시 현재 활성화된 pagination 변경
    paginationItems.forEach((i) => i.classList.remove("active"));
    paginationItems[currSlide - 1].classList.add("active");
  } else {
    // 무한 슬라이드 기능 - currSlide 값만 변경해줘도 되지만 시각적으로 자연스럽게 하기 위해 아래 코드 작성
    currSlide = maxSlide + 1;
    let offset = slideWidth * currSlide;
    // 각 슬라이드 아이템의 left에 offset 적용
    slideItems.forEach((i) => {
      i.setAttribute("style", 'transition: ${0}s; left: -'+offset+'vw');
    });
    currSlide--;
    offset = slideWidth * currSlide;
    setTimeout(() => {
      // 각 슬라이드 아이템의 left에 offset 적용
      slideItems.forEach((i) => {
        // i.setAttribute("style", 'transition: ${0}s; left: ${-offset}vw');
        i.setAttribute("style", 'transition: ${0.15}s; left: -'+offset+'vw');
      });
    }, 0);
    // 슬라이드 이동 시 현재 활성화된 pagination 변경
    paginationItems.forEach((i) => i.classList.remove("active"));
    paginationItems[currSlide - 1].classList.add("active");
  }
}

// 버튼 엘리먼트에 클릭 이벤트 추가하기
nextBtn.addEventListener("click", () => {
  // 이후 버튼 누를 경우 현재 슬라이드를 변경
  nextMove();
});
// 버튼 엘리먼트에 클릭 이벤트 추가하기
prevBtn.addEventListener("click", () => {
  // 이전 버튼 누를 경우 현재 슬라이드를 변경
  prevMove();
});

// 브라우저 화면이 조정될 때 마다 slideWidth를 변경하기 위해
window.addEventListener("resize", () => {
  slideWidth = slide.clientWidth;
});

// 각 페이지네이션 클릭 시 해당 슬라이드로 이동하기
for (let i = 0; i < maxSlide; i++) {
  // 각 페이지네이션마다 클릭 이벤트 추가하기
  paginationItems[i].addEventListener("click", () => {
    // 클릭한 페이지네이션에 따라 현재 슬라이드 변경해주기(currSlide는 시작 위치가 1이기 때문에 + 1)
    currSlide = i + 1;
    // 슬라이드를 이동시키기 위한 offset 계산
    const offset = slideWidth * currSlide;
    // 각 슬라이드 아이템의 left에 offset 적용
    slideItems.forEach((i) => {
      i.setAttribute("style", 'left: -'+offset+'vw');
    });
    // 슬라이드 이동 시 현재 활성화된 pagination 변경
    paginationItems.forEach((i) => i.classList.remove("active"));
    paginationItems[currSlide - 1].classList.add("active");
  });
}

// 드래그(스와이프) 이벤트를 위한 변수 초기화
let startPoint = 0;
let endPoint = 0;

// PC 클릭 이벤트 (드래그)
slide.addEventListener("mousedown", (e) => {
  startPoint = e.pageX; // 마우스 드래그 시작 위치 저장
});

slide.addEventListener("mouseup", (e) => {
  endPoint = e.pageX; // 마우스 드래그 끝 위치 저장
  if (startPoint < endPoint) {
    // 마우스가 오른쪽으로 드래그 된 경우
    prevMove();
  } else if (startPoint > endPoint) {
    // 마우스가 왼쪽으로 드래그 된 경우
    nextMove();
  }
});

// 모바일 터치 이벤트 (스와이프)
slide.addEventListener("touchstart", (e) => {
  startPoint = e.touches[0].pageX; // 터치가 시작되는 위치 저장
});
slide.addEventListener("touchend", (e) => {
  endPoint = e.changedTouches[0].pageX; // 터치가 끝나는 위치 저장
  if (startPoint < endPoint) {
    // 오른쪽으로 스와이프 된 경우
    prevMove();
  } else if (startPoint > endPoint) {
    // 왼쪽으로 스와이프 된 경우
    nextMove();
  }
});

// 기본적으로 슬라이드 루프 시작하기
let loopInterval = setInterval(() => {
  nextMove();
}, 3000);

// 슬라이드에 마우스가 올라간 경우 루프 멈추기
slide.addEventListener("mouseover", () => {
  clearInterval(loopInterval);
});

// 슬라이드에서 마우스가 나온 경우 루프 재시작하기
slide.addEventListener("mouseout", () => {
  loopInterval = setInterval(() => {
    nextMove();
  }, 3000);
});


$(".eventPopUp img").click(function(){
	debugger;
    var src = $(this).attr("src");
    //window.open(src);
});



//quest slider--------------------------------------------------------------------
new Swiper('.swiper-container', {

	slidesPerView : 3, // 동시에 보여줄 슬라이드 갯수
	spaceBetween : 30, // 슬라이드간 간격
	slidesPerGroup : 3, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

	// 그룹수가 맞지 않을 경우 빈칸으로 메우기
	// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
	loopFillGroupWithBlank : true,

	loop : true, // 무한 반복

	navigation : { // 네비게이션
		nextEl : '.swiper-button-next', // 다음 버튼 클래스명
		prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
	},
});
</script>		
<%@ include file="./footer.jsp" %>
