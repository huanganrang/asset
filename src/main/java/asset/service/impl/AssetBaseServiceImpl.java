/**
 * 
 */
package asset.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jb.pageModel.PageHelper;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import asset.dao.AssetAttrDaoI;
import asset.dao.AssetBaseDaoI;
import asset.dao.AssetExtDaoI;
import asset.model.AssetAttr;
import asset.model.AssetBaseInfo;
import asset.model.AssetExtInfo;
import asset.model.AssetInfo;
import asset.service.AssetBaseServiceI;

/**
 * @author yanghui
 *
 */
@Service
public class AssetBaseServiceImpl  implements AssetBaseServiceI {
	
	@Autowired
	private AssetBaseDaoI baseDao; 
	
	@Autowired
	private AssetExtDaoI baseExtDao; 
	
	@Autowired
	private AssetAttrDaoI attrDao;

	@Override
	public AssetBaseInfo getAssetBaseInfo(Integer id) throws Exception {
		Map<String, Object> params = new HashMap<String,Object>();
		params.put("id",id);
		return baseDao.get(" from AssetBaseInfo where asset_id = :id",params);
	}


	@Override
	public List<AssetExtInfo> getAssetExtInfo(Integer id) throws Exception {
		Map<String, Object> params = new HashMap<String,Object>();
		params.put("id",id);
		String hql = "from AssetExtInfo where assetId = :id and assetStatus = 1";
		return baseExtDao.find(hql,params);
	}


	@Override
	public AssetInfo getAssetInfo(Integer id) throws Exception {
		AssetBaseInfo base = getAssetBaseInfo(id);
		if(null != base){
			AssetInfo asset = new AssetInfo();
			Integer assetId = base.getAssetId();
			List<AssetExtInfo> extInfoList = getAssetExtInfo(assetId);
			asset.setBaseInfo(base);
			asset.setExtList(extInfoList);
			return asset;
		}
		return null;
	}


	@Override
	public List<AssetBaseInfo> searchAssetBaseInfo(String key, PageHelper ph)
			throws Exception {
		
		String hql = " from AssetBaseInfo t ";
		String where = whereHql(key);
		List<AssetBaseInfo> l;
		if(null != ph){
			 l = baseDao.find(hql  + where + orderHql(ph), null, ph.getPage(), ph.getRows());
		}else{
			 l = baseDao.find(hql  + where + orderHql(ph), null, 1,10);
		}
		return l;
	}
	
	protected String orderHql(PageHelper ph) {
		String orderString = "";
		if (null != ph && ph.getSort() != null && ph.getOrder() != null) {
			orderString = " order by t." + ph.getSort() + " " + ph.getOrder();
		}
		return orderString;
	}
	
	protected String whereHql(String key) {
		String whereHql = "where t.assetStatus = 1 and (";	
		if (StringUtils.isNotBlank(key)) {
			whereHql += " t.assetItNumber like '%"+key+"%' or ";
			whereHql += " t.assetNumber like '%"+key+"%' or ";
			whereHql += " t.assetType like '%"+key+"%' or ";
			whereHql += " t.assetName like '%"+key+"%' or ";
			whereHql += " t.assetMaker like '%"+key+"%' or ";
			whereHql += " t.assetModel like '%"+key+"%' or ";
			whereHql += " t.assetSerial like '%"+key+"%' or ";
			whereHql += " t.assetInvoice like '%"+key+"%' or ";
			whereHql += " t.assetProperties like '%"+key+"%')";
		}
		return whereHql;
	}


	@Override
	public List<AssetInfo> searchAssetInfo(String key, PageHelper ph)
			throws Exception {
		List<AssetInfo> assetInfoList = new ArrayList<AssetInfo>();
		List<AssetBaseInfo> list = searchAssetBaseInfo(key, ph);
		if(null != list && list.size() > 0){
			for(AssetBaseInfo base:list){
				AssetInfo asset = new AssetInfo();
				Integer assetId = base.getAssetId();
				List<AssetExtInfo> extInfoList = getAssetExtInfo(assetId);
				asset.setBaseInfo(base);
				asset.setExtList(extInfoList);
				assetInfoList.add(asset);
			}
			return assetInfoList;
		}
		return null;
	}


	@Override
	public List<AssetAttr> getAssetAttr(String cate) throws Exception {
		Map<String, Object> params = new HashMap<String,Object>();
		params.put("attrStatus", 1);
		params.put("attrCate", cate);
		String hql = "from AssetAttr where attrCate = :attrCate and attrStatus = :attrStatus";
		return attrDao.find(hql,params);
	}


	@Override
	public Long countAssetSearch(String key) throws Exception {
		String hql = " from AssetBaseInfo t ";
		String where = whereHql(key);
		 Long count = baseDao.count(hql+where);
		return count;
	}

}
