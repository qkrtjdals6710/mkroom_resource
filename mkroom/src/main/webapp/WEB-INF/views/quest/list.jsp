<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>    

<security:authorize access="hasRole('MEMBER')">
	<security:authentication var="principal" property="principal" />
</security:authorize>

<%@ include file="../header.jsp" %>

	
	<!-- 상단 -->    
    <div class="hero-wrap hero-wrap-2" style="background-image: url('${contextPath}/resources/skillhunt-master/images/header-back.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-start">
          <div class="col-md-12 ftco-animate text-center mb-5">
            <h1 class="mb-3 bread">테마 / 소개</h1>
          </div>                
        </div>
      </div>			
    </div>
	<!-- 상단 끝-->
	
	<!-- 이벤트 게시물 표시 영역 -->
	<section class="ftco-section" >
		<div class="board0">
			<div class="panel" style="padding-top:50px; padding-left:30px; padding-right:30px; ">
				<div style="text-align: right;">
				<security:authorize access="hasAnyRole('ADMIN', 'BMANAGER')">
					<button type="button" id="btnMoveRegister" class="btn btn-danger pull-right">테마 등록</button>
				</security:authorize>	
				</div>
				<div class="container">
					<div class="col-md-12">
						<form id="frmUp" action="${contextPath}/quest/detail">
							<span id="wrapRowAmountselect">
								<select id="selectRowAmount" name="rowAmountPerPage" >
									<option value="4" <c:out value="${(pagingCreator.questPagingDTO.rowAmountPerPage == '4') ? 'selected' : '' }"/>
										>4개</option>
									<option value="8" <c:out value="${(pagingCreator.questPagingDTO.rowAmountPerPage == '8') ? 'selected' : '' }"/>
										>8개</option>
									<option value="12" <c:out value="${(pagingCreator.questPagingDTO.rowAmountPerPage == '12') ? 'selected' : '' }"/>
										>12개</option>
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
							&nbsp;&nbsp;
							<button type="button" class="btn btn-danger btn-sm" style="border: solid 1px;"><a href="${contextPath}/quest/list" style="color: white;">조건 리셋</a></button>
							
							<input type="hidden" name="pageNum" id="pageNum" value="${pagingCreator.questPagingDTO.pageNum }"/>
							<input type="hidden" name="rowAmountPerPage" id="rowAmountPerPage"  value="${pagingCreator.questPagingDTO.rowAmountPerPage }"/>
							<input type="hidden" name="lastPageNum" id="lastPageNum" value="${pagingCreator.lastPageNum }"/>
							<security:csrfInput/>
						</form> 
					</div><%-- 필터 --%>
				
					<%-- for문 2개 열어서 배열 내부 값 가져오기. 2개씩 표기하려면 index를 가져와서 짝수 홀수로 하나씩 표현해야 함. 
						 아 그냥 쉽게 for문에서 2개 만드는데, 하나에 index +1해서 사용하면 될 듯. questStatus.index --%>
					<c:forEach var="quest" varStatus="questStatus" items="${questList}">
						<c:if test="${(questStatus.index % 2) == 0}">
							<div class="container">
								<div class="row" style="padding-left: 5%; padding-right: 5%; margin-top:100px; margin-bottom: 100px;">	
									<%-- 한 사이클의 첫 번째 정보 --%>
									<div class="col-md-2">
										<c:set var="imagePath" value='${questList[questStatus.index].fileInfos[0].uploadPath += "/"
																		+= questList[questStatus.index].fileInfos[0].uuid += "_" 
																		+= questList[questStatus.index].fileInfos[0].fileName}'/>						 
										<img alt="-" style="width: 100%;" src='${contextPath += "/displayThumbnail?fileName=C:/myupload/" += imagePath}'/>	
										<!-- 이미지 크기 조절하자 -->
									</div>
									<div class="col-md-4" style="padding-left: 20px; padding-right: 40px;">
											<h3 style="display: inline;"><c:out value="${questList[questStatus.index].questName}"/></h3>
											<h5 style="display:inline; float: right;"><c:out value="${questList[questStatus.index].branchLocation}"/></h5>
										<hr>
										<span>장르: <c:out value="${questList[questStatus.index].genre}"/></span>
										<div>
											<span>
												난이도: 
												<c:choose>
													<c:when test="${questList[questStatus.index].difficulty == 1}">
														<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/starhaf.png">
													</c:when>
													<c:otherwise>
														<c:forEach begin="1" end="${(questList[questStatus.index].difficulty) / 2}">
															<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/star.png">
														</c:forEach>
														<c:if test="${(questList[questStatus.index].difficulty) % 2 == 1}">
															<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/starhaf.png">
														</c:if>
													</c:otherwise>
												</c:choose>
											</span>
											&nbsp;&nbsp;&nbsp;
											<span>인원: <c:out value="${questList[questStatus.index].minPlayerNum}"/> ~ <c:out value="${questList[questStatus.index].maxPlayerNum}"/> </span> 
											&nbsp;&nbsp;&nbsp;
											<span>제한시간: <c:out value="${questList[questStatus.index].questTime}"/> 분</span>
										</div>
										<hr>
										<div>
											<button type="button" class="btn btn-primary moveBooking" >예약하기</button>
											&nbsp;&nbsp;&nbsp;
											<button type="button" class="btn btn-warning moveDetail" data-questname="${questList[questStatus.index].questName}" 
								                                                        			 data-location="${questList[questStatus.index].branchLocation}"
								                                                        >상세보기</button>
											&nbsp;&nbsp;&nbsp;
											<security:authorize access="hasAnyRole('ADMIN', 'BMANAGER')">
												<c:if test="${BmanagerLocation == questList[questStatus.index].branchLocation || principal.username == 'admin'}">
													<button type="button" class="btn btn-danger moveDelFlag" data-questname="${questList[questStatus.index].questName}" 
										                                                        			 data-location="${questList[questStatus.index].branchLocation}" 
																								>삭제</button>
												</c:if>												
											</security:authorize>												
										</div>
									</div>
									
									<%-- 한 사이클의 두 번째 정보. 없을 수도 있으니 if 열어서 없으면 빈공간 처리 --%>
									<c:if test="${!questStatus.last}">
										
										<div class="col-md-2">
											<c:set var="imagePath" value='${questList[questStatus.index + 1].fileInfos[0].uploadPath += "/"
																			 += questList[questStatus.index + 1].fileInfos[0].uuid += "_" 
																			 += questList[questStatus.index + 1].fileInfos[0].fileName}'/>
											<img alt="-" style="width: 100%;" src='${contextPath += "/displayThumbnail?fileName=C:/myupload/" += imagePath}'/>	
											<!-- 이미지 크기 조절하자 -->
										</div>
										<div class="col-md-4" style="padding-left: 20px; padding-right: 40px;">
											<h3 style="display: inline;"><c:out value="${questList[(questStatus.index + 1)].questName}"/></h3>
											<h5 style="display:inline; float: right;"><c:out value="${questList[(questStatus.index + 1)].branchLocation}"/></h5>
											<hr>
											<span>장르: <c:out value="${questList[(questStatus.index + 1)].genre}"/></span>
											<div>
												<span>
													난이도: 
													<c:choose>
														<c:when test="${questList[(questStatus.index + 1)].difficulty == 1}">
															<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/starhaf.png">
														</c:when>
														<c:otherwise>
															<c:forEach begin="1" end="${(questList[(questStatus.index + 1)].difficulty) / 2}">
																<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/star.png">
															</c:forEach>
															<c:if test="${(questList[(questStatus.index + 1)].difficulty) % 2 == 1}">
																<img alt="오류" style="height:15px;" src="${contextPath}/resources/skillhunt-master/images/starhaf.png">
															</c:if>
														</c:otherwise>
													</c:choose>
												</span>
												&nbsp;&nbsp;&nbsp;
												<span>인원: <c:out value="${questList[(questStatus.index + 1)].minPlayerNum}"/> ~ <c:out value="${questList[(questStatus.index + 1)].maxPlayerNum}"/> </span> 
												&nbsp;&nbsp;&nbsp;
												<span>제한시간: <c:out value="${questList[(questStatus.index + 1)].questTime}"/> 분</span>
											</div>
											<hr>
											<div>
												<button type="button" class="btn btn-primary moveBooking">예약하기</button>
												&nbsp;&nbsp;&nbsp;
												<button type="button" class="btn btn-warning moveDetail" data-questname="${questList[(questStatus.index + 1)].questName}" 
									                                                        			 data-location="${questList[(questStatus.index + 1)].branchLocation}"
									                                                        >상세보기</button>
												&nbsp;&nbsp;&nbsp;
												<security:authorize access="hasAnyRole('ADMIN', 'BMANAGER')">
													<c:if test="${BmanagerLocation == questList[(questStatus.index + 1)].branchLocation || principal.username == 'admin'}">
														<button type="button" class="btn btn-danger moveDelFlag" data-questname="${questList[(questStatus.index + 1)].questName}" 
											                                                       				 data-location="${questList[(questStatus.index + 1)].branchLocation}"
											                                                 		>삭제</button>
										            </c:if>                                     		
										        </security:authorize>               		
											</div>
										</div> 
										
									</c:if> <%-- 총 테이터 수가 홀수일 때 2개 중 하나만 나오게끔 처리하는 if 문 - end --%>
								</div> <%-- 반복문 내부 row - end --%>
							</div> <%-- container - end --%>
						</c:if>	<%-- 0 / 2 / 4... 로 받아와서 내부에서 index +1 처리하여 2개씩 - end --%>
					</c:forEach> <%-- 반복문 end --%>
				</div> <%-- 컨테이너 - end --%>

				<!-- 페이징 -->
				<div class="row mt-5">
					<div class="col text-center">
						<div class="block-27">
							<ul>
								<c:if test="${pagingCreator.prev}">
								<li class="paginate_button previous"><a href="1">&laquo;</a></li>
								</c:if>
								<%-- 화면에 보이는 시작 번호가 1보다 크면 true. --%>
								<c:if test="${pagingCreator.prev}">
									<li class="paginate_button previous"><a href="${pagingCreator.startPagingNum - 1}">이전</a></li>
								</c:if>
								<%-- 번호 표시 반복 추가. 시작페이징 번호부터 끝 페이징 번호 까지 긁는다. --%>
								<c:forEach var="pageNum" begin="${pagingCreator.startPagingNum }"
									end="${pagingCreator.endPagingNum }">
									
									<%-- 현재 페이지 번호인 pageNum에 for 문자를 순차로 대입하여 li를 생성. 눌러서 페이지 갱신했을 때 번호와 같으면 active로 표시 아니면 그대로. --%>
									<li class='paginate_button ${pagingCreator.questPagingDTO.pageNum == pageNum ? "active" : "" }'>
										<a href="${pageNum}">${pageNum}</a>
									</li>
								</c:forEach>
								<%-- 화면에 보이는 끝 번호가 마지막 페이지 번호보다 작으면 true. --%>
								<c:if test="${pagingCreator.next }">
									<li class="paginate_button next"><a href="${pagingCreator.endPagingNum + 1} ">다음</a></li>
								</c:if>
								<c:if test="${pagingCreator.next }">
									<li class="paginate_button next"><a href="${pagingCreator.lastPageNum} ">&raquo;</a></li>
								</c:if>
							</ul>
						</div>	
					</div>
				</div><!-- 페이징 끝 -->		

				</div><%-- container --%>				
			</div>
		</div>
	</section><!-- 게시물 표시 영역 끝 -->



<script type="text/javascript" src="${contextPath }/resources/js/mycomment.js"></script>
<script>


	var frmUp = $("#frmUp");
	
	<%-- 페이징 번호 클릭 이벤트 처리 --%>
	$(".paginate_button a").on("click", function(e) {
		e.preventDefault();//기본동작 막기
		
		frmUp.find("input[name='pageNum']").val($(this).attr("href")) ;
		frmUp.attr("action", "${contextPath}/quest/list");
		frmUp.attr("method", "get");
		frmUp.submit();
		
	});
	
	<%-- 예약 페이지로 이동 --%>
	$(".moveBooking").on("click", function(){
		
		frmUp.attr("action", "${contextPath}/booking");
		frmUp.attr("method", "get") ;
		frmUp.submit() ;
	}) ;
	
	<%-- 등록으로 이동 --%>
	$("#btnMoveRegister").on("click", function() {
		location.href = "${contextPath}/quest/register";
	});
	
	<%-- 상세로 이동 --%>
	$(".moveDetail").on("click", function(e) {
		
		frmUp.append("<input type='hidden' name='questName' value='" + $(this).data("questname") + "'/>");
		frmUp.append("<input type='hidden' name='branchLocation' value='" + $(this).data("location") + "'/>");
		frmUp.attr("action", "${contextPath}/quest/detail");
		frmUp.attr("method", "get");
		frmUp.submit();
		
	});
		
	<%-- 삭제 --%>
	$(".moveDelFlag").on("click", function(e) {
		
		
		
		frmUp.append("<input type='hidden' name='questName' value='" + $(this).data("questname") + "'/>");
		frmUp.append("<input type='hidden' name='branchLocation' value='" + $(this).data("location") + "'/>");
		frmUp.attr("action", "${contextPath}/quest/delete");
		frmUp.attr("method", "get");
		frmUp.submit();
		
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
		frmUp.attr("action", "${contextPath}/quest/list");
		frmUp.attr("method", "get");
		frmUp.submit();
	});
	
	<%-- 난이도 선택 이벤트 처리--%>
	$("#wrapDifficulty").on("change", "#selectDifficulty", function() {
		frmUp.find("input[name='pageNum']").val(1);
		frmUp.attr("action", "${contextPath}/quest/list");
		frmUp.attr("method", "get");
		frmUp.submit();
	});
	
	<%-- 제한시간 선택 이벤트 처리--%>
	$("#wrapQuestTime").on("change", "#selectQuestTime", function() {
		frmUp.find("input[name='pageNum']").val(1);
		frmUp.attr("action", "${contextPath}/quest/list");
		frmUp.attr("method", "get");
		frmUp.submit();
	});


</script>


		
<%@ include file="../footer.jsp" %>
