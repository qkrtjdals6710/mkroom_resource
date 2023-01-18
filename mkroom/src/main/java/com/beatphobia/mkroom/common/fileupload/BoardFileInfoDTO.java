package com.beatphobia.mkroom.common.fileupload;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@ToString
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class BoardFileInfoDTO {
	
	private String uuid;
	private String uploadPath;
	private String fileName;
	private String fileType;
	private String beforeFileCheck;
	
	
}
