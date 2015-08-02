package jb.pageModel;

import java.util.Date;
import java.util.List;

public class DiveActivity implements java.io.Serializable {

	private static final long serialVersionUID = 5454155825314635342L;

	private java.lang.String id;	
	private java.lang.String name;	
	private Date startDate;			
	private Date endDate;			
	private java.lang.String startAddr;	
	private java.lang.String addrId;	
	private java.lang.String endAddr;	
	private java.lang.String description;	
	private java.lang.String status;	
	private java.lang.String stamp;	
	private Date addtime;		
	
	private int commentNum; //评论数量
	private int collectNum; //收藏数量
	private int applyNum;  //报名人数
	private int praiseNum;  //赞人数
	
	private boolean isCollect;
	
	//报名者
	private List<DiveAccount> applies;
	//评论
	private List<DiveActivityComment> diveActivityCommentList;

	

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
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	
	public Date getStartDate() {
		return this.startDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	
	public Date getEndDate() {
		return this.endDate;
	}
	public void setStartAddr(java.lang.String startAddr) {
		this.startAddr = startAddr;
	}
	
	public java.lang.String getStartAddr() {
		return this.startAddr;
	}
	public void setAddrId(java.lang.String addrId) {
		this.addrId = addrId;
	}
	
	public java.lang.String getAddrId() {
		return this.addrId;
	}
	public void setEndAddr(java.lang.String endAddr) {
		this.endAddr = endAddr;
	}
	
	public java.lang.String getEndAddr() {
		return this.endAddr;
	}
	public void setDescription(java.lang.String description) {
		this.description = description;
	}
	
	public java.lang.String getDescription() {
		return this.description;
	}
	public void setStatus(java.lang.String status) {
		this.status = status;
	}
	
	public java.lang.String getStatus() {
		return this.status;
	}
	public void setStamp(java.lang.String stamp) {
		this.stamp = stamp;
	}
	
	public java.lang.String getStamp() {
		return this.stamp;
	}
	public void setAddtime(Date addtime) {
		this.addtime = addtime;
	}
	
	public Date getAddtime() {
		return this.addtime;
	}

	public int getCommentNum() {
		return commentNum;
	}

	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
	}

	public int getCollectNum() {
		return collectNum;
	}

	public void setCollectNum(int collectNum) {
		this.collectNum = collectNum;
	}

	public int getApplyNum() {
		return applyNum;
	}

	public void setApplyNum(int applyNum) {
		this.applyNum = applyNum;
	}

	public int getPraiseNum() {
		return praiseNum;
	}

	public void setPraiseNum(int praiseNum) {
		this.praiseNum = praiseNum;
	}

	public List<DiveAccount> getApplies() {
		return applies;
	}

	public void setApplies(List<DiveAccount> applies) {
		this.applies = applies;
	}

	public List<DiveActivityComment> getDiveActivityCommentList() {
		return diveActivityCommentList;
	}

	public void setDiveActivityCommentList(
			List<DiveActivityComment> diveActivityCommentList) {
		this.diveActivityCommentList = diveActivityCommentList;
	}

	public boolean isCollect() {
		return isCollect;
	}

	public void setCollect(boolean isCollect) {
		this.isCollect = isCollect;
	}


}
