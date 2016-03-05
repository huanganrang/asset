package asset.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import jb.pageModel.DataGrid;
import jb.pageModel.PageHelper;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import asset.model.AssetBaseInfo;
import asset.service.AssetBaseServiceI;
import asset.service.AssetDicServiceI;

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
		List<AssetBaseInfo> baseList;
		try {
			baseList = assetBaseService.searchAssetBaseInfo(key, ph);
			if(null != baseList && baseList.size() > 0){
				dataGrid.setRows(baseList);
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
