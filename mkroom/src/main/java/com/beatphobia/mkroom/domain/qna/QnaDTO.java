package com.beatphobia.mkroom.domain.qna;

import java.util.Date;
import java.util.List;

import com.beatphobia.mkroom.common.fileupload.FileInfoDTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class QnaDTO {
	
	private long bno;
	private String btitle;
	private String bcontent ;
	private String bwriter;
	private Date bregDate;
	private int bviewCnt;
	private int breplyCnt;
	private int bdelFlag;
		
	private List<FileInfoDTO> attachFileList;

	//파일 널값때문에 시도중
//	public void setAttachFileList(String string) {
//	
//		
//	}
	
}
