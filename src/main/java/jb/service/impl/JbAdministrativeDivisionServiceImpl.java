package jb.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import jb.absx.F;
import jb.dao.JbAdministrativeDivisionDaoI;
import jb.model.TjbAdministrativeDivision;
import jb.pageModel.DataGrid;
import jb.pageModel.JbAdministrativeDivision;
import jb.pageModel.PageHelper;
import jb.service.JbAdministrativeDivisionServiceI;
import jb.util.MyBeanUtils;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class JbAdministrativeDivisionServiceImpl extends BaseServiceImpl<JbAdministrativeDivision> implements JbAdministrativeDivisionServiceI {

	@Autowired
	private JbAdministrativeDivisionDaoI jbAdministrativeDivisionDao;

	@Override
	public DataGrid dataGrid(JbAdministrativeDivision jbAdministrativeDivision, PageHelper ph) {
		List<JbAdministrativeDivision> ol = new ArrayList<JbAdministrativeDivision>();
		String hql = " from TjbAdministrativeDivision t ";
		DataGrid dg = dataGridQuery(hql, ph, jbAdministrativeDivision, jbAdministrativeDivisionDao);
		@SuppressWarnings("unchecked")
		List<TjbAdministrativeDivision> l = dg.getRows();
		if (l != null && l.size() > 0) {
			for (TjbAdministrativeDivision t : l) {
				JbAdministrativeDivision o = new JbAdministrativeDivision();
				BeanUtils.copyProperties(t, o);
				ol.add(o);
			}
		}
		dg.setRows(ol);
		return dg;
	}
	

	protected String whereHql(JbAdministrativeDivision jbAdministrativeDivision, Map<String, Object> params) {
		String whereHql = "";	
		if (jbAdministrativeDivision != null) {
			whereHql += " where 1=1 ";
			if (!F.empty(jbAdministrativeDivision.getName())) {
				whereHql += " and t.name = :name";
				params.put("name", jbAdministrativeDivision.getName());
			}		
			if (!F.empty(jbAdministrativeDivision.getPid())) {
				whereHql += " and t.pid = :pid";
				params.put("pid", jbAdministrativeDivision.getPid());
			}		
			if (!F.empty(jbAdministrativeDivision.getLevel())) {
				whereHql += " and t.level = :level";
				params.put("level", jbAdministrativeDivision.getLevel());
			}		
		}	
		return whereHql;
	}

	@Override
	public void add(JbAdministrativeDivision jbAdministrativeDivision) {
		TjbAdministrativeDivision t = new TjbAdministrativeDivision();
		BeanUtils.copyProperties(jbAdministrativeDivision, t);
		t.setId(UUID.randomUUID().toString());
		//t.setCreatedatetime(new Date());
		jbAdministrativeDivisionDao.save(t);
	}

	@Override
	public JbAdministrativeDivision get(String id) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		TjbAdministrativeDivision t = jbAdministrativeDivisionDao.get("from TjbAdministrativeDivision t  where t.id = :id", params);
		JbAdministrativeDivision o = new JbAdministrativeDivision();
		BeanUtils.copyProperties(t, o);
		return o;
	}

	@Override
	public void edit(JbAdministrativeDivision jbAdministrativeDivision) {
		TjbAdministrativeDivision t = jbAdministrativeDivisionDao.get(TjbAdministrativeDivision.class, jbAdministrativeDivision.getId());
		if (t != null) {
			MyBeanUtils.copyProperties(jbAdministrativeDivision, t, new String[] { "id" , "createdatetime" },true);
			//t.setModifydatetime(new Date());
		}
	}

	@Override
	public void delete(String id) {
		jbAdministrativeDivisionDao.delete(jbAdministrativeDivisionDao.get(TjbAdministrativeDivision.class, id));
	}

}
