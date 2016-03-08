/**
 * 
 */
package asset.service.impl;

import asset.dao.AssetAttrDaoI;
import asset.dao.AssetBaseDaoI;
import asset.dao.AssetExtDaoI;
import asset.model.AssetAttr;
import asset.model.AssetBaseInfo;
import asset.model.AssetExtInfo;
import asset.model.AssetInfo;
import asset.service.AssetBaseServiceI;
import jb.pageModel.PageHelper;
import jb.util.MyBeanUtils;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
			whereHql += " t.assetProperty like '%"+key+"%')";
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
		String hql = "select count(*)  from AssetBaseInfo t ";
		String where = whereHql(key);
		 Long count = baseDao.count(hql + where);
		return count;
	}


	@Override
	public Map<String, String> getAllAttr() throws Exception {
		String hql = "from AssetAttr where attrStatus = 1";
		List<AssetAttr> list = attrDao.find(hql);
		if(CollectionUtils.isNotEmpty(list)){
			HashMap<String,String> attrMap = new HashMap<String,String>();
			for(AssetAttr attr:list){
				attrMap.put(attr.getAttrId()+"", attr.getAttrName());
			}
			return attrMap;
		}
		return null;
	}


	@Override
	public Map<String, List<AssetAttr>> getAllAttrByCate() throws Exception {
		String hql = "from AssetAttr where attrStatus = 1";
		List<AssetAttr> list = attrDao.find(hql);
		if(CollectionUtils.isNotEmpty(list)){
			HashMap<String,List<AssetAttr>> attrMap = new HashMap<String,List<AssetAttr>>();
			for(AssetAttr attr:list){
				String key = attr.getAttrCate();
				if(attrMap.containsKey(key)){
					List<AssetAttr> attrList = attrMap.get(key);
					attrList.add(attr);
				}else{
					List<AssetAttr> attrList = new ArrayList<AssetAttr>();
					attrList.add(attr);
					attrMap.put(key, attrList);
				}
			}
			return attrMap;
		}
		return null;
	}

	@Override
	public List getLedgerList(PageHelper ph){
		String hql = "from AssetBaseInfo t ";
		List<AssetBaseInfo> list = baseDao.find(hql + orderHql(ph), null, ph.getPage(), ph.getRows());
		return list;
	}

	@Override
	public void add(AssetBaseInfo assetBaseInfo){
		baseDao.save(assetBaseInfo);
	}

	@Override
	public void edit(AssetBaseInfo assetBaseInfo){
		AssetBaseInfo a = baseDao.get(AssetBaseInfo.class, assetBaseInfo.getAssetId());
		if (a != null) {
			MyBeanUtils.copyProperties(assetBaseInfo, a, new String[] {"assetId"},true);
		}
	}

	@Override
	public void delete(String assetId){
		if(StringUtils.isNotBlank(assetId)){
			if(!assetId.contains(",")){
				Map<String, Object> params = new HashMap<String,Object>();
				params.put("assetId", Integer.parseInt(assetId));
				AssetBaseInfo assetBaseInfo = baseDao.get(" from AssetBaseInfo where assetId = :assetId", params);
				baseDao.delete(assetBaseInfo);
			}else {
				String hql = "delete from AssetBaseInfo where assetId in (" + assetId +")";
				baseDao.executeHql(hql);
			}
		}
	}

}
