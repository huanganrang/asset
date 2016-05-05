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
import asset.service.ScrapService;

/**
 * @author yanghui
 *
 */
@Service
public class ScrapServiceImpl implements ScrapService {
	
	@Autowired
	private AssetBaseDaoI baseDao; 

	
	protected String orderHql(PageHelper ph) {
		String orderString = "";
		if (null != ph && ph.getSort() != null && ph.getOrder() != null) {
			orderString = " order by t." + ph.getSort() + " " + ph.getOrder();
		}
		return orderString;
	}



	@Override
	public List<AssetBaseInfo> getScrapList(Map<String, String> paramMap,
			PageHelper ph) throws Exception {
		
		StringBuilder hql = new StringBuilder("from AssetBaseInfo t where t.assetStatus = 1 ");
		String endDate = paramMap.get("endDate");
		if(StringUtils.isBlank(endDate)){
			throw new IllegalArgumentException("param error");
		}
		
		hql.append(" and t.assetBeginDate != '' and  t.assetBeginDate < '" + endDate+"'");
		List<AssetBaseInfo> list = baseDao.find(hql + orderHql(ph), null, ph.getPage(), ph.getRows());
		return list;
	}



	@Override
	public Long countScrap(Map<String, String> paramMap) throws Exception {
		
		StringBuilder hql = new StringBuilder("select count(*) from AssetBaseInfo t where t.assetStatus = 1 ");
		String endDate = paramMap.get("endDate");
		if(StringUtils.isBlank(endDate)){
			throw new IllegalArgumentException("param error");
		}
		
		hql.append(" and t.assetBeginDate < '" + endDate+"'");
		return baseDao.count(hql.toString());
	}
}
