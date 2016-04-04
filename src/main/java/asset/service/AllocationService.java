/**
 * 
 */
package asset.service;

import java.util.List;
import java.util.Map;

import jb.pageModel.PageHelper;
import asset.model.AllocationInfo;
import asset.model.AssetAllocation;

/**
 * @author yanghui
 *
 */
public interface AllocationService {
	
	
	List<AllocationInfo> searchAllocation(Map<String,String> paramMap,PageHelper ph) throws Exception;
	
	
	Long countAllocation(Map<String,String> paramMap) throws Exception;
	
	
	void addAllocation(AssetAllocation allo) throws Exception;
	
}
