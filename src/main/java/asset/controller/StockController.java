package asset.controller;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import jb.pageModel.DataGrid;
import jb.pageModel.Json;
import jb.pageModel.PageHelper;
import jb.pageModel.SessionInfo;
import jb.util.ConfigUtil;

import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.time.DateFormatUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import asset.model.AssetBaseInfo;
import asset.service.AssetBaseServiceI;
import asset.service.StockService;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

/**
 * 库存Controller
 * @author yanghui
 *
 */
@Controller
@RequestMapping("/stock")
public class StockController {
	
	
	@Autowired
	private StockService stockService;
	

	@Autowired
	private AssetBaseServiceI assetBaseService;
	
	
	@RequestMapping("/tostock")
	public String tosearch(HttpServletRequest request) {
//		SessionInfo sessionInfo = (SessionInfo) request.getSession().getAttribute(ConfigUtil.getSessionInfoName());
//		System.out.println(sessionInfo.getId());
//		System.out.println(sessionInfo.getName());
//		System.out.println(sessionInfo.getResourceList().size());
		return "assets/stock";
	}
	
	@RequestMapping("/data")
	@ResponseBody
	public DataGrid stockData(HttpServletRequest request, PageHelper ph) {
		
		DataGrid dataGrid = new DataGrid();
		List<AssetBaseInfo> assetList = null;
		try {
			
			String rulesStr = request.getParameter("filterRules");
			HashMap<String,String> baseMap = new HashMap<String,String>();
			if(StringUtils.isNotBlank(rulesStr)){
				JSONArray rules = JSONArray.parseArray(rulesStr);
				for(int i = 0;i<rules.size();i++){
					JSONObject jsonObject = rules.getJSONObject(i);
					
					
					String field = jsonObject.getString("field");
					String value = jsonObject.getString("value");
//					jsonObject.getString("op");
					baseMap.put(field, value);
				}
			}
			assetList = stockService.getStockList(baseMap,ph);	
			if(null != assetList && assetList.size() > 0){
				JSONArray rows = new JSONArray();
				for(AssetBaseInfo baseInfo:assetList){
					JSONObject json = JSON.parseObject(JSON.toJSONString(baseInfo));
					rows.add(json);
				}
				
				dataGrid.setRows(rows);
				dataGrid.setTotal(stockService.countStock(baseMap));	
				return dataGrid;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dataGrid;
	}
	
	
	@RequestMapping("/outstock")
	@ResponseBody
	public Json outstock(HttpServletRequest request) {
		
		Json j = new Json();
		try {
			String assetIds = request.getParameter("assetIds");
			if(StringUtils.isBlank(assetIds)){
				throw new IllegalArgumentException("param error");
			}
			String[] assetIdArray = assetIds.split(",");
			if(ArrayUtils.isEmpty(assetIdArray)){
				throw new IllegalArgumentException("param error");
			}
			String assetUser = request.getParameter("assetUser");
			String assetUseDepartment = request.getParameter("assetUseDepartment");
			String assetUseDate = DateFormatUtils.format(Calendar.getInstance(), "yyyy-MM-dd");
			String assetDeviceLocation = request.getParameter("assetDeviceLocation");
			SessionInfo sessionInfo = (SessionInfo) request.getSession().getAttribute(ConfigUtil.getSessionInfoName());
			String assetAddUser = sessionInfo.getName();
			for(String assetId:assetIdArray){
				AssetBaseInfo baseInfo = new AssetBaseInfo();
				baseInfo.setAssetId(Integer.parseInt(assetId));
				baseInfo.setAssetUser(assetUser);
				baseInfo.setAssetUseDepartment(assetUseDepartment);
				baseInfo.setAssetUseDate(assetUseDate);
				baseInfo.setAssetDeviceLocation(assetDeviceLocation);
				baseInfo.setAssetAddUser(assetAddUser);
				baseInfo.setAssetStockStatus("出库");
				assetBaseService.updateAssetById(baseInfo);
			}
			j.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			j.setSuccess(false);
		} 
		return j;
	}
}
