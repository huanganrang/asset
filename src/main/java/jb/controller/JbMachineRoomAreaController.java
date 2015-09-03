package jb.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jb.pageModel.Colum;
import jb.pageModel.JbMachineRoomArea;
import jb.pageModel.DataGrid;
import jb.pageModel.Json;
import jb.pageModel.PageHelper;
import jb.service.JbMachineRoomAreaServiceI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

/**
 * JbMachineRoomArea管理控制器
 * 
 * @author John
 * 
 */
@Controller
@RequestMapping("/jbMachineRoomAreaController")
public class JbMachineRoomAreaController extends BaseController {

	@Autowired
	private JbMachineRoomAreaServiceI jbMachineRoomAreaService;


	/**
	 * 跳转到JbMachineRoomArea管理页面
	 * 
	 * @return
	 */
	@RequestMapping("/manager")
	public String manager(HttpServletRequest request) {
		return "/jbmachineroomarea/jbMachineRoomArea";
	}

	/**
	 * 获取JbMachineRoomArea数据表格
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping("/dataGrid")
	@ResponseBody
	public DataGrid dataGrid(JbMachineRoomArea jbMachineRoomArea, PageHelper ph) {
		return jbMachineRoomAreaService.dataGrid(jbMachineRoomArea, ph);
	}
	/**
	 * 获取JbMachineRoomArea数据表格excel
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
	public void download(JbMachineRoomArea jbMachineRoomArea, PageHelper ph,String downloadFields,HttpServletResponse response) throws SecurityException, NoSuchMethodException, IllegalArgumentException, IllegalAccessException, InvocationTargetException, IOException{
		DataGrid dg = dataGrid(jbMachineRoomArea,ph);		
		downloadFields = downloadFields.replace("&quot;", "\"");
		downloadFields = downloadFields.substring(1,downloadFields.length()-1);
		List<Colum> colums = JSON.parseArray(downloadFields, Colum.class);
		downloadTable(colums, dg, response);
	}
	/**
	 * 跳转到添加JbMachineRoomArea页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request) {
		JbMachineRoomArea jbMachineRoomArea = new JbMachineRoomArea();
		jbMachineRoomArea.setId(UUID.randomUUID().toString());
		return "/jbmachineroomarea/jbMachineRoomAreaAdd";
	}

	/**
	 * 添加JbMachineRoomArea
	 * 
	 * @return
	 */
	@RequestMapping("/add")
	@ResponseBody
	public Json add(JbMachineRoomArea jbMachineRoomArea) {
		Json j = new Json();		
		jbMachineRoomAreaService.add(jbMachineRoomArea);
		j.setSuccess(true);
		j.setMsg("添加成功！");		
		return j;
	}

	/**
	 * 跳转到JbMachineRoomArea查看页面
	 * 
	 * @return
	 */
	@RequestMapping("/view")
	public String view(HttpServletRequest request, String id) {
		JbMachineRoomArea jbMachineRoomArea = jbMachineRoomAreaService.get(id);
		request.setAttribute("jbMachineRoomArea", jbMachineRoomArea);
		return "/jbmachineroomarea/jbMachineRoomAreaView";
	}

	/**
	 * 跳转到JbMachineRoomArea修改页面
	 * 
	 * @return
	 */
	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, String id) {
		JbMachineRoomArea jbMachineRoomArea = jbMachineRoomAreaService.get(id);
		request.setAttribute("jbMachineRoomArea", jbMachineRoomArea);
		return "/jbmachineroomarea/jbMachineRoomAreaEdit";
	}

	/**
	 * 修改JbMachineRoomArea
	 * 
	 * @param jbMachineRoomArea
	 * @return
	 */
	@RequestMapping("/edit")
	@ResponseBody
	public Json edit(JbMachineRoomArea jbMachineRoomArea) {
		Json j = new Json();		
		jbMachineRoomAreaService.edit(jbMachineRoomArea);
		j.setSuccess(true);
		j.setMsg("编辑成功！");		
		return j;
	}

	/**
	 * 删除JbMachineRoomArea
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public Json delete(String id) {
		Json j = new Json();
		jbMachineRoomAreaService.delete(id);
		j.setMsg("删除成功！");
		j.setSuccess(true);
		return j;
	}

}
