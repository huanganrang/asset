package jb.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import jb.absx.F;
import jb.dao.JbDepartmentDaoI;
import jb.model.TjbDepartment;
import jb.pageModel.DataGrid;
import jb.pageModel.JbDepartment;
import jb.pageModel.PageHelper;
import jb.service.JbDepartmentServiceI;
import jb.util.MyBeanUtils;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class JbDepartmentServiceImpl extends BaseServiceImpl<JbDepartment> implements JbDepartmentServiceI {

	@Autowired
	private JbDepartmentDaoI jbDepartmentDao;

	@Override
	public DataGrid dataGrid(JbDepartment jbDepartment, PageHelper ph) {
		List<JbDepartment> ol = new ArrayList<JbDepartment>();
		String hql = " from TjbDepartment t ";
		DataGrid dg = dataGridQuery(hql, ph, jbDepartment, jbDepartmentDao);
		@SuppressWarnings("unchecked")
		List<TjbDepartment> l = dg.getRows();
		if (l != null && l.size() > 0) {
			for (TjbDepartment t : l) {
				JbDepartment o = new JbDepartment();
				BeanUtils.copyProperties(t, o);
				ol.add(o);
			}
		}
		dg.setRows(ol);
		return dg;
	}
	

	protected String whereHql(JbDepartment jbDepartment, Map<String, Object> params) {
		String whereHql = "";	
		if (jbDepartment != null) {
			whereHql += " where 1=1 ";
			if (!F.empty(jbDepartment.getName())) {
				whereHql += " and t.name = :name";
				params.put("name", jbDepartment.getName());
			}		
			if (!F.empty(jbDepartment.getPid())) {
				whereHql += " and t.pid = :pid";
				params.put("pid", jbDepartment.getPid());
			}		
			if (!F.empty(jbDepartment.getPrincipal())) {
				whereHql += " and t.principal = :principal";
				params.put("principal", jbDepartment.getPrincipal());
			}		
			if (!F.empty(jbDepartment.getRemark())) {
				whereHql += " and t.remark = :remark";
				params.put("remark", jbDepartment.getRemark());
			}		
		}	
		return whereHql;
	}

	@Override
	public void add(JbDepartment jbDepartment) {
		TjbDepartment t = new TjbDepartment();
		BeanUtils.copyProperties(jbDepartment, t);
		t.setId(UUID.randomUUID().toString());
		//t.setCreatedatetime(new Date());
		jbDepartmentDao.save(t);
	}

	@Override
	public JbDepartment get(String id) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		TjbDepartment t = jbDepartmentDao.get("from TjbDepartment t  where t.id = :id", params);
		JbDepartment o = new JbDepartment();
		BeanUtils.copyProperties(t, o);
		return o;
	}

	@Override
	public void edit(JbDepartment jbDepartment) {
		TjbDepartment t = jbDepartmentDao.get(TjbDepartment.class, jbDepartment.getId());
		if (t != null) {
			MyBeanUtils.copyProperties(jbDepartment, t, new String[] { "id" , "createdatetime" },true);
			//t.setModifydatetime(new Date());
		}
	}

	@Override
	public void delete(String id) {
		jbDepartmentDao.delete(jbDepartmentDao.get(TjbDepartment.class, id));
	}

}
