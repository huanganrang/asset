/**
 * 
 */
package asset.service;

import java.util.List;
import java.util.Map;

import jb.pageModel.PageHelper;
import asset.model.AssetAttr;
import asset.model.AssetBaseInfo;
import asset.model.AssetExtInfo;
import asset.model.AssetInfo;

/**
 * @author yanghui
 *
 */
public interface AssetBaseServiceI {

	
	/**
	 * 根据ID获取资产基本信息
	 * @param id
	 * @return
	 * @throws Exception
	 */
	AssetBaseInfo getAssetBaseInfo(Integer id) throws Exception;
	
	
	/**
	 * 根据ID获取资产扩展信息
	 * @param id
	 * @return
	 * @throws Exception
	 */
	List<AssetExtInfo> getAssetExtInfo(Integer id) throws Exception;
	
	
	/**
	 * 根据ID获取资产全部信息
	 * @param id
	 * @return
	 * @throws Exception
	 */
	AssetInfo getAssetInfo(Integer id) throws Exception;
	
	
	/**
	 * 搜索
	 * @param id
	 * @return
	 * @throws Exception
	 */
	List<AssetBaseInfo> searchAssetBaseInfo(String key,PageHelper ph) throws Exception;
	
	
	/**
	 * 搜索总记录数
	 * @param key
	 * @return
	 * @throws Exception
	 */
	Long countAssetSearch (String key) throws Exception;
	
	/**
	 * 高级搜索
	 * @param id
	 * @return
	 * @throws Exception
	 */
	List<AssetInfo> searchAssetInfo(String key,PageHelper ph) throws Exception;
	
	
	/**
	 * 根据类别获取扩展属性
	 * @param cate
	 * @return
	 * @throws Exception
	 */
	List<AssetAttr> getAssetAttr(String cate) throws Exception;
	
	
	/**
	 * 获取所有的扩展属性（数据量不是很多）
	 * @return
	 * @throws Exception
	 */
	Map<String,String> getAllAttr() throws Exception;
	
}
