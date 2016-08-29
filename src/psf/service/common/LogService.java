package psf.service.common;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import psf.PsfService;
import psf.common.PageParam;
import psf.common.PageResult;
import psf.entity.TLogPageView;
import psf.entity.TLogPostView;
import psf.entity.TLogSpaceVisit;
import psf.entity.TLogUserLogin;
import psf.vo.sns.SnsUserInfoVO;
import psf.vo.sns.right.SnsRightUserVO;

public class LogService extends PsfService {
	public void addPageView(TLogPageView pv) throws Exception {
		dao.insert(pv);
	}
	
	public void addSpaceVisit(TLogSpaceVisit sv) throws Exception {
		dao.insert(sv);
	}
	
	public void addPostView(TLogPostView postview) throws Exception {
		dao.insert(postview);
	}
	
	public void addUserLogin(TLogUserLogin login) throws Exception {
		dao.insert(login);
	}
	
	/**
	 * 查询看过指定空间的用户
	 * @param uid
	 * @param pp
	 * @return
	 * @throws Exception
	 */
	public PageResult<SnsRightUserVO> queryVistorByUid(Integer uid, PageParam pp) throws Exception {
		UserService userService = new UserService();
		
		Integer count = (Integer) sqlmap.queryForObject("log.countVisitorByUid", uid);
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("uid", uid);
		param.put("offset", pp.getOffset());
		param.put("pageSize", pp.getPageSize());
		PageResult<SnsRightUserVO> result = null;
		if(count > 0){
			List<SnsRightUserVO> userlist = sqlmap.queryForList("log.queryVisitorByUid", param);
			//设置用户显示名、头像名和关注与否
			for(SnsRightUserVO user : userlist){
				SnsUserInfoVO userinfo = userService.queryUserInfo(uid, user.getUid());
				user.setAvatarFileName(userinfo.getAvatarFileName());
				user.setUsername(userinfo.getUsername());
				user.setIsFollow(userinfo.getIsfollow());
			}
			return new PageResult<SnsRightUserVO>(userlist, count, pp.getPageSize());
		}
		return result;
	}
}
