package asset.controller;

import javax.servlet.http.HttpServletRequest;

import jb.pageModel.DataGrid;
import jb.pageModel.PageHelper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import asset.model.AssetBaseInfo;
import asset.service.AssetBaseServiceI;

@Controller
@RequestMapping("/asset")
public class AssetController {

	
	@Autowired
	private AssetBaseServiceI assetBaseService;
	
	
	/**
	 * 跳转到资产管理页面
	 * 
	 * @return
	 */
	@RequestMapping("/manager")
	public String manager(HttpServletRequest request) {
		return "/jbassets/jbAssets";
	}
	
	
}
