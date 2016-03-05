/**
 * 
 */
package asset.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import asset.dao.AssetDicDaoI;
import asset.model.AssetDic;
import asset.service.AssetDicServiceI;

/**
 * @author yanghui
 *
 */
@Service
public class AssetDicServiceImpl  implements AssetDicServiceI {
	
	@Autowired
	private AssetDicDaoI dicDao;

	@Override
	public List<AssetDic> getAssetDic(Integer type) throws Exception{
		return dicDao.find("from AssetDic where dicType=" + type);
	}

	@Override
	public Map<String, String> getAssetDicMap(Integer type) throws Exception {
		
		List<AssetDic> assetDicList = getAssetDic(type);
		if(null != assetDicList && assetDicList.size() > 0){
			HashMap<String,String> map = new HashMap<String,String>();
			for(AssetDic dic:assetDicList){
				map.put(dic.getDicKey(),dic.getDicValue());
			}
			return map;
		}
		return null;
	}
	
	
	
	
}
