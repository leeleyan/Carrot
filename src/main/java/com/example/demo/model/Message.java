package com.example.demo.model;


public class Message {
    private int mNo; // 게시물 번호
    private String uSender; // 보낸사람 닉네임
    private String uRecipient; // 받는사람 닉네임
    private String mTitle; // 쪽지 제목
    private String mContent; // 쪽지 내용
    private String createDate; // 보낸 시간
    
	public int getmNo() {
		return mNo;
	}
	public void setmNo(int mNo) {
		this.mNo = mNo;
	}
	public String getuSender() {
		return uSender;
	}
	public void setuSender(String uSender) {
		this.uSender = uSender;
	}
	public String getuRecipient() {
		return uRecipient;
	}
	public void setuRecipient(String uRecipient) {
		this.uRecipient = uRecipient;
	}
	public String getmTitle() {
		return mTitle;
	}
	public void setmTitle(String mTitle) {
		this.mTitle = mTitle;
	}
	public String getmContent() {
		return mContent;
	}
	public void setmContent(String mContent) {
		this.mContent = mContent;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
}