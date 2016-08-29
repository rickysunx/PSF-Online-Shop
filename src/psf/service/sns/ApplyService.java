/**
 * 请求和邀请
 * @author 于淼
 */
package psf.service.sns;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import psf.Psf;
import psf.PsfService;
import psf.common.PageParam;
import psf.common.PageResult;
import psf.entity.TApply;
import psf.entity.TPic;
import psf.entity.TZone;
import psf.service.common.UserService;
import psf.service.common.ZoneService;
import psf.vo.sns.ApplyVO;
import psf.vo.sns.GroupVO;
import psf.vo.sns.SnsUserInfoVO;

public class ApplyService extends PsfService {
	public void addApply(TApply apply) throws Exception {
		dao.insert(apply);
	}
	public void updateApply(TApply apply) throws Exception {
		dao.update(apply);
	}
	public TApply queryApplyByID(int applyid) throws Exception {
		return (TApply)sqlmap.queryForObject("apply.queryApplyByID", applyid);
	}
	
	public PageResult<TApply> queryApplyByOid(int otype,int oid,PageParam pp) throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("otype", otype);
		map.put("oid", oid);
		map.put("pp", pp);
		Integer itemCount = (Integer)sqlmap.queryForObject("apply.queryApplyByOidCount", map);
		List<TApply> applyList = sqlmap.queryForList("apply.queryApplyByOid", map);
		return new PageResult<TApply>(applyList,itemCount);
	}
	/**
	 * 我的邀请页查询所有好友邀请和关注邀请
	 * @param uid
	 * @param pp
	 * @return
	 * @throws Exception
	 */
	public PageResult<ApplyVO> queryAppplyByUid(Integer uid,PageParam pp,String keyword) throws Exception {
		ZoneService zoneService = new ZoneService();
		Map<String,Object> m = new HashMap<String,Object>();
		m.put("uid", uid);
		m.put("pp",pp);
		m.put("keyword", keyword);
		Integer itemCount = (Integer)sqlmap.queryForObject("apply.queryApplyByUidCount", m);
		List<ApplyVO> list = sqlmap.queryForList("apply.queryApplyByUid", m);
		for(ApplyVO apply : list){
			apply.setPubCount(apply.getGuidecount()+apply.getShowcount()+apply.getShopexpcount());
			if(apply.getAvatarFileName() != null){
				TPic p = (TPic)sqlmap.queryForObject("sns.queryPicByPicid", Integer.parseInt(apply.getAvatarFileName()));
				apply.setAvatarFileName(apply.getAvatarFileName()+"."+p.getFiletype());
			} else {
				apply.setAvatarFileName("1.jpg");
			}
			if(apply.getZonename() != null){
				TZone z = zoneService.queryZoneByID(Integer.parseInt(apply.getZonename()));
				String provice = "";
				if(z.getLevel1id()!=0){
					TZone tz = zoneService.queryZoneByID(z.getLevel1id());
					provice = tz.getZonename();
				}
				apply.setZonename(provice+"，"+z.getZonename());
			}
			if(apply.getOtype() == Psf.OTYPE_Ask_For_Follow){
				apply.setType(2);
			} else if(apply.getOtype() == Psf.OTYPE_Friend){
				apply.setType(1);
			}
			
		}
		return new PageResult<ApplyVO>(list,itemCount,pp.getPageSize());
	} 
	
	/**
	 * 查询该用户是否申请过，并且申请还未处理
	 * @param otype
	 * @param oid
	 * @param uid
	 * @param applytype
	 * @param checkstatus
	 * @return
	 * @throws Exception
	 */
	public Boolean isApplied(Integer otype, Integer oid, Integer uid, Integer applytype, Integer checkstatus) throws Exception {
		Boolean flag = false;
		List<TApply> applies = queryApplyByStatus(otype,oid,uid,applytype,checkstatus);
		if(applies != null && applies.size()>0){
			flag = true;
		}
		return flag;
	}
	
	public List<TApply> queryApplyByStatus(Integer otype, Integer oid, Integer uid, Integer applytype, Integer checkstatus) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("otype", otype);
		param.put("oid", oid);
		param.put("uid", uid);
		param.put("applytype", applytype);
		param.put("checkstatus", checkstatus);
		List<TApply> applies = sqlmap.queryForList("apply.queryApplyByStatus", param);
		return applies;
	}
	
	/**
	 * 查询申请
	 * @param otype
	 * @param oid
	 * @param uid 当前登录用户的ID
	 * @param fromuid
	 * @param touid
	 * @param applytype
	 * @param checkstatus
	 * @param pp
	 * @return
	 * @throws Exception
	 */
	public PageResult<ApplyVO> queryApply(Integer otype, Integer oid, Integer uid, Integer fromuid, Integer touid, Integer applytype, Integer checkstatus, PageParam pp) throws Exception {
		UserService userService = new UserService();
		GroupService groupService = new GroupService();
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("otype", otype);
		param.put("oid", oid);
		param.put("fromuid", fromuid);
		param.put("touid", touid);
		param.put("applytype", applytype);
		param.put("checkstatus", checkstatus);
		Integer count = (Integer)sqlmap.queryForObject("apply.countApply",param);
		PageResult<ApplyVO> result = null;
		if(count > 0){
			param.put("offset",pp.getOffset());
			param.put("pageSize", pp.getPageSize());
			List<ApplyVO> applies = sqlmap.queryForList("apply.queryApply", param);
			for(ApplyVO apply : applies){
				SnsUserInfoVO userinfo = userService.queryUserInfo(uid, apply.getFromuid());
				apply.setUsername(userinfo.getUsername());
				apply.setAvatarFileName(userinfo.getAvatarFileName());
				
				//如果是邀请，需要查询圈子名和圈子logo属性
				if(apply.getOtype().equals(5) && apply.getApplytype().equals(2)){
					GroupVO group = groupService.queryGroupById(apply.getOid(), uid);
					apply.setGroupid(group.getGroupid());
					apply.setGroupname(group.getGroupname());
					apply.setLogo(group.getLogo());
				}
			}
			result = new PageResult<ApplyVO>(applies, count, pp.getPageSize());
		}
		return result;
	}
}
