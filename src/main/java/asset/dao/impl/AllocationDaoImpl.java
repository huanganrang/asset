package asset.dao.impl;

import jb.dao.impl.BaseDaoImpl;

import org.springframework.stereotype.Repository;

import asset.dao.AllocationDaoI;
import asset.model.AssetAllocation;

@Repository
public class AllocationDaoImpl extends BaseDaoImpl<AssetAllocation> implements AllocationDaoI {

}
