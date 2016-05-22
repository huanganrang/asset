package asset.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import jb.pageModel.DataGrid;
import jb.pageModel.Json;
import jb.pageModel.PageHelper;

import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.time.DateFormatUtils;
import org.apache.commons.lang.time.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import asset.model.AssetBaseInfo;
import asset.service.AssetBaseServiceI;
import asset.service.ScrapService;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

/**
 * 库存Controller
 * @author yanghui
 *
 */
@Controller
@RequestMapping("/scrap")
public class ScrapController {
	
	
	@Autowired
	private ScrapService scrapService;
	

	@Autowired
	private AssetBaseServiceI assetBaseService;
	
	
	@RequestMapping("/toscrap")
	public String tosearch(HttpServletRequest request) {
//		SessionInfo sessionInfo = (SessionInfo) request.getSession().getAttribute(ConfigUtil.getSessionInfoName());
//		System.out.println(sessionInfo.getId());
//		System.out.println(sessionInfo.getName());
//		System.out.println(sessionInfo.getResourceList().size());
		return "assets/scrap";
	}
	
	@RequestMapping("/data")
	@ResponseBody
	public DataGrid scrapData(HttpServletRequest request, PageHelper ph) {
		
		DataGrid dataGrid = new DataGrid();
		List<AssetBaseInfo> assetList = null;
		try {
			
			String yearsStr = request.getParameter("years");
			String endDateStr = request.getParameter("endDate");
			String format = "yyyy-MM-dd";
			if(StringUtils.isBlank(yearsStr)){
				 yearsStr = "1";
			}
			if(StringUtils.isBlank(endDateStr)){
				endDateStr = DateFormatUtils.format(Calendar.getInstance(), format);
			}
			
			SimpleDateFormat sdf = new SimpleDateFormat(format);
			Date date = sdf.parse(endDateStr);
			Date endYear = DateUtils.addYears(date, Integer.parseInt(yearsStr)*-1);
			String endDate = DateFormatUtils.format(endYear, format);
			HashMap<String,String> paramMap = new HashMap<String,String>();
			paramMap.put("endDate", endDate);
			assetList = scrapService.getScrapList(paramMap,ph);	
			if(null != assetList && assetList.size() > 0){
				JSONArray rows = new JSONArray();
				for(AssetBaseInfo baseInfo:assetList){
					String assetUseDate = baseInfo.getAssetBeginDate();
					String assetDeviceStatus = baseInfo.getAssetDeviceStatus();
					long times = 100;
					if(StringUtils.isNotBlank(assetUseDate))
					{
						Date useDate = sdf.parse(assetUseDate);
						times = (endYear.getTime()-useDate.getTime())/(1000*3600*24);
					}
					JSONObject json = JSON.parseObject(JSON.toJSONString(baseInfo));
					//json.put("useTime", (endYear.getTime()-useDate.getTime())/(1000*3600*24));
					json.put("useTime", times);
					json.put("scrapReason", "超期");
					if(!"待报废".equals(assetDeviceStatus) && !"报废".equals(assetDeviceStatus)){
						json.put("assetDeviceStatus", "");
					}
					rows.add(json);
				}
				
				dataGrid.setRows(rows);
				System.out.println(rows.toJSONString());
				dataGrid.setTotal(scrapService.countScrap(paramMap));	
				return dataGrid;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dataGrid;
	}
	
	
	@RequestMapping("/saveStatus")
	@ResponseBody
	public Json saveStatus(HttpServletRequest request) {
		
		Json j = new Json();
		try {
			String assetIds = request.getParameter("assetIds");
			String status = request.getParameter("status");
			if(StringUtils.isBlank(assetIds)){
				throw new IllegalArgumentException("param error");
			}
			String[] assetIdArray = assetIds.split(",");
			if(ArrayUtils.isEmpty(assetIdArray)){
				throw new IllegalArgumentException("param error");
			}
			for(String assetId:assetIdArray){
				assetBaseService.updateAssetStatusById(Integer.parseInt(assetId), status);
			}
			j.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			j.setSuccess(false);
		} 
		return j;
	}
}
