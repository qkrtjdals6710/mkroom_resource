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
           <h2 class="mb-3 bread">공지 / 이벤트 수정</h2>
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
            <div class="panel panel-default">
				<form role="form" method="post" name="frmModify" id="frmModify">		
																			
								<input type="hidden" name="pageNum" value="${eventBoardPagingDTO.pageNum }"/>
								<input type="hidden" name="rowAmountPerPage" value="${eventBoardPagingDTO.rowAmountPerPage }"/>
								<input type="hidden" name="scope" value="${eventBoardPagingDTO.scope }"/>
								<input type="hidden" name="keyword" value="${eventBoardPagingDTO.keyword }"/>
								<input type="hidden" name="bno" value="${eventboard.bno }"/>
										
								
								<input type="hidden" name="bwriter" value="test작성자">		
										
								<sec:csrfInput/>
				
				<div class="panel-heading">
					<div class="row">
						<div class="form-group board1">
							<div class="container">
								<div class="row">
								    <div class="col-lg-10" >
							    		<textarea name="btitle" rows="1" style="width:100%; resize:none;">${eventboard.btitle}</textarea>
								    </div>
									<div class="col-lg-2" style="text-align:right;"><%-- vertical-align: middle; --%>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-12 board2">
						<span class="text-primary" style="font-size: smaller;">
								
								글번호:&nbsp;<strong><c:out value="${eventboard.bno}"/></strong>&nbsp;&nbsp;
								조회수:&nbsp;<strong><c:out value="${eventboard.bviewCnt}"/></strong>	
								등록일:&nbsp;<strong><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${eventboard.bregDate}"/></strong>&nbsp;&nbsp;
								수정일:&nbsp;<strong><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${eventboard.bmodDate}"/></strong>&nbsp;&nbsp;							
										
									    
						</span><%--조회수 안올라가게 해야함--%>
					</div>
				</div><%-- .panel-heading 끝 --%>
				
                <div class="panel-body form-horizontal">
					<div class="form-group">
						<div class="col-sm-12 board3">
						<br><br>						  
							<textarea name="bcontent" rows="6" style="width:100%; resize:none;">${eventboard.bcontent}</textarea>
							<br><br>					
							
							<%-- 첨부파일 표시 영역 --%>
							<div class="panel-body">
												
								<div class="uploadDiv">
									<input type="file" id="inputFiles" name="uploadFiles" multiple accept="image/png, image/jpeg"><br>
								</div>
								
								<div class="form-group fileUploadResult">
									<ul>
										<%-- 업로드 후, 업로드 처리결과가 표시될 영역 --%>
									</ul>
								</div>
							</div><%-- /.panel-body --%>

							<br>
							<div class="button-group">
							
								<button type="button" id="btnModify" data-oper="modify" class="btn btn-primary btnBoard">수정</button> 
								<button type="button" id="btnGoList" data-oper="list" class="btn btn-warning btnBoard">취소</button>
								<button type="button" id="btnRemove" data-oper="remove" class="btn btn-danger btnBoard">삭제</button>
								
							</div>		
						</div>
					</div>
				</div><%-- /.panel-body --%>
				
	</form>

            </div><%-- /.panel --%>
        </div><%-- /.col-lg-12 --%>
    </div><%-- 게시물 상태 표시 끝 /.row --%>
</div><%-- /#page-wrapper --%>



<script>

var bnoValue = '<c:out value="${eventboard.bno}" />' ;
var frmModify = $("#frmModify");

// var loginUser = "" ;
// <sec:authorize access="isAuthenticated()">
// 	loginUser = '<sec:authentication property="principal.username"/>' ;
// </sec:authorize>


//수정 취소 삭제 버튼 함수
$('.btnBoard').on("click", function(e){
	
	var operation = $(this).data("oper"); //각 버튼의 data-xxx 속성에 설정된 값을 저장
	
	if(operation == "list"){ //게시물 목록 화면 요청
		
		var strInputHidden = "" ;
		$(".fileUploadResult ul li").each(function(i, obj) {
			
			var objLi = $(obj) ;
			
			strInputHidden += "<input type='hidden' name='fileInfos[" + i + "].uuid' value='" + objLi.data("uuid") + "' > "
			               +  "<input type='hidden' name='fileInfos[" + i + "].uploadPath' value='" + objLi.data("uploadpath") + "' > "
			               +  "<input type='hidden' name='fileInfos[" + i + "].fileName' value='" + objLi.data("filename") + "' > "
			               +  "<input type='hidden' name='fileInfos[" + i + "].fileType' value='" + objLi.data("filetype") + "' > "
			               +  "<input type='hidden' name='fileInfos[" + i + "].repoPath' value='" + objLi.data("repopath") + "' > "
			               +  "<input type='hidden' name='fileInfos[" + i + "].beforeFileCheck' value='" + objLi.data("bfcheck") + "' > " ;
		}); 
		frmModify.append(strInputHidden) ;	
		frmModify.attr("method", "post");
		frmModify.attr("action", "${contextPath}/eventboard/modifyCancel");
		
		
	}

	
		if(operation == "modify"){ //게시물 수정 요청
			
			var strInputHidden = "" ;		
			
			$(".fileUploadResult ul li").each(function(i, obj) {	
			var objLi = $(obj) ;
				
				strInputHidden += "<input type='hidden' name='fileInfos[" + i + "].uuid' value='" + objLi.data("uuid") + "' > "
				               +  "<input type='hidden' name='fileInfos[" + i + "].uploadPath' value='" + objLi.data("uploadpath") + "' > "
				               +  "<input type='hidden' name='fileInfos[" + i + "].fileName' value='" + objLi.data("filename") + "' > "
				               +  "<input type='hidden' name='fileInfos[" + i + "].fileType' value='" + objLi.data("filetype") + "' > "
				               +  "<input type='hidden' name='fileInfos[" + i + "].repoPath' value='" + objLi.data("repopath") + "' > "
				               +  "<input type='hidden' name='fileInfos[" + i + "].beforeFileCheck' value='" + objLi.data("bfcheck") + "' > " ;
			}); 
				
		    if (confirm("수정 하시겠습니까?")) {

				frmModify.attr("method", "post");
				frmModify.append(strInputHidden) ;			
				frmModify.attr("action", "${contextPath}/eventboard/modify");
		    	 
		    } else {
		    	
		       return;
		       
		    }

				
		} 
		
		if (operation == "remove"){
			frmModify.attr("method", "post");
			frmModify.attr("action", "${contextPath}/eventboard/delete");
		}
	
		
		j=0;
		frmModify.submit() ; //요청 전송
		
});


//첨부파일 처리 시작
var csrfHeaderName = "${_csrf.headerName}" ;
var csrfTokenValue = "${_csrf.token}" ;

$(document).ajaxSend(function(e, xhr, options){
	xhr.setRequestHeader(csrfHeaderName, csrfToken) ;
});

//input 초기화를 위해 div 요소의 비어있는 input 요소를 복사해서 저장함.
var cloneInputFile = $(".uploadDiv").clone() ;

//업로드 파일의 확장자 및 최대 파일 크기를 제한하는 함수
function checkUploadFile(fileName, fileSize) {
	
	var maxFileSizeAllowed = 104857600 ;
	var regExpFileExtension = /(.*)\.(png|jpg)$/i ;

	//최대 허용 크기 제한 검사
	if(fileSize >= maxFileSizeAllowed) {
		alert("업로드 파일의 제한된 크기(1MB)를 초과했습니다.") ;
		return false ;
		
	}
	
	if(!regExpFileExtension.test(fileName)) {
		alert("이미지 파일만 업로드 할 수 있습니다.") ;
		return false ;
		
	}
	
	return true ;
}



//파일교체
$(".uploadDiv").on("change", "input[type='file']" , function(){
	
	var formData = new FormData() ;
	var inputFiles = $(this);
	var yourFiles = inputFiles[0].files ;
	
	if(yourFiles == null || yourFiles.length == 0){
		return ;
	}//if end
	
	//formData 객체에 파일추가
	for(var i = 0 ; i < yourFiles.length ; i++){
		
		if(!checkUploadFile(yourFiles[i].name, yourFiles[i].size)) {
			$(".uploadDiv").html(cloneInputFile) ;
			return ;
			
		}
		
		formData.append("uploadFiles", yourFiles[i]) ;
		
	}//for end
	
	//url 키에 명시된 주소의 컨트롤러에게 formData 객체를 POST 방식으로 전송.
	$.ajax({
		type: 'post' ,
		url: '${contextPath}/fileUploadAjaxAction' ,
		data: formData ,
		dataType: "json" ,
		contentType: false , //contentType에 MIME 타입을 지정하지 않음.
		processData: false , //contentType에 설정된 형식으로 data를 처리하지 않음.
		beforeSend: function(xhr) {
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue) ;
		} ,
		success: function(listAttachInfo){
			
			$(".uploadDiv").html(cloneInputFile.html()) ;
			showUploadedFiles(listAttachInfo) ;
		}	
			
	});
	
});//end



//DB 정보를 이용 첨부파일 정보 표시 함수
function showUploadedFiles(uploadResult) {
	
	if(!uploadResult || uploadResult.length == 0) {
		return ;	
	}
	
	var fileUploadResult = $(".fileUploadResult ul") ;
	var str = "";
	
	
	$(uploadResult).each(function(i, obj){

		if (obj.fileType == "I") {
				
			var thumbnailPath =  "C:/myupload/" + obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName ;
			
			str += "<li data-repopath='C:/myupload'" 
		    	+  "    data-uploadpath='" + obj.uploadPath + "'" 
			    +  "    data-uuid='" + obj.uuid + "'"
			    +  "    data-filename='" + obj.fileName + "' data-filetype='I' data-bfcheck='p' style='height:25px;'>"
			    +  "    <img src='${contextPath}/displayThumbnail?fileName=" + encodeURI(thumbnailPath) + "'"
			    +  "         alt='No Image' style='height:18px; width: 18px;'/>&nbsp;&nbsp;" 
			    +       obj.fileName
			    +  " &nbsp;<button type='button' class='btn btn-danger btn-xs' "
			    +  " data-filename='" + thumbnailPath + "' data-filetype='I'>X</button>"
			    +  "</li>" ;
			
		} else {
			alert("이미지 파일만 업로드하실 수 있습니다.");
		}
	});
	
	fileUploadResult.append(str) ;
		
}//showUploadedFiles end






function iniShowUploadedFiles(uploadResult) {
	
	if(!uploadResult || uploadResult.length == 0) {
		return ;	
	}
	
	var fileUploadResult = $(".fileUploadResult ul") ;
	var str = "";
	
	
	$(uploadResult).each(function(i, obj){

		if (obj.fileType == "I") {
				
			var thumbnailPath =  "C:/myupload/" + obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName ;
			
			str += "<li data-repopath='C:/myupload'" 
		    	+  "    data-uploadpath='" + obj.uploadPath + "'" 
			    +  "    data-uuid='" + obj.uuid + "'"
			    +  "    data-filename='" + obj.fileName + "' data-filetype='I' data-bfcheck='b' style='height:25px;'>"
			    +  "    <img src='${contextPath}/displayThumbnail?fileName=" + encodeURI(thumbnailPath) + "'"
			    +  "         alt='No Image' style='height:18px; width: 18px;'/>&nbsp;&nbsp;" 
			    +       obj.fileName
			    +  " &nbsp;<button type='button' class='btn btn-danger btn-xs' "
			    +  " data-filename='" + thumbnailPath + "' data-filetype='I'>X</button>"
			    +  "</li>" ;
			    
			
			
		} 
			
		
		
	});
	
	fileUploadResult.append(str) ;
		
}//showUploadedFiles end







var j = 0 ;

//파일 삭제
$(".fileUploadResult ul").on("click", "li button", function(e){

	var obj = $(this).closest("li");
	var bcheck = $(this).closest("li").data("bfcheck");
	var strInputHiddend = "";
	var parentLi = $(this).parent() ;
	
	
	if(confirm("이 파일을 삭제하겠습니까?")) {	
		
		if(bcheck == "b") {
			
			parentLi.remove() ;
			return;
			
		} else {
			
			strInputHiddend += "<input type='hidden' name='wfileInfos[" + j + "].uuid' value='" + obj.data("uuid") + "' > "
					        +  "<input type='hidden' name='wfileInfos[" + j + "].uploadPath' value='" + obj.data("uploadpath") + "' > "
					        +  "<input type='hidden' name='wfileInfos[" + j + "].fileName' value='" + obj.data("filename") + "' > "
					        +  "<input type='hidden' name='wfileInfos[" + j + "].fileType' value='" + obj.data("filetype") + "' > "
					        +  "<input type='hidden' name='wfileInfos[" + j + "].repoPath' value='" + obj.data("repopath") + "' > "
					        +  "<input type='hidden' name='wfileInfos[" + j + "].beforeFileCheck' value='w' > " ;
					        
			frmModify.append(strInputHiddend) ;			
			j = j + 1;
			
			
			
		}

		
	} 
	//if end
	

});//파일 삭제 end




$(document).ready(function(){
	$.ajax({
		type: "get" ,
		url: "${contextPath}/eventboard/getFiles" ,
		data: {bno: bnoValue} ,
		dataType: "json" ,
		success: function(fileList, status) {
			
			if(fileList == null) {
				
			} else{
				
				j=0;
				iniShowUploadedFiles(fileList) ;
			}

		}
	});
});

</script>
<%@ include file="../footer.jsp" %>