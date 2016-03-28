/**
 * 
 */
package asset.service;

import java.util.LinkedHashMap;
import java.util.List;

import asset.model.AssetDic;


/**
 * @author yanghui
 *
 */
public interface AssetDicServiceI {
	
	/**
	 * 查询字典信息
	 * @param type
	 * @return
	 */
	List<AssetDic> getAssetDic(Integer type) throws Exception;
	
	
	/**
	 * 查询字典信息
	 * @param type
	 * @return
	 * @throws Exception
	 */
	LinkedHashMap<String,String> getAssetDicMap(Integer type) throws Exception;
	
	
	
	/**
	 * 新增或者删除字典信息
	 * @param dic
	 * @throws Exception
	 */
	void saveOrUpdate(AssetDic dic) throws Exception;
}
