package jb.pageModel;

import jb.listener.Application;


public class DiveCountry implements java.io.Serializable {

	private static final long serialVersionUID = 5454155825314635342L;

	private java.lang.Integer id;	
	private java.lang.String name;	
	private java.lang.String code;	
	private java.lang.String adCode;	

	public String getAdCodeZh() {
		return Application.getString(this.adCode) + "_" + this.adCode;
	}

	public void setId(java.lang.Integer value) {
		this.id = value;
	}
	
	public java.lang.Integer getId() {
		return this.id;
	}

	
	public void setName(java.lang.String name) {
		this.name = name;
	}
	
	public java.lang.String getName() {
		return this.name;
	}
	public void setCode(java.lang.String code) {
		this.code = code;
	}
	
	public java.lang.String getCode() {
		return this.code;
	}
	public void setAdCode(java.lang.String adCode) {
		this.adCode = adCode;
	}
	
	public java.lang.String getAdCode() {
		return this.adCode;
	}

}
