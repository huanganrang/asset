package jb.service;

import jb.pageModel.JbMachineRoom;
import jb.pageModel.DataGrid;
import jb.pageModel.PageHelper;

/**
 * 
 * @author John
 * 
 */
public interface JbMachineRoomServiceI {

	/**
	 * 获取JbMachineRoom数据表格
	 * 
	 * @param jbMachineRoom
	 *            参数
	 * @param ph
	 *            分页帮助类
	 * @return
	 */
	public DataGrid dataGrid(JbMachineRoom jbMachineRoom, PageHelper ph);

	/**
	 * 添加JbMachineRoom
	 * 
	 * @param jbMachineRoom
	 */
	public void add(JbMachineRoom jbMachineRoom);

	/**
	 * 获得JbMachineRoom对象
	 * 
	 * @param id
	 * @return
	 */
	public JbMachineRoom get(String id);

	/**
	 * 修改JbMachineRoom
	 * 
	 * @param jbMachineRoom
	 */
	public void edit(JbMachineRoom jbMachineRoom);

	/**
	 * 删除JbMachineRoom
	 * 
	 * @param id
	 */
	public void delete(String id);

}
