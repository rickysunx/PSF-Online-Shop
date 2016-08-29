package psf.service.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import psf.PsfService;
import psf.entity.TZone;
import psf.vo.sns.ZoneVO;

/**
 * 地区和快递地区查询方法类
 * 
 * @author 肖慧
 * 
 */
public class ZoneService extends PsfService {
	/**
	 * 查询所有的地区
	 * @param level -1:全部，1：一级，2：二级
	 * @return
	 * @throws Exception
	 */
	public List<TZone> queryZoneByLevel(Integer level) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("level", level);
		return sqlmap.queryForList("zone.queryZoneByLevel",param);
	}
	
	public List<ZoneVO> queryAllZoneVO() throws Exception {
		
		List<TZone> listAllZone = sqlmap.queryForList("zone.queryAllZone");
		List<ZoneVO> listZoneVO = new ArrayList<ZoneVO>();
		
		for (TZone z:listAllZone) {
			if(z.getLevel()==1) {
				ZoneVO zvo = new ZoneVO();
				zvo.setZoneid(z.getZoneid());
				zvo.setParentid(0);
				zvo.setZonename(z.getZonename());
				zvo.setChildren(new ArrayList());
				listZoneVO.add(zvo);
			}
		}
		
		for(TZone z:listAllZone) {
			if(z.getLevel()==2) {
				for(ZoneVO zvo_p:listZoneVO) {
					if(zvo_p.getZoneid().equals(z.getLevel1id())) {
						ZoneVO zvo = new ZoneVO();
						zvo.setZoneid(z.getZoneid());
						zvo.setParentid(0);
						zvo.setZonename(z.getZonename());
						zvo_p.getChildren().add(zvo);
					}
				}
			}
		}
		
		
		return listZoneVO;
	}

	/**
	 * 根据父地区查询所辖子地区
	 * 
	 * @param parentid
	 *            父地区ID
	 * @return
	 * @throws Exception
	 */
	public List<TZone> queryZoneChildren(Integer parentid) throws Exception { // 省、市二级，即根据省（市）ID查询其所辖市（地区），其level=2
		return sqlmap.queryForList("zone.queryZoneChildren", parentid);
	}

	/**
	 * 根据地区ID查询地区对象
	 * 
	 * @param zoneid
	 *            地区ID
	 * @return
	 * @throws Exception
	 */
	public TZone queryZoneByID(Integer zoneid) throws Exception {
		return (TZone) sqlmap.queryForObject("zon.queryZoneByID", zoneid);
	}

//	/**
//	 * 查询所有的快递地区
//	 * 
//	 * @return
//	 * @throws Exception
//	 */
//	@SuppressWarnings("unchecked")
//	public List<TExpresszone> queryAllExpressZone() throws Exception {
//		return sqlmap.queryForList("zone.queryAllExpressZone");
//	}
//
//	/**
//	 * 根据父地区ID查询所有的快递地区对象
//	 * 
//	 * @param parentid
//	 * @return
//	 * @throws Exception
//	 */
//	@SuppressWarnings("unchecked")
//	public List<TExpresszone> queryExpressZoneChildren(Integer parentid) throws Exception {
//		// 先查出指定地区的级别
//		TExpresszone ezone = (TExpresszone) sqlmap.queryForObject("zone.queryExpressZoneByID", parentid);
//		Integer level = ezone.getLevel();
//		Map<String, Object> param = new HashMap<String, Object>();
//		param.put("parentid", parentid);
//		param.put("level", level);
//		return sqlmap.queryForList("zone.queryExpressZoneChildren", param);
//	}
//
//	/**
//	 * 根据指定ID查询快递地区
//	 * 
//	 * @param expresszoneid
//	 * @return
//	 * @throws Exception
//	 */
//	public TExpresszone queryExpressZoneByID(Integer expresszoneid) throws Exception {
//		return (TExpresszone) sqlmap.queryForObject("zone.queryExpressZoneByID", expresszoneid);
//	}
	
	/**
	 * 查询父地区
	 * @param zoneid
	 * @return
	 * @throws Exception
	 */
	public TZone queryParentZone(Integer zoneid) throws Exception {
		return (TZone)sqlmap.queryForObject("zone.queryParentZone", zoneid);
	}
}
