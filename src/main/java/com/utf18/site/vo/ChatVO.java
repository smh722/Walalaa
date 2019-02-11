package com.utf18.site.vo;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

/*
CREATE TABLE CHAT(
    NUM NUMBER(20) PRIMARY KEY,
    NAME VARCHAR2(500) NOT NULL,
    PWD VARCHAR2(500),
    TOTALCOUNT NUMBER(3) NOT NULL,
    REMAINCOUNT NUMBER(3) NOT NULL,
    CONTENT VARCHAR2(4000) NOT NULL
);

CREATE SEQUENCE CHAT_SEQ
START WITH 1 INCREMENT BY 1;
 */
public class ChatVO implements Serializable {

	private static final long serialVersionUID = 8087582886569691632L;

	private int num; // 방번호
	private String name; // 방이름
	private String filterword; // 비밀번호
	private int totalcount; // 접속자제한수
	private int remaincount; // 남은사람수
	private String content; // 내용
	private String owner; // 방 생성하는 사람

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

//DB 이미지 경로 추가
	private String fileName;

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}

	private MultipartFile uploadFile;

	public ChatVO() {
	}

	public ChatVO(int num, String name, String filterword, int totalcount, int remaincount, String content) {
		this.num = num;
		this.name = name;
		this.filterword = filterword;
		this.totalcount = totalcount;
		this.remaincount = remaincount;
		this.content = content;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getFilterword() {
		return filterword;
	}

	public void setFilterword(String filterword) {
		this.filterword = filterword;
	}

	public int getTotalcount() {
		return totalcount;
	}

	public void setTotalcount(int totalcount) {
		this.totalcount = totalcount;
	}

	public int getRemaincount() {
		return remaincount;
	}

	public void setRemaincount(int remaincount) {
		this.remaincount = remaincount;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "ChatVO [num=" + num + ", name=" + name + ", filterword=" + filterword + ", totalcount=" + totalcount
				+ ", remaincount=" + remaincount + ", content=" + content + "]";
	}

}