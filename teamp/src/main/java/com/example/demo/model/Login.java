package com.example.demo.model;


public class Login {
	private String id; 
	private String pwd;
	private String name;
	private int frontregisnum;
	private int afterregisnum;

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public int getFrontregisnum() {
		return frontregisnum;
	}
	public void setFrontregisnum(int frontregisnum) {
		this.frontregisnum = frontregisnum;
	}
	public int getAfterregisnum() {
		return afterregisnum;
	}
	public void setAfterregisnum(int afterregisnum) {
		this.afterregisnum = afterregisnum;
	}
	

}