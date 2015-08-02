package jb.pageModel;

import java.util.List;
import java.util.Map;

@SuppressWarnings("rawtypes")
public class DiveHomePage implements java.io.Serializable {

	private static final long serialVersionUID = -4646376589460527543L;
	
	private String icon; // 个人头像图标
	private List<Map> travel_list; // 潜水旅游列表
	private List<Map> address_list;	// 潜点列表
	private List<Map> store_list;	// 度假村/潜水店列表
	
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public List<Map> getTravel_list() {
		return travel_list;
	}
	public void setTravel_list(List<Map> travel_list) {
		this.travel_list = travel_list;
	}
	public List<Map> getAddress_list() {
		return address_list;
	}
	public void setAddress_list(List<Map> address_list) {
		this.address_list = address_list;
	}
	public List<Map> getStore_list() {
		return store_list;
	}
	public void setStore_list(List<Map> store_list) {
		this.store_list = store_list;
	}
	
}
