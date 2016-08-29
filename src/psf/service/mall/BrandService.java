package psf.service.mall;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import psf.PsfService;
import psf.common.PageParam;
import psf.common.PageResult;
import psf.entity.TBrand;
import psf.entity.TPic;
import psf.service.common.PicService;
import psf.vo.mall.BrandVO;

/**
 * 商品品牌
 * 
 * @author 肖慧
 */
public class BrandService extends PsfService {

	/**
	 * 根据指南ID查询指南包含的品牌对象
	 * @param guideid
	 * @param pp
	 * @return
	 * @throws Exception
	 */
	public PageResult<BrandVO> queryBrandByGuideId(Integer guideid, PageParam pp) throws Exception {
		PicService picService = new PicService();
		
		Integer count = (Integer) sqlmap.queryForObject("brand.countByGuideId", guideid);
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("guideid", guideid);
		param.put("offset", pp.getOffset());
		param.put("pageSize", pp.getPageSize());
		List<BrandVO> brandlist = sqlmap.queryForList("brand.queryByGuideId", param);
		//设置品牌图片
		for(BrandVO brand : brandlist){
			//TPic pic = (TPic) picService.queryPicByPicId(brand.getBrandpic());
			brand.setLogoName("");
		}
		return new PageResult<BrandVO>(brandlist, count, pp.getPageSize());
	}
	
	/**
	 * 查询多个品牌
	 * @param brandids
	 * @return
	 * @throws Exception
	 */
	public List<BrandVO> queryBrandVOs(Integer[] brandids) throws Exception {
		if(brandids == null)
			return null;
		List<BrandVO> brandlist = new ArrayList<BrandVO>();
		for(Integer brandid : brandids){
			brandlist.add(queryBrandVO(brandid));
		}
		return brandlist;
	}
	
	/**
	 * 设置品牌logoName
	 * @param brand
	 * @throws Exception
	 */
	private void setBrandVO(BrandVO brand) throws Exception {
		PicService picService = new PicService();
		//TPic pic = picService.queryPicByPicId(brand.getBrandpic());
		brand.setLogoName("");
	}
	/**
	 * 查询指定品牌
	 * @param brandid
	 * @return
	 * @throws Exception
	 */
	public BrandVO queryBrandVO(Integer brandid) throws Exception {
		BrandVO brandvo = (BrandVO)sqlmap.queryForObject("brand.queryBrandVO", brandid);
		setBrandVO(brandvo);
		return brandvo;
	}
	
	/**
	 * 查询该品牌的好友推荐数
	 * @param uid
	 * @param brandid
	 * @return
	 * @throws Exception
	 */
	public Integer queryRecommondFriend(Integer uid, Integer brandid) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("uid", uid);
		param.put("brandid", brandid);
		return (Integer)sqlmap.queryForObject("brand.queryRecommondFriend",param);
	}
	
	/**
	 * 查询秀场、体验相关品牌
	 * @param postid
	 * @param pp
	 * @return
	 * @throws Exception
	 */
	public PageResult<BrandVO> queryPostBrandVO(Integer postid, PageParam pp) throws Exception {
		Integer count = (Integer)sqlmap.queryForObject("brand.countPostBrandVO", postid);
		PageResult<BrandVO> result = null;
		if(count > 0){
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("postid",postid);
			param.put("offset", pp.getOffset());
			param.put("pageSize", pp.getPageSize());
			List<BrandVO> brandlist = sqlmap.queryForList("brand.queryPostBrandVO",param);
			for(BrandVO brand : brandlist){
				setBrandVO(brand);
			}
			result = new PageResult<BrandVO>(brandlist, count, pp.getPageSize());
		}
		return result;
	}
	
}
