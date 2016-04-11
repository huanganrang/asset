package asset.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import jb.pageModel.DataGrid;
import jb.pageModel.Json;
import jb.pageModel.PageHelper;
import jb.pageModel.Resource;
import jb.pageModel.Role;
import jb.pageModel.SessionInfo;
import jb.pageModel.User;
import jb.service.ResourceServiceI;
import jb.service.RoleServiceI;
import jb.service.UserServiceI;
import jb.util.ConfigUtil;

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
 * 系统管理Controller
 * @author yeshenghong
 *
 */
@Controller
@RequestMapping("/system")
public class SystemController {
	
	@Autowired
	private UserServiceI userService;

	@Autowired
	private RoleServiceI roleService;

	@Autowired
	private ResourceServiceI resourceService;

	
	@RequestMapping("/user_management")
	public String toallocation(HttpServletRequest request) {
		try {
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "demo/user_management";
	}
	
	/**
	 * 跳转到用户管理页面
	 *
	 * @return
	 */
	@RequestMapping("/manager")
	public String manager(HttpServletRequest request, User user, PageHelper ph) {
		DataGrid dataGrid = userService.dataGrid(user, ph);
		List userRoles = roleService.allTree();
		List userList = dataGrid.getRows();
		request.setAttribute("userList", userList);
		request.setAttribute("userRoles", userRoles);
		return "/assets/user";
	}
	
	/**
	 * 跳转到用户管理页面
	 *
	 * @return
	 */
	@RequestMapping("/system")
	public String system(HttpServletRequest request, User user, PageHelper ph) {
		DataGrid dataGrid = userService.dataGrid(user, ph);
		List userRoles = roleService.allTree();
		List userList = dataGrid.getRows();
		request.setAttribute("userList", userList);
		request.setAttribute("userRoles", userRoles);
		return "/assets/system";
	}
	
	/**
	 * 获得角色列表
	 * 
	 * @return
	 */
	@RequestMapping("/roleManager")
	public String treeGrid(HttpServletRequest request, HttpSession session) {
		SessionInfo sessionInfo = (SessionInfo) session.getAttribute(ConfigUtil.getSessionInfoName());
		List<Role> userRoleList = roleService.treeGrid(sessionInfo);
		List<Resource> resourceList = resourceService.treeGrid(sessionInfo);
		request.setAttribute("userRoleList", userRoleList);
		request.setAttribute("resourceList", resourceList);
		return "/assets/systemRole";
	}

	
}
