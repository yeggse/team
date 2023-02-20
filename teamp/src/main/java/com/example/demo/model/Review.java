package com.example.demo.model;


public class Review {

   private int reviewnum;
   private String categori;
   private int resnum;
   private String title;
   private String writedate;
   private String content;
   private String grade;
   private String nickname;
   private String create_id;
   private String reskind;

   
   
public int getReviewnum() {
	return reviewnum;
}
public void setReviewnum(int reviewnum) {
	this.reviewnum = reviewnum;
}
public String getCategori() {
	return categori;
}
public void setCategori(String categori) {
	this.categori = categori;
}
public int getResnum() {
	return resnum;
}
public void setResnum(int resnum) {
	this.resnum = resnum;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public String getGrade() {
	return grade;
}
public void setGrade(String grade) {
	this.grade = grade;
}
public String getNickname() {
	return nickname;
}
public String getWritedate() {
	return writedate;
}
public void setWritedate(String writedate) {
	this.writedate = writedate;
}
public String getCreate_id() {
	return create_id;
}
public void setCreate_id(String create_id) {
	this.create_id = create_id;
}
public void setNickname(String nickname) {
	this.nickname = nickname;
}
public String getReskind() {
	return reskind;
}
public void setReskind(String reskind) {
	this.reskind = reskind;
}

}