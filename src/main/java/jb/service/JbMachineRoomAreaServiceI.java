package jb.service;

import jb.pageModel.JbMachineRoomArea;
import jb.pageModel.DataGrid;
import jb.pageModel.PageHelper;

/**
 * 
 * @author John
 * 
 */
public interface JbMachineRoomAreaServiceI {

	/**
	 * 获取JbMachineRoomArea数据表格
	 * 
	 * @param jbMachineRoomArea
	 *            参数
	 * @param ph
	 *            分页帮助类
	 * @return
	 */
	public DataGrid dataGrid(JbMachineRoomArea jbMachineRoomArea, PageHelper ph);

	/**
	 * 添加JbMachineRoomArea
	 * 
	 * @param jbMachineRoomArea
	 */
	public void add(JbMachineRoomArea jbMachineRoomArea);

	/**
	 * 获得JbMachineRoomArea对象
	 * 
	 * @param id
	 * @return
	 */
	public JbMachineRoomArea get(String id);

	/**
	 * 修改JbMachineRoomArea
	 * 
	 * @param jbMachineRoomArea
	 */
	public void edit(JbMachineRoomArea jbMachineRoomArea);

	/**
	 * 删除JbMachineRoomArea
	 * 
	 * @param id
	 */
	public void delete(String id);

}
