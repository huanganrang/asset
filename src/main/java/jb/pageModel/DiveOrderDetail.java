package jb.pageModel;


public class DiveOrderDetail implements java.io.Serializable {

	private static final long serialVersionUID = 5454155825314635342L;

	private java.lang.String id;	
	private java.lang.String orderId;	
	private java.lang.String businessId;	
	private java.lang.String businessType;	
	private java.lang.Integer number;	
	private java.lang.Float price;	

	private String businessName;

	public void setId(java.lang.String value) {
		this.id = value;
	}
	
	public java.lang.String getId() {
		return this.id;
	}

	
	public void setOrderId(java.lang.String orderId) {
		this.orderId = orderId;
	}
	
	public java.lang.String getOrderId() {
		return this.orderId;
	}
	public void setBusinessId(java.lang.String businessId) {
		this.businessId = businessId;
	}
	
	public java.lang.String getBusinessId() {
		return this.businessId;
	}
	public void setBusinessType(java.lang.String businessType) {
		this.businessType = businessType;
	}
	
	public java.lang.String getBusinessType() {
		return this.businessType;
	}
	public void setNumber(java.lang.Integer number) {
		this.number = number;
	}
	
	public java.lang.Integer getNumber() {
		return this.number;
	}
	public void setPrice(java.lang.Float price) {
		this.price = price;
	}
	
	public java.lang.Float getPrice() {
		return this.price;
	}
	public String getBusinessName() {
		return businessName;
	}

	public void setBusinessName(String businessName) {
		this.businessName = businessName;
	}
}
