<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:set var="contextPath" value="<%=request.getContextPath() %>"/>


<%@ include file="../header.jsp" %>



   <!-- 상단 -->    
   <div class="hero-wrap hero-wrap-2" style="background-image: url('${contextPath}/resources/skillhunt-master/images/header-back.jpg');" data-stellar-background-ratio="0.8">
     <div class="overlay"></div>
     <div class="container">
       <div class="row no-gutters slider-text align-items-end justify-content-start">
         <div class="col-md-12 ftco-animate text-center mb-5">
           <h2 class="mb-3 bread">테마 / 등록</h2>
         </div>
       </div>
     </div>
   </div>
   <!-- 상단 끝-->


<style>
	.txtBoxCmt, .txtBoxComment { overflow: hidden ; resize: vertical; min-height: 100px ; color: black ; }
</style>

<div id="page-wrapper">
    <div class="row col-lg-12">
        <div class="board0">
       	    <form name="questForm" id="questForm">
	            <div class="panel panel-default">
	                <div class="panel-heading">
	                	<div class="container">
							<div class="row">
								<div class="form-group board1">
									<div class="container">
										<div class="row">
										    <div class="col-lg-12" >
										    	<textarea name="questName" placeholder="테마명 입력란" rows="1" style="width:100%; resize:none;"></textarea>
										    </div>
										</div>
									</div>
									<span id="wrapDifficulty">	
										<select id="selectDifficulty" name="difficulty">
											<option value="">난이도</option>	<%-- 별 반개 없이 하실꺼면 바꾸시면 댑니당. /resources/skillhunt-master/images/starhaf.png 이거 지우시구요  --%>
											<option value="1">☆</option>
											<option value="2">★</option>
											<option value="3">★☆</option>
											<option value="4">★★</option>
											<option value="5">★★☆</option>
											<option value="6">★★★</option>
											<option value="7">★★★☆</option>
											<option value="8">★★★★</option>
											<option value="9">★★★★☆</option>
											<option value="10">★★★★★</option>
										</select>
									</span>
									&nbsp;&nbsp;
									<input name="branchLocation" type="text" placeholder="분점" style="text-align:center;width:80px;height:24px;font-size:14px;"
									  value='<c:out value="${BmanagerLocation}"></c:out>' readonly="readonly">
									&nbsp;
									<input name="genre" type="text" placeholder="장르" style="text-align:center;width:100px;height:24px;font-size:14px;">
									&nbsp;
									<input name="questTime" type="text" placeholder="제한시간" style="text-align:center;width:80px;height:24px;font-size:14px;">
									&nbsp;
									<input name="minPlayerNum" type="text" placeholder="최소인원" style="text-align:center;width:80px;height:24px;font-size:14px;">
									&nbsp;
									<input name="maxPlayerNum" type="text" placeholder="최대인원" style="text-align:center;width:80px;height:24px;font-size:14px;">
									<security:csrfInput/>
								</div>
							</div>
						</div>	
					</div><%-- .panel-heading 끝 --%>
	                <div class="panel-body form-horizontal">
						<div class="form-group">
							<div class="col-sm-12 board3">
										  
								<textarea name="detailComment" rows="6" style="width:100%" placeholder="테마 소개 입력란"></textarea>
								<br><br>					
								<%-- 첨부파일 표시 영역 --%>
								<div class="panel-body">
									<label for="file">
										<div class="btn-upload">사진 업로드</div>	<%--업로드 파일형식 jpg,png만 되게 --%>
									</label>
									<div class="uploadDiv">
										<input type="file" id="file" name="uploadFiles" accept="image/gif, image/jpg, image/png, image/jpeg">
									</div>
									<br>
									<div class="form-group fileUploadResult">
										<ul>
											<%-- 업로드 후, 업로드 처리결과가 표시될 영역 --%>
										</ul>
									</div>
								</div><%-- /.panel-body --%>

								<br>
								<div class="button-group">
									<security:authorize access="hasAnyRole('ADMIN', 'BMANAGER')">
											<button type="button" id="btnToRegister" class="btn btn-primary"><span>작성</span></button> 
									</security:authorize>	
									<button type="button" id="btnToList" class="btn btn-warning"
																			><span>취소</span></button>
								</div>
							</div>
						</div>
					</div><%-- /.panel-body --%>
	            </div><%-- /.panel --%>
         	</form><%-- questform end --%>   
        </div><%-- board0 --%>
    </div><%-- /.col-lg-12 --%>
</div><%-- /#page-wrapper --%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">

	<%-- ----------------------------------- 1. 파일 첨부 기능 ----------------------------------- --%>
	<%-- files 초기화를 위해, 초기 상태 저장 --%>
	var cloneInputFile = $(".uploadDiv").clone();
	
	<%-- 파일 체크 --%>
	function checkUploadFile(fileName, fileSize) {
	
		var maxFileSizeAllowed = 104857600 ;
		var onlyImage = /(.*)\.(png|jpg)$/i;
		if(fileSize >= maxFileSizeAllowed) {
			alert("업로드 파일이 제한된 크기(1MB)를 초과했습니다. ");
			return false;
		}

		if(!onlyImage.test(fileName)) {
			alert("이미지 파일만 업로드할 수 있습니다.");
			return false;
		}

		return true;
	
	}

	<%-- 업로드 결과 표시 함수 --%>
	function showUploadedFiles(uploadResult) {
		
		if(!uploadResult || uploadResult.length == 0) {
			return ;	
		}
		
		var fileUploadResult = $(".fileUploadResult ul") ;
		var str = "" ;
		$(uploadResult).each(function(i, obj){
			if (obj.fileType == "F") {
				
				var calledPathFileName =  obj.repoPath + "/" + obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName ;
				
				str += "<li data-repopath='" + obj.repoPath + "'" 
				    +  "    data-uploadpath='" + obj.uploadPath + "'" 
				    +  "    data-uuid='" + obj.uuid + "'"
				    +  "    data-filename='" + obj.fileName + "' data-filetype='F'>" 
				    +  "    <img src='${contextPath}/resources/images/icon-attach.png'"
				    +  "         alt='No icon' style='height:18px; width: 18px;' />&nbsp;"
				    +       obj.fileName
				    +  "    <span data-filename='" + calledPathFileName + "' data-filetype='F'>[삭제]</span>"
				    +  "</li>" ;			
			} else  { 
				var thumbnailPath =  obj.repoPath + "/" + obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName ;
				str += "<li data-repopath='" + obj.repoPath + "'" 
			    	+  "    data-uploadpath='" + obj.uploadPath + "'" 
				    +  "    data-uuid='" + obj.uuid + "'"
				    +  "    data-filename='" + obj.fileName + "' data-filetype='I'>"
				    +  "    <img src='${contextPath}/displayThumbnail?fileName=" + encodeURI(thumbnailPath) + "'"
				    +  "         alt='No Image' style='height:18px; width: 18px;'/>&nbsp;" 
				    +       obj.fileName
				    +  "    <span data-filename='" + thumbnailPath + "' data-filetype='I'>[삭제]</span>"			    
				    +  "</li>" ;
			}
		});
		//alert(str);
		fileUploadResult.append(str) ;
	}	
	
	
	<%-- 업로드 파일 삭제 --%>
	$(".fileUploadResult ul").on("click", "li span", function(e){
		
		//filename은 컨트롤러에서 처리된 파일 이름
		var targetFileName = $(this).data("filename") ;
		var targetFileType = $(this).data("filetype") ;
		
		var parentLi = $(this).parent() ;
		//var parentLi = $(this).closest("li") ;
		
		$.ajax({
			type: "post" ,
			url: "${contextPath}/deleteUploadedFile" ,
			data: {fileName: targetFileName, fileType: targetFileType} ,
			dataType: "text" ,
			beforeSend: function(xhr) {
				xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}') ;
			},
			success: function(result) {
				if (result == "SuccessFileDelete") {
					alert("파일이 삭제되었습니다.") ;
					parentLi.remove() ;
					
				} else {
					alert("오류: 파일 삭제 실패") ;
				}
			}
		
			
		});
		

	});
	
	var checkFile = '';
	<%-- 서버에 업로드하고 화면에 어떤 파일인지 보여주기 --%>
	$(".uploadDiv").on("change", "input[type='file']", function() {
		var formData = new FormData();
		var inputTag = $(this);
		var inputFiles = inputTag[0].files;
		checkFile = inputFiles;
		
		if(inputFiles == null || inputFiles.length == 0){
			return;	
		}
		
		//input에 넣은 파일 하나하나 조건 체크한 뒤 formData에 대입.  
		for(var i = 0; i < inputFiles.length; i++) {
			if(!checkUploadFile(inputFiles[i].name, inputFiles[i].size)){
				$(".uploadDiv").html(cloneInputFile.html());
				return;
			}
			formData.append("uploadFiles", inputFiles[i]);
		}
		
		//formData에 파일 담았으면, 원하는 로직을 처리하는 컨트롤러로 요청. 
		$.ajax({
			type: "post", 
			url: "${contextPath}/fileUploadAjaxAction", 
			processData: false, 
			contentType: false, 
			data: formData, 
			dataType: "json",
			beforeSend: function(xhr) { 
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}") ;
			},  
			success: function(uploadResult, status) {
				$(".uploadDiv").html(cloneInputFile.html());
				showUploadedFiles(uploadResult);
			}	
		});
	});
	
	
	<%-- ----------------------------------- 2. 등록 시 처리 ----------------------------------- --%>	

	<%-- 작성란 빈칸 체크 --%>	
	function checkQuestInfoInput() {
		var questForm = document.questForm;
		
		
		var branchLocation = questForm.branchLocation.value;
		var questName = questForm.questName.value;
		var genre = questForm.genre.value;
		var difficulty = questForm.difficulty.value;
		var minPlayerNum = questForm.minPlayerNum.value;	
		var maxPlayerNum = questForm.maxPlayerNum.value;
		var questTime = questForm.questTime.value;
		var detailComment = questForm.detailComment.value;
		
		if( (branchLocation.length==0 ||branchLocation=="") ||
			(questName.length==0 ||questName=="") ||
			(genre.length==0 ||genre=="") ||
			(difficulty.length==0 ||difficulty=="") || 
			(minPlayerNum.length==0 ||minPlayerNum=="") || 
			(maxPlayerNum.length==0 ||maxPlayerNum=="") || 
			(questTime.length==0 ||questTime=="") || 
			(detailComment.length==0 ||detailComment=="") ||
			(checkFile.length==0 || checkFile == "")){
			
			return false ;
			
		} else {
			return true ;
		}
	}
	
	<%-- 첨부파일 포함하여 게시물 등록. 테이블에 입력 --%>		
	$("#btnToRegister").on("click", function(){
		if(!checkQuestInfoInput()){
			alert("입력칸을 모두 입력해야 합니다.") ;
			return ;
		}
		
		var questForm = $("#questForm") ; 
		var strInputHidden = "" ;
		
		//업로드 결과의 li 요소 각각에 대하여 다음을 처리(이벤트 위임 이용)
		$(".fileUploadResult ul li").each(function(i, obj) {
			var objli = $(obj);
			strInputHidden += "<input type='hidden' name='fileInfos[" + i + "].uuid' value='" + objli.data("uuid") + "' > "
			               +  "<input type='hidden' name='fileInfos[" + i + "].uploadPath' value='" + objli.data("uploadpath") + "' > "
			               +  "<input type='hidden' name='fileInfos[" + i + "].fileName' value='" + objli.data("filename") + "' > "
			               +  "<input type='hidden' name='fileInfos[" + i + "].fileType' value='" + objli.data("filetype") + "' > "
// 			               +  "<input type='hidden' name='fileInfos[" + i + "].repoPath' value='" + objli.data("repopath") + "' > "
			
			               ;
		});
		
		//alert(strInputHidden) ;
		questForm.append(strInputHidden) ;
		questForm.attr("action", "${contextPath}/quest/register") ;
		questForm.attr("method", "post") ;
		questForm.submit() ;
		
	});
	
	<%-- 취소 클릭 시 목록으로 되돌아가기 --%>	
	$("#btnToList").on("click", function(){
	
		var targetFileName = $(".fileUploadResult ul li span").data("filename") ;
		var targetFileType = $(".fileUploadResult ul li span").data("filetype") ;
		
		if(targetFileName == null || targetFileName == "" || targetFileType == null || targetFileType == "" ){
			location.href = "${contextPath}/quest/list";
		}
		
		$.ajax({
			type: "post" ,
			url: "${contextPath}/deleteUploadedFile" ,
			data: {fileName: targetFileName, fileType: targetFileType} ,
			dataType: "text" ,
			beforeSend: function(xhr) {
				xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}') ;
			},
			success: function(result) {
				location.href = "${contextPath}/quest/list";
			}
		
			
		});
		
		
	});
</script>


<%@ include file="../footer.jsp" %>