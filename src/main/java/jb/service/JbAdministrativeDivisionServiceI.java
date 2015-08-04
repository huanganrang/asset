package jb.service;

import jb.pageModel.JbAdministrativeDivision;
import jb.pageModel.DataGrid;
import jb.pageModel.PageHelper;

/**
 * 
 * @author John
 * 
 */
public interface JbAdministrativeDivisionServiceI {

	/**
	 * 获取JbAdministrativeDivision数据表格
	 * 
	 * @param jbAdministrativeDivision
	 *            参数
	 * @param ph
	 *            分页帮助类
	 * @return
	 */
	public DataGrid dataGrid(JbAdministrativeDivision jbAdministrativeDivision, PageHelper ph);

	/**
	 * 添加JbAdministrativeDivision
	 * 
	 * @param jbAdministrativeDivision
	 */
	public void add(JbAdministrativeDivision jbAdministrativeDivision);

	/**
	 * 获得JbAdministrativeDivision对象
	 * 
	 * @param id
	 * @return
	 */
	public JbAdministrativeDivision get(String id);

	/**
	 * 修改JbAdministrativeDivision
	 * 
	 * @param jbAdministrativeDivision
	 */
	public void edit(JbAdministrativeDivision jbAdministrativeDivision);

	/**
	 * 删除JbAdministrativeDivision
	 * 
	 * @param id
	 */
	public void delete(String id);

}
