package com.example.demo.model;

public class Product {
	private int BoardIdx;
	private String bTitle;
	private String bContent;
	private String uNickName;
	private String uAddress;
	private int pPrice;
	public int getBoardIdx() {
		return BoardIdx;
	}
	public void setBoardIdx(int boardIdx) {
		BoardIdx = boardIdx;
	}
	public String getbTitle() {
		return bTitle;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	public String getbContent() {
		return bContent;
	}
	public void setbContent(String bContent) {
		this.bContent = bContent;
	}
	public String getuNickName() {
		return uNickName;
	}
	public void setuNickName(String uNickName) {
		this.uNickName = uNickName;
	}
	public String getuAddress() {
		return uAddress;
	}
	public void setuAddress(String uAddress) {
		this.uAddress = uAddress;
	}
	public int getpPrice() {
		return pPrice;
	}
	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}
}
