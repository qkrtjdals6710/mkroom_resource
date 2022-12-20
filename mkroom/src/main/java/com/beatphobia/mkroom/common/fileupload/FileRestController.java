package com.beatphobia.mkroom.common.fileupload;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@RestController
@RequestMapping("/files")
@Log4j
public class FileRestController {
	
	
	private String uploadFileRepoDir = "C:/myupload" ;
	
	
	private String getDatePathName() {
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd") ;
		
		Date date = new Date() ;
		
		String strDatePathName = simpleDateFormat.format(date) ;
		
		return strDatePathName ;
	}
	
	private boolean checkIsImageForUploadFile(File uploadFile) {
		
		try {
			String strContentType = Files.probeContentType(uploadFile.toPath()) ;
			
			return strContentType.startsWith("image") ;
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return false ;
	}
	
	
	@PostMapping(value = "/fileUploadAjaxAction", produces = {"application/json; charset=utf-8"})
	public ResponseEntity<List<AttachFileDTO>> fileUploadActionPost(MultipartFile[] uploadFiles) {
		
		List<AttachFileDTO> listAttachInfo = new ArrayList<AttachFileDTO>() ;
		
		
		String strDatePathName = getDatePathName() ;
		String strFileUploadPath =  uploadFileRepoDir + "/" + strDatePathName ;
		
		File fileUploadPath = new File(strFileUploadPath) ;
		
		if(!fileUploadPath.exists()) {
			fileUploadPath.mkdirs() ;
		}

		
		for(MultipartFile multipartFile : uploadFiles ) {
			
			AttachFileDTO attachInfo = new AttachFileDTO() ;
			
			attachInfo.setUploadPath(strDatePathName) ;
			attachInfo.setRepoPath(uploadFileRepoDir) ;
			
			String strUploadFileName = multipartFile.getOriginalFilename() ;
			strUploadFileName = strUploadFileName.substring(strUploadFileName.lastIndexOf("\\") + 1) ;
			
			attachInfo.setFileName(strUploadFileName) ;
			
			//추가고려사항 2: UUID를 이용한 고유한 파일이름 적용
			UUID uuid = UUID.randomUUID() ;
			
			attachInfo.setUuid(uuid.toString()) ;			
			strUploadFileName = uuid.toString() + "_" + strUploadFileName ;
			
			File saveUploadFile = new File(fileUploadPath, strUploadFileName) ;
			
			try {
				
				if (checkIsImageForUploadFile(saveUploadFile)) {
					attachInfo.setFileType("I") ;
					FileOutputStream fileOutputStream = 
							new FileOutputStream(new File(fileUploadPath, "s_" + strUploadFileName)) ;
					
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), 
							                      fileOutputStream, 
							                      20, 20) ;
					
					fileOutputStream.flush() ;
					fileOutputStream.close() ;					
				
				} else {
					attachInfo.setFileType("F") ;	
				}
				
				multipartFile.transferTo(saveUploadFile);
				
			} catch (IllegalStateException | IOException e) {
				
				log.error(e.getMessage());
			}
			
			listAttachInfo.add(attachInfo) ;
			

		} //for-end

		return new ResponseEntity<List<AttachFileDTO>> (listAttachInfo, HttpStatus.OK) ;
		
	}
	
	@GetMapping("/displayThumbnail")
	public ResponseEntity<byte[]> sendThumbNailFile(String fileName) {
		
		File file = new File(fileName) ;
		
		ResponseEntity<byte[]> result = null ;
		
		HttpHeaders header = new HttpHeaders() ;
		
		try {
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			
			result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		return result ;
	}
	
	@PostMapping("/deleteUploadedFile")
	public ResponseEntity<String> deleteFile(String fileName, String fileType) {
		
		File delFile = null ;
		
		try {
			delFile = new File (URLDecoder.decode(fileName, "utf-8")) ;
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<String>(HttpStatus.NOT_FOUND) ;
		}
		
		delFile.delete() ; //일반파일, 썸네일 파일 삭제
		
		if(fileType.equals("I")) {
			
			
			String imageFileName = delFile.getAbsolutePath().replace("s_", "") ;
			delFile = new File(imageFileName) ;
			
			delFile.delete() ; //원본이미지 파일 삭제
		}
		
		return new ResponseEntity<String>("SuccessFileDelete", HttpStatus.OK) ;
	}
	
	
	@GetMapping(value="/fileDownloadAjax", produces = "application/octet-stream")
	public ResponseEntity<Resource> fileDownloadActionAjax(@RequestHeader("User-Agent") String userAgent, 
														   String fileName){
		//log.info("브라우저로 요청에서 전달된 User-Agent 해더정보: "+ userAgent);
		//log.info("처리 전 파일이름: " + fileName);
		
		Resource resource = new FileSystemResource(fileName);
		//log.info("resource :" + resource);
		
		if(!resource.exists()) {
			return new ResponseEntity<Resource>(HttpStatus.NOT_FOUND) ;
			
		} 
		
		String resourceFileName = resource.getFilename() ;
		//log.info("UUID 제거 전 resourceFileName :" + resourceFileName);
		
		//UUID가 제거된 파일이름
		resourceFileName = resourceFileName.substring(resourceFileName.indexOf("_") + 1) ;
		//log.info("UUID 제거 후 resourceFileName :" + resourceFileName);
		
		HttpHeaders httpHeaders = new HttpHeaders() ;
		
		String downloadFileName  = null ;
		
		if ( userAgent.contains("Trident") || userAgent.contains("MSIE") ||
				userAgent.contains("Edge") || userAgent.contains("Edg")) {
			
			//downloadFileName = resourceFileName ;
			
			try {
				downloadFileName = URLEncoder.encode(resourceFileName, "utf-8");

			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			//log.info("downloadFileName: " + downloadFileName) ;
			
			
		} else { 
			
			try {
				downloadFileName = new String(resourceFileName.getBytes("utf-8"), "ISO-8859-1") ;
				//log.info("Chrome에서의 파일이름: "+ downloadFileName);
			
				
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		httpHeaders.add("Content-Disposition", "attachment; filename=" + downloadFileName) ;
		
		
		
		return new ResponseEntity<Resource>(resource, httpHeaders, HttpStatus.OK) ;
	}
}
