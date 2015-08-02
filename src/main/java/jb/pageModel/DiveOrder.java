package jb.pageModel;

import java.util.Date;
import java.util.List;

public class DiveOrder implements java.io.Serializable {

	private static final long serialVersionUID = 5454155825314635342L;

	private java.lang.String id;	
	private java.lang.String accountId;	
	private java.lang.String address;	
	private java.lang.String expressName;	
	private java.lang.String expressNo;	
	private java.lang.String payWay;	
	private java.lang.String remark;	
	private java.lang.String payStatus;	
	private java.lang.String orderStatus;	
	private java.lang.String sendStatus;	
	private Date paytime;			
	private Date addtime;			

	private List<DiveOrderDetail> detail_list;

	public void setId(java.lang.String value) {
		this.id = value;
	}
	
	public java.lang.String getId() {
		return this.id;
	}

	
	public void setAccountId(java.lang.String accountId) {
		this.accountId = accountId;
	}
	
	public java.lang.String getAccountId() {
		return this.accountId;
	}
	public void setAddress(java.lang.String address) {
		this.address = address;
	}
	
	public java.lang.String getAddress() {
		return this.address;
	}
	public void setExpressName(java.lang.String expressName) {
		this.expressName = expressName;
	}
	
	public java.lang.String getExpressName() {
		return this.expressName;
	}
	public void setExpressNo(java.lang.String expressNo) {
		this.expressNo = expressNo;
	}
	
	public java.lang.String getExpressNo() {
		return this.expressNo;
	}
	public void setPayWay(java.lang.String payWay) {
		this.payWay = payWay;
	}
	
	public java.lang.String getPayWay() {
		return this.payWay;
	}
	public void setRemark(java.lang.String remark) {
		this.remark = remark;
	}
	
	public java.lang.String getRemark() {
		return this.remark;
	}
	public void setPayStatus(java.lang.String payStatus) {
		this.payStatus = payStatus;
	}
	
	public java.lang.String getPayStatus() {
		return this.payStatus;
	}
	public void setOrderStatus(java.lang.String orderStatus) {
		this.orderStatus = orderStatus;
	}
	
	public java.lang.String getOrderStatus() {
		return this.orderStatus;
	}
	public void setSendStatus(java.lang.String sendStatus) {
		this.sendStatus = sendStatus;
	}
	
	public java.lang.String getSendStatus() {
		return this.sendStatus;
	}
	public void setPaytime(Date paytime) {
		this.paytime = paytime;
	}
	
	public Date getPaytime() {
		return this.paytime;
	}
	public void setAddtime(Date addtime) {
		this.addtime = addtime;
	}
	
	public Date getAddtime() {
		return this.addtime;
	}

	public List<DiveOrderDetail> getDetail_list() {
		return detail_list;
	}

	public void setDetail_list(List<DiveOrderDetail> detail_list) {
		this.detail_list = detail_list;
	}
}
