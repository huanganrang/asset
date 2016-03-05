package asset.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import jb.pageModel.DataGrid;
import jb.pageModel.PageHelper;

import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import asset.model.AssetInfo;
import asset.service.AssetBaseServiceI;
import asset.service.AssetDicServiceI;

import com.alibaba.fastjson.JSON;

@Controller
@RequestMapping("/asset")
public class AssetController {

	
	@Autowired
	private AssetBaseServiceI assetBaseService;
	
	@Autowired
	private AssetDicServiceI assetDicService;
	
	@RequestMapping("/tosearch")
	public String tosearch(HttpServletRequest request) {
		request.setAttribute("key", request.getParameter("key"));
		String baseids = request.getParameter("baseids");
		String attrids = request.getParameter("attrids");
		StringBuilder columns = new StringBuilder("[[");
		try {
			if(StringUtils.isNotBlank(baseids)){
				String[] baseIdsArray = baseids.split(",");
				if(!ArrayUtils.isEmpty(baseIdsArray)){
					//获取基本属性信息
					Map<String,String> dicMap = assetDicService.getAssetDicMap(1);
					for(String baseId:baseIdsArray){
						if(dicMap.containsKey(baseId)){
							String column = "{field:'"+baseId+"',title:'"+dicMap.get(baseId)+"'},";
							columns.append(column);
						}
					}
				}
			}
			
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
			if(columns.length() == 2){
				Map<String,String> dicMap = assetDicService.getAssetDicMap(1);
				
				for(Map.Entry<String, String> entry:dicMap.entrySet()){
					String column = "{field:'"+entry.getKey()+"',title:'"+entry.getValue()+"'},";
					columns.append(column);
				}
			}
			request.setAttribute("columns", columns.deleteCharAt(columns.length()-1)+"]]");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "assets/assets_search";
	}
	
	@RequestMapping("/tohigh")
	public String tohigh(HttpServletRequest request) {
		request.setAttribute("key", request.getParameter("key"));
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
		List<AssetInfo> baseList;
		try {
			baseList = assetBaseService.searchAssetInfo(key, ph);
			if(null != baseList && baseList.size() > 0){
				dataGrid.setRows(baseList);
				dataGrid.setTotal(assetBaseService.countAssetSearch(key));
				return dataGrid;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(JSON.toJSONString(dataGrid));
		return dataGrid;
	}
	
	
}
