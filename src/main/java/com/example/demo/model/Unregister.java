package com.example.demo.model;


public class Unregister { // 수정 해야됨
    private String uPassword;
    private String uNickname;
    
	public String getuPassword() {
		return uPassword;
	}
	public void setuPassword(String uPassword) {
		this.uPassword = uPassword;
	}
	public String getuNickname() {
		return uNickname;
	}
	public void setuNickname(String uNickname) {
		this.uNickname = uNickname;
	}
    
}