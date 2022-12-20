package com.beatphobia.mkroom.domain.fileinfo;

import lombok.ToString;

@ToString
public class FileInfo {

//	UUID VARCHAR2 (100 BYTE)
//	UPLOADPATH VARCHAR2 (250 BYTE)
//	FILENAME VARCHAR2 (100 BYTE)
//	FILETYPE CHAR (1 BYTE)
	
	private String uuid;
	private String uploadPath;
	private String fileName;
	private String fileType;
	
	public FileInfo() {
		
	}

	public FileInfo(String uuid, String uploadPath, String fileName, String fileType) {
		this.uuid = uuid;
		this.uploadPath = uploadPath;
		this.fileName = fileName;
		this.fileType = fileType;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getUploadPath() {
		return uploadPath;
	}

	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	
}
