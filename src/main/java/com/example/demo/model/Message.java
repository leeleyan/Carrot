package com.example.demo.model;


public class Message { // 수정 해야됨
    private int mNo;
    private String uSender;
    private String uRecipient;
    private String mTitle;
    private String mContent;
    private String createDate;
    
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