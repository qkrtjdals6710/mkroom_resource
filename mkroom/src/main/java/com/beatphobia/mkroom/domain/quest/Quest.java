package com.beatphobia.mkroom.domain.quest;

import lombok.ToString;

@ToString
public class Quest {

//	QUESTNAME VARCHAR2 (100 BYTE)
//	MAXPLAYERNUM NUMBER (2)
//	GENRE CHAR (2 BYTE)
//	DIFFICULTY NUMBER (2)
//	BRANCH_LOCATION VARCHAR2 (200 BYTE)
//	UUID VARCHAR2 (100 BYTE)
	
	private String questName;
	private int maxPlayerNum;
	private String genre;
	private int difficulty;
	private String branchLocation;
	private String uuid;
	
	public Quest() {
		
	}

	public Quest(String questName, int maxPlayerNum, String genre, int difficulty, String branchLocation,
			String uuid) {
		this.questName = questName;
		this.maxPlayerNum = maxPlayerNum;
		this.genre = genre;
		this.difficulty = difficulty;
		this.branchLocation = branchLocation;
		this.uuid = uuid;
	}

	public String getQuestName() {
		return questName;
	}

	public void setQuestName(String questName) {
		this.questName = questName;
	}

	public int getMaxPlayerNum() {
		return maxPlayerNum;
	}

	public void setMaxPlayerNum(int maxPlayerNum) {
		this.maxPlayerNum = maxPlayerNum;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public int getDifficulty() {
		return difficulty;
	}

	public void setDifficulty(int difficulty) {
		this.difficulty = difficulty;
	}

	public String getBranchLocation() {
		return branchLocation;
	}

	public void setBranchLocation(String branchLocation) {
		this.branchLocation = branchLocation;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	
	
	
}
