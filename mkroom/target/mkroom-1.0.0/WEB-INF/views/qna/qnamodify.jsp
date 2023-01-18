<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="contextPath" value="<%=request.getContextPath() %>" />

<%@ include file="../header.jsp" %>

<!-- 상단 -->    
   <div class="hero-wrap hero-wrap-2" style="background-image: url('${contextPath}/resources/skillhunt-master/images/header-back.jpg');" data-stellar-background-ratio="0.8">
     <div class="overlay"></div>
     <div class="container">
       <div class="row no-gutters slider-text align-items-end justify-content-start">
         <div class="col-md-12 ftco-animate text-center mb-5">
           <h2 class="mb-3 bread">QnA / 수정</h2>
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
        	<form role="form" method="post" name="frmModify" id="frmModify">
	            <div class="panel panel-default">
	                <div class="panel-heading">
	                	<input type="hidden" name="bno" value="${qna.bno}">
	             			<div class="row">
								<div class="form-group board1">
									<div class="container">
										<div class="row">
										    <div class="col-lg-10" >
										    <label>제목</label>
										    <textarea name="btitle" placeholder="제목 입력란" rows="1" style="width:100%; resize:none;"><c:out value="${qna.btitle}"/></textarea>
											</div>
											<div class="col-lg-2" style="text-align:right;"><%-- vertical-align: middle; --%></div>
										</div>
									</div>
								</div>
							</div>
			
						<div class="col-md-12 board2">
							<span class="text-primary" style="font-size: smaller;">
									글번호:&nbsp;<strong><c:out value="${qna.bno}"/></strong>&nbsp;&nbsp;
									등록일:&nbsp;<strong><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${qna.bregDate}"/></strong>&nbsp;&nbsp;
									조회수:&nbsp;<strong><c:out value="${qna.bviewCnt}"/></strong>
							</span><%--조회수 안올라가게 해야함--%>
						</div>
					</div><%-- .panel-heading 끝 --%>
						<div class="panel-body form-horizontal">
							<div class="form-group">
								<div class="col-sm-12 board3">
								<br><br>						  
								<label>작성자</label>
								<input class="form-control" name="bwriter"
								 	   value='<c:out value="${qna.bwriter}"/>' readonly="readonly"/>
								<br><br>						  
								<label>글내용</label>
								<textarea class="form-control" rows="3" name="bcontent"  rows="6" style="width:100%" placeholder="내용 입력란"
								><c:out value="${qna.bcontent}" /></textarea>
								<br><br>					
		       						<%-- 첨부파일 표시 영역 --%>
												<div class="panel-body">
													<label for="file">
														<div class="btn-upload">사진 업로드</div>   
													</label>
														<div class="uploadDiv">
														<input type="file" id="file" name="uploadFiles" multiple>
														</div>
						                  			<br>
												<div class="form-group fileUploadResult">
					                              <ul>
					                                 <%-- 업로드 후, 업로드 처리결과가 표시될 영역 --%>
					                              </ul>
												</div>
	                        </div><%-- /.panel-body --%>
									<br>
								<div class="qnaBtn">
								<button type="button" class="btn btn-primary btn-frmModify" id="btnModify" data-oper="modify" ><span>수정</span></button> 
								<button type="button" class="btn btn-danger btn-frmModify" id="btnRemove" data-oper="remove">삭제</button>
								<button type="button" class="btn btn-info btn-frmModify" id="btnList" data-oper="list">취소</button>
								</div>
							
								<input type='hidden' name='pageNum'value='${qnaPagingDTO.pageNum}'> 
								<input type='hidden' name='rowAmountPerPage' value='${qnaPagingDTO.rowAmountPerPage}'>
								<input type='hidden' name='scope' value='${qnaPagingDTO.scope}'>
								<input type='hidden' name='keyword' value='${qnaPagingDTO.keyword}'>
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	
							</div>
						</div>
					</div><%-- /.panel-body --%>
	            </div><%-- /.panel --%>
            </form> 
        </div><%-- /.col-lg-12 --%>
    </div><%-- 게시물 상태 표시 끝 /.row --%>
</div><%-- /#page-wrapper --%>


<script>

var bnoValue = '<c:out value="${qna.bno}" />' ;

// var csrfHeaderName = "${_csrf.headerName}" ;
// var csrfToken = "${_csrf.token}" ;
// $(document).ajaxSend(function(e, xhr, options){
// 	xhr.setRequestHeader(csrfHeaderName, csrfToken) ;
// });

//기존 내용 삭제 후, 아래의 내용 추가 작성(오타, 대소문자 주의!!!)
//form의 수정/삭제/목록보기 버튼 클릭 이벤트 처리
var frmModify = $("#frmModify");
	$(".btn-frmModify").on("click", function(e){ //수정
		 var operation = $(this).data("oper"); //각 버튼의 data-xxx 속성에 설정된 값을 저장
 
		 if(operation == "modify"){ //게시물 수정 요청
 			var strFilesInputHidden = ""; //여기서부터는 추가 시작
 
 			
//업로드 결과의 li 요소 선택하여 각각에 대하여 다음을 처리
	 $(".fileUploadResult ul li").each(function(i, obj){
	 var objLi = $(obj);
 	strFilesInputHidden
				 += " <input type='hidden' name='attachFileList["+i+"].uuid' " 
				 + " value='" + objLi.data("uuid") + "'>"
				 + " <input type='hidden' name='attachFileList["+i+"].uploadPath' " 
				 + " value='" + objLi.data("uploadpath") + "'>"
				 + " <input type='hidden' name='attachFileList["+i+"].fileName' "
				 + " value='" + objLi.data("filename") + "'>"
				 + " <input type='hidden' name='attachFileList["+i+"].fileType' " 
				 + " value='" + objLi.data("filetype") + "'>" ;
 	});
 			
 console.log(strFilesInputHidden);//테스트 후, 주석처리할 것
 
 frmModify.append(strFilesInputHidden); 
 
 
 frmModify.attr("action", "${contextPath}/qna/qnamodify");
 
		 } else if(operation == "remove"){ //게시물 삭제 요청

	 frmModify.attr("action", "${contextPath}/qna/qnaremove"); //bdelFlag만 업데이트

 
		 } else if(operation == "list"){ //게시물 목록 화면 요청
 
			 //기존 페이징 데이터 input 요소 복사
 
		 var pageNumInput = $("input[name='pageNum']").clone();
 
		 var rowAmountInput = $("input[name='rowAmountPerPage']").clone();

		 var scopeInput = $("input[name='scope']").clone();

		 var keywordInput = $("input[name='keyword']").clone();
			 frmModify.empty();
			 frmModify.attr("action","${contextPath}/qna/qnalist").attr("method","get");
			 //복사된 input 요소를 form에 추가
			 frmModify.append(pageNumInput);
			 frmModify.append(rowAmountInput);
			 frmModify.append(scopeInput);
			 frmModify.append(keywordInput);
	 }
			 
 frmModify.submit() ; //요청 전송
});

//첨부파일 처리 시작
//input 초기화를 위해 div 요소의 비어있는 input 요소를 복사해서 저장함.
var cloneInputFile = $(".uploadDiv").clone() ;

//업로드 파일의 확장자 및 최대 파일 크기를 제한하는 함수
function checkUploadFile(fileName, fileSize) {
	
	var maxFileSizeAllowed = 104857600 ;
	var regExpFileExtension = /(.*)\.(exe|sh|zip|alz)$/i ;
	
	//최대 허용 크기 제한 검사
	if(fileSize >= maxFileSizeAllowed) {
		alert("업로드 파일의 제한된 크기(1MB)를 초과했습니다.") ;
		return false ;
		
	}
	
	if(regExpFileExtension.test(fileName)) {
		alert("exe, sh, zip, alz 유형의 파일은 업로드 할 수 없습니다.") ;
		return false ;
		
	}
	
	return true ;
}


$(".uploadDiv").on("change", "input[type='file']" , function(){
	
	//FormData() Ajax 파일 전송 시에 사용되는 Web API 클래스의 생성자
	var formData = new FormData() ;
	
	//uploadFiles 이름의 file 유형 input 요소를 변수에 저장
	//var inputFiles = $("input[name='myFiles']");
	var inputFiles = $(this);
	
	//inputFiles에 저장된 파일들을 files 변수에 저장.
	//inputFiles[0]은 첫번째 input 요소를 의미(input 요소가 하나만 있더라도 [0]을 명시해야 함).
	var yourFiles = inputFiles[0].files ;
	
	if(yourFiles == null || yourFiles.length == 0){
		return ;
	}
	
	//console.log(yourFiles);
	
	//formData 객체에 파일추가
	for(var i = 0 ; i < yourFiles.length ; i++){
		
		if(!checkUploadFile(yourFiles[i].name, yourFiles[i].size)) {
			//$(".uploadDiv input[name='myFiles']").val("") ;
			$(".uploadDiv").html(cloneInputFile) ;
			return ;
			
		}
		
		formData.append("uploadFiles", yourFiles[i]) ;
		
	}
	
	//url 키에 명시된 주소의 컨트롤러에게 formData 객체를 POST 방식으로 전송.
	$.ajax({
		type: 'post' ,
		url: '${contextPath}/fileUploadAjaxAction' ,
		data: formData ,
		dataType: "json" ,
		contentType: false , //contentType에 MIME 타입을 지정하지 않음.
		processData: false , //contentType에 설정된 형식으로 data를 처리하지 않음.
		beforeSend: function(xhr) {
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}") ;
		},  
		success: function(listAttachInfo){
			console.log(listAttachInfo) ;
			
			$(".uploadDiv").html(cloneInputFile.html()) ;
			
			showUploadedFiles(listAttachInfo) ;
		}	
			
	});
	
}) ;


//DB 정보를 이용 첨부파일 정보 표시 함수: uploadResult 매개변수에서 DB로 부터 전달된 첨부파일 정보가 저장됨
function showUploadedFiles(uploadResult) {
	
	if(!uploadResult || uploadResult.length == 0) {
		return ;	
	}
	
	var fileUploadResult = $(".fileUploadResult ul") ;
	
	var str = "";
	
	
	$(uploadResult).each(function(i, obj){
	
		//calledPathFileName = encodeURI(calledPathFileName.replace(new RegExp(/\\/g), "/")) ;
	
		if (obj.fileType == "F") {
		
			var calledPathFileName =  obj.repoPath + "/" + obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName ;
			//console.log("calledPathFileName: "+ calledPathFileName);
			
			str += "<li data-repopath='" + obj.repoPath + "'" 
			    +  "    data-uploadpath='" + obj.uploadPath + "'" 
			    +  "    data-uuid='" + obj.uuid + "'"
			    +  "    data-filename='" + obj.fileName + "' data-filetype='F' style='height:25px;'>" 
			    +  "    <img src='${contextPath}/resources/images/icon-attach.png'"
			    +  "         alt='No icon' style='height:18px; width: 18px;' />&nbsp;&nbsp;"
			    +       obj.fileName
			    +  " &nbsp;<button type='button' class='btn btn-danger btn-xs' "
			    +  " data-filename='" + calledPathFileName + "' data-filetype='F'>X</button>"
			    +  "</li>" ;
			
		} else  {  //if(obj.fileType == "I")

			var thumbnailPath =  obj.repoPath + "/" + obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName ;
		
			
			str += "<li data-repopath='" + obj.repoPath + "'" 
		    	+  "    data-uploadpath='" + obj.uploadPath + "'" 
			    +  "    data-uuid='" + obj.uuid + "'"
			    +  "    data-filename='" + obj.fileName + "' data-filetype='I' style='height:25px;'>"
			    +  "    <img src='${contextPath}/displayThumbnail?fileName=" + encodeURI(thumbnailPath) + "'"
			    +  "         alt='No Image' style='height:18px; width: 18px;'/>&nbsp;&nbsp;" 
			    +       obj.fileName
			    +  " &nbsp;<button type='button' class='btn btn-danger btn-xs' "
			    +  " data-filename='" + thumbnailPath + "' data-filetype='I'>X</button>"
			    +  "</li>" ;
		}
		
	});

	fileUploadResult.append(str) ;
}


//파일 삭제
$(".fileUploadResult ul").on("click", "li button", function(e){
	
	if(confirm("이 파일을 삭제하겠습니까?")) {
		var targetLi = $(this).closest("li") ;
		targetLi.remove() ;
		alert("파일이 삭제되었습니다.") ;
		
	} 

});




</script>






<%@ include file="../footer.jsp" %>


