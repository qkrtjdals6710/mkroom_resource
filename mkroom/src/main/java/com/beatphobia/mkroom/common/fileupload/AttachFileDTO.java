package com.beatphobia.mkroom.common.fileupload;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class AttachFileDTO {
	
	private String fileName ;   //원본파일이름
	private String uploadPath ; //업로드 경로 : yyyy/MM/dd 형식의 문자열이 저장됨
	private String uuid ;
	private String fileType ;   //파일유형(이미지파일:I, 이미지가 아닌파일:F)
	private String repoPath = "C:/myupload"; //서버 레포지토리 경로
	

}
