package asset.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import jb.pageModel.PageHelper;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import asset.dao.AllocationDaoI;
import asset.model.AllocationInfo;
import asset.model.AssetAllocation;
import asset.service.AllocationService;

import com.alibaba.fastjson.JSON;

@Service
public class AllocationServiceImpl implements AllocationService {
	
	@Autowired
	private AllocationDaoI allocationDao;
	
	
	protected String withHql(String key) {
		String withHql = "on  a.asset_Id = b.asset_Id where a.asset_device_status != '报废'";	
		if (StringUtils.isNotBlank(key)) {
			withHql += " and ( a.asset_it_number like '%"+key+"%' or ";
			withHql += " a.asset_number like '%"+key+"%' or ";
			withHql += " a.asset_name like '%"+key+"%' or ";
			withHql += " a.asset_model like '%"+key+"%' or ";
			withHql += " a.asset_device_status like '%"+key+"%' or ";
			withHql += " b.allocation_company like '%"+key+"%')";
		}
		return withHql;
	}

	
	@Override
	public List<AllocationInfo> searchAllocation(Map<String, String> paramMap,
			PageHelper ph) throws Exception {

		String key = "";
		if(paramMap.containsKey("key")){
			key = paramMap.get("key");
		}
		String sql = "select a.asset_id,a.asset_it_number,a.asset_number,a.asset_type,a.asset_name,a.asset_model,a.asset_device_status,b.allocation_date,b.allocation_company from asset_base_info as a left join asset_allocation as b ";
		String where = withHql(key);
		List<Map> sql2Map = new ArrayList<Map>();
		if(null != ph){
			sql2Map = allocationDao.findBySql2Map(sql + where + orderHql(ph), ph.getPage(), ph.getRows());
		}else{
			sql2Map =  allocationDao.findBySql2Map(sql  + where + orderHql(ph), null, 1,10);
		}
		ArrayList<AllocationInfo> list = new ArrayList<AllocationInfo>(sql2Map.size());
		for(Map map:sql2Map){
			JSON json = JSON.parseObject(JSON.toJSONString(map));
			AllocationInfo info = JSON.toJavaObject(json, AllocationInfo.class);
			list.add(info);
		}
		return list;
	}
	
	protected String orderHql(PageHelper ph) {
		String orderString = "";
		if (null != ph && ph.getSort() != null && ph.getOrder() != null) {
			orderString = " order by t." + ph.getSort() + " " + ph.getOrder();
		}
		return orderString;
	}

	@Override
	public Long countAllocation(Map<String, String> paramMap) throws Exception {
		String key = "";
		if(paramMap.containsKey("key")){
			key = paramMap.get("key");
		}
		String hql = "select count(*) from asset_base_info as a left join asset_allocation as b ";
		return allocationDao.countBySql(hql+withHql(key)).longValue();
	}


	@Override
	public void addAllocation(AssetAllocation allo) throws Exception {
		// TODO Auto-generated method stub
		allocationDao.saveOrUpdate(allo);
	}

}
