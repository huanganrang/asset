/**
 * 
 */
package asset.service.impl;

import java.io.Serializable;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jb.pageModel.PageHelper;
import jb.util.MyBeanUtils;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.collections.MapUtils;
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
	
	@Autowired
	private AssetDicServiceImpl dicService;

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
	public List<AssetExtInfo> getAssetExtInfo(List<Integer> ids)
			throws Exception {
		Map<String, Object> params = new HashMap<String,Object>();
		params.put("ids",ids);
		String hql = "from AssetExtInfo where assetId in :ids and assetStatus = 1";
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
		String whereHql = "where t.assetStatus = 1 ";	
		if (StringUtils.isNotBlank(key)) {
			whereHql += " and ( t.assetItNumber like '%"+key+"%' or ";
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
		params.put("attrStatus", (byte)1);
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
	public List<AssetInfo> getAssetList(Map<String,String> paramMap,PageHelper ph) throws Exception {
		StringBuilder hql = new StringBuilder("from AssetBaseInfo t where t.assetStatus = 1 ");
		List<AssetBaseInfo> list = null;
		long s1 = System.currentTimeMillis();
		if(null != paramMap && paramMap.size() > 0){
			for(Map.Entry<String, String> entry:paramMap.entrySet()){
				String key = entry.getKey();
				String value = entry.getValue();
				//需要判断是否是基本表的属性
				hql.append(" and t."+key+" like '%"+value+"%' ");
			}
			list = baseDao.find(hql + orderHql(ph), null, ph.getPage(), ph.getRows());
		}else{
			list = baseDao.find(hql + orderHql(ph), null, ph.getPage(), ph.getRows());
		}
		long s2 = System.currentTimeMillis();
		System.out.println(s2-s1+"ms");
		
		List<AssetInfo> assetInfoList = new ArrayList<AssetInfo>();
		if(null != list && list.size() > 0){
			long s3 = System.currentTimeMillis();
			for(AssetBaseInfo base:list){
				AssetInfo asset = new AssetInfo();
				Integer assetId = base.getAssetId();
				List<AssetExtInfo> extInfoList = getAssetExtInfo(assetId);
				asset.setBaseInfo(base);
				asset.setExtList(extInfoList);
				assetInfoList.add(asset);
			}
			long s4 = System.currentTimeMillis();
			System.out.println(s4-s3+"ms");
			return assetInfoList;
		}
		
		return null;
	}
	


	@Override
	public Long countAsset(Map<String, String> paramMap) throws Exception {
		
		StringBuilder hql = new StringBuilder("select count(*) from AssetBaseInfo t where t.assetStatus = 1 ");
		if(null != paramMap && paramMap.size() > 0){
			for(Map.Entry<String, String> entry:paramMap.entrySet()){
				String key = entry.getKey();
				String value = entry.getValue();
				//需要判断是否是基本表的属性
				hql.append(" and t."+key+" like '%"+value+"%' ");
			}
		}
		return baseDao.count(hql.toString());
	}

	@Override
	public int updateAssetById(AssetBaseInfo base) throws Exception {
		Integer assetId = base.getAssetId();
		if(null == assetId || assetId.intValue() == 0){
			throw new IllegalArgumentException("param error");
		}
		StringBuilder hql = new StringBuilder("update AssetBaseInfo set ");
		hql.append(updateSql(base));
		hql.append(" where assetId =" + assetId);
		return baseDao.executeHql(hql.toString());
	}
	
	
	private String updateSql(AssetBaseInfo base){
		StringBuilder sb = new StringBuilder();
		Field[] fields = base.getClass().getDeclaredFields();
		for(Field field:fields){
			String name = field.getName();
			Object value = getter(base, name);
			if (value instanceof java.lang.String) {
				sb.append( name+"='"+value.toString()+"',");
			}
		}
		return sb.deleteCharAt(sb.length()-1).toString();
		
	}
	
	public Object getter(Object obj, String att) {
        try {
            Method method = obj.getClass().getMethod("get" + firstLower(att));
            return method.invoke(obj);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

	/**
     * 给setter()的操作的属性首字母大写
     * @param att setter()操作的属性
     * @return 
     */
    protected String firstLower(String att) {
        StringBuffer sb = new StringBuffer();
        sb.append(att.substring(0,1).toUpperCase());
        sb.append(att.substring(1, att.length()));
        return sb.toString();
    }
	
    @Override
	public int updateAssetExtById(AssetExtInfo ext) throws Exception {
    	Integer assetId = ext.getAssetId();
		if(null == assetId || assetId.intValue() == 0){
			throw new IllegalArgumentException("param error");
		}
		StringBuilder hql = new StringBuilder("update AssetExtInfo set assetAttrValue = '"+ext.getAssetAttrValue()+"'");
		hql.append(" where assetId =" + assetId+" and assetAttrId = "+ext.getAssetAttrId());
		return baseDao.executeHql(hql.toString());
	}
    



	@Override
	public Long countAsset(Map<String, String> baseMap,
			Map<String, String> extMap) throws Exception {
		
		StringBuilder hql = new StringBuilder("select count(*) from AssetBaseInfo a,AssetExtInfo b where a.assetId = b.assetId");
		if(MapUtils.isNotEmpty(baseMap)){
			for(Map.Entry<String, String> entry:baseMap.entrySet()){
				String key = entry.getKey();
				String value = entry.getValue();
				hql.append(" and a."+key+"like '%"+value+"%' ");
			}
		}
		
		if(MapUtils.isNotEmpty(extMap)){
			for(Map.Entry<String, String> entry:extMap.entrySet()){
				String key = entry.getKey();
				String value = entry.getValue();
				hql.append(" and b.assetAttrName = '"+key+"' and b.assetAttrValue like '%"+value+"%' ");
			}
		}
		return baseDao.count(hql.toString());
	}


	@Override
	public List<AssetInfo> getAssetList(Map<String, String> baseMap,
			Map<String, String> extMap, PageHelper ph) throws Exception {
		
		StringBuilder hql = new StringBuilder("select a from AssetBaseInfo a,AssetExtInfo b where a.assetId = b.assetId");
		if(MapUtils.isNotEmpty(baseMap)){
			for(Map.Entry<String, String> entry:baseMap.entrySet()){
				String key = entry.getKey();
				String value = entry.getValue();
				hql.append(" and a."+key+"like '%"+value+"%' ");
			}
		}
		
		if(MapUtils.isNotEmpty(extMap)){
			for(Map.Entry<String, String> entry:extMap.entrySet()){
				String key = entry.getKey();
				String value = entry.getValue();
				hql.append(" and b.assetAttrName = '"+key+"' and b.assetAttrValue like '%"+value+"%' ");
			}
		}
		List<AssetBaseInfo> list = baseDao.find(hql.toString());
		List<AssetInfo> assetInfoList = new ArrayList<AssetInfo>();
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
	/***
	 * 
	 * ###########################
	 * 
	 * ###########################
	 */

	@Override
	public List getLedgerList(PageHelper ph){
		String hql = "from AssetBaseInfo t ";
		List<AssetBaseInfo> list = baseDao.find(hql + orderHql(ph), null, ph.getPage(), ph.getRows());
		return list;
	}

	@Override
	public Integer add(AssetBaseInfo assetBaseInfo){
		Serializable save = baseDao.save(assetBaseInfo);
		return (Integer)save;
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


	@Override
	public void addExtInfo(AssetExtInfo extInfo) {
		baseExtDao.save(extInfo);
	}


}
