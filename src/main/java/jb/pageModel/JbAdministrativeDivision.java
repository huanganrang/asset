package jb.pageModel;

import java.util.Date;

@SuppressWarnings("serial")
public class JbAdministrativeDivision implements java.io.Serializable {

	private static final long serialVersionUID = 5454155825314635342L;

	private java.lang.String id;	
	private java.lang.String name;	
	private java.lang.String pid;	
	private java.lang.String level;	
	private Date addtime;			

	

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
	public void setPid(java.lang.String pid) {
		this.pid = pid;
	}
	
	public java.lang.String getPid() {
		return this.pid;
	}
	public void setLevel(java.lang.String level) {
		this.level = level;
	}
	
	public java.lang.String getLevel() {
		return this.level;
	}
	public void setAddtime(Date addtime) {
		this.addtime = addtime;
	}
	
	public Date getAddtime() {
		return this.addtime;
	}

}
