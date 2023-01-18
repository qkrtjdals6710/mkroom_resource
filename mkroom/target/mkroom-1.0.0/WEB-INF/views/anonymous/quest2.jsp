<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%@ include file="../myinclude/header.jsp" %>


&nbsp;&nbsp;&nbsp;

<div id="questName">
	<div>${questList[0].questName} / ${questList[0].maxPlayerNum} / <c:out value="${questList[0].genre}" />/ ${questList[0].difficulty} / ${questList[0].branchLocation}</div>
</div>
<hr>
<form action="${contextPath}/quest/info">
	<button type="submit">홈 리셋</button>
</form>
<hr>
<form id="frmUp" action="${contextPath}/quest/detail">
	<span id="wrapRowAmountselect">
		<select id="selectRowAmount" name="rowAmountPerPage">
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
	&nbsp;
</form> 
<hr>
<table class="questTest" style="width:100%;text-align:center;" > 
	<thead>
		<tr>
			<th colspan="6" style="text-align:center;">데이터 확인용 테이블(+ 테이블 작성 연습)</th>
		</tr>
		<tr>
			<th style="text-align:center;">그림(uuid)</th>
			<th style="text-align:center;">questName</th>
			<th style="text-align:center;">maxPlayerNum</th>
			<th style="text-align:center;">genre</th>
			<th style="text-align:center;">difficulty</th>
			<th style="text-align:center;">branchLocation</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${questList}" var="qList">
			<c:if test="${qList.delFlag == 1 }">
				<tr style="background-color:Moccasin; text-align: center;">
					<td colspan="1"><c:out value="${qList.uuid}"/></td>
					<td colspan="1"><c:out value="${qList.questName}"/></td>
					<td colspan="4"><em>작성자에 의해 임시로 삭제(보여지지 않게)된 글(나중에 관리자가 보고 삭제하겠지?)</em></td>
				</tr>
			</c:if>
			<c:if test="${qList.delFlag == 0 }">
				<tr class="moveQuestDetail" data-questname='<c:out value="${qList.questName}"/>' data-location='<c:out value="${qList.branchLocation}"/>' >
					<td><c:out value="${qList.uuid}"/></td>
					<td><c:out value="${qList.questName}"/></td>
					<td><c:out value="${qList.maxPlayerNum}"/></td>
					<td><c:out value="${qList.genre}"/></td>
					<td><c:out value="${qList.difficulty}"/></td>
					<td><c:out value="${qList.branchLocation}"/></td>
				</tr>
			</c:if>
		</c:forEach>
	</tbody>
</table>

<form id="frm">
	<input type="hidden" name="pageNum" id="pageNum" value="${pagingCreator.questPagingDTO.pageNum}" /><!-- 
	<input type="hidden" name="rowAmountPerPage" id="rowAmountPerPage"  /> -->
	<input type="hidden" name="lastPageNum" id="lastPageNum" value="${pagingCreator.lastPageNum}" />	
</form>

<%-- pagination 시작 --%>
<div style="text-align: center;">
  <ul class="pagination pagination-sm">
  <c:if test="${pagingCreator.prev }">
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


<form id="frmImage">
	<div>이미지 확인 공간</div>
	<div class="uploadDiv">
		<input id="inputFile" type="file" name="uploadFiles" multiple><br>
	</div>
	&nbsp;&nbsp;&nbsp;
	<button type="button" id="uploadBtn">업로드!</button>
	<div class="fileUploadResult">
		<ul>
			<%-- 업로드 후, 업로드 처리결과가 표시될 영역 --%>
		</ul>
	</div>
</form>


<%-- mycomment.js를 로딩 --%><%-- 
<script type="text/javascript" src="${contextPath}/resources/js/mycomment.js">
</script> --%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
	
	var frm = $("#frm"); //데이터를 보내는 hidden 타입 변수들을 모아놓은 form 
	var frmUp = $("#frmUp") ; //테이블 조회 범위 관련 변수들을 모아놓은 form
	
	//form을 안 쓸 때는 헤더에 넣기. 
	var csrfHeaderName = "${_csrf.headerName}"
	var csrfTokenValue = "${_csrf.token}"
	
	<%-- 목록 클릭 시 상세로 이동(상세 테이블의 키값을 가지고 간다.) --%>
	$(".moveQuestDetail").on("click", function(e) {
		
		frm.append("<input type='hidden' name='questName' value='" + $(this).data("questname") + "'/>");
		frm.append("<input type='hidden' name='branchLocation' value='" + $(this).data("location") + "'/>");
		frm.attr("action", "${contextPath}/quest/detail");
		frm.attr("method", "get");
		frm.submit();
		
	});
	
	<%-- 표시행수 변경 이벤트 처리(select의 name에 담긴 값을 가지고 처리한 뒤 이 페이지 재조회) --%>
	$("#wrapRowAmountselect").on("change", "#selectRowAmount", function() {
		frmUp.find("input[name='pageNum']").val(1);
		frmUp.attr("action", "${contextPath}/quest/info");
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
	
	
	

	
	<%-- 페이징 번호 클릭 이벤트 처리 --%>
	$(".paginate_button a").on("click", function(e) {
		e.preventDefault();//기본동작 막기
		
		//this는 e와 같음(결국 클릭한 a와 같다). 그것의 href 주소 속성(.attr)의 값(.val)을 
		//pageNum속성의 값에 대입. 그 밑의 경고창은 대입된 그 값을 가져와서 보여달라는 것. 
		frmUp.find("input[name='pageNum']").val($(this).attr("href")) ;
		//alert("선택된 페이지: " + frmUp.find("input[name='pageNum']").val()); //읽어오기. 
		frmUp.attr("action", "${contextPath}/quest/info");
		frmUp.attr("method", "get");
		frmUp.submit();
	});
	
	//첨부파일 처리 시작
	//DB 정보를 이용한 첨부파일 정보 표시 함수: listAttachInfo 매개변수에서 DB로부터 전달된 첨부파일 정보가 저장됨. 
	
		//검사
	function checkUploadFile(fileName, fileSize) {
		
		var maxFileSizeAllowed = 104857600 ; //1MB 허용
		var regExpFileExtension = /(.*)\.(exe|sh|zip|alz|bat)$/i; // 파일이름.확장자, i는 철자만 확인하기. 
		
		//최대 허용 크기 제한 검사
		if(fileSize >= maxFileSizeAllowed) {
			alert("업로드 파일이 제한된 크기(1MB)를 초과했습니다. ");
			return false;
		}
		
		if(regExpFileExtension.test(fileName)) {
			alert("exe, sh, zip, alz, bat 유형의 파일은 업로드 할 수 없습니다. ");
			return false;
		}
		
		//제한 다 통과하면 true. 
		return true;
		
	}
	
	
	var cloneInputFile = $(".uploadDiv").clone();
	
	<%-- 서버에 파일 저장하고, 테이블에 파일 데이터 기록하기 --%>
	$("#frmImage #uploadBtn").on("click", function() {
		var formData = new FormData();
		//var inputFiles = $("#inputFile");
		var inputTag = $("input[type='file']");
		//var files = inputFiles[0].files; //name으로 선택 시 특정해주기
		var inputFiles = inputTag[0].files;
		
		//alert(inputFiles[0].name);
		if(inputFiles == null || inputFiles.length == 0){//파일 없을 때 서버 갈 필요 없음. 
			return;	
		}
		
		for(var i = 0; i < inputFiles.length; i++) {
			
			if(!checkUploadFile(inputFiles[i].name, inputFiles[i].size)){
				$(".uploadDiv").html(cloneInputFile.html());
				return;
			}
			formData.append("uploadFiles", inputFiles[i]);
		}
		
		//alert(inputFiles[0].name);
		
		$.ajax({
			type: "post", 
			url: "${contextPath}/files/fileUploadAjaxAction", 
			processData: false, 
			contentType: false, 
			data: formData, 
			dataType: "json", /* 
			beforeSend: function(xhr) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue) ;
			},  */
			success: function(uploadResult, status) {
				$(".uploadDiv").html(cloneInputFile.html());
				alert(uploadResult + "업로드 완료" + status);
			}	
		});
	});
	
	
	
	function showUploadedFiles(listAttachInfo) {//uploadResult
		
		if( !listAttachInfo || listAttachInfo.length == 0) {
			return; 
		}
		var str = "";
		
		var fileUploadResult = $(".fileUploadResult ul");
		
		$(listAttachInfo).each(function(i, obj){//MyBoardAttachFileVO 객체

			if(obj.fileType == "F"){//일반 파일. 
				var calledPathFileName = encodeURI(obj.repoPath + "/" + obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
				
				str += "<li data-repopath='" + obj.repoPath + "'"
				    +  "    data-uploadpath='" + obj.uploadPath  + "'"
				    +  "    data-uuid='" + obj.uuid + "'"
				    +  "    data-filename='" + obj.fileName + "' data-filetype='F'>" 
					+  "    <img src='${contextPath}/resources/img/icon-attach.png' "
					+  "         alt='No icon' style='height:18px; width:18px;' />&nbsp;"
					+       obj.fileName/* 
					+  "    <span data-filename='" + calledPathFileName + "' data-filetype='F' >[삭제]</span>" */
					+  "</li>" ;
				
			} else if(obj.fileType=="I"){//, 이미지 파일
				//str += "<li>" + obj.fileName + "</li>";
				var thumbnailPath = encodeURI(obj.repoPath + "/" + obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
				
				var calledPathFileName = obj.repoPath + "/" + obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName; //메서드 내에서는 % 문자 사용 불가?
				//calledPathFileName = calledPathFileName.replace(new RegExp(/\\/g), "/"); //g는 전부 찾아라. 
						
				str += "<li data-repopath='" + obj.repoPath + "'"
				    +  "    data-uploadpath='" + obj.uploadPath  + "'"
				    +  "    data-uuid='" + obj.uuid + "'"
				    +  "    data-filename='" + obj.fileName + "' data-filetype='I'>" 
				    +  "    <img src='${contextPath}/displayThumbnail?fileName=" + thumbnailPath + "'" 
				    +  "         alt='No Image' style='height:18px; width:18px;' />&nbsp;"
				    +       obj.fileName/* 
					+  "    <span data-filename='" + thumbnailPath + "' data-filetype='I' >[삭제]</span>" */
				    +  "</li>";    
				    
			}
			
		}); //매개변수 받을 수 있음. each, 배열을 받으면 인덱스(i)와 값(obj)을 같이 넣어줌. 
		
		fileUploadResult.append(str); //jquery append()	
	}
	
	//이미지 표시
	function showImage(calledPathImageName) {
		$(".bigImageWrapper").css("display", "flex").show() ; //이미지를 웹 브라우저 중앙에 표시. show는 jquery 메서드 
		
//		$(".bigImage").html("<img src='${contextPath}/fileDownloadAjax?fileName=" + calledPathImageName + "'/>")
//		             .animate({width: '100%', height: '100%'}, 1000) ; //1000ms 동안 서서히 표기하라. 
		
		$(".bigImage").html("<img src='${contextPath}/fileDownloadAjax?fileName=" + encodeURI(calledPathImageName) + "'/>")
		             .animate({width: '100%', height: '100%'}, 1000) ; 
		
	}

	//이미지 제거: 원본 이미지 표시 DIV 클릭 이벤트처리 - 클릭 시 1초 후 이미지 사라짐. 
	$(".bigImageWrapper").on("click", function () {
		$(".bigImage").animate({width: '0%', height: '0%'}, 1000);
		
		//setTimeout(() => {$(this).hide();}, 1000); //최신 방식인데 브라우저에 따라 달라서 주의. this 적을 땐 매개변수 e를 적자. 
		setTimeout(function() {
				   		$(".bigImageWrapper").hide();
				   }, 1000);
		
	});
	
	
/*    $(document).ready(function() {	
		//showCmtList();
		showUploadedFiles(listAttachInfo);
	});  */
	
	
</script>

<%@ include file="../myinclude/footer.jsp" %>