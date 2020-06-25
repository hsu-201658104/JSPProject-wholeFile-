package com.hanshin.example;

public class Member {

	private int id;
	private String name;
	private String pw;
	// 우클릭 후 source-getters,setters 선택 하면 자동으로 만들어짐
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
