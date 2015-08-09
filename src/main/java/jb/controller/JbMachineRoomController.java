package jb.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jb.pageModel.Colum;
import jb.pageModel.JbMachineRoom;
import jb.pageModel.DataGrid;
import jb.pageModel.Json;
import jb.pageModel.PageHelper;
import jb.service.JbMachineRoomServiceI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;

/**
 * JbMachineRoom管理控制器
 * 
 * @author John
 * 
 */
@Controller
@RequestMapping("/jbMachineRoomController")
public class JbMachineRoomController extends BaseController {

	@Autowired
	private JbMachineRoomServiceI jbMachineRoomService;


	/**
	 * 跳转到JbMachineRoom管理页面
	 * 
	 * @return
	 */
	@RequestMapping("/manager")
	public String manager(HttpServletRequest request) {
		return "/jbmachineroom/jbMachineRoom";
	}

	/**
	 * 获取JbMachineRoom数据表格
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping("/dataGrid")
	@ResponseBody
	public DataGrid dataGrid(JbMachineRoom jbMachineRoom, PageHelper ph) {
		return jbMachineRoomService.dataGrid(jbMachineRoom, ph);
	}
	/**
	 * 获取JbMachineRoom数据表格excel
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
	public void download(JbMachineRoom jbMachineRoom, PageHelper ph,String downloadFields,HttpServletResponse response) throws SecurityException, NoSuchMethodException, IllegalArgumentException, IllegalAccessException, InvocationTargetException, IOException{
		DataGrid dg = dataGrid(jbMachineRoom,ph);		
		downloadFields = downloadFields.replace("&quot;", "\"");
		downloadFields = downloadFields.substring(1,downloadFields.length()-1);
		List<Colum> colums = JSON.parseArray(downloadFields, Colum.class);
		downloadTable(colums, dg, response);
	}
	/**
	 * 跳转到添加JbMachineRoom页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request) {
		JbMachineRoom jbMachineRoom = new JbMachineRoom();
		jbMachineRoom.setId(UUID.randomUUID().toString());
		return "/jbmachineroom/jbMachineRoomAdd";
	}

	/**
	 * 添加JbMachineRoom
	 * 
	 * @return
	 */
	@RequestMapping("/add")
	@ResponseBody
	public Json add(JbMachineRoom jbMachineRoom,HttpServletRequest request,@RequestParam MultipartFile imagePathFile) {
		Json j = new Json();		
		String imagPath = uploadFile(request, "machineroom", imagePathFile);
		jbMachineRoom.setImagePath(imagPath);
		jbMachineRoomService.add(jbMachineRoom);
		j.setSuccess(true);
		j.setMsg("添加成功！");		
		return j;
	}

	/**
	 * 跳转到JbMachineRoom查看页面
	 * 
	 * @return
	 */
	@RequestMapping("/view")
	public String view(HttpServletRequest request, String id) {
		JbMachineRoom jbMachineRoom = jbMachineRoomService.get(id);
		request.setAttribute("jbMachineRoom", jbMachineRoom);
		return "/jbmachineroom/jbMachineRoomView";
	}

	/**
	 * 跳转到JbMachineRoom修改页面
	 * 
	 * @return
	 */
	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, String id) {
		JbMachineRoom jbMachineRoom = jbMachineRoomService.get(id);
		request.setAttribute("jbMachineRoom", jbMachineRoom);
		return "/jbmachineroom/jbMachineRoomEdit";
	}

	/**
	 * 修改JbMachineRoom
	 * 
	 * @param jbMachineRoom
	 * @return
	 */
	@RequestMapping("/edit")
	@ResponseBody
	public Json edit(JbMachineRoom jbMachineRoom) {
		Json j = new Json();		
		jbMachineRoomService.edit(jbMachineRoom);
		j.setSuccess(true);
		j.setMsg("编辑成功！");		
		return j;
	}

	/**
	 * 删除JbMachineRoom
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public Json delete(String id) {
		Json j = new Json();
		jbMachineRoomService.delete(id);
		j.setMsg("删除成功！");
		j.setSuccess(true);
		return j;
	}

}
