package asset.controller;

import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

import jb.pageModel.DataGrid;
import jb.pageModel.PageHelper;

import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import asset.model.AssetAttr;
import asset.model.AssetBaseInfo;
import asset.model.AssetExtInfo;
import asset.model.AssetInfo;
import asset.service.AssetBaseServiceI;
import asset.service.AssetDicServiceI;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

@Controller
@RequestMapping("/asset")
public class AssetController {

	
	@Autowired
	private AssetBaseServiceI assetBaseService;
	
	@Autowired
	private AssetDicServiceI assetDicService;
	
	private void setColumns(HttpServletRequest request){
		String baseids = request.getParameter("baseids");
		String attrids = request.getParameter("attrids");
		StringBuilder columns = new StringBuilder("[[");
		try {
		
			if(StringUtils.isNotBlank(attrids)){
				String[] attrIdsArray = attrids.split(",");
				if(!ArrayUtils.isEmpty(attrIdsArray)){
					Map<String, String> attrMap = assetBaseService.getAllAttr();
					//获取扩展属性信息
					for(String attrId:attrIdsArray){
						if(attrMap.containsKey(attrId)){
							String attrName = attrMap.get(attrId);
							String column = "{field:'"+attrName+"',title:'"+attrName+"'},";
							columns.append(column);
						}
					}
				}
			}
			
			//默认情况 显示所有的基本信息
//			if(columns.length() == 2){
			Map<String,String> dicMap = assetDicService.getAssetDicMap(1);
			//默认选中的属性
			if(StringUtils.isBlank(baseids)){
				Properties properties = PropertiesLoaderUtils.loadAllProperties("config.properties");
				baseids = properties.getProperty("search.result.columns");
			}
			for(Map.Entry<String, String> entry:dicMap.entrySet()){
					String column = "";
					String[] baseIdsArray = baseids.split(",");
					//只显示这些列
					boolean hidden = true;
					for(String baseId:baseIdsArray){
						if(baseId.equals(entry.getKey())){
							hidden = false;
							break;
						}
					}
					if(hidden){
						column = "{field:'"+entry.getKey()+"',title:'"+entry.getValue()+"',hidden:'true'},";
					}else{
						column = "{field:'"+entry.getKey()+"',title:'"+entry.getValue()+"'},";
					}
					columns.append(column);
			}
			request.setAttribute("columns", columns.deleteCharAt(columns.length()-1)+"]]");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping("/tosearch")
	public String tosearch(HttpServletRequest request) {
		request.setAttribute("key", request.getParameter("key"));
		setColumns(request);
		return "assets/assets_search";
	}
	
	@RequestMapping("/tohigh")
	public String tohigh(HttpServletRequest request) {
		request.setAttribute("key", request.getParameter("key"));
		try {
			//默认属性
			Map<String,String> baseAttrMap = assetDicService.getAssetDicMap(1);
			request.setAttribute("baseAttrMap", baseAttrMap);
			
			//默认选中的属性
			Properties properties = PropertiesLoaderUtils.loadAllProperties("config.properties");
			String columns = properties.getProperty("search.result.columns");
			request.setAttribute("columns", columns);
			
			//其他属性
			Map<String, List<AssetAttr>> attrByCate = assetBaseService.getAllAttrByCate();
			request.setAttribute("attrMap", attrByCate);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/assets/assets_search_high";
	}
	
	
	@RequestMapping("/search")
	@ResponseBody
	public DataGrid search(HttpServletRequest request, PageHelper ph) {
		String key = request.getParameter("key");
		if(StringUtils.isBlank(key)){
			return null;
		}
		DataGrid dataGrid = new DataGrid();
		List<AssetInfo> assetList;
		try {
			assetList = assetBaseService.searchAssetInfo(key, ph);
			if(null != assetList && assetList.size() > 0){
				JSONArray rows = new JSONArray();
				for(AssetInfo asset:assetList){
					AssetBaseInfo baseInfo = asset.getBaseInfo();
					JSONObject json;
					if(null != baseInfo){
						json = JSON.parseObject(JSON.toJSONString(baseInfo));
					}else{
						json = new JSONObject();
					}
					
					List<AssetExtInfo> extList = asset.getExtList();
					
					if(null != extList && extList.size() > 0){
						for(AssetExtInfo extInfo:extList){
							String attrName = extInfo.getAssetAttrName();
							String attrValue = extInfo.getAssetAttrValue();
							json.put(attrName, attrValue);
						}
					}
					rows.add(json);
				}
				
				
				dataGrid.setRows(rows);
				dataGrid.setTotal(assetBaseService.countAssetSearch(key));
				return dataGrid;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dataGrid;
	}
	
	
	
	
	
}
