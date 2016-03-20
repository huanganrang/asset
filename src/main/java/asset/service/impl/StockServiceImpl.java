/**
 * 
 */
package asset.service.impl;

import java.util.List;
import java.util.Map;

import jb.pageModel.PageHelper;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import asset.dao.AssetBaseDaoI;
import asset.model.AssetBaseInfo;
import asset.service.StockService;

/**
 * @author yanghui
 *
 */
@Service
public class StockServiceImpl implements StockService {
	
	@Autowired
	private AssetBaseDaoI baseDao; 

	/* (non-Javadoc)
	 * @see asset.service.StockService#getStockList(java.util.Map, java.lang.String, jb.pageModel.PageHelper)
	 */
	@Override
	public List<AssetBaseInfo> getStockList(Map<String, String> paramMap,PageHelper ph) throws Exception {
		
		StringBuilder hql = new StringBuilder("from AssetBaseInfo t where t.assetStatus = 1 "
				+ "and (t.assetStockStatus = '在库' or t.assetStockStatus = '入库') ");
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
		return list;
	}

	/* (non-Javadoc)
	 * @see asset.service.StockService#countStock(java.util.Map, java.lang.String)
	 */
	@Override
	public Long countStock(Map<String, String> paramMap)
			throws Exception {
		StringBuilder hql = new StringBuilder("select count(*) from AssetBaseInfo t where t.assetStatus = 1 "
				+ "and (t.assetStockStatus = '在库' or t.assetStockStatus = '入库') ");
		long s1 = System.currentTimeMillis();
		if(null != paramMap && paramMap.size() > 0){
			for(Map.Entry<String, String> entry:paramMap.entrySet()){
				String key = entry.getKey();
				String value = entry.getValue();
				//需要判断是否是基本表的属性
				hql.append(" and t."+key+" like '%"+value+"%' ");
			}
			return baseDao.count(hql.toString());
		}
		long s2 = System.currentTimeMillis();
		System.out.println(s2-s1+"ms");
		return null;
	}
	
	protected String orderHql(PageHelper ph) {
		String orderString = "";
		if (null != ph && ph.getSort() != null && ph.getOrder() != null) {
			orderString = " order by t." + ph.getSort() + " " + ph.getOrder();
		}
		return orderString;
	}
}
