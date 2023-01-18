package com.beatphobia.mkroom.domain.qna;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class FaqDTO {
	
	private long bno;
	private String btitle;
	private String bcontent ;
	private Date bregDate;
	private int bdelFlag;
	
	
	
}