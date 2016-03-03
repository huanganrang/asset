/**
 * 
 */
package asset.model;

import java.util.List;

/**
 * @author yanghui
 *
 */
public class AssetInfo {
	
	AssetBaseInfo baseInfo;
	List<AssetExtInfo> extList;
	
	public AssetBaseInfo getBaseInfo() {
		return baseInfo;
	}
	public void setBaseInfo(AssetBaseInfo baseInfo) {
		this.baseInfo = baseInfo;
	}
	public List<AssetExtInfo> getExtList() {
		return extList;
	}
	public void setExtList(List<AssetExtInfo> extList) {
		this.extList = extList;
	}
}
