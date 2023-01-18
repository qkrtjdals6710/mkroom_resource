<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>file upload-test</title>
<script src="https://code.jquery.com/jquery-3.6.2.min.js"></script>


</head>
<body>




	<div class="form-group uploadDiv">
		<input id="inputFile" type="file" name="uploadFiles" multiple><br>
	</div>
	<div class="form-group fileUploadResult">
		<ul>

		</ul>
	</div>

	<button type="button" class="btn btn-primary" id="btnRegister">등록</button>
	<button type="button" class="btn btn-warning">취소</button>

<script>

var cloneInputFile = $(".uploadDiv").clone() ;


$(".uploadDiv").on("change", "input[type=file]" , function(){
	
	var formData = new FormData() ;
	
	var files = $(this)[0].files ;
	
	if(files == null || files.length == 0){
		return ;
	}
	
	
	for(var i = 0 ; i < files.length ; i++){
		
		if(!checkUploadFile(files[i].name, files[i].size)) {
			$(".uploadDiv").html(cloneInputFile) ;
			return ;
			
		}
		
		formData.append("uploadFiles", files[i]) ;
		
	}
	
	$.ajax({
		type: 'post' ,
		url: '${pageContext.request.contextPath}/files/fileUploadAjaxAction' ,
		data: formData ,
		dataType: "json" ,
		contentType: false , 
		processData: false , 
		
		
		success: function(listAttachInfo){
			console.log(listAttachInfo) ;
			
			$(".uploadDiv").html(cloneInputFile.html()) ;
			
			showUploadedFiles(listAttachInfo) ;
		}	
			
	});
	
}) ;


function checkUploadFile(fileName, fileSize) {
	
	var maxFileSizeAllowed = 104857600 ;
	var regExpFileExtension = /(.*)\.(exe|sh|zip|alz)$/i ;
	
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

function showUploadedFiles(uploadResult) {
	
	if(!uploadResult) {
		return ;	
	}
	
	var fileUploadResult = $(".fileUploadResult ul") ;
	
	//var str = "";
	
	
	$(uploadResult).each(function(i, obj){
	
		var li = undefined;
		var img = undefined;
		var span = undefined;
	
		if (obj.fileType == "F") {
			var calledPathFileName =  obj.repoPath + "/" + obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName ;
			li = $("<li>").attr("data-repopath", obj.repoPath)
					      .attr("data-uploadPath", obj.uploadPath)
					      .attr("data-uuid", obj.uuid)
					      .attr("data-fileName", obj.fileName)
					      .attr("data-filetype", "F");
			img = $("<img>").attr("src", "${pageContext.request.contextPath}/resources/img/icon-attach.png")
						    .attr("alt", "No icon")
						    .attr("style", "height:18px; width: 18px;")
			span = $("<span>").attr("data-filename", encodeURI(calledPathFileName))
							  .attr("data-filetype", "F")
							  .html("[삭제]");
			li.append(img)
			  .append("&nbsp;" + obj.fileName + "&nbsp;")
			  .append(span);

			/* 	
			str += "<li data-repopath='" + obj.repoPath + "'" 
			    +  "    data-uploadpath='" + obj.uploadPath + "'" 
			    +  "    data-uuid='" + obj.uuid + "'"
			    +  "    data-filename='" + obj.fileName + "' data-filetype='F'>" 
			    +  "    <img src='${pageContext.request.contextPath}/resources/img/icon-attach.png'"
			    +  "         alt='No icon' style='height:18px; width: 18px;' />&nbsp;"
			    +       obj.fileName
			    +  "    <span data-filename='" + encodeURI(calledPathFileName) + "' data-filetype='F'>[삭제]</span>"
			    +  "</li>" ; */
			
		} else  {  //if(obj.fileType == "I")

			var thumbnailPath =  obj.repoPath + "/" + obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName ;

			li = $("<li>").attr("data-repopath", obj.repoPath)
						  .attr("data-uploadPath", obj.uploadPath)
						  .attr("data-uuid", obj.uuid)
						  .attr("data-fileName", obj.fileName)
						  .attr("data-filetype", "I");
			img = $("<img>").attr("src", "${pageContext.request.contextPath}/displayThumbnail?fileName=" + encodeURI(thumbnailPath))
							.attr("alt", "No Image")
							.attr("style", "height:18px; width: 18px;")
			span = $("<span>").attr("data-filename", encodeURI(thumbnailPath))
							  .attr("data-filetype", "F")
							  .html("[삭제]");
			li.append(img)
			  .append("&nbsp;" + obj.fileName + "&nbsp;")
			  .append(span);
			/* 
			str += "<li data-repopath='" + obj.repoPath + "'" 
		    	+  "    data-uploadpath='" + obj.uploadPath + "'" 
			    +  "    data-uuid='" + obj.uuid + "'"
			    +  "    data-filename='" + obj.fileName + "' data-filetype='I'>"
			    +  "    <img src='${pageContext.request.contextPath}/displayThumbnail?fileName=" + encodeURI(thumbnailPath) + "'"
			    +  "         alt='No Image' style='height:18px; width: 18px;'/>&nbsp;" 
			    +       obj.fileName
			    +  "    <span data-filename='" + encodeURI(thumbnailPath) + "' data-filetype='I'>[삭제]</span>"			    
			    +  "</li>" ; */
		}
		
		fileUploadResult.append(li) ;
	});

	//fileUploadResult.append(str) ;
}



//파일 삭제
$(".fileUploadResult ul").on("click", "li span", function(e){
	var targetFileName = $(this).data("filename") ;
	var targetFileType = $(this).data("filetype") ;
	
	var li = $(this).parent() ;
	
	$.ajax({
		type: "post" ,
		url: "${pageContext.request.contextPath}/deleteUploadedFile" ,
		data: {fileName: targetFileName, fileType: targetFileType} ,
		dataType: "text" ,
		success: function(result) {
			if (result == "SuccessFileDelete") {
				alert("파일이 삭제되었습니다.") ;
				li.remove() ;
				
			} else {
				alert("오류: 파일 삭제 실패") ;
			}
		}
	
		
	});
	

});

//게시물 등록: 첨부파일 포함
$("#btnRegister").on("click", function(){

	
	var formObj = $("form[role='form']") ;
	//var strInputHidden = "" ;
	
	//업로드 결과의 li 요소 각각에 대하여 다음을 처리(이벤트 위임 이용)
	$(".fileUploadResult ul li").each(function(i, obj) {
		var objLi =$(obj) ;
		var uuid = $("<input>").attr("type", "hidden")
							   .attr("name", `attachFileList[${i}].uuid`)
							   .val(objLi.data("uuid"));
		var uploadPath = $("<input>").attr("type", "hidden")
							   .attr("name", `attachFileList[${i}].uploadpath`)
							   .val(objLi.data("uploadpath"));
		var fileName = $("<input>").attr("type", "hidden")
							   	   .attr("name", `attachFileList[${i}].filename`)
							   	   .val(objLi.data("filename"));
		var fileType = $("<input>").attr("type", "hidden")
							       .attr("name", `attachFileList[${i}].filetype`)
							       .val(objLi.data("filetype"));
		var repoPath = $("<input>").attr("type", "hidden")
							       .attr("name", `attachFileList[${i}].repopath`)
							       .val(objLi.data("repopath"));
	

		/* 
		strInputHidden += "<input type='hidden' name='attachFileList[" + i + "].uuid' value='" + objLi.data("uuid") + "' > "
		               +  "<input type='hidden' name='attachFileList[" + i + "].uploadPath' value='" + objLi.data("uploadpath") + "' > "
		               +  "<input type='hidden' name='attachFileList[" + i + "].fileName' value='" + objLi.data("filename") + "' > "
		               +  "<input type='hidden' name='attachFileList[" + i + "].fileType' value='" + objLi.data("filetype") + "' > "
		               +  "<input type='hidden' name='attachFileList[" + i + "].repoPath' value='" + objLi.data("repopath") + "' > " ; */
		
		formObj.append(uuid);	
		formObj.append(uploadPath);	
		formObj.append(fileName);	
		formObj.append(fileType);	
		formObj.append(repoPath);	
	});
	
	// formObj.append(strInputHidden) ;
	formObj.submit() ;
	
});



$(".fileUploadResult ul").on("click", "li", function(){
	var objLi = $(this);
	
	var downloadFileName = objLi.data("repopath") + "/" + objLi.data("uploadpath") + "/" + objLi.data("uuid") + "_" + objLi.data("filename") ;
	downloadFileName = downloadFileName.replace(new RegExp(/\\/g), "/") ;
	
	location.href = "${pageContext.request.contextPath}/files/fileDownloadAjax?fileName=" + encodeURI(downloadFileName) ;
	
	
}) ;



</script>


</body>
</html>