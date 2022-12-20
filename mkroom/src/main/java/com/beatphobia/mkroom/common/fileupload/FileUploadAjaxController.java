package com.beatphobia.mkroom.common.fileupload;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
public class FileUploadAjaxController {
	
	private String uploadFileRepoDir = "C:/myupload" ;
	
	@GetMapping(value="/fileUploadAjax")
	public String callFileUploadFormPage() {
		return "sample/fileUploadAjax" ;
		
	}
	
	private String getDatePathName() {
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd") ;
		
		Date date = new Date() ;
		
		String strDatePathName = simpleDateFormat.format(date) ;
		
		return strDatePathName ;
	}
	
	//추가고려사항 4: 업로드 파일의 이미지파일 유무 확인 메서드
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
	@ResponseBody
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
	@ResponseBody
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
	@ResponseBody
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

}
