/**
 * 
 */
package asset.service;

import java.util.List;

import asset.model.TuserNotice;


/**
 * @author yanghui
 *
 */
public interface TuserNoticeServiceI {
	
	
	List<TuserNotice> getUserNotice(Integer userId) throws Exception;
}
