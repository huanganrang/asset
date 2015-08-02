package jb.pageModel;

import java.util.Date;

import jb.listener.Application;

public class DiveStore implements java.io.Serializable {

	private static final long serialVersionUID = 5454155825314635342L;

	private java.lang.String id;	
	private java.lang.String name;	
	private java.lang.String icon;	
	private java.lang.String sumary;	
	private java.lang.String description;	
	private java.lang.String serverScope;	
	private java.lang.String area;	
	private java.lang.String status;	
	private Date addtime;			

	private int praiseNum;
	private boolean isPraise;
	
	public String getStatusZh() {
		return Application.getString(this.status);
	}
	
	public void setId(java.lang.String value) {
		this.id = value;
	}
	
	public java.lang.String getId() {
		return this.id;
	}

	
	public void setName(java.lang.String name) {
		this.name = name;
	}
	
	public java.lang.String getName() {
		return this.name;
	}
	public void setIcon(java.lang.String icon) {
		this.icon = icon;
	}
	
	public java.lang.String getIcon() {
		return this.icon;
	}
	public void setSumary(java.lang.String sumary) {
		this.sumary = sumary;
	}
	
	public java.lang.String getSumary() {
		return this.sumary;
	}
	public java.lang.String getDescription() {
		return description;
	}

	public void setDescription(java.lang.String description) {
		this.description = description;
	}

	public void setServerScope(java.lang.String serverScope) {
		this.serverScope = serverScope;
	}
	
	public java.lang.String getServerScope() {
		return this.serverScope;
	}
	public void setArea(java.lang.String area) {
		this.area = area;
	}
	
	public java.lang.String getArea() {
		return this.area;
	}
	public void setStatus(java.lang.String status) {
		this.status = status;
	}
	
	public java.lang.String getStatus() {
		return this.status;
	}
	public void setAddtime(Date addtime) {
		this.addtime = addtime;
	}
	
	public Date getAddtime() {
		return this.addtime;
	}
	
	public int getPraiseNum() {
		return praiseNum;
	}

	public void setPraiseNum(int praiseNum) {
		this.praiseNum = praiseNum;
	}
	
	public boolean isPraise() {
		return isPraise;
	}

	public void setPraise(boolean isPraise) {
		this.isPraise = isPraise;
	}
}
