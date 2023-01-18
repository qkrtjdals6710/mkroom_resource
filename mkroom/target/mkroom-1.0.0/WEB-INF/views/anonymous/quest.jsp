<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%@ include file="../myinclude/testheader.jsp" %>


<form id="frmQuestInput">
	<%-- 시큐리티 적용할 곳 --%>
	<button type="button" class="btn btn-danger moveQuestInput">
		<div>퀘스트 추가</div>
	</button>
</form>
&nbsp;&nbsp;&nbsp;
<h2 class="text-center">테마</h2>
<hr>
<div class="row" >
	<div class="col-md-6">
		<form id="frmUp" action="${contextPath}/quest/detail">
			<span id="wrapRowAmountselect">
				<select id="selectRowAmount" name="rowAmountPerPage" >
					<option value="2" <c:out value="${(pagingCreator.questPagingDTO.rowAmountPerPage == '2') ? 'selected' : '' }"/>
						>2개</option>
					<option value="5" <c:out value="${(pagingCreator.questPagingDTO.rowAmountPerPage == '5') ? 'selected' : '' }"/>
						>5개</option>
					<option value="10" <c:out value="${(pagingCreator.questPagingDTO.rowAmountPerPage == '10') ? 'selected' : '' }"/>
						>10개</option>
				</select>
			</span>
			&nbsp;&nbsp;
			<span id="wrapLocation">		
				<!-- 분점 기준으로 정렬할 수 있도록 하는 select -->
				<select id="selectLocation" name="locationScope">
					<option value="" <c:out value="${(pagingCreator.questPagingDTO.locationScope == null) ? 'selected' : ''}"/> 
						>분점</option>
					<c:forEach items="${locationList}"  var="LList">
						<option <c:out value="${(pagingCreator.questPagingDTO.locationScope == LList.branchLocation) ? 'selected' : ''}"/> 
							><c:out value="${LList.branchLocation}"/></option>
					</c:forEach>			
				</select>
			</span>
			&nbsp;
			<span id="wrapDifficulty">	
				<!-- 난이도 기준으로 정렬할 수 있도록 하는 select -->
				<select id="selectDifficulty" name="diffScope">
					<option value="" <c:out value="${(pagingCreator.questPagingDTO.diffScope == null) ? 'selected' : ''}"/> 
						>난이도</option>
					<c:forEach items="${difficultyList}"  var="dList">
						<option <c:out value="${(pagingCreator.questPagingDTO.diffScope == dList.difficulty) ? 'selected' : ''}"/> 
							><c:out value="${dList.difficulty}"/></option>
					</c:forEach>			
				</select>
			</span>
			&nbsp;
			<span id="wrapQuestTime">		
				<!-- 시간 기준으로 정렬할 수 있도록 하는 select -->
				<select id="selectQuestTime" name="questTimeScope">
					<option value="" <c:out value="${(pagingCreator.questPagingDTO.questTimeScope == null) ? 'selected' : ''}"/> 
						>제한 시간</option>
					<c:forEach items="${questTimeList}"  var="QTList">
						<option <c:out value="${(pagingCreator.questPagingDTO.questTimeScope == QTList.questTime) ? 'selected' : ''}"/> 
							><c:out value="${QTList.questTime}"/></option>
					</c:forEach>			
				</select>
			</span>	
		</form> 
	</div><%-- col-6-end --%>
	<div class="col-md-6 text-right" >
		<form>
			<span class="text-right">
				<button type="button" class="btn btn-light btn-sm" style="border: solid 1px;"><a href="${contextPath}/quest/list">조건 리셋</a></button>
			</span>
		</form>
	</div>
</div><%-- row-end --%>

<hr>

<div class="container-fluid">
	<div class="row">
		<c:forEach var="quest" varStatus="questStatus" items="${questList}">
				<div class="col-md-4"><!-- 
					<div style="width: 290px; height: 408px; background-color: orange;"></div> -->
					<c:set var="thumbnailPath" value='${questImageList[questStatus.index].repoPath += "/" 
													 += questImageList[questStatus.index].uploadPath += "/s_"
													 += questImageList[questStatus.index].uuid += "_" 
													 += questImageList[questStatus.index].fileName}'/>						 
					<img alt="-" style="height: 408px; width: 290px" src='${contextPath += "/displayThumbnail?fileName=" += thumbnailPath}'/>	
					<!-- 이미지 저장하고 가져올 때 크기 잘 조절하자. -->
				</div>
				<div class="col-md-8">
					
					<c:out value="${quest.questName}"/> 
					<hr><hr>
					<div style="height: 200px;">
						<c:out value="${quest.detailComment}"/> 
					</div>
					<hr>
					<div style="height: 70px;" >
						<span>난이도:</span> 
						<c:forEach begin="1" end="5" step="1" var="j">
							<c:choose>
								<c:when test="${quest.difficulty >= j}">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="red" class="bi bi-star-fill" viewBox="0 0 16 16">
									  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
									</svg>
								</c:when>
								<c:otherwise>
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="red" class="bi bi-star" viewBox="0 0 16 16">
									  <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/>
									</svg>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						&nbsp;&nbsp;&nbsp;
						<span>인원: <c:out value="${quest.minPlayerNum}"/> ~ <c:out value="${quest.maxPlayerNum}"/>  </span> 
						&nbsp;&nbsp;&nbsp;
						<span>제한시간: <c:out value="${quest.questTime}"/> 분</span> 
						<br><br>
						<button type="button" class="btn btn-danger">
							예약하기
						</button>
						&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-warning moveDetail" data-questname="${quest.questName}" 
						                                                         data-location="${quest.branchLocation}">
							리뷰보기
						</button>
					</div>
				</div>
			<div class="col-md-12"><br></div>
		</c:forEach>
	</div>
</div>

<form id="frm">
	<input type="hidden" name="pageNum" id="pageNum" value="${pagingCreator.questPagingDTO.pageNum}" /><!-- 
	<input type="hidden" name="rowAmountPerPage" id="rowAmountPerPage"  /> -->
	<input type="hidden" name="lastPageNum" id="lastPageNum" value="${pagingCreator.lastPageNum}" />	
</form>

<%-- pagination 시작 --%>
<div style="text-align: center;">
  <ul class="pagination pagination-sm">
  <c:if test="${pagingCreator.prev}">
    <li class="paginate_button prevuous">
      <a href="1">&laquo;</a>
  	</li>
  </c:if>

  <c:if test="${pagingCreator.prev }">
    <li class="paginate_button prevuous">
      <a href="${pagingCreator.startPagingNum - 1}">이전</a>
    </li>
  </c:if>

  <%-- 페이징 그룹의 페이징 숫자(10개 표시) 
  		li 내용: 클릭한 페이지 번호 값과 같은 페이지 번호의 클래스이름에 paginate_button active 설정--%>
  <c:forEach var="pageNum" begin="${pagingCreator.startPagingNum}" end="${pagingCreator.endPagingNum}">
  	<li class='paginate_button ${pagingCreator.questPagingDTO.pageNum == pageNum ? "active" : ""}'>
  		<a href="${pageNum}">${pageNum}</a>
  	</li>
  </c:forEach>
  
  <c:if test="${pagingCreator.next }">
    <li class="paginate_button next">
      <a href="${pagingCreator.endPagingNum + 1}">다음</a>
    </li>
  </c:if>

  <c:if test="${pagingCreator.next }">
    <li class="paginate_button next">
      <a href="${pagingCreator.lastPageNum}">&raquo;</a>
    </li>
  </c:if>
    
  </ul>
</div><%-- pagination 끝 --%>

<%-- mycomment.js를 로딩 --%><%-- 
<script type="text/javascript" src="${contextPath}/resources/js/mycomment.js">
</script> --%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
	
	var frm = $("#frm"); //데이터를 보내는 hidden 타입 변수들을 모아놓은 form 
	var frmUp = $("#frmUp") ; //테이블 조회 범위 관련 변수들을 모아놓은 form
	var frmQuestInput = $('#frmQuestInput'); //퀘스트 작성 페이지로 이동하는 버튼이 있는 form
	
	//form을 안 쓸 때는 헤더에 넣기. 
	var csrfHeaderName = "${_csrf.headerName}"
	var csrfTokenValue = "${_csrf.token}"
	
	<%-- 리뷰보기 클릭 시 상세로 이동(키 값만 들고가서 데이터 조회 후 반환하면 된다. ) --%>
	$(".moveDetail").on("click", function(e) {
		
		frm.append("<input type='hidden' name='questName' value='" + $(this).data("questname") + "'/>");
		frm.append("<input type='hidden' name='branchLocation' value='" + $(this).data("location") + "'/>");
		frm.attr("action", "${contextPath}/quest/detail");
		frm.attr("method", "get");
		frm.submit();
		
	});
	
	<%-- 표시행수 변경 이벤트 처리(select의 name에 담긴 값을 가지고 처리한 뒤 이 페이지 재조회) --%>
	$("#wrapRowAmountselect").on("change", "#selectRowAmount", function() {
		frmUp.find("input[name='pageNum']").val(1);
		frmUp.attr("action", "${contextPath}/quest/list");
		frmUp.attr("method", "get");
		frmUp.submit();
	});
	
	<%-- 분점 선택 이벤트 처리--%>
	$("#wrapLocation").on("change", "#selectLocation", function() {
		frmUp.find("input[name='pageNum']").val(1);
		frmUp.attr("action", "${contextPath}/quest/info");
		frmUp.attr("method", "get");
		frmUp.submit();
	});
	
	<%-- 난이도 선택 이벤트 처리--%>
	$("#wrapDifficulty").on("change", "#selectDifficulty", function() {
		frmUp.find("input[name='pageNum']").val(1);
		frmUp.attr("action", "${contextPath}/quest/info");
		frmUp.attr("method", "get");
		frmUp.submit();
	});
	
	<%-- 제한시간 선택 이벤트 처리--%>
	$("#wrapQuestTime").on("change", "#selectQuestTime", function() {
		frmUp.find("input[name='pageNum']").val(1);
		frmUp.attr("action", "${contextPath}/quest/info");
		frmUp.attr("method", "get");
		frmUp.submit();
	});
	
	<%-- 퀘스트 수정할 곳으로 필요한 데이터 받아서 이동. --%>
	$(".moveQuestInput").on("click", function(e) {

		frmQuestInput.attr("action", "${contextPath}/quest/input");
		frmQuestInput.attr("method", "get");
		frmQuestInput.submit();
	});
	
	
	function showCmtPagingNums(pageNum, startPagingNum, endPagingNum, prev, next, lastPageNum) {
		if(endPagingNum >= lastPageNum) {
			endPagingNum = lastPageNum ; 
		}
		
		//표현언어를 사용할 때 ''로 감싸면 가끔 안 되서 작은 따옴표로 만드는 습관 들이자. 
		var str  = '<ul class="pagination pagination-sm">';
		
		//맨 앞으로 가는 버튼 
		if(prev){
			str += '    <li class="page-item">'
			    +  '        <a class="page-link" href="1">'
			    +  '            <span aria-hidden="true">&laquo;</span>'
			    +  '        </a>'
			    +  '    </li>';
		//이전 페이지
			str += '    <li class="page-item">'
			    +  '        <a class="page-link" href="' + (startPagingNum - 1) + '">'
			    +  '            <span aria-hidden="true">이전</span>'
			    +  '        </a>'
			    +  '    </li>';
		
		}
		
		//선택한 페이지 번호 Bootstrap의 색상표시
		for(var i = startPagingNum ; i <= endPagingNum; i++){
			//active는 Bootstrap 클래스 이름. 
			var active = ( (pageNum == i) ? "active" : "" );
			
			str += '    <li class="page-item ' + active + '" >'
				+  '        <a class="page-link" href="' + i + '">'
			    +  '            <span aria-hidden="true">' + i + '</span>'
			    +  '        </a>'
				+  '    </li>';
		}

		if(next){
			//다음 페이지
			str += '    <li class="page-item">'
			    +  '        <a class="page-link" href="' + (endPagingNum + 1) + '">'
			    +  '            <span aria-hidden="true">다음</span>'
			    +  '        </a>'
			    +  '    </li>';
			    
			//맨 마지막으로    
			str += '    <li class="page-item">'
			    +  '        <a class="page-link" href="' + lastPageNum + '">'
			    +  '            <span aria-hidden="true">&raquo;</span>'
			    +  '        </a>'
			    +  '    </li>';
		}

		str += '</ul>';
		
		$("#showCmtPagingNums").html(str);
		
	}
	
	
	
	<%-- 페이징 번호 클릭 이벤트 처리 --%>
	$(".paginate_button a").on("click", function(e) {
		e.preventDefault();//기본동작 막기
		
		//this는 e와 같음(결국 클릭한 a와 같다). 그것의 href 주소 속성(.attr)의 값(.val)을 
		//pageNum속성의 값에 대입. 그 밑의 경고창은 대입된 그 값을 가져와서 보여달라는 것. 
		frmUp.find("input[name='pageNum']").val($(this).attr("href")) ;
		//alert("선택된 페이지: " + frmUp.find("input[name='pageNum']").val()); //읽어오기. 
		frmUp.attr("action", "${contextPath}/quest/list");
		frmUp.attr("method", "get");
		frmUp.submit();
	});
		
	
//  		$(document).ready(function() {	
			
// 			alert(qusetList.length);
//  		});
	
	
	
</script>

<%@ include file="../myinclude/testfooter.jsp" %>