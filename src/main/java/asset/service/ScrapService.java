/**
 * 
 */
package asset.service;

import java.util.List;
import java.util.Map;

import jb.pageModel.PageHelper;
import asset.model.AssetBaseInfo;

/**
 * @author yanghui
 *
 */
public interface ScrapService {
	
	/**
	 * 获取库存列表
	 * @param ph
	 * @return
	 * @throws Exception
	 */
	List<AssetBaseInfo> getScrapList(Map<String,String> paramMap,PageHelper ph) throws Exception;
	
	
	/**
	 * 库存记录数
	 * @param key
	 * @return
	 * @throws Exception
	 */
	Long countScrap (Map<String,String> paramMap) throws Exception;
	
}
