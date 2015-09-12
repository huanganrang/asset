package jb.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import jb.absx.F;
import jb.dao.JbMachineRoomDaoI;
import jb.dao.JbMachineRoomRemarkDaoI;
import jb.model.TjbMachineRoom;
import jb.model.TjbMachineRoomRemark;
import jb.pageModel.DataGrid;
import jb.pageModel.JbMachineRoom;
import jb.pageModel.JbMachineRoomRemark;
import jb.pageModel.PageHelper;
import jb.service.JbMachineRoomServiceI;
import jb.util.MyBeanUtils;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class JbMachineRoomServiceImpl extends BaseServiceImpl<JbMachineRoom> implements JbMachineRoomServiceI {

	@Autowired
	private JbMachineRoomDaoI jbMachineRoomDao;
	@Autowired
	private JbMachineRoomRemarkDaoI jbMachineRoomRemarkDao;

	@Override
	public DataGrid dataGrid(JbMachineRoom jbMachineRoom, PageHelper ph) {
		List<JbMachineRoom> ol = new ArrayList<JbMachineRoom>();
		String hql = " from TjbMachineRoom t ";
		DataGrid dg = dataGridQuery(hql, ph, jbMachineRoom, jbMachineRoomDao);
		@SuppressWarnings("unchecked")
		List<TjbMachineRoom> l = dg.getRows();
		if (l != null && l.size() > 0) {
			for (TjbMachineRoom t : l) {
				JbMachineRoom o = new JbMachineRoom();
				BeanUtils.copyProperties(t, o);
				ol.add(o);
			}
		}
		dg.setRows(ol);
		return dg;
	}
	

	protected String whereHql(JbMachineRoom jbMachineRoom, Map<String, Object> params) {
		String whereHql = "";	
		if (jbMachineRoom != null) {
			whereHql += " where 1=1 ";
			if (!F.empty(jbMachineRoom.getName())) {
				whereHql += " and t.name = :name";
				params.put("name", jbMachineRoom.getName());
			}		
			if (!F.empty(jbMachineRoom.getImagePath())) {
				whereHql += " and t.imagePath = :imagePath";
				params.put("imagePath", jbMachineRoom.getImagePath());
			}		
			if (!F.empty(jbMachineRoom.getAreaCode())) {
				whereHql += " and t.areaCode = :areaCode";
				params.put("areaCode", jbMachineRoom.getAreaCode());
			}		
			if (!F.empty(jbMachineRoom.getAddress())) {
				whereHql += " and t.address = :address";
				params.put("address", jbMachineRoom.getAddress());
			}		
			if (!F.empty(jbMachineRoom.getRemark())) {
				whereHql += " and t.remark = :remark";
				params.put("remark", jbMachineRoom.getRemark());
			}		
		}	
		return whereHql;
	}

	@Override
	public void add(JbMachineRoom jbMachineRoom) {
		TjbMachineRoom t = new TjbMachineRoom();
		BeanUtils.copyProperties(jbMachineRoom, t);
		t.setId(UUID.randomUUID().toString());
		//t.setCreatedatetime(new Date());
		jbMachineRoomDao.save(t);
	}

	@Override
	public JbMachineRoom get(String id) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		TjbMachineRoom t = jbMachineRoomDao.get("from TjbMachineRoom t  where t.id = :id", params);
		JbMachineRoom o = new JbMachineRoom();
		BeanUtils.copyProperties(t, o);
		return o;
	}

	@Override
	public void edit(JbMachineRoom jbMachineRoom) {
		TjbMachineRoom t = jbMachineRoomDao.get(TjbMachineRoom.class, jbMachineRoom.getId());
		if (t != null) {
			MyBeanUtils.copyProperties(jbMachineRoom, t, new String[] { "id" , "createdatetime" },true);
			//t.setModifydatetime(new Date());
		}
	}

	@Override
	public void delete(String id) {
		jbMachineRoomDao.delete(jbMachineRoomDao.get(TjbMachineRoom.class, id));
	}

	@Override
	public void updateRemarks(String id,String[] remarks) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		jbMachineRoomRemarkDao.executeHql("delete from TjbMachineRoomRemark t where t.roomId = :id",params);
		if(remarks == null) return;
		for (String remark : remarks) {
			TjbMachineRoomRemark remarkEntity = new TjbMachineRoomRemark();
			remarkEntity.setRoomId(id);
			remarkEntity.setRemark(remark);
			remarkEntity.setId(UUID.randomUUID().toString());
			jbMachineRoomRemarkDao.save(remarkEntity);
		}
	}

	@Override
	public List<JbMachineRoomRemark> getRemarkList(String roomId) {
		List<JbMachineRoomRemark> jbMachineRoomRemarkList = new ArrayList<JbMachineRoomRemark>();
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", roomId);
		List<TjbMachineRoomRemark> tjbMachineRoomRemarkList = jbMachineRoomRemarkDao.find("from TjbMachineRoomRemark t where t.roomId = :id", params);
		if(tjbMachineRoomRemarkList!=null){
			for (TjbMachineRoomRemark tjbMachineRoomRemark : tjbMachineRoomRemarkList) {
				JbMachineRoomRemark jbMachineRoomRemark = new JbMachineRoomRemark();
				BeanUtils.copyProperties(tjbMachineRoomRemark,jbMachineRoomRemark);
				jbMachineRoomRemarkList.add(jbMachineRoomRemark);
			}
		}
		return jbMachineRoomRemarkList;
	}

}
