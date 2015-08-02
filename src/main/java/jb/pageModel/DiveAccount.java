package jb.pageModel;

import java.util.Date;

import jb.listener.Application;

public class DiveAccount implements java.io.Serializable {

	private static final long serialVersionUID = 5454155825314635342L;

	private java.lang.String id;	
	private java.lang.String userName;	
	private java.lang.String password;	
	private java.lang.String icon;	
	private java.lang.String nickname;	
	private java.lang.String sex;	
	private java.lang.String city;	
	private java.lang.String personality;	
	private java.lang.String email;	
	private java.lang.String recommend;
	private java.lang.String hxPassword;
	private java.lang.String hxStatus;
	private Date addtime;			

	private int logNum; // 潜水日志数量
	private String qrCodePath; // 二维码地址
	
	public String getSexZh() {
		return Application.getString(this.sex);
	}

	public void setId(java.lang.String value) {
		this.id = value;
	}
	
	public java.lang.String getId() {
		return this.id;
	}

	
	public void setUserName(java.lang.String userName) {
		this.userName = userName;
	}
	
	public java.lang.String getUserName() {
		return this.userName;
	}
	public void setPassword(java.lang.String password) {
		this.password = password;
	}
	
	public java.lang.String getPassword() {
		return this.password;
	}
	public void setIcon(java.lang.String icon) {
		this.icon = icon;
	}
	
	public java.lang.String getIcon() {
		return this.icon;
	}
	public void setNickname(java.lang.String nickname) {
		this.nickname = nickname;
	}
	
	public java.lang.String getNickname() {
		return this.nickname;
	}
	public void setSex(java.lang.String sex) {
		this.sex = sex;
	}
	
	public java.lang.String getSex() {
		return this.sex;
	}
	public void setCity(java.lang.String city) {
		this.city = city;
	}
	
	public java.lang.String getCity() {
		return this.city;
	}
	public void setPersonality(java.lang.String personality) {
		this.personality = personality;
	}
	
	public java.lang.String getPersonality() {
		return this.personality;
	}
	public void setEmail(java.lang.String email) {
		this.email = email;
	}
	
	public java.lang.String getEmail() {
		return this.email;
	}
	public void setAddtime(Date addtime) {
		this.addtime = addtime;
	}
	
	public Date getAddtime() {
		return this.addtime;
	}
	
	public int getLogNum() {
		return logNum;
	}

	public void setLogNum(int logNum) {
		this.logNum = logNum;
	}
	
	public String getQrCodePath() {
		return qrCodePath;
	}

	public void setQrCodePath(String qrCodePath) {
		this.qrCodePath = qrCodePath;
	}
	
	public java.lang.String getRecommend() {
		return recommend;
	}

	public void setRecommend(java.lang.String recommend) {
		this.recommend = recommend;
	}

	public java.lang.String getHxPassword() {
		return hxPassword;
	}

	public void setHxPassword(java.lang.String hxPassword) {
		this.hxPassword = hxPassword;
	}
	public java.lang.String getHxStatus() {
		return hxStatus;
	}

	public void setHxStatus(java.lang.String hxStatus) {
		this.hxStatus = hxStatus;
	}
}
