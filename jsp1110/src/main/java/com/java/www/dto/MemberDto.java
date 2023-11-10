package com.java.www.dto;

import java.sql.Timestamp;

public class MemberDto {
	
	public MemberDto() {}//기본생성자
	
	public MemberDto(String id, String pw, String name, String phone, String gender, String hobby, Timestamp mdate) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.phone = phone;
		this.gender = gender;
		this.hobby = hobby;
		this.mdate = mdate;
	}//전체 생성자
	
	public MemberDto(String id, String pw, String name, String phone, String gender, String hobby) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.phone = phone;
		this.gender = gender;
		this.hobby = hobby;
	}//날짜 뺀 생성자

	public String id;
	public String pw;
	public String name;
	public String phone;
	public String gender;
	public String hobby;
	public Timestamp mdate;
	
	//get, set
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getHobby() {
		return hobby;
	}

	public void setHobby(String hobby) {
		this.hobby = hobby;
	}

	public Timestamp getMdate() {
		return mdate;
	}

	public void setMdate(Timestamp mdate) {
		this.mdate = mdate;
	}
		
}//class
