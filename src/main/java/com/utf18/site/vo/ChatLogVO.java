package com.utf18.site.vo;

public class ChatLogVO {
	private String email;
	private String content;
	private String time;
	private int num;

	public ChatLogVO() {
	}


	public ChatLogVO(String email, String content, int num) {
		this.email = email;
		this.content = content;
		this.num = num;
	}

	public ChatLogVO(String email, String content, String time, int num) {
		super();
		this.email = email;
		this.content = content;
		this.time = time;
		this.num = num;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}
}
