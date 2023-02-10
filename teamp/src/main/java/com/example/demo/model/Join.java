package com.example.demo.model;

public class Join {
	private String kind; //회원타입(20)
	private String id;  //아이디(20) *pk*
	private String pwd;  //비밀번호(20)
	private String nickname;  //닉네임(20)
	private String name;  //이름(20)
	private String email;  //메일(20)
	private String resname;  //사업자명(20)
	private String add; // 주소(20)
	private int resnum; // 사업자번호
	private int resphone; // 사업자연락처
	private int acc; // 계좌
	
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
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
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getResname() {
		return resname;
	}
	public void setResname(String resname) {
		this.resname = resname;
	}
	public String getAdd() {
		return add;
	}
	public void setAdd(String add) {
		this.add = add;
	}
	public int getResnum() {
		return resnum;
	}
	public void setResnum(int resnum) {
		this.resnum = resnum;
	}
	public int getResphone() {
		return resphone;
	}
	public void setResphone(int resphone) {
		this.resphone = resphone;
	}
	public int getAcc() {
		return acc;
	}
	public void setAcc(int acc) {
		this.acc = acc;
	}
	public int getRegisnum() {
		return regisnum;
	}
	public void setRegisnum(int regisnum) {
		this.regisnum = regisnum;
	}
	private int regisnum; // 주민번호

}
