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
	 * 根据ID获取资产基本信息
	 * @param id
	 * @return
	 * @throws Exception
	 */
	AssetBaseInfo getAssetBaseInfoByItNumber(String itNumber) throws Exception;
	
	
	
	public List<AssetExtInfo> getAssetExtInfo(List<Integer> ids) throws Exception;
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
	 * @param key
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
	 * 资产记录数
	 * @param key
	 * @return
	 * @throws Exception
	 */
	Long countAsset (Map<String,String> paramMap) throws Exception;
	
	

	/**
	 * 资产记录数
	 * @param key
	 * @return
	 * @throws Exception
	 */
	Long countAsset (Map<String,String> baseMap,Map<String,String> extMap) throws Exception;
	
	/**
	 * 高级搜索
	 * @param key
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
	
	
	/**
	 * 获取所有的扩展属性（数据量不是很多）
	 * @return
	 * @throws Exception
	 */
	Map<String,List<AssetAttr>> getAllAttrByCate() throws Exception;
	
	
	/**
	 * 获取资产列表
	 * @param ph
	 * @return
	 * @throws Exception
	 */
	List<AssetInfo> getAssetList(Map<String,String> paramMap,PageHelper ph) throws Exception;
	
	
	
	/**
	 * 获取资产列表
	 * @param ph
	 * @return
	 * @throws Exception
	 */
	List<AssetInfo> getAssetList(Map<String,String> baseMap,Map<String,String> extMap,PageHelper ph) throws Exception;
	
	
      
	/**
	 * 根据ID更新基本信息
	 * @param base
	 * @return
	 * @throws Exception
	 */
	int updateAssetById(AssetBaseInfo base) throws Exception;
	
	
	/**
	 * 根据ID更新设备状态
	 * @param base
	 * @return
	 * @throws Exception
	 */
	int updateAssetStatusById(Integer assetId,String status) throws Exception;
	
	
	/**
	 * 根据ID更新扩展信息
	 * @param base
	 * @return
	 * @throws Exception
	 */
	int updateAssetExtById(AssetExtInfo ext) throws Exception;
	
	
	/**
	 * ###########################
	 * 
	 */
	/**
	 * 获取获取台账信息
	 * @return
	 */
	List<AssetBaseInfo> getLedgerList(PageHelper ph);

	/**
	 * 添加AssetBaseInfo
	 *
	 * @param assetBaseInfo
	 */
	Integer add(AssetBaseInfo assetBaseInfo);
	
	
	/**
	 * 添加AssetExtInfo
	 *
	 * @param assetBaseInfo
	 */
	void addExtInfo(AssetExtInfo extInfo);

	/**
	 * 修改AssetBaseInfo
	 *
	 * @param assetBaseInfo
	 */
	void edit(AssetBaseInfo assetBaseInfo);

	/**
	 * 删除AssetBaseInfo
	 *
	 * @param assetId
	 */
	void delete(String assetId);

}
