package com.example.demo.model;


public class Board {
    private int noticenum;
	private String title;
    private int hits;
    private String nickname;
    private String startdate;
	private String boardtype;
	private String content;
	private String id;
	private String image;
    
    public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getBoardtype() {
		return boardtype;
	}
	public void setBoardtype(String boardtype) {
		this.boardtype = boardtype;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getNoticenum() {
		return noticenum;
	}
	public void setNoticenum(int noticenum) {
		this.noticenum = noticenum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

}