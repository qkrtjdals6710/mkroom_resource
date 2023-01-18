package com.beatphobia.mkroom.domain.quest;

import java.util.List;

import com.beatphobia.mkroom.common.fileupload.FileInfoDTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class QuestDTO {
	
	private String questName;
	private String branchLocation;
	private String genre;
	private int difficulty;
	private int questTime;
	private int minPlayerNum;
	private int maxPlayerNum;
	private String detailComment;
	private int delFlag;
	
	private List<FileInfoDTO> fileInfos;
	private List<String> selectTime;
}
