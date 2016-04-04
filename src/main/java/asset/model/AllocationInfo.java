/**
 * 
 */
package asset.model;

import java.util.Date;

/**
 * @author yanghui
 *
 */
public class AllocationInfo implements java.io.Serializable{
	
	private Integer asset_id;
	private String asset_it_number;
	private String asset_number;
	private String asset_type;
	private String asset_name;
	private String asset_model;
	private String asset_device_status;
	private String allocation_date;
	private String allocation_company;
	public Integer getAsset_id() {
		return asset_id;
	}
	public void setAsset_id(Integer asset_id) {
		this.asset_id = asset_id;
	}
	public String getAsset_it_number() {
		return asset_it_number;
	}
	public void setAsset_it_number(String asset_it_number) {
		this.asset_it_number = asset_it_number;
	}
	public String getAsset_number() {
		return asset_number;
	}
	public void setAsset_number(String asset_number) {
		this.asset_number = asset_number;
	}
	public String getAsset_type() {
		return asset_type;
	}
	public void setAsset_type(String asset_type) {
		this.asset_type = asset_type;
	}
	public String getAsset_name() {
		return asset_name;
	}
	public void setAsset_name(String asset_name) {
		this.asset_name = asset_name;
	}
	public String getAsset_model() {
		return asset_model;
	}
	public void setAsset_model(String asset_model) {
		this.asset_model = asset_model;
	}
	public String getAsset_device_status() {
		return asset_device_status;
	}
	public void setAsset_device_status(String asset_device_status) {
		this.asset_device_status = asset_device_status;
	}
	
	public String getAllocation_date() {
		return allocation_date;
	}
	public void setAllocation_date(String allocation_date) {
		this.allocation_date = allocation_date;
	}
	public String getAllocation_company() {
		return allocation_company;
	}
	public void setAllocation_company(String allocation_company) {
		this.allocation_company = allocation_company;
	}
	
	
	
	
}
