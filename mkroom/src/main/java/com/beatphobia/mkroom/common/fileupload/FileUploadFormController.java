package com.beatphobia.mkroom.common.fileupload;

import java.io.File;
import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class FileUploadFormController {
	private String uploadFileRepoDir = "C:\\myupload" ;
	
	@GetMapping(value="/fileUploadForm")
	public String callFileUploadFormPage() {
		log.info("upload Form 시작=====================");
		return "sample/fileUploadForm" ;
		
	}
	
	@PostMapping("/fileUploadFormAction")
	public String fileUploadActionPost(MultipartFile[] uploadFiles, Model model,
			                         @ModelAttribute("ename") String ename) {
		
		for(MultipartFile multipartFile : uploadFiles) {
			
			log.info("=================================");
			log.info("Upload File Name: "+ multipartFile.getOriginalFilename());
			log.info("Upload File Size: "+ multipartFile.getSize());
			
			String strUploadFileName = multipartFile.getOriginalFilename() ;
			
			strUploadFileName = strUploadFileName.substring(strUploadFileName.lastIndexOf("\\") + 1) ;
			
			File saveUploadFile = new File(uploadFileRepoDir, strUploadFileName) ;
			
			try {
				multipartFile.transferTo(saveUploadFile);
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				log.error(e.getMessage());
			} 
			
		}
		
		return "sample/fileUploadFormAction" ;
	}
	
	
}
