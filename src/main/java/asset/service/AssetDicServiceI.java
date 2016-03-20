/**
 * 
 */
package asset.service;

import java.util.List;
import java.util.Map;

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
	Map<String,String> getAssetDicMap(Integer type) throws Exception;
	
	
	
	/**
	 * 新增或者删除字典信息
	 * @param dic
	 * @throws Exception
	 */
	void saveOrUpdate(AssetDic dic) throws Exception;
}
