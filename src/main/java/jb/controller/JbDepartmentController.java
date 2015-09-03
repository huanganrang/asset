package jb.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jb.pageModel.Colum;
import jb.pageModel.JbDepartment;
import jb.pageModel.DataGrid;
import jb.pageModel.Json;
import jb.pageModel.PageHelper;
import jb.service.JbDepartmentServiceI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

/**
 * JbDepartment管理控制器
 * 
 * @author John
 * 
 */
@Controller
@RequestMapping("/jbDepartmentController")
public class JbDepartmentController extends BaseController {

	@Autowired
	private JbDepartmentServiceI jbDepartmentService;


	/**
	 * 跳转到JbDepartment管理页面
	 * 
	 * @return
	 */
	@RequestMapping("/manager")
	public String manager(HttpServletRequest request) {
		return "/jbdepartment/jbDepartment";
	}

	/**
	 * 获取JbDepartment数据表格
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping("/dataGrid")
	@ResponseBody
	public DataGrid dataGrid(JbDepartment jbDepartment, PageHelper ph) {
		return jbDepartmentService.dataGrid(jbDepartment, ph);
	}
	/**
	 * 获取JbDepartment数据表格excel
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
	public void download(JbDepartment jbDepartment, PageHelper ph,String downloadFields,HttpServletResponse response) throws SecurityException, NoSuchMethodException, IllegalArgumentException, IllegalAccessException, InvocationTargetException, IOException{
		DataGrid dg = dataGrid(jbDepartment,ph);		
		downloadFields = downloadFields.replace("&quot;", "\"");
		downloadFields = downloadFields.substring(1,downloadFields.length()-1);
		List<Colum> colums = JSON.parseArray(downloadFields, Colum.class);
		downloadTable(colums, dg, response);
	}
	/**
	 * 跳转到添加JbDepartment页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request) {
		JbDepartment jbDepartment = new JbDepartment();
		jbDepartment.setId(UUID.randomUUID().toString());
		return "/jbdepartment/jbDepartmentAdd";
	}

	/**
	 * 添加JbDepartment
	 * 
	 * @return
	 */
	@RequestMapping("/add")
	@ResponseBody
	public Json add(JbDepartment jbDepartment) {
		Json j = new Json();		
		jbDepartmentService.add(jbDepartment);
		j.setSuccess(true);
		j.setMsg("添加成功！");		
		return j;
	}

	/**
	 * 跳转到JbDepartment查看页面
	 * 
	 * @return
	 */
	@RequestMapping("/view")
	public String view(HttpServletRequest request, String id) {
		JbDepartment jbDepartment = jbDepartmentService.get(id);
		request.setAttribute("jbDepartment", jbDepartment);
		return "/jbdepartment/jbDepartmentView";
	}

	/**
	 * 跳转到JbDepartment修改页面
	 * 
	 * @return
	 */
	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, String id) {
		JbDepartment jbDepartment = jbDepartmentService.get(id);
		request.setAttribute("jbDepartment", jbDepartment);
		return "/jbdepartment/jbDepartmentEdit";
	}

	/**
	 * 修改JbDepartment
	 * 
	 * @param jbDepartment
	 * @return
	 */
	@RequestMapping("/edit")
	@ResponseBody
	public Json edit(JbDepartment jbDepartment) {
		Json j = new Json();		
		jbDepartmentService.edit(jbDepartment);
		j.setSuccess(true);
		j.setMsg("编辑成功！");		
		return j;
	}

	/**
	 * 删除JbDepartment
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public Json delete(String id) {
		Json j = new Json();
		jbDepartmentService.delete(id);
		j.setMsg("删除成功！");
		j.setSuccess(true);
		return j;
	}

}
