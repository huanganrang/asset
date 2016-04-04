package asset.model;

// Generated 2016-4-3 6:18:39 by Hibernate Tools 3.4.0.CR1

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * AssetAllocation generated by hbm2java
 */
@Entity
@Table(name = "asset_allocation", catalog = "asset")
public class AssetAllocation implements java.io.Serializable {

	private String allocationDate;
	private int assetId;
	private String allocationCompany;
	private int allocationStatus;
	private Date allocationCreateTime;
	private Date allocationModifyTime;

	public AssetAllocation() {
	}

	public AssetAllocation( int assetId, String allocationDate,
			String allocationCompany, int allocationStatus) {
		this.allocationDate = allocationDate;
		this.assetId = assetId;
		this.allocationCompany = allocationCompany;
		this.allocationStatus = allocationStatus;
	}

	public AssetAllocation(String allocationDate, int assetId,
			String allocationCompany, int allocationStatus,
			Date allocationCreateTime, Date allocationModifyTime) {
		this.allocationDate = allocationDate;
		this.assetId = assetId;
		this.allocationCompany = allocationCompany;
		this.allocationStatus = allocationStatus;
		this.allocationCreateTime = allocationCreateTime;
		this.allocationModifyTime = allocationModifyTime;
	}


	@Column(name = "allocation_date", nullable = false)
	public String getAllocationDate() {
		return this.allocationDate;
	}

	public void setAllocationDate(String allocationDate) {
		this.allocationDate = allocationDate;
	}

	@Id
	@Column(name = "asset_id", nullable = false)
	public int getAssetId() {
		return this.assetId;
	}

	public void setAssetId(int assetId) {
		this.assetId = assetId;
	}

	@Column(name = "allocation_company", nullable = false)
	public String getAllocationCompany() {
		return this.allocationCompany;
	}

	public void setAllocationCompany(String allocationCompany) {
		this.allocationCompany = allocationCompany;
	}

	@Column(name = "allocation_status", nullable = false)
	public int getAllocationStatus() {
		return this.allocationStatus;
	}

	public void setAllocationStatus(int allocationStatus) {
		this.allocationStatus = allocationStatus;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "allocation_create_time", length = 19)
	public Date getAllocationCreateTime() {
		return this.allocationCreateTime;
	}

	public void setAllocationCreateTime(Date allocationCreateTime) {
		this.allocationCreateTime = allocationCreateTime;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "allocation_modify_time", length = 19)
	public Date getAllocationModifyTime() {
		return this.allocationModifyTime;
	}

	public void setAllocationModifyTime(Date allocationModifyTime) {
		this.allocationModifyTime = allocationModifyTime;
	}
}
