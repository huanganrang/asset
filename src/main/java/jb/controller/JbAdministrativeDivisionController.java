package jb.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jb.pageModel.Colum;
import jb.pageModel.JbAdministrativeDivision;
import jb.pageModel.DataGrid;
import jb.pageModel.Json;
import jb.pageModel.PageHelper;
import jb.service.JbAdministrativeDivisionServiceI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

/**
 * JbAdministrativeDivision管理控制器
 * 
 * @author John
 * 
 */
@Controller
@RequestMapping("/jbAdministrativeDivisionController")
public class JbAdministrativeDivisionController extends BaseController {

	@Autowired
	private JbAdministrativeDivisionServiceI jbAdministrativeDivisionService;


	/**
	 * 跳转到JbAdministrativeDivision管理页面
	 * 
	 * @return
	 */
	@RequestMapping("/manager")
	public String manager(HttpServletRequest request) {
		return "/jbadministrativedivision/jbAdministrativeDivision";
	}

	/**
	 * 获取JbAdministrativeDivision数据表格
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping("/dataGrid")
	@ResponseBody
	public DataGrid dataGrid(JbAdministrativeDivision jbAdministrativeDivision, PageHelper ph) {
		return jbAdministrativeDivisionService.dataGrid(jbAdministrativeDivision, ph);
	}
	/**
	 * 获取JbAdministrativeDivision数据表格excel
	 * 
	 * @param user
	 * @return
	 * @throws NoSuchMethodException 
	 * @throws SecurityException 
	 * @throws InvocationTargetException 
	 * @throws IllegalAccessException 
	 * @throws IllegalArgumentException 
	 * @throws IOException 
	 */
	@RequestMapping("/download")
	public void download(JbAdministrativeDivision jbAdministrativeDivision, PageHelper ph,String downloadFields,HttpServletResponse response) throws SecurityException, NoSuchMethodException, IllegalArgumentException, IllegalAccessException, InvocationTargetException, IOException{
		DataGrid dg = dataGrid(jbAdministrativeDivision,ph);		
		downloadFields = downloadFields.replace("&quot;", "\"");
		downloadFields = downloadFields.substring(1,downloadFields.length()-1);
		List<Colum> colums = JSON.parseArray(downloadFields, Colum.class);
		downloadTable(colums, dg, response);
	}
	/**
	 * 跳转到添加JbAdministrativeDivision页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request) {
		JbAdministrativeDivision jbAdministrativeDivision = new JbAdministrativeDivision();
		jbAdministrativeDivision.setId(UUID.randomUUID().toString());
		return "/jbadministrativedivision/jbAdministrativeDivisionAdd";
	}

	/**
	 * 添加JbAdministrativeDivision
	 * 
	 * @return
	 */
	@RequestMapping("/add")
	@ResponseBody
	public Json add(JbAdministrativeDivision jbAdministrativeDivision) {
		Json j = new Json();		
		jbAdministrativeDivisionService.add(jbAdministrativeDivision);
		j.setSuccess(true);
		j.setMsg("添加成功！");		
		return j;
	}

	/**
	 * 跳转到JbAdministrativeDivision查看页面
	 * 
	 * @return
	 */
	@RequestMapping("/view")
	public String view(HttpServletRequest request, String id) {
		JbAdministrativeDivision jbAdministrativeDivision = jbAdministrativeDivisionService.get(id);
		request.setAttribute("jbAdministrativeDivision", jbAdministrativeDivision);
		return "/jbadministrativedivision/jbAdministrativeDivisionView";
	}

	/**
	 * 跳转到JbAdministrativeDivision修改页面
	 * 
	 * @return
	 */
	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, String id) {
		JbAdministrativeDivision jbAdministrativeDivision = jbAdministrativeDivisionService.get(id);
		request.setAttribute("jbAdministrativeDivision", jbAdministrativeDivision);
		return "/jbadministrativedivision/jbAdministrativeDivisionEdit";
	}

	/**
	 * 修改JbAdministrativeDivision
	 * 
	 * @param jbAdministrativeDivision
	 * @return
	 */
	@RequestMapping("/edit")
	@ResponseBody
	public Json edit(JbAdministrativeDivision jbAdministrativeDivision) {
		Json j = new Json();		
		jbAdministrativeDivisionService.edit(jbAdministrativeDivision);
		j.setSuccess(true);
		j.setMsg("编辑成功！");		
		return j;
	}

	/**
	 * 删除JbAdministrativeDivision
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public Json delete(String id) {
		Json j = new Json();
		jbAdministrativeDivisionService.delete(id);
		j.setMsg("删除成功！");
		j.setSuccess(true);
		return j;
	}

}
