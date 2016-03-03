/**
 * 
 */
package asset.service.impl;

import java.util.List;

import jb.pageModel.PageHelper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import asset.dao.AssetBaseDaoI;
import asset.model.AssetAttr;
import asset.model.AssetBaseInfo;
import asset.model.AssetExtInfo;
import asset.model.AssetInfo;
import asset.service.AssetBaseServiceI;

/**
 * @author yanghui
 *
 */
@Service
public class AssetBaseServiceImpl  implements AssetBaseServiceI {

	@Autowired
	private AssetBaseDaoI assetBaseDao;
	

	@Override
	public AssetBaseInfo getAssetBaseInfo(Integer id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<AssetExtInfo> getAssetExtInfo(Integer id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public AssetInfo getAssetInfo(Integer id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<AssetBaseInfo> searchAssetBaseInfo(String key, PageHelper ph)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<AssetInfo> searchAssetInfo(String key, PageHelper ph)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<AssetAttr> getAssetAttr(String cate) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
