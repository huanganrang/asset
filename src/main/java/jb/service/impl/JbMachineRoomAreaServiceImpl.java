package jb.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import jb.absx.F;
import jb.dao.JbMachineRoomAreaDaoI;
import jb.model.TjbMachineRoomArea;
import jb.pageModel.DataGrid;
import jb.pageModel.JbMachineRoomArea;
import jb.pageModel.PageHelper;
import jb.service.JbMachineRoomAreaServiceI;
import jb.util.MyBeanUtils;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class JbMachineRoomAreaServiceImpl extends BaseServiceImpl<JbMachineRoomArea> implements JbMachineRoomAreaServiceI {

	@Autowired
	private JbMachineRoomAreaDaoI jbMachineRoomAreaDao;

	@Override
	public DataGrid dataGrid(JbMachineRoomArea jbMachineRoomArea, PageHelper ph) {
		List<JbMachineRoomArea> ol = new ArrayList<JbMachineRoomArea>();
		String hql = " from TjbMachineRoomArea t ";
		DataGrid dg = dataGridQuery(hql, ph, jbMachineRoomArea, jbMachineRoomAreaDao);
		@SuppressWarnings("unchecked")
		List<TjbMachineRoomArea> l = dg.getRows();
		if (l != null && l.size() > 0) {
			for (TjbMachineRoomArea t : l) {
				JbMachineRoomArea o = new JbMachineRoomArea();
				BeanUtils.copyProperties(t, o);
				ol.add(o);
			}
		}
		dg.setRows(ol);
		return dg;
	}
	

	protected String whereHql(JbMachineRoomArea jbMachineRoomArea, Map<String, Object> params) {
		String whereHql = "";	
		if (jbMachineRoomArea != null) {
			whereHql += " where 1=1 ";
			if (!F.empty(jbMachineRoomArea.getRoomId())) {
				whereHql += " and t.roomId = :roomId";
				params.put("roomId", jbMachineRoomArea.getRoomId());
			}		
			if (!F.empty(jbMachineRoomArea.getName())) {
				whereHql += " and t.name = :name";
				params.put("name", jbMachineRoomArea.getName());
			}		
			if (!F.empty(jbMachineRoomArea.getScope())) {
				whereHql += " and t.scope = :scope";
				params.put("scope", jbMachineRoomArea.getScope());
			}		
			if (!F.empty(jbMachineRoomArea.getRemark())) {
				whereHql += " and t.remark = :remark";
				params.put("remark", jbMachineRoomArea.getRemark());
			}		
		}	
		return whereHql;
	}

	@Override
	public void add(JbMachineRoomArea jbMachineRoomArea) {
		TjbMachineRoomArea t = new TjbMachineRoomArea();
		BeanUtils.copyProperties(jbMachineRoomArea, t);
		t.setId(UUID.randomUUID().toString());
		//t.setCreatedatetime(new Date());
		jbMachineRoomAreaDao.save(t);
	}

	@Override
	public JbMachineRoomArea get(String id) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		TjbMachineRoomArea t = jbMachineRoomAreaDao.get("from TjbMachineRoomArea t  where t.id = :id", params);
		JbMachineRoomArea o = new JbMachineRoomArea();
		BeanUtils.copyProperties(t, o);
		return o;
	}

	@Override
	public void edit(JbMachineRoomArea jbMachineRoomArea) {
		TjbMachineRoomArea t = jbMachineRoomAreaDao.get(TjbMachineRoomArea.class, jbMachineRoomArea.getId());
		if (t != null) {
			MyBeanUtils.copyProperties(jbMachineRoomArea, t, new String[] { "id" , "createdatetime" },true);
			//t.setModifydatetime(new Date());
		}
	}

	@Override
	public void delete(String id) {
		jbMachineRoomAreaDao.delete(jbMachineRoomAreaDao.get(TjbMachineRoomArea.class, id));
	}

}
