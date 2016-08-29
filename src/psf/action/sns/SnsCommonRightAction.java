package psf.action.sns;

import java.math.BigDecimal;

import psf.Psf;
import psf.PsfAction;
import psf.common.PageParam;
import psf.common.PageResult;
import psf.service.common.LogService;
import psf.service.common.UserService;
import psf.service.mall.BrandService;
import psf.service.mall.ProductService;
import psf.service.sns.GroupService;
import psf.service.sns.PostService;
import psf.service.sns.SnsService;
import psf.vo.mall.BrandVO;
import psf.vo.sns.GroupVO;
import psf.vo.sns.GuideVO;
import psf.vo.sns.ShopexpVO;
import psf.vo.sns.ShowVO;
import psf.vo.sns.right.SnsRightProductVO;
import psf.vo.sns.right.SnsRightUserVO;

/**
 * 右侧推荐组件Action
 * @author 肖慧
 *
 */
public class SnsCommonRightAction extends PsfAction {
	
	/**
	 * 处理共同的参数
	 * @return
	 * @throws Exception
	 */
	private Integer[] handle() throws Exception {
		Integer[] result = new Integer[2];
		//page参数处理
		Integer page = p2int("page");
		if(page == null)
			page = 1;
		result[0] = page;
		set("page", page);
		//请求参数typeid处理
		Integer typeid = p2int("typeid");
		result[1] = typeid;
		set("typeid", typeid);
		//请求divid参数,翻页事件需要调用该标志
		String divid = p("divid");
		set("divid", divid);
		return result;
	}
	
	
	public void getCoins() throws Exception {
		Integer[] paramValues = handle();
		Integer typeid = paramValues[1];
		
		UserService userService = new UserService();
		PageParam pp = new PageParam(paramValues[0], 6);
		PageResult<SnsRightUserVO> rankers = null;
		
		if(typeid.equals(1)){	//秀场排行榜
			rankers = userService.queryTopUserByType(getLoginUserId(), Psf.OTYPE_Show, 100, pp);
			set("title", "秀场");
		}else if(typeid.equals(2)){	//体验排行榜
			rankers = userService.queryTopUserByType(getLoginUserId(), Psf.OTYPE_Shopexp, 100, pp);
			set("title", "体验");
		}else if(typeid.equals(3)){	//指南排行榜
			rankers = userService.queryTopUserByType(getLoginUserId(), Psf.OTYPE_Guide, 100, pp);
			set("title", "指南");
		}
		set("rankers", rankers);
	}
	
	public void getGroup() throws Exception {
		Integer[] paramValues = handle();
		Integer typeid = paramValues[1];
		
		GroupService groupService = new GroupService();
		
		if(typeid.equals(1)){	//我参加的圈子
			PageParam pp = new PageParam(paramValues[0], 9);
			PageResult<GroupVO> groups = groupService.queryJoinGroupByUid(getLoginUserId(), pp);
			if(groups == null){
				String message = "亲，您还没有参加任何圈子，赶紧去圈子看看吧！";
				set("message", message);
			}
			set("groups", groups);
		}else if(typeid.equals(2)){	//你可能喜欢的圈子
			PageParam pp = new PageParam(paramValues[0], 9);
			PageResult<GroupVO> groups = groupService.queryGroupRecommend(getLoginUserId(), pp);
			
			if(groups == null){
				String message = "亲，您还没有参加任何圈子，赶紧去圈子看看吧！";
				set("message", message);
			}
			set("groups", groups);
			
		}else if(typeid.equals(3)){	//热门圈子
			PageParam pp = new PageParam(paramValues[0], 9);
			PageResult<GroupVO> groups = groupService.queryHotGroup(0,1,pp);
			
			if(groups == null){
				String message = "亲，您还没有参加任何圈子，赶紧去圈子看看吧！";
				set("message", message);
			}
			set("groups", groups);
		}else if(typeid.equals(4)){	//新建圈子
			PageParam pp = new PageParam(paramValues[0], 9);
			PageResult<GroupVO> groups = groupService.queryHotGroup(0,2,pp);
			
			if(groups == null){
				String message = "亲，您还没有参加任何圈子，赶紧去圈子看看吧！";
				set("message", message);
			}
			set("groups", groups);
		}else if(typeid.equals(5)){ //TA感兴趣的圈子
			Integer uid = p2int("uid");
			set("uid",uid);
			PageParam pp = new PageParam(paramValues[0], 9);
			PageResult<GroupVO> groups = groupService.queryGroupRecommend(uid, pp);
			if(groups == null){
				String message = "当前还没有参加任何圈子，赶紧去圈子看看吧！";
				set("message", message);
			}
			set("groups", groups);
		}
	}
	
	public void getProduct() throws Exception {
		Integer[] paramValues = handle();
		Integer typeid = paramValues[1];
		
		ProductService productService = new ProductService();
		PageParam pp = new PageParam(paramValues[0], 9);
		
		if(typeid.equals(1)){	//热门秀场商品
			PageResult<SnsRightProductVO> products = productService.queryHotPostProduct(2, pp);
			if(products == null){
				String message = "当前没有热门秀场商品！";
				set("message", message);
			}
			set("products", products);
		}else if(typeid.equals(2)){	//猜你喜欢的秀场商品
			PageResult<SnsRightProductVO> products = productService.queryTopProduct(1, 9, pp);
			if(products == null){
				String message = "系统找不到您喜欢的秀场商品，去商城瞧瞧吧！";
				set("message", message);
			}
			set("products", products);
		}else if(typeid.equals(3)){	//热门体验商品
			PageResult<SnsRightProductVO> products = productService.queryHotPostProduct(3, pp);
			if(products == null){
				String message = "当前没有热门体验商品！";
				set("message", message);
			}
			set("products", products);
		}else if(typeid.equals(4)){	//猜你喜欢的体验商品
			PageResult<SnsRightProductVO> products = productService.queryTopProduct(2, 9, pp);
			if(products == null){
				String message = "系统找不到您喜欢的体验商品，去商城瞧瞧吧！";
				set("message", message);
			}
			set("products", products);
		}else if(typeid.equals(5)){	//热门指南商品
			PageResult<SnsRightProductVO> products = productService.queryHotPostProduct(4, pp);
			if(products == null){
				String message = "当前没有热门指南商品！";
				set("message", message);
			}
			set("products", products);
		}else if(typeid.equals(6)){	//猜你喜欢的指南商品
			PageResult<SnsRightProductVO> products = productService.queryTopProduct(3, 9, pp);
			if(products == null){
				String message = "系统找不到您喜欢的指南商品，去商城瞧瞧吧！";
				set("message", message);
			}
			set("products", products);
		}else if(typeid.equals(7)){	//猜你喜欢的商品
			PageResult<SnsRightProductVO> products = productService.queryTopProduct(0, 9, pp);
			if(products == null){
				String message = "系统找不到您喜欢的商品，去商城瞧瞧吧！";
				set("message", message);
			}
			set("products", products);
		}else if(typeid.equals(8)){	//指南品牌相关的商品
			Integer postid = p2int("postid");
			set("postid",postid);
			PageResult<SnsRightProductVO> products = productService.queryGuideBrandProduct(postid, pp);
			if(products == null){
				String message = "当前没有与该指南品牌相关的商品！";
				set("message", message);
			}
			set("products", products);
		}else if(typeid.equals(9)){//TA发布的体验商品
			Integer uid = p2int("uid");
			set("uid",uid);
			PageResult<SnsRightProductVO> products = productService.queryPostProductByUid(uid, Psf.OTYPE_Shopexp, pp);
			if(products == null){
				String message = "该用户当前没有发布商品体验！";
				set("message", message);
			}
			set("products", products);
		}
	}
	
	public void getPsfFriend() throws Exception {
		Integer[] paramValues = handle();
		Integer typeid = paramValues[1];
		
		UserService userService = new UserService();
		SnsService snsService = new SnsService();
		LogService logService = new LogService();
		
		PageParam pp = new PageParam(paramValues[0],9);
		if(typeid.equals(1)){	//请求人气品友
			PageResult<SnsRightUserVO> users = userService.queryTopUser(getLoginUserId(), 20, pp);
			if(users == null){
				String message = "系统暂时找不到人气品友.";
				set("message", message);
			}
			set("users", users);
		}else if(typeid.equals(2)){	//请求你可能喜欢的品友
			PageResult<SnsRightUserVO> users = snsService.queryRecommendUser(getLoginUserId(), pp);
			if(users == null){
				String message = "当前没有推荐品友，赶紧玩起来！";
				set("message", message);
			}
			set("users", users);
		}else if(typeid.equals(3)){	//请求看过我的品友
			PageResult<SnsRightUserVO> users = logService.queryVistorByUid(getLoginUserId(), pp);
			if(users == null){
				String message = "当前还没有品友造访过您哦，加油！";
				set("message", message);
			}
			set("users", users);
		}else if(typeid.equals(4)){	//喜欢该秀场商品的品友
			Integer postid = p2int("postid");
			PageResult<SnsRightUserVO> users = snsService.queryPostProductUser(getLoginUserId(), postid, pp);
			if(users == null){
				String message = "暂时还没有品友喜欢您发布的商品哦！";
				set("message", message);
			}
			set("users", users);
			set("postid", postid);
		}else if(typeid.equals(5)){	//喜欢该体验商品的品友
			Integer postid = p2int("postid");
			PageResult<SnsRightUserVO> users = snsService.queryPostProductUser(getLoginUserId(), postid, pp);
			if(users == null){
				String message = "暂时还没有品友喜欢您发布的商品哦！";
				set("message", message);
			}
			set("users", users);
			set("postid", postid);
		}else if(typeid.equals(6)){ //喜欢该指南品牌的品友
			Integer postid = p2int("postid");
			PageResult<SnsRightUserVO> users = snsService.queryPostBrandUser(getLoginUserId(), postid, pp);
			if(users == null){
				String message = "暂时还没有品友喜欢您发布的品牌哦！";
				set("message", message);
			}
			set("users", users);
			set("postid", postid);
		}else if(typeid.equals(7)){	//TA的好友
			Integer uid = p2int("uid");
			set("uid", uid);
			PageResult<SnsRightUserVO> users = snsService.queryRightUserVO(getLoginUserId(), uid, 1, pp);
			if(users == null){
				String message = "暂时你还没有好友哦！";
				set("message", message);
			}
			set("users", users);
		}else if(typeid.equals(8)){ //TA的粉丝
			Integer uid = p2int("uid");
			set("uid", uid);
			PageResult<SnsRightUserVO> users = snsService.queryRightUserVO(getLoginUserId(), uid, 2, pp);
			if(users == null){
				String message = "暂时你还没有粉丝哦！";
				set("message", message);
			}
			set("users", users);
		}else if(typeid.equals(9)){ //TA的关注
			Integer uid = p2int("uid");
			set("uid", uid);
			PageResult<SnsRightUserVO> users = snsService.queryRightUserVO(getLoginUserId(), uid, 3, pp);
			if(users == null){
				String message = "暂时你还没有关注用户哦！";
				set("message", message);
			}
			set("users", users);
		}else if(typeid.equals(10)){ //关注TA的还关注
			Integer uid = p2int("uid");
			set("uid", uid);
			PageResult<SnsRightUserVO> users = snsService.queryRightUserVO(getLoginUserId(), uid, 4, pp);
			if(users == null){
				String message = "暂时你还没有关注用户哦！";
				set("message", message);
			}
			set("users", users);
		}
	}
	
	public void getShow() throws Exception {
		Integer[] paramValues = handle();
		Integer typeid = paramValues[1];
		
		PostService postService = new PostService();
		PageParam pp = new PageParam(paramValues[0],6);
		if(typeid.equals(1)){
			PageResult<ShowVO> shows = postService.queryShowRecommend(getLoginUserId(), pp);
			if(shows == null){
				String message = "系统找不到您喜欢的秀场 ，赶紧去发布吧！";
				set("message", message);
			}
			set("shows",shows);
		}else if(typeid.equals(2)){
			Integer postid = p2int("postid");
			Integer uid = p2int("uid");
			PageResult<ShowVO> shows = postService.queryOtherShowByUid(uid, postid, Psf.OTYPE_Show, pp);
			if(shows == null){
				String message = "这是秀主唯一的秀场哦！";
				set("message", message);
			}
			set("shows",shows);
			set("postid",postid);
			set("uid",uid);
		}else if(typeid.equals(3)){
			Integer postid = p2int("postid");
			PageResult<ShowVO> shows = postService.queryHotProductShow(getLoginUserId(), postid, Psf.OTYPE_Show, pp);
			if(shows == null){
				String message = "没有发现这些秀品的其他秀场呢，赶紧去发布吧！";
				set("message", message);
			}
			set("shows",shows);
			set("postid",postid);
		}
	}
	
	public void getShopexp() throws Exception {
		Integer[] paramValues = handle();
		Integer typeid = paramValues[1];
		
		PostService postService = new PostService();
		PageParam pp = new PageParam(paramValues[0],4);
		if(typeid.equals(1)){
			PageResult<ShopexpVO> shopexps = postService.queryShopexpRecommend(getLoginUserId(), pp);
			if(shopexps == null){
				String message = "系统找不到您喜欢的体验 ，赶紧去发布吧！";
				set("message", message);
			}
			set("shopexps", shopexps);
		}else if(typeid.equals(2)){
			Integer postid = p2int("postid");
			Integer uid = p2int("uid");
			PageResult<ShopexpVO> shopexps = postService.queryOtherShopexpByUid(uid, postid, Psf.OTYPE_Shopexp, pp);
			if(shopexps == null){
				String message = "这是TA唯一的体验哦！";
				set("message", message);
			}
			set("shopexps",shopexps);
			set("postid",postid);
			set("uid",uid);
		}else if(typeid.equals(3)){
			Integer postid = p2int("postid");
			PageResult<ShopexpVO> shopexps = postService.queryHotProductShopexp(getLoginUserId(), postid, Psf.OTYPE_Shopexp, pp);
			if(shopexps == null){
				String message = "没有发现这个商品的其他体验呢，赶紧去发布吧！";
				set("message", message);
			}
			set("shopexps",shopexps);
			set("postid",postid);
		}
	}
	
	public void getGuide() throws Exception {
		Integer[] paramValues = handle();
		Integer typeid = paramValues[1];
		
		PostService postService = new PostService();
		PageParam pp = new PageParam(paramValues[0],4);
		if(typeid.equals(1)){
			PageResult<GuideVO> guides = postService.queryGuideRecommend(getLoginUserId(), pp);
			if(guides == null){
				String message = "系统找不到您喜欢的指南 ，赶紧去发布吧！";
				set("message", message);
			}
			set("guides", guides);
		}else if(typeid.equals(2)){
			Integer uid = p2int("uid");
			set("uid",uid);
			Integer postid = p2int("postid");
			set("postid",postid);
			PageResult<GuideVO> guides = postService.queryOtherGuideByUid(uid, postid, Psf.OTYPE_Guide, pp);
			if(guides == null){
				String message = "这是TA唯一的指南哦！";
				set("message", message);
			}
			set("guides", guides);
		}else if(typeid.equals(3)){
			Integer postid = p2int("postid");
			set("postid",postid);
			PageResult<GuideVO> guides = postService.queryHotBrandGuide(getLoginUserId(), postid, pp);
			if(guides == null){
				String message = "目前没有与指南品牌相关的其他指南，赶紧去发布吧！";
				set("message", message);
			}
			set("guides", guides);
		}
	}
	
	public void getFloatProduct() throws Exception {
		Integer pid = p2int("pid");
		ProductService productService = new ProductService();
		SnsRightProductVO product = null;
		if(pid != null){
			product = productService.queryRightProductVO(pid);
		}
		product.setPrice(product.getPrice().setScale(0));
		product.setPrice_market(product.getPrice_market().setScale(2,BigDecimal.ROUND_HALF_DOWN));
		set("product", product);
	}
	
	public void getFloatShow() throws Exception {
		Integer showid = p2int("showid");
		PostService postService = new PostService();
		ShowVO show = null;
		if(showid != null){
			show = postService.queryShowVOById(getLoginUserId(), showid);
		}
		set("show", show);
	}
	
	public void getPostBrand() throws Exception {
		Integer postid = p2int("postid");
		set("postid",postid);
		Integer page = p2int("page");
		if(page == null){
			page = 1;
		}
		set("page",page);
		String divid = p("divid");
		set("divid", divid);
		BrandService brandService = new BrandService();
		PageParam pp = new PageParam(1,4);
		PageResult<BrandVO> brands = brandService.queryPostBrandVO(postid, pp);
		if(brands != null){
			set("brandlist", brands.getList());
			set("pageCount", brands.getPageCount());
		}
	}
}
