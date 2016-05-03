package asset.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import jb.pageModel.DataGrid;
import jb.pageModel.Json;
import jb.pageModel.PageHelper;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.time.DateFormatUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import asset.model.AllocationInfo;
import asset.model.AssetAllocation;
import asset.model.AssetDic;
import asset.service.AllocationService;
import asset.service.AssetBaseServiceI;
import asset.service.AssetDicServiceI;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;

/**
 * 库存Controller
 * @author yanghui
 *
 */
@Controller
@RequestMapping("/allocation")
public class AllocationController {
	
	
	@Autowired
	private AllocationService allocationService;
	

	@Autowired
	private AssetBaseServiceI assetBaseService;
	
	@Autowired
	private AssetDicServiceI dicService;
	
	@RequestMapping("/toallocation")
	public String toallocation(HttpServletRequest request) {
		try {
			List<AssetDic> dic = dicService.getAssetDic(102);
			request.setAttribute("company", JSONArray.parseArray(JSON.toJSONString(dic)));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "assets/allocation";
	}
	
	@RequestMapping("/data")
	@ResponseBody
	public DataGrid allocationData(HttpServletRequest request, PageHelper ph) {
		
		DataGrid dataGrid = new DataGrid();
		try {
			
			String key = request.getParameter("key");
			HashMap<String,String> paramMap = new HashMap<String,String>();
			paramMap.put("key", key);
			List<AllocationInfo> searchList = allocationService.searchAllocation(paramMap,ph);
			if(CollectionUtils.isNotEmpty(searchList)){
				JSONArray rows = JSONArray.parseArray(JSON.toJSONString(searchList));
				dataGrid.setRows(rows);
				dataGrid.setTotal(allocationService.countAllocation(paramMap));	
				return dataGrid;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dataGrid;
	}
	
	
	@RequestMapping("/allocation")
	@ResponseBody
	public Json saveStatus(HttpServletRequest request) {
		
		Json j = new Json();
		try {
			String assetIds = request.getParameter("ss");
			if(StringUtils.isBlank(assetIds)){
				throw new IllegalArgumentException("param error");
			}
			String[] assetIdArray = assetIds.split(",");
			if(ArrayUtils.isEmpty(assetIdArray)){
				throw new IllegalArgumentException("param error");
			}
			Date date = new Date();
			for(String assetId:assetIdArray){
				
				String[] split = assetId.split(":");
				AssetAllocation allo = new AssetAllocation();
				if(split.length == 2){
					if("undefined".equals(split[1])){
						allo.setAllocationCompany("");
						allo.setAssetId(Integer.parseInt(split[0]));
						allo.setAllocationDate("");
					}else{
						allo.setAllocationCompany(split[1]);
						allo.setAssetId(Integer.parseInt(split[0]));
						allo.setAllocationDate(DateFormatUtils.format(date, "yyyy-MM-dd"));
					}
					allocationService.addAllocation(allo);
				}
			}
			j.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			j.setSuccess(false);
		} 
		return j;
	}
	
	
	@RequestMapping("/addCompany")
	@ResponseBody
	public Json addCompany(HttpServletRequest request) {
		
		Json j = new Json();
		try {
			String company = request.getParameter("company");
			if(StringUtils.isBlank(company)){
				throw new IllegalArgumentException("param error");
			}
		
			AssetDic dic = new AssetDic();
			dic.setDicType(102);
			dic.setDicKey(company);
			dic.setDicValue(company);
			dicService.saveOrUpdate(dic);
			
			
			List<AssetDic> dicList = dicService.getAssetDic(102);
			j.setObj(JSONArray.parseArray(JSON.toJSONString(dicList)));
			j.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			j.setSuccess(false);
		} 
		return j;
	}
}
