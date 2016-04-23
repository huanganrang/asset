package asset.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jb.pageModel.DataGrid;
import jb.pageModel.PageHelper;
import jb.util.Constants;
import jb.util.CookieUtils;

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
	
	private void setColumns(HttpServletRequest request,HttpServletResponse response){
		String baseids = request.getParameter("baseids");
		String attrids = request.getParameter("attrids");
		try {
			if(StringUtils.isNotBlank(baseids)){
					CookieUtils.saveCookie(response, Constants.column_base, URLEncoder.encode(baseids,"utf-8"));
			}else{
				baseids = URLDecoder.decode(CookieUtils.getCookie(request,  Constants.column_base),"utf-8");
			}
			if(StringUtils.isNotBlank(attrids)){
					CookieUtils.saveCookie(response, Constants.column_ext, URLEncoder.encode(attrids,"utf-8"));
			}else{
				attrids = URLDecoder.decode(CookieUtils.getCookie(request,  Constants.column_ext),"utf-8");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
				
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
			String column = columns.deleteCharAt(columns.length()-1)+"]]";
			request.setAttribute("columns", column);
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping("/searchHome")
	public String searchHome(HttpServletRequest request) {
		return "assets/search";
	}
	
	@RequestMapping("/tosearch")
	public String tosearch(HttpServletRequest request,HttpServletResponse response) {
		request.setAttribute("key", request.getParameter("key"));
		setColumns(request,response);
		return "assets/assets_search";
	}
	
	@RequestMapping("/tohigh")
	public String tohigh(HttpServletRequest request) {
		request.setAttribute("key", request.getParameter("key"));
		try {
			//默认属性
			Map<String,String> baseAttrMap = assetDicService.getAssetDicMap(1);
			request.setAttribute("baseAttrMap", baseAttrMap);
			String columns = "";
			String base = CookieUtils.getCookie(request, Constants.column_base);
			String ext = CookieUtils.getCookie(request, Constants.column_ext);
			if(StringUtils.isBlank(base) && StringUtils.isBlank(ext)){
				//默认选中的属性
				Properties properties = PropertiesLoaderUtils.loadAllProperties("config.properties");
				columns = properties.getProperty("search.result.columns");
			}else{
				columns = URLDecoder.decode(base,"utf-8");
				if(StringUtils.isNotBlank(ext)){
					columns =columns+","+URLDecoder.decode(ext,"utf-8");
				}
			}
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
