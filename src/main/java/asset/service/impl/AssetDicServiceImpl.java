/**
 * 
 */
package asset.service.impl;

import java.util.LinkedHashMap;
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
	public LinkedHashMap<String, String> getAssetDicMap(Integer type) throws Exception {
		
		List<AssetDic> assetDicList = getAssetDic(type);
		if(null != assetDicList && assetDicList.size() > 0){
			LinkedHashMap<String,String> map = new LinkedHashMap<String,String>();
			for(AssetDic dic:assetDicList){
				map.put(dic.getDicKey(),dic.getDicValue());
			}
			return map;
		}
		return null;
	}

	@Override
	public void saveOrUpdate(AssetDic dic) throws Exception {
		dicDao.saveOrUpdate(dic);
	}
	
	public void updateDicValue(Integer type,String key,String value){
		dicDao.executeHql("update AssetDic set dicValue = '"+value+"' where dicType="+type+" and dicKey = '"+key+"'");
	}
	
	
	
}
