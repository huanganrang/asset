package jb.service;

import jb.pageModel.JbDepartment;
import jb.pageModel.DataGrid;
import jb.pageModel.PageHelper;

/**
 * 
 * @author John
 * 
 */
public interface JbDepartmentServiceI {

	/**
	 * 获取JbDepartment数据表格
	 * 
	 * @param jbDepartment
	 *            参数
	 * @param ph
	 *            分页帮助类
	 * @return
	 */
	public DataGrid dataGrid(JbDepartment jbDepartment, PageHelper ph);

	/**
	 * 添加JbDepartment
	 * 
	 * @param jbDepartment
	 */
	public void add(JbDepartment jbDepartment);

	/**
	 * 获得JbDepartment对象
	 * 
	 * @param id
	 * @return
	 */
	public JbDepartment get(String id);

	/**
	 * 修改JbDepartment
	 * 
	 * @param jbDepartment
	 */
	public void edit(JbDepartment jbDepartment);

	/**
	 * 删除JbDepartment
	 * 
	 * @param id
	 */
	public void delete(String id);

}
