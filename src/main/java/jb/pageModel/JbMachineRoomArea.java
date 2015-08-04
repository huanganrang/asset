package jb.pageModel;

import java.util.Date;

@SuppressWarnings("serial")
public class JbMachineRoomArea implements java.io.Serializable {

	private static final long serialVersionUID = 5454155825314635342L;

	private java.lang.String id;	
	private java.lang.String roomId;	
	private java.lang.String name;	
	private java.lang.String scope;	
	private java.lang.String remark;	
	private Date addtime;			

	

	public void setId(java.lang.String value) {
		this.id = value;
	}
	
	public java.lang.String getId() {
		return this.id;
	}

	
	public void setRoomId(java.lang.String roomId) {
		this.roomId = roomId;
	}
	
	public java.lang.String getRoomId() {
		return this.roomId;
	}
	public void setName(java.lang.String name) {
		this.name = name;
	}
	
	public java.lang.String getName() {
		return this.name;
	}
	public void setScope(java.lang.String scope) {
		this.scope = scope;
	}
	
	public java.lang.String getScope() {
		return this.scope;
	}
	public void setRemark(java.lang.String remark) {
		this.remark = remark;
	}
	
	public java.lang.String getRemark() {
		return this.remark;
	}
	public void setAddtime(Date addtime) {
		this.addtime = addtime;
	}
	
	public Date getAddtime() {
		return this.addtime;
	}

}
