package psf.service.mall;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import psf.PsfService;
import psf.common.PageParam;
import psf.common.PageResult;
import psf.entity.TProductCate;
import psf.service.sns.PostService;
import psf.vo.sns.right.SnsRightProductVO;

/**
 * 商品
 * 
 * @author 
 */
public class ProductService extends PsfService {
	
	/**
	 * 查询销售靠前的商品
	 * @param posttype 0-所有商品，1-秀场商品，2-体验商品，3-指南商品
	 * @param topCount
	 * @param pp
	 * @return
	 * @throws Exception
	 */
	public PageResult<SnsRightProductVO> queryTopProduct(Integer posttype, Integer topCount, PageParam pp) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("posttype", posttype);
		param.put("topCount", topCount);
		param.put("offset", pp.getOffset());
		param.put("pageSize", pp.getPageSize());
		List<SnsRightProductVO> productlist = sqlmap.queryForList("product.queryTopProduct", param);
		for(SnsRightProductVO product : productlist) {
			//处理商品价格
			setGoodsPrice(product);
		}
		return new PageResult<SnsRightProductVO>(productlist, topCount, pp.getPageSize());
		
	}
	
	/**
	 * 查询右侧浮动显示的商品信息
	 * @param pid
	 * @return
	 * @throws Exception
	 */
	public SnsRightProductVO queryRightProductVO(Integer pid) throws Exception {
		PostService postService = new PostService();
		
		SnsRightProductVO productVO = (SnsRightProductVO) sqlmap.queryForObject("product.queryRightProductVO", pid);
		
		//设置秀场数和体验数，品数暂时不计算
		productVO.setShowCount(postService.queryPostCount(2, productVO.getPid()));
		productVO.setShopexpCount(postService.queryPostCount(3, productVO.getPid()));
		
		return productVO;
	}
	
	/**
	 * 查询秀场的商品
	 * @param showid
	 * @return
	 * @throws Exception
	 */
	public List<SnsRightProductVO> queryProductByShowid(Integer showid) throws Exception {
		List<SnsRightProductVO> products = sqlmap.queryForList("product.queryProductByShowid", showid);
		//价格显示调整
		for(SnsRightProductVO product : products){
			setGoodsPrice(product);
		}
		return products;
	}
	
	/**
	 * 根据已选择的商品ID查询商品信息
	 * @param pids
	 * @param pp
	 * @return
	 * @throws Exception
	 */
	public PageResult<SnsRightProductVO> querySelectedProduct(Integer[] pids, PageParam pp) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("pids", pids);
		param.put("offset", pp.getOffset());
		param.put("pageSize", pp.getPageSize());
		List<SnsRightProductVO> productlist = sqlmap.queryForList("product.querySelectedProduct", param);
		//价格显示调整
		for(SnsRightProductVO product : productlist){
			setGoodsPrice(product);
		}
		return new PageResult<SnsRightProductVO>(productlist, pids.length, pp.getPageSize());
	}
	
	/**
	 * 查询“热门秀场商品”、“热门体验商品”、“热门指南商品”
	 * @param posttype
	 * @param pp
	 * @return
	 * @throws Exception
	 */
	public PageResult<SnsRightProductVO> queryHotPostProduct(Integer posttype, PageParam pp) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("posttype", posttype);
		Integer count = (Integer)sqlmap.queryForObject("product.countHotPostProduct",param);
		PageResult<SnsRightProductVO> result = null;
		if(count > 0){
			param.put("offset", pp.getOffset());
			param.put("pageSize", pp.getPageSize());
			List<SnsRightProductVO> productlist = sqlmap.queryForList("product.queryHotPostProduct", param);
			for(SnsRightProductVO product : productlist){
				setGoodsPrice(product);
			}
			result = new PageResult<SnsRightProductVO>(productlist, count, pp.getPageSize());
		}
		return result;
	}
	
	/**
	 * 查询指南品牌相关的商品
	 * @param postid
	 * @param pp
	 * @return
	 * @throws Exception
	 */
	public PageResult<SnsRightProductVO> queryGuideBrandProduct(Integer postid, PageParam pp) throws Exception {
		Integer count = (Integer)sqlmap.queryForObject("product.countGuideBrandProduct",postid);
		PageResult<SnsRightProductVO> result = null;
		if(count > 0){
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("postid", postid);
			param.put("offset", pp.getOffset());
			param.put("pageSize", pp.getPageSize());
			List<SnsRightProductVO> productlist = sqlmap.queryForList("product.queryGuideBrandProduct", param);
			for(SnsRightProductVO product : productlist){
//				product.setPrice(product.getPrice().setScale(2,BigDecimal.ROUND_HALF_DOWN));
//				product.setPrice_market(product.getPrice_market().setScale(2,BigDecimal.ROUND_HALF_DOWN));
				setGoodsPrice(product);
			}
			result = new PageResult<SnsRightProductVO>(productlist, count, pp.getPageSize());
		}
		return result;
	}
	
	private void setGoodsPrice(SnsRightProductVO product){
		if(product.getPrice() != null){
			product.setPrice(product.getPrice().setScale(2,BigDecimal.ROUND_HALF_DOWN));
		}
		if(product.getPrice_market()!=null){
			product.setPrice_market(product.getPrice_market().setScale(2,BigDecimal.ROUND_HALF_DOWN));
		}
	}
	
	/**
	 * 查询父类
	 * @param type	1-上级父类，2-顶级父类
	 * @param cateid
	 * @return
	 * @throws Exception
	 */
	public TProductCate queryParentCate(Integer type, Integer cateid) throws Exception {
		TProductCate cate = (TProductCate)sqlmap.queryForObject("product.queryParentCate", cateid);
		if(type.equals(1)){
			return cate;
		}else if(type.equals(2)){
			while(!cate.getParentid().equals(0)){
				cate = (TProductCate)sqlmap.queryForObject("product.queryParentCate", cate.getCateid());
			}
			return cate;
		}
		return null;	
	}
	
	/**
	 * 按照等级查询分类
	 * @param level
	 * @return
	 * @throws Exception
	 */
	public List<TProductCate> queryProductCateByLevel(Integer level) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("level", level);
		return sqlmap.queryForList("product.queryProductCateByLevel", param);
	}
	
	/**
	 * 查询用户在秀场和体验中发布的商品
	 * @param uid
	 * @param posttype
	 * @param pp
	 * @return
	 * @throws Exception
	 */
	public PageResult<SnsRightProductVO> queryPostProductByUid(Integer uid, Integer posttype, PageParam pp) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("uid", uid);
		param.put("posttype", posttype);
		Integer count = (Integer)sqlmap.queryForObject("product.countPostProductByUid", param);
		PageResult<SnsRightProductVO> result = null;
		if(count > 0){
			param.put("offset", pp.getOffset());
			param.put("pageSize", pp.getPageSize());
			List<SnsRightProductVO> productlist = sqlmap.queryForList("product.queryPostProductByUid", param);
			for(SnsRightProductVO product : productlist){
				setGoodsPrice(product);
			}
			result = new PageResult<SnsRightProductVO>(productlist, count, pp.getPageSize());
		}
		return result;
	}
}
