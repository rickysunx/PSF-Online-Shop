package psf.service.sns;

import java.math.RoundingMode;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import psf.Psf;
import psf.PsfService;
import psf.Smiley;
import psf.common.PageParam;
import psf.common.PageResult;
import psf.common.PsfHtmlUtils;
import psf.common.PsfShortUrl;
import psf.common.PsfUtils;
import psf.entity.TPic;
import psf.entity.TPost;
import psf.entity.TPostBrand;
import psf.entity.TPostPic;
import psf.entity.TPostProduct;
import psf.entity.TProductCate;
import psf.entity.TUserBalance;
import psf.service.common.PicService;
import psf.service.common.UserService;
import psf.service.mall.BrandService;
import psf.service.mall.ProductService;
import psf.vo.mall.BrandVO;
import psf.vo.mall.ProductVO;
import psf.vo.sns.CommentVO;
import psf.vo.sns.GroupVO;
import psf.vo.sns.GuideVO;
import psf.vo.sns.LikeUserVO;
import psf.vo.sns.PostListItemVO;
import psf.vo.sns.PostPicVO;
import psf.vo.sns.ShopexpVO;
import psf.vo.sns.ShowVO;
import psf.vo.sns.SnsUserInfoVO;
import psf.vo.sns.TopicVO;
import psf.vo.sns.right.SnsRightProductVO;

/**
 * 帖子
 * 
 * @author 肖慧
 */
public class PostService extends PsfService {
	
	/* 帖子排序 */
	public static final int OrderBy_Latest = 1; // 最新排序
	public static final int OrderBy_Hot = 2; // 最热排序

	/* 帖子查询范围 */
	public static final int Range_MyAll = 1; // 我关注的人+我的好友+我自己发布的
	public static final int Range_MySelf = 2; // 与我相关的(我发布的) 
	public static final int Range_MyLike = 3; // 我喜欢的
	
	/**
	 * 发表帖子
	 * 
	 * @param post
	 * @return
	 * @throws Exception
	 */
	public int addPost(TPost post) throws Exception {
		return dao.insert(post);
	}
	public void addPostProduct(TPostProduct postproduct) throws Exception {
		dao.insert(postproduct);
	}
	public void addPostBrand(TPostBrand postbrand) throws Exception {
		dao.insert(postbrand);
	}

	/**
	 * 更新帖子
	 * 
	 * @param post
	 * @throws Exception
	 */
	public void updatePost(TPost post) throws Exception {
		dao.update(post);
	}

	/**
	 * 删除帖子，逻辑删除
	 */
	public void delPost(Integer postid) throws Exception {
		sqlmap.update("post.delete", postid);
	}

	public TPost queryById(Integer postid) throws Exception {
		return (TPost) sqlmap.queryForObject("post.queryById", postid);
	}

	/**
	 * 点击帖子，更新该帖子的点击量
	 */
	public void clickPost(Integer postid) throws Exception {
		TPost post = queryById(postid);
		int clicks = post.getClickcount();
		post.setClickcount(clicks + 1);
		dao.update(post);
	}

	/**
	 * 查询帖子数【用于查询最新且未查看的帖子】
	 * 
	 * @param uid
	 * @param otype 如果为空，则为全部
	 * @param time 查询的时间。
	 * @param range 参看PostList_Range
	 * @param pp 分页参数
	 * @return
	 * @throws Exception
	 */
	public Integer queryAutoPostListCount(Integer uid,Integer otype, int time, Integer range) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("uid", uid);
		param.put("otype", otype);
		param.put("range", range);
		param.put("time", time);
		return (Integer) sqlmap.queryForObject("post.queryPostListItemForCount", param);
	}
	/**
	 * 查询帖子【用于查询最新且未查看的帖子】
	 * 
	 * @param uid
	 * @param otype 如果为空，则为全部
	 * @param time 查询的时间。
	 * @param range 参看PostList_Range
	 * @param pp 分页参数
	 * @return
	 * @throws Exception
	 */
	public List<PostListItemVO> queryAutoPostListItem(Integer uid,Integer otype, int time, Integer range) throws Exception {
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("uid", uid);
		param.put("otype", otype);
		param.put("range", range);
		param.put("time", time);
		//Integer count = (Integer) sqlmap.queryForObject("post.queryPostListItemForCount", param);
		param.put("orderby", 1);
		List<PostListItemVO> postlist = sqlmap.queryForList("post.queryPostListItem", param);
		for (PostListItemVO post : postlist) {
			//设置用户名、用户头像、秀场数、体验数、指南数、喜欢数和粉丝
			updatePostItemsForUserInfo(uid, post);			
		}
		return postlist;
		
	}
	
	/**
	 * 封装 PostListItemVO 对象
	 * 设置用户名、用户头像、秀场数、体验数、指南数、喜欢数和粉丝
	 * 
	 * @param uid
	 * @param post
	 * @throws Exception
	 */
	private void updatePostItemsForUserInfo(Integer uid, PostListItemVO post) throws Exception {
		UserService userService = new UserService();
		SnsService snsService = new SnsService();
		GroupService groupService = new GroupService();
		TopicService topicService = new TopicService();
		
		Integer puid = post.getUid();
		Integer postid = post.getPostid();
		Integer type = post.getOtype();
		
		SnsUserInfoVO userinfo = userService.queryUserInfo(uid, puid);
		post.setAvatarFileName(userinfo.getAvatarFileName());
		post.setUserName(userinfo.getUsername());
		post.setSignature(userinfo.getSignature());
		TUserBalance balance = userService.queryUserBalanceByUid(puid);
		if(balance!=null) {
			Integer showCount = balance.getShowcount();
			post.setShowCount((showCount == null) ? 0 : showCount);
			Integer shopexpCount = balance.getShopexpcount();
			post.setExpCount((shopexpCount == null) ? 0 : shopexpCount);
			Integer guideCount = balance.getGuidecount();
			post.setGuideCount((guideCount == null) ? 0 : guideCount);
		}
		
		Integer likeCount = snsService.queryLikeCountByOid(type, postid);
		post.setLikeCount(likeCount);
		if(uid != null){
			post.setLikedByMe(snsService.isLikedByUid(uid, type, postid));
		}
		
		PageParam pp_fans = new PageParam(1, 15);
		List<LikeUserVO> fans = snsService.queryLikeUserByOid(type, postid, pp_fans).getList();
		post.setLikeUserList(fans);
		
		if(post.getOtype().equals(5)){	//如果为圈子中的发言
			GroupVO group = groupService.queryGroupById(post.getTypeid(), uid);
			post.setGroup(group);
			
			if(group.getGrouptype()>2 && (!group.getIsJoin())){
				post.setIsShow(false);
			}
		}
		
		//封装转发的信息。
		if(post.getForwardid() != null && post.getForwardid() != 0){
//			TPost forward = queryById(post.getForwardid());
//			SnsUserInfoVO userInfoVO = userService.queryUserInfo(uid, forward.getUid());
//			String displayName = userInfoVO==null?"":userInfoVO.getDisplayName();
//			String ss = "<div class='post_popupbox'>" +
//					"	            <div class='arrow'></div>" +
//					"	            <div class='conbox'>" +
//					"	                <div class='post_header'>" +
//					"	                    <div class='post_displayName'>" +
//					"	                        <a href='#' class='avatar' psftype='card' uid='" + forward.getUid() + "' >" + displayName + "</a>" +
//					"	                    </div>" +
//					"	                    <em class='post_postIcon icon_blog'></em>" +
////					"	                    <div class='post_title'>" + forward.getTitle() + "</div>" +
////					"	                    <div class='post_type'><a class='type' href='#'>(鞋帽/女装)</a></div>" +
////					"	                    <div class='post_brand'><a class='activeflag activeflag-green' href='#'>相关品牌</a></div>" +
//					"	                    <div class='post_addTime'>" + new PsfTime(forward.getAddtime()).getTimePassed() + "</div>" +
//					"	                </div>" +
//					"	                <div class='post_content'>" +
//					"	                    <p>" + forward.getContent() + "</p>" +
//					"	                </div>" +
////					"	                <div class='imglist'><a href='#'><img src='/images/sns/photo/photo09.png' alt='' /></a></div>" +
//					"	                <div class='bottom'>" +
//					"	                        " +
//					"	                    <div class='navlinkbox'>" +
//					"	                        <dl><dt><a href='javascript:void(0)'>转发(" + forward.getForwardcount() + ")</a></dt></dl>" +
//					"	                        <dl><dt>|</dt></dl>" +
//					"	                        <dl><dt><a href='javascript:void(0)'>品论(" + forward.getCommentcount() + ")</a></dt></dl>" +
//					"	                        " +
//					"	                    </div>" +
////					"	                    <span class='time'>昨天13：25</span>" +
////					"	                    <span>来自<a href='#'>周博通微博管家</a></span>" +
//					"	                " +
//					"	                </div>" +
//					"	                " +
//					"	            </div>" +
//					"	        </div>";
//			post.setContent(post.getContent() + ss);
		}
	}
	
	/**
	 * 话题添加链接
	 * @param text
	 * @param posttype
	 * @throws Exception
	 */
	private String addTopicLink(String text, Integer posttype, Integer groupid) throws Exception {
		List<String> topics = PsfUtils.getTopics(0, text);
		if(topics.size()>0){
			if(posttype.equals(5)){
				for(String topic : topics){
					text = text.replaceAll(topic, "<a href='/gt/"+topic.replaceAll("#", "")+"/"+groupid+"'>"+topic+"</a>");
				}
			}else{
				for(String topic : topics){
					text = text.replaceAll(topic, "<a>"+topic+"</a>");
				}
			}
		}
		return text;
	}
	
	/**
	 * 查询指定的post，内容详细页使用
	 * @param postid
	 * @param uid
	 * @return
	 * @throws Exception
	 */
	public PostListItemVO queryPostListItemById(Integer postid, Integer uid) throws Exception {
		BrandService brandService = new BrandService();
		
		PostListItemVO postItem = (PostListItemVO)sqlmap.queryForObject("post.queryPostListItemById", postid);
		if(postItem != null){
			updatePostItemsForUserInfo(uid, postItem);
			String text = PsfHtmlUtils.decodeText(postItem.getContent());
			text = Smiley.replaceSmiley(PsfUtils.getShortStr(text, 200, postItem.getPostid(), postItem.getOtype()));
			postItem.setListContent(addTopicLink(text,postItem.getOtype(),postItem.getTypeid()));
			postItem.setPostpicList(queryPostPicByPostid(postItem.getPostid(),postItem.getOtype()));
			postItem.setProductList(queryPostProductByPostid(postItem.getPostid()));
			postItem.setBrandList(brandService.queryBrandByGuideId(postItem.getPostid(), new PageParam(1,3)).getList());//最多三个品牌
			//查询父帖
			if(postItem.getForwardid() != null){
				postItem.setParentPost(queryPostListItemById(postItem.getForwardid(),uid));
			}
		}
		return postItem;
	}
	
	/**
	 * 查询帖子
	 * 
	 * @param uid
	 * @param otype 如果为空，则为全部
	 * @param orderby 参看PostList_OrderBy,如果为1，则优先按最新排列；否则，优先按最热排序。
	 * @param range 参看PostList_Range
	 * @param pp 分页参数
	 * @return
	 * @throws Exception
	 */
	public PageResult<PostListItemVO> queryPostListItem(Integer uid,Integer otype, Integer orderby, Integer range, PageParam pp) throws Exception {
		//long t1 = System.currentTimeMillis();
		BrandService brandService = new BrandService();
		TopicService topicService = new TopicService();
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("uid", uid);
		param.put("otype", otype);
		param.put("range", range);
		Integer count = (Integer) sqlmap.queryForObject("post.queryPostListItemForCount", param);
		param.put("orderby", orderby);
		param.put("offset", pp.getOffset());
		param.put("pageSize", pp.getPageSize());
		List<PostListItemVO> postlist = sqlmap.queryForList("post.queryPostListItem", param);
		for (PostListItemVO post : postlist) {
			updatePostItemsForUserInfo(uid, post);
			String text = PsfHtmlUtils.decodeText(post.getContent());
			text = Smiley.replaceSmiley(PsfUtils.getShortStr(text, 200, post.getPostid(), post.getOtype()));
			text = PsfShortUrl.processShortUrl(text);
			
			post.setListContent(addTopicLink(text,post.getOtype(),post.getTypeid()));
			post.setPostpicList(queryPostPicByPostid(post.getPostid(),null));
			post.setProductList(queryPostProductByPostid(post.getPostid()));
			post.setBrandList(brandService.queryBrandByGuideId(post.getPostid(), new PageParam(1,3)).getList());//最多三个品牌
			//查询父帖
			if(post.getForwardid() != null){
				post.setParentPost(queryPostListItemById(post.getForwardid(),uid));
			}
		}
		//long t2 = System.currentTimeMillis();
		//System.out.println("postlist_exec:"+(t2-t1));
		return new PageResult<PostListItemVO>(postlist, count, pp.getPageSize());
	}
	
	public List<ProductVO> queryPostProductByPostid(Integer postid) throws Exception {
		PicService picService = new PicService();
		List<ProductVO> productList = sqlmap.queryForList("post.queryPostProductByPostid", postid);
		
		for (ProductVO pvo:productList) {
			PageResult<TPic> picList = picService.queryPicByOid(Psf.OTYPE_Product, pvo.getPid(), new PageParam(1, 200));
			pvo.setPics(picList.getList());
			
			//设置商品主图
//			if(pvo.getRefpicid() != null){
//				TPic pic = picService.queryPicByPicId(pvo.getRefpicid());
//				pvo.setCover(pic.getPicid()+"."+pic.getFiletype());
//			}else{
//				if(pvo.getPics() != null && pvo.getPics().size()>0){
//					TPic pic = pvo.getPics().get(0);
//					pvo.setCover(pic.getPicid()+"."+pic.getFiletype());
//				}
//			}
			
			//设置显示价格
			pvo.setPrice(pvo.getPrice().setScale(0,  RoundingMode.HALF_DOWN));	//向最接近的整数舍入，如果5.5，则向下舍入
			pvo.setPrice_market(pvo.getPrice_market().setScale(0, RoundingMode.HALF_DOWN));
		}
		
		return productList;
	}
	
	/**
	 * 查询帖子的图片
	 * @param postid
	 * @param type -1：编辑器上传图片，2-秀场上传图片,null-所有图片
	 * @return
	 * @throws Exception
	 */
	public List<PostPicVO> queryPostPicByPostid(Integer postid, Integer type) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("postid", postid);
		param.put("type", type);
		return sqlmap.queryForList("post.queryPostPicByPostid", param);
	}

	
	/**
	 * 根据对象ID和对象类型查询圈子和活动的话题（帖子）数、商品的秀场数、体验数和品牌的指南数
	 * @param posttype	
	 * @param typeid
	 * @return
	 * @throws Exception
	 */
	public Integer queryPostCount(Integer posttype, Integer typeid) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("posttype", posttype);
		param.put("typeid", typeid);
		if(posttype.equals(Psf.OTYPE_Show) || posttype.equals(Psf.OTYPE_Shopexp)){
			return (Integer)sqlmap.queryForObject("post.queryProductPostCount", param);
		}else if(posttype.equals(Psf.OTYPE_Guide)){
			return (Integer)sqlmap.queryForObject("post.queryBrandPostCount", param);
		}else{
			return (Integer)sqlmap.queryForObject("post.queryPostCount", param);
		}
	}
	
	
	//设置图片，主图、秀主信息、秀场商品、是否喜欢
	private void setShowVO(Integer uid, ShowVO svo) throws Exception {
		PicService picService = new PicService();
		UserService userService = new UserService();
		ProductService productService = new ProductService();
		SnsService snsService = new SnsService();
		
		PageParam pp = new PageParam(1,10);
		List<TPic> pics = picService.queryPicByOid(Psf.OTYPE_Show, svo.getPostid(), pp).getList();
		svo.setPics(pics);
		for(TPic pic : pics){
			if(pic.getIscover().equals(1)){
				svo.setCover(pic.getPicid()+"."+pic.getFiletype());
				svo.setCover_thumb(pic.getPicid()+"-1."+pic.getFiletype());
			}
		}
		

		List<SnsRightProductVO> products = productService.queryProductByShowid(svo.getPostid());
		svo.setProducts(products);
		if(uid != null){
			SnsUserInfoVO userinfo = userService.queryUserInfo(uid, svo.getUid());
			svo.setDisplayName(userinfo.getUsername());
			svo.setAvatarFileName(userinfo.getAvatarFileName());
			
			
			svo.setIsLiked(snsService.isLikedByUid(uid, Psf.OTYPE_Show, svo.getPostid()));
		}
	}
	
	/**
	 * 根据用户ID查询推荐秀场，根据用户所有秀场的商品，查询用户可能喜欢的秀场，如果用户秀场为空，则推荐热门秀场,按照评论、分享、转发和点击之和排序
	 * @param uid
	 * @param pp
	 * @return
	 * @throws Exception
	 */
	public PageResult<ShowVO> queryShowRecommend(Integer uid, PageParam pp) throws Exception {
		PicService picService = new PicService();
		
		Integer count = (Integer) sqlmap.queryForObject("post.countShowRecommend", uid);
		List<ShowVO> showlist = null;
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("uid", uid);
		param.put("offset", pp.getOffset());
		param.put("pageSize", pp.getPageSize());
		if(count > 0){
			showlist = sqlmap.queryForList("post.queryShowRecommend", param);
		}else{
			param.put("posttype", Psf.OTYPE_Show);
			count = (Integer) sqlmap.queryForObject("post.countHotByUid", param);
			showlist = sqlmap.queryForList("post.queryHotShowByUid", param);
		}
		//设置秀场图片和主图
		for(ShowVO show : showlist){
			setShowVO(uid, show);
		}
		return new PageResult<ShowVO>(showlist, count, pp.getPageSize());
	}
	
	private void setShopexpVO(Integer uid, ShopexpVO shopexp) throws Exception {
		UserService userService = new UserService();
		CommentService commentService = new CommentService();
		SnsService snsService = new SnsService();
		PicService picService = new PicService();
		
		//最后评论用户名和评论时间
		CommentVO lastComment = commentService.queryLastByOid(shopexp.getPostid(), Psf.OTYPE_Shopexp);
		shopexp.setLastComment(lastComment);
		
		//体验喜欢数
		Integer likecount = snsService.queryLikeCountByOid(Psf.OTYPE_Shopexp, shopexp.getPostid());
		shopexp.setLikecount(likecount);
		
		//体验图片
		List<PostPicVO> pics = queryPostPicByPostid(shopexp.getPostid(),null);
		shopexp.setPics(pics);
		
		//缩写内容
		String text = PsfHtmlUtils.decodeText(shopexp.getContent());
		shopexp.setListcontent(Smiley.replaceSmiley(PsfUtils.getShortStr(text, 65, null, null).replace("查看全文","")));
		
		
		Integer euid = shopexp.getUid();
		SnsUserInfoVO userinfo = userService.queryUserInfo(uid, euid);
		shopexp.setUsername(userinfo.getUsername());
		shopexp.setAvatarname(userinfo.getAvatarFileName());
		if(uid != null){	
			shopexp.setIsLiked(snsService.isLikedByUid(uid, Psf.OTYPE_Shopexp, shopexp.getPostid()));
		}
	}
	
	/**
	 * 根据用户ID查询推荐体验，根据用户所有体验的商品，查询用户可能喜欢的体验，如果用户体验为空，则推荐热门体验,按照评论、分享、转发和点击之和排序
	 * @param uid
	 * @param pp
	 * @return
	 * @throws Exception
	 */
	public PageResult<ShopexpVO> queryShopexpRecommend(Integer uid, PageParam pp) throws Exception {
		Integer count = (Integer) sqlmap.queryForObject("post.countShopexpRecommend", uid);
		List<ShopexpVO> explist = null;
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("uid", uid);
		param.put("offset", pp.getOffset());
		param.put("pageSize", pp.getPageSize());
		if(count > 0){
			explist = sqlmap.queryForList("post.queryShopexpRecommend", param);
		}else{
			param.put("posttype", Psf.OTYPE_Shopexp);
			count = (Integer) sqlmap.queryForObject("post.countHotByUid", param);
			explist = sqlmap.queryForList("post.queryHotExpByUid", param);
		}
		//设置体验发布者的用户名、头像、最后评论用户名、最后评论时间、喜欢数
		for(ShopexpVO shopexp : explist){
			setShopexpVO(uid, shopexp);
		}
		return new PageResult<ShopexpVO>(explist, count, pp.getPageSize());
	}
	
	/**
	 * 设置GuideVO对象属性
	 * @param uid
	 * @param guide
	 * @throws Exception
	 */
	private void setGuideVO(Integer uid, GuideVO guide) throws Exception {
		UserService userService = new UserService();
		CommentService commentService = new CommentService();
		SnsService snsService = new SnsService();
		PicService picService = new PicService();
		BrandService brandService = new BrandService();
		
		SnsUserInfoVO userinfo = userService.queryUserInfo(uid, guide.getUid());
		guide.setUsername(userinfo.getUsername());
		guide.setAvatarName(userinfo.getAvatarFileName());
		
		//最后评论用户名和评论时间
		CommentVO lastComment = commentService.queryLastByOid(guide.getPostid(), Psf.OTYPE_Guide);
		guide.setLastComment(lastComment);
		
		//体验喜欢数
		Integer likecount = snsService.queryLikeCountByOid(Psf.OTYPE_Guide, guide.getPostid());
		guide.setLikecount(likecount);
		
		//指南图片
		List<PostPicVO> pics = queryPostPicByPostid(guide.getPostid(),null);
		guide.setPics(pics);
		
		//设置相关品牌
		PageParam pp_brand = new PageParam(1,3);
		List<BrandVO> brands = brandService.queryBrandByGuideId(guide.getPostid(), pp_brand).getList();
		guide.setBrands(brands);
		
		if(uid != null){
			guide.setIsLiked(snsService.isLikedByUid(uid, Psf.OTYPE_Guide, guide.getPostid()));
		}
		
		//缩写内容
		String text = PsfHtmlUtils.decodeText(guide.getContent());
		guide.setListcontent(Smiley.replaceSmiley(PsfUtils.getShortStr(text, 65, null, null).replace("查看全文","")));
	}
	
	public PageResult<GuideVO> queryGuideRecommend(Integer uid, PageParam pp) throws Exception {
		UserService userService = new UserService();
		CommentService commentService = new CommentService();
		SnsService snsService = new SnsService();
		PicService picService = new PicService();
		BrandService brandService = new BrandService();
		
		Integer count = (Integer) sqlmap.queryForObject("post.countGuideRecommend", uid);
		List<GuideVO> guidelist = null;
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("uid", uid);
		param.put("offset", pp.getOffset());
		param.put("pageSize", pp.getPageSize());
		if(count > 0){
			guidelist = sqlmap.queryForList("post.queryGuideRecommend", param);
		}else{
			param.put("posttype", Psf.OTYPE_Guide);
			count = (Integer) sqlmap.queryForObject("post.countHotByUid", param);
			guidelist = sqlmap.queryForList("post.queryHotGuideByUid", param);
		}
		//设置指南发布者的用户名、头像、最后评论用户名、最后评论时间、喜欢数
		for(GuideVO guide : guidelist) {
			setGuideVO(uid, guide);
		}
		return new PageResult<GuideVO>(guidelist, count, pp.getPageSize());
	}

	/**
	 * 更新帖子所有count字段
	 * @param postid
	 */
	public void updatePostCounts(Integer postid) throws Exception {
		TPost p = this.queryById(postid);
		TPost post = new TPost();
		post.setAddby(p.getAddby());
		post.setAddip(p.getAddip());
		post.setAddtime(p.getAddtime());
		post.setClickcount(p.getClickcount());
		post.setCommentcount((Integer)sqlmap.queryForObject("post.queryCommentCountByPostid", postid));
		post.setContent(p.getContent());
		post.setDelflag(p.getDelflag());
		post.setForwardcount((Integer)sqlmap.queryForObject("post.queryForwardCountByPostid", postid));
		post.setForwardid(p.getForwardid());
		post.setHtmlcontent(p.getHtmlcontent());
		post.setListcontent(p.getHtmlcontent());
		post.setPostid(postid);
		post.setPosttype(p.getPosttype());
		post.setReplyid(p.getReplyid());
		post.setTitle(p.getTitle());
		post.setUid(p.getUid());
		post.setSharecount(p.getSharecount());
		this.updatePost(post);
	}
	
	
	
	/**
	 * 查询指定秀场
	 * @param showid
	 * @return
	 * @throws Exception
	 */
	public ShowVO queryShowVOById(Integer uid,Integer showid) throws Exception {
		ShowVO show = (ShowVO)sqlmap.queryForObject("post.queryShowVOById", showid);
		setShowVO(uid, show);
		return show;
	}
	
	/**
	 * 查询用户的其他秀场
	 * @param uid
	 * @param postid
	 * @param pp
	 * @return
	 * @throws Exception
	 */
	public PageResult<ShowVO> queryOtherShowByUid(Integer uid, Integer postid, Integer posttype, PageParam pp) throws Exception{
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("uid", uid);
		param.put("postid", postid);
		param.put("posttype", posttype);
		Integer count = (Integer)sqlmap.queryForObject("post.countOtherPostByUid", param);
		PageResult<ShowVO> result = null;
		if(count > 0){
			param.put("offset", pp.getOffset());
			param.put("pageSize", pp.getPageSize());
			List<ShowVO> showlist = sqlmap.queryForList("post.queryOtherShowByUid", param);
			for(ShowVO show : showlist){
				setShowVO(uid, show);
			}
			result = new PageResult<ShowVO>(showlist, count, pp.getPageSize());
		}
		return result;
	}

	/**
	 * 查询用户的其他体验
	 * @param uid
	 * @param postid
	 * @param pp
	 * @return
	 * @throws Exception
	 */
	public PageResult<ShopexpVO> queryOtherShopexpByUid(Integer uid, Integer postid, Integer posttype, PageParam pp) throws Exception{
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("uid", uid);
		param.put("postid", postid);
		param.put("posttype", posttype);
		Integer count = (Integer)sqlmap.queryForObject("post.countOtherPostByUid", param);
		PageResult<ShopexpVO> result = null;
		if(count > 0){
			param.put("offset", pp.getOffset());
			param.put("pageSize", pp.getPageSize());
			List<ShopexpVO> shopexplist = sqlmap.queryForList("post.queryOtherShopexpByUid", param);
			for(ShopexpVO shopexp : shopexplist){
				setShopexpVO(uid, shopexp);
			}
			result = new PageResult<ShopexpVO>(shopexplist, count, pp.getPageSize());
		}
		return result;
	}
	
	/**
	 * 查询用户的其他指南
	 * @param uid
	 * @param postid
	 * @param pp
	 * @return
	 * @throws Exception
	 */
	public PageResult<GuideVO> queryOtherGuideByUid(Integer uid, Integer postid, Integer posttype, PageParam pp) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("uid", uid);
		param.put("postid", postid);
		param.put("posttype", posttype);
		Integer count = (Integer)sqlmap.queryForObject("post.countOtherPostByUid", param);
		PageResult<GuideVO> result = null;
		if(count > 0){
			param.put("offset", pp.getOffset());
			param.put("pageSize", pp.getPageSize());
			List<GuideVO> guidelist = sqlmap.queryForList("post.queryOtherGuideByUid", param);
			for(GuideVO guide : guidelist){
				setGuideVO(uid, guide);
			}
			result = new PageResult<GuideVO>(guidelist, count, pp.getPageSize());
		}
		return result;
	}
	
	/**
	 * 查询该商品的其他秀场
	 * @param uid
	 * @param postid
	 * @param posttype
	 * @param pp
	 * @return
	 * @throws Exception
	 */
	public PageResult<ShowVO> queryHotProductShow(Integer uid, Integer postid, Integer posttype, PageParam pp) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("postid", postid);
		param.put("posttype", posttype);
		Integer count = (Integer)sqlmap.queryForObject("post.countHotProductPost", param);
		PageResult<ShowVO> result = null;
		if(count > 0){
			param.put("offset", pp.getOffset());
			param.put("pageSize", pp.getPageSize());
			List<ShowVO> showlist = sqlmap.queryForList("post.queryHotProductShow", param);
			for(ShowVO show : showlist){
				setShowVO(uid, show);
			}
			result = new PageResult<ShowVO>(showlist, count, pp.getPageSize());
		}
		return result;
	}
	
	/**
	 * 查询该商品的其他体验
	 * @param uid
	 * @param postid
	 * @param posttype
	 * @param pp
	 * @return
	 * @throws Exception
	 */
	public PageResult<ShopexpVO> queryHotProductShopexp(Integer uid, Integer postid, Integer posttype, PageParam pp) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("postid", postid);
		param.put("posttype", posttype);
		Integer count = (Integer)sqlmap.queryForObject("post.countHotProductPost", param);
		PageResult<ShopexpVO> result = null;
		if(count > 0){
			param.put("offset", pp.getOffset());
			param.put("pageSize", pp.getPageSize());
			List<ShopexpVO> shopexplist = sqlmap.queryForList("post.queryHotProductShopexp", param);
			for(ShopexpVO shopexp : shopexplist){
				setShopexpVO(uid, shopexp);
			}
			result = new PageResult<ShopexpVO>(shopexplist, count, pp.getPageSize());
		}
		return result;
	}
	
	/**
	 * 查询品牌的其他指南
	 * @param uid
	 * @param postid
	 * @param pp
	 * @return
	 * @throws Exception
	 */
	public PageResult<GuideVO> queryHotBrandGuide(Integer uid, Integer postid, PageParam pp) throws Exception {
		Integer count = (Integer)sqlmap.queryForObject("post.countHotBrandPost",postid);
		PageResult<GuideVO> result = null;
		if(count > 0){
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("postid", postid);
			param.put("offset", pp.getOffset());
			param.put("pageSize", pp.getPageSize());
			List<GuideVO> guidelist = sqlmap.queryForList("post.queryHotBrandPost", param);
			for(GuideVO guide : guidelist){
				setGuideVO(uid, guide);
			}
			result = new PageResult<GuideVO>(guidelist, count, pp.getPageSize());
		}
		return result;
	}
	
	/**
	 * 体验，秀场已完成的订单商品
	 * @param cateid	商品种类
	 * @param uid		
	 * @param pub		是否发布过 0-否 1-是
	 * @param posttype	参照Psf.java
	 * @param keyword   搜索条件
	 * @param pp
	 * @return
	 * @throws Exception
	 */
	public PageResult<SnsRightProductVO> queryProductByOrder(Integer cateid,Integer uid,Integer pub,Integer posttype,String keyword,PageParam pp) throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("cateid", cateid);
		map.put("uid", uid);
		map.put("pub", pub);
		map.put("posttype", posttype);
		map.put("keyword", keyword);
		map.put("offset",pp.getOffset());
		map.put("pageSize", pp.getPageSize());
		Integer itemCount = (Integer)sqlmap.queryForObject("exp.queryProductByOrderCount", map);
		List<SnsRightProductVO> list = sqlmap.queryForList("exp.queryProductByOrder", map);
		return new PageResult<SnsRightProductVO>(list,itemCount,pp.getPageSize());
	}
	/**
	 * 用户所有订单商品的分类
	 * @param uid
	 * @return
	 * @throws Exception
	 */
	public List<TProductCate> queryProductCateByOrder(Integer uid) throws Exception {
		return sqlmap.queryForList("exp.queryProductCateByOrder", uid);
	}
	
	/**
	 * 根据商品分类查询下属品牌
	 * @param cateid
	 * @param uid
	 * @param keyword
	 * @param pp
	 * @return
	 * @throws Exception
	 */
	public PageResult<BrandVO> queryBrandByCate(Integer cateid, Integer uid, String keyword, PageParam pp) throws Exception {
		PicService picService = new PicService();
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("cateid", cateid);
		param.put("uid", uid);
		param.put("keyword", keyword);
		Integer count = (Integer)sqlmap.queryForObject("guide.countBrandByCate", param);
		
		if(count > 0){
			param.put("offset", pp.getOffset());
			param.put("pageSize", pp.getPageSize());
			List<BrandVO> brandlist = sqlmap.queryForList("guide.queryBrandByCate", param);
			for(BrandVO brand : brandlist){
				//TPic pic = picService.queryPicByPicId(brand.getBrandpic());
				//brand.setLogoName(pic.getPicid()+"."+pic.getFiletype());
			}
			return new PageResult<BrandVO>(brandlist, count, pp.getPageSize());
		}else{
			return null;
		}
	}
	
	public Integer addPostPic(TPostPic pp) throws Exception {
		return dao.insert(pp);
	}
	
	/**
	 * 查询当前用户"我的秀场","我的指南","我的体验"列表
	 * @param uid 当前用户ID
	 * @param type 1-我发表的，2-我喜欢的，3-我评论的
	 * @param oderby 1-最新，2-最热
	 * @param keyword 查询关键字
	 * @param pp 分页参数
	 * @return
	 * @throws Exception
	 */
	public PageResult<PostListItemVO> queryMyPost(Integer uid, Integer type, Integer posttype, Integer orderby, String keyword, PageParam pp) throws Exception {
		BrandService brandService = new BrandService();
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("uid", uid);
		param.put("type", type);
		param.put("posttype", posttype);
		param.put("keyword", keyword);
		Integer count = (Integer)sqlmap.queryForObject("post.countMyPost", param);
		PageResult<PostListItemVO> result = null;
		if(count > 0){
			param.put("orderby", orderby);
			param.put("offset", pp.getOffset());
			param.put("pageSize", pp.getPageSize());
			List<PostListItemVO> postlist = sqlmap.queryForList("post.queryMyPost", param);
			for (PostListItemVO post : postlist) {
				updatePostItemsForUserInfo(uid, post);
				String text = PsfHtmlUtils.decodeText(post.getContent());
				post.setListContent(PsfUtils.getShortStr(text, 200, post.getPostid(),post.getOtype()));
				post.setPostpicList(queryPostPicByPostid(post.getPostid(),null));
				post.setProductList(queryPostProductByPostid(post.getPostid()));
				post.setBrandList(brandService.queryBrandByGuideId(post.getPostid(), new PageParam(1,3)).getList());//最多三个品牌
			}
			result = new PageResult<PostListItemVO>(postlist, count, pp.getPageSize());
		}
		
		return result;
	}
	
	/**
	 * 查询当前用户的"好友秀场","好友指南","好友体验"列表
	 * @param uid
	 * @param type null-全部，0-未分组
	 * @param posttype
	 * @param orderby
	 * @param keyword
	 * @param pp
	 * @return
	 * @throws Exception
	 */
	public PageResult<PostListItemVO> queryFriendPost(Integer uid, Integer type, Integer posttype, Integer orderby, String keyword, PageParam pp) throws Exception{
		BrandService brandService = new BrandService();
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("uid", uid);
		param.put("type", type);
		param.put("posttype", posttype);
		param.put("keyword", keyword);
		Integer count = (Integer)sqlmap.queryForObject("post.countFriendPost", param);
		PageResult<PostListItemVO> result = null;
		if(count > 0){
			param.put("orderby", orderby);
			param.put("offset", pp.getOffset());
			param.put("pageSize", pp.getPageSize());
			List<PostListItemVO> postlist = sqlmap.queryForList("post.queryFriendPost", param);
			for (PostListItemVO post : postlist) {
				updatePostItemsForUserInfo(uid, post);
				String text = PsfHtmlUtils.decodeText(post.getContent());
				post.setListContent(PsfUtils.getShortStr(text, 200, post.getPostid(),post.getOtype()));
				post.setPostpicList(queryPostPicByPostid(post.getPostid(),null));
				post.setProductList(queryPostProductByPostid(post.getPostid()));
				post.setBrandList(brandService.queryBrandByGuideId(post.getPostid(), new PageParam(1,3)).getList());//最多三个品牌
			}
			result = new PageResult<PostListItemVO>(postlist, count, pp.getPageSize());
		}
		
		return result;
	}
	
	/**
	 * 查询当前用户的“圈子秀场”、“圈子体验”和“圈子指南”
	 * @param uid
	 * @param groupid 圈子ID 0-全部
	 * @param posttype
	 * @param orderby
	 * @param keyword
	 * @param pp
	 * @return
	 * @throws Exception
	 */
	public PageResult<PostListItemVO> queryGroupFriendPost(Integer uid, Integer groupid, Integer posttype, Integer orderby, String keyword, PageParam pp) throws Exception {
		BrandService brandService = new BrandService();
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("uid", uid);
		param.put("groupid", groupid);
		param.put("posttype", posttype);
		param.put("keyword", keyword);
		Integer count = (Integer)sqlmap.queryForObject("post.countGroupFriendPost", param);
		PageResult<PostListItemVO> result = null;
		if(count > 0){
			param.put("orderby", orderby);
			param.put("offset", pp.getOffset());
			param.put("pageSize", pp.getPageSize());
			List<PostListItemVO> postlist = sqlmap.queryForList("post.queryGroupFriendPost", param);
			for (PostListItemVO post : postlist) {
				updatePostItemsForUserInfo(uid, post);
				String text = PsfHtmlUtils.decodeText(post.getContent());
				post.setListContent(PsfUtils.getShortStr(text, 200, post.getPostid(),post.getOtype()));
				post.setPostpicList(queryPostPicByPostid(post.getPostid(),null));
				post.setProductList(queryPostProductByPostid(post.getPostid()));
				post.setBrandList(brandService.queryBrandByGuideId(post.getPostid(), new PageParam(1,3)).getList());//最多三个品牌
			}
			result = new PageResult<PostListItemVO>(postlist, count, pp.getPageSize());
		}
		
		return result;
	}
	
	/**
	 * 查询当前用户的“社区秀场”、“社区体验”，“社区指南”
	 * @param uid
	 * @param cateid
	 * @param posttype
	 * @param orderby
	 * @param keyword
	 * @param pp
	 * @return
	 * @throws Exception
	 */
	public PageResult<PostListItemVO> queryClubPost(Integer uid, Integer cateid, Integer posttype, Integer orderby, String keyword, PageParam pp) throws Exception {
		BrandService brandService = new BrandService();
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("cateid", cateid);
		param.put("posttype", posttype);
		param.put("keyword", keyword);
		Integer count = (Integer)sqlmap.queryForObject("post.countClubPost", param);
		PageResult<PostListItemVO> result = null;
		if(count > 0){
			param.put("orderby", orderby);
			param.put("offset", pp.getOffset());
			param.put("pageSize", pp.getPageSize());
			List<PostListItemVO> postlist = sqlmap.queryForList("post.queryClubPost", param);
			for (PostListItemVO post : postlist) {
				updatePostItemsForUserInfo(uid, post);
				String text = PsfHtmlUtils.decodeText(post.getContent());
				post.setListContent(PsfUtils.getShortStr(text, 200, post.getPostid(),post.getOtype()));
				post.setPostpicList(queryPostPicByPostid(post.getPostid(),null));
				post.setProductList(queryPostProductByPostid(post.getPostid()));
				post.setBrandList(brandService.queryBrandByGuideId(post.getPostid(), new PageParam(1,3)).getList());//最多三个品牌
			}
			result = new PageResult<PostListItemVO>(postlist, count, pp.getPageSize());
		}
		
		return result;
	}
	
	/**
	 * 查询“秀场商品、“体验商品”
	 * @param uid
	 * @param type 1-我的推荐，2-我喜欢的，3-好友推荐，4-圈子推荐，5-社区推荐
	 * @param posttype
	 * @param orderby
	 * @param keyword
	 * @param pp
	 * @return
	 * @throws Exception
	 */
	public PageResult<SnsRightProductVO> queryPostProduct(Integer uid, Integer type, Integer posttype, Integer orderby, String keyword, PageParam pp) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("uid",uid);
		param.put("type",type);
		param.put("posttype",posttype);
		param.put("keyword",keyword);
		Integer count = (Integer)sqlmap.queryForObject("post.countPostProduct",param);
		PageResult<SnsRightProductVO> result = null;
		if(count > 0){
			param.put("orderby", orderby);
			param.put("offset", pp.getOffset());
			param.put("pageSize", pp.getPageSize());
			List<SnsRightProductVO> productlist = sqlmap.queryForList("post.queryPostProduct", param);
			for(SnsRightProductVO pvo : productlist){
				//设置秀场数和体验数，品数暂时不计算
				pvo.setShowCount(queryPostCount(2, pvo.getPid()));
				pvo.setShopexpCount(queryPostCount(3, pvo.getPid()));
			}
			result = new PageResult<SnsRightProductVO>(productlist, count, pp.getPageSize());
		}
		return result;
	}
	
	/**
	 * 查询”相关品牌“
	 * @param uid
	 * @param type 1-我的推荐，2-我喜欢的，3-好友推荐，4-圈子推荐，5-社区推荐
	 * @param posttype
	 * @param orderby
	 * @param keyword
	 * @param pp
	 * @return
	 * @throws Exception
	 */
	public PageResult<BrandVO> queryGuideBrand(Integer uid, Integer type, Integer orderby, String keyword, PageParam pp) throws Exception {
		BrandService brandService = new BrandService();
		PicService picService = new PicService();
		SnsService snsService = new SnsService();
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("uid", uid);
		param.put("type", type);
		param.put("keyword", keyword);
		Integer count = (Integer)sqlmap.queryForObject("post.countPostBrand", param);
		PageResult<BrandVO> result = null;
		if(count > 0){
			param.put("orderby", orderby);
			param.put("offset", pp.getOffset());
			param.put("pageSize", pp.getPageSize());
			List<BrandVO> brandlist = sqlmap.queryForList("post.queryPostBrand", param);
			for(BrandVO brand : brandlist){
				brand.setRecommendCount(brandService.queryRecommondFriend(uid, brand.getBrandid()));
				brand.setGuideCount(queryPostCount(Psf.OTYPE_Guide, brand.getBrandid()));
				//TPic pic = picService.queryPicByPicId(brand.getBrandpic());
				//brand.setLogoName(pic.getPicid()+"."+pic.getFiletype());
				brand.setLikecount(snsService.queryLikeCountByOid(Psf.OTYPE_Brand, brand.getBrandid()));
			}
			result = new PageResult<BrandVO>(brandlist, count, pp.getPageSize());
		}
		return result;
	}
	
	/**
	 * 根据type参数查询圈子发言
	 * @param type 	0-全部圈子发言，1-我发表的发言，2-我品论的，3-提到我的，4-参加圈子的发言
	 * @param uid	与参数type关联
	 * @param groupid 圈子ID 	null-所有圈子
	 * @param topicid 	null-全部圈子发言
	 * @param keyword
	 * @param orderby 	1-最新，2-最热
	 * @param pp
	 * @return
	 * @throws Exception
	 */
	public PageResult<PostListItemVO> queryGroupPost(Integer type, Integer uid, Integer groupid, Integer topicid, String keyword, Integer orderby, PageParam pp) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("uid", uid);
		param.put("groupid", groupid);
		param.put("topicid", topicid);
		param.put("type", type);
		param.put("keyword", keyword);
		Integer count = (Integer)sqlmap.queryForObject("post.countGroupPost",param);
		PageResult<PostListItemVO> result = null;
		if(count > 0){
			param.put("orderby", orderby);
			param.put("offset", pp.getOffset());
			param.put("pageSize", pp.getPageSize());
			List<PostListItemVO> postlist = sqlmap.queryForList("post.queryGroupPost",param);
			for (PostListItemVO post : postlist) {
				updatePostItemsForUserInfo(uid, post);
				String text = PsfHtmlUtils.decodeText(post.getContent());
				text = PsfUtils.getShortStr(text, 200, post.getPostid(),post.getOtype());
				text = Smiley.replaceSmiley(text);
				post.setListContent(addTopicLink(text, post.getOtype(), post.getTypeid()));
				post.setPostpicList(queryPostPicByPostid(post.getPostid(),null));
				
				//查询父帖
				if(post.getForwardid() != null){
					post.setParentPost(queryPostListItemById(post.getForwardid(),uid));
				}
			}
			
			result = new PageResult<PostListItemVO>(postlist, count, pp.getPageSize());
		}
		return result;
	}
	
	/**
	 * 按帖子类型查询指定圈子中的发言
	 * @param groupid 圈子ID
	 * @param type 0-全部，1-广播，2-秀场，3-体验，4-指南
	 * @param uid
	 * @param keyword
	 * @param orderby
	 * @param pp
	 * @return
	 * @throws Exception
	 */
	public PageResult<PostListItemVO> queryGroupPostByType(Integer groupid, Integer type, Integer uid, String keyword, Integer orderby, PageParam pp) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("groupid", groupid);
		param.put("type", type);
		param.put("keyword", keyword);
		Integer count = (Integer)sqlmap.queryForObject("post.countGroupPostByType",param);
		PageResult<PostListItemVO> result = null;
		if(count > 0){
			param.put("orderby", orderby);
			param.put("offset", pp.getOffset());
			param.put("pageSize", pp.getPageSize());
			List<PostListItemVO> postlist = sqlmap.queryForList("post.queryGroupPostByType",param);
			for (PostListItemVO post : postlist) {
				updatePostItemsForUserInfo(uid, post);
				String text = PsfHtmlUtils.decodeText(post.getContent());
				text = Smiley.replaceSmiley(PsfUtils.getShortStr(text, 200, post.getPostid(),post.getOtype()));
				post.setListContent(addTopicLink(text, post.getOtype(), post.getTypeid()));
				post.setPostpicList(queryPostPicByPostid(post.getPostid(),null));
				//查询父帖
				if(post.getForwardid() != null){
					post.setParentPost(queryPostListItemById(post.getForwardid(),uid));
				}
			}
			result = new PageResult<PostListItemVO>(postlist, count, pp.getPageSize());
		}
		return result;
	}
	
	/**
	 * 查询圈子或者话题的发言数
	 * @param groupid null-所有圈子发言数
	 * @param topicid null-所有话题发言
	 * @return
	 * @throws Exception
	 */
	public Integer queryGroupPostCount(Integer groupid, Integer topicid) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		if(topicid != null){
			param.put("topicid", topicid);
		}else if(groupid != null){
			param.put("groupid", groupid);
		}
		return (Integer)sqlmap.queryForObject("post.queryGroupPostCount", param);
	}
	
	
	/**
	 * 更新帖子转发数
	 */
	public void updateForwardCount(Integer postid) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("postid", postid);
		Integer count = (Integer)sqlmap.queryForObject("post.queryForwardCount",param);
		
		param.put("forwardcount", count);
		sqlmap.update("post.updateForwardCount", param);
	}
	
	/**
	 * 查询圈子公告
	 * @param groupid
	 * @param pp
	 * @return
	 * @throws Exception
	 */
	public PageResult<PostListItemVO> queryGroupAnnoucement(Integer groupid, PageParam pp) throws Exception {
		Integer count = (Integer)sqlmap.queryForObject("post.countGroupAnnoucement", groupid);
		PageResult<PostListItemVO> result = null;
		if(count > 0){
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("groupid", groupid);
			param.put("offset", pp.getOffset());
			param.put("pageSize", pp.getPageSize());
			List<PostListItemVO> postlist = sqlmap.queryForList("post.queryGroupAnnoucement", param);
			result = new PageResult<PostListItemVO>(postlist, count, pp.getPageSize());
		}
		return result;
	}
	
	/**
	 * 查询话题的发言
	 * @param uid 当前登录用户的ID
	 * @param topictype
	 * @param groupid
	 * @param topictitle
	 * @param orderby
	 * @param pp
	 * @return
	 * @throws Exception
	 */
	public PageResult<PostListItemVO> queryTopicPost(Integer uid, Integer topictype, Integer groupid, String topictitle, Integer orderby, PageParam pp) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("topictype", topictype);
		param.put("groupid", groupid);
		param.put("topictitle", topictitle);
		Integer count = (Integer)sqlmap.queryForObject("post.countTopicPost", param);
		PageResult<PostListItemVO> result = null;
		if(count > 0){
			param.put("orderby", orderby);
			param.put("offset", pp.getOffset());
			param.put("pageSize", pp.getPageSize());
			List<PostListItemVO> postlist = sqlmap.queryForList("post.queryTopicPost", param);
			for(PostListItemVO post : postlist){
				updatePostItemsForUserInfo(uid, post);
				String text = PsfHtmlUtils.decodeText(post.getContent());
				text = Smiley.replaceSmiley(PsfUtils.getShortStr(text, 200, post.getPostid(), post.getOtype()));
				text = PsfShortUrl.processShortUrl(text);
				
				post.setListContent(addTopicLink(text,post.getOtype(),post.getTypeid()));
				post.setPostpicList(queryPostPicByPostid(post.getPostid(),null));
				
				//查询父帖
				if(post.getForwardid() != null){
					post.setParentPost(queryPostListItemById(post.getForwardid(),uid));
				}
			}
			result = new PageResult<PostListItemVO>(postlist, count, pp.getPageSize());
		}
		return result;
	}
	
	/**
	 * 查询某人的最后一条
	 * @param uid
	 * @return
	 * @throws Exception
	 */
	public PostListItemVO queryLastPostByUid(Integer uid) throws Exception {
		return (PostListItemVO)sqlmap.queryForObject("post.queryLastPostByUid", uid);
	}
	
	/**
	 * 根据ID数组查询帖子，全文检索查询
	 * @param uid 当前登录用户的ID
	 * @param postids
	 * @param pp
	 * @return
	 * @throws Exception
	 */
	public PageResult<PostListItemVO> queryPostByIDs(Integer uid, Integer[] postids, Integer orderby, PageParam pp) throws Exception {
		BrandService brandService = new BrandService();
		
		PageResult<PostListItemVO> result = null;
		if(postids.length > 0){
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("postids", postids);
			param.put("orderby", orderby);
			param.put("offset", pp.getOffset());
			param.put("pageSize", pp.getPageSize());
			List<PostListItemVO> postlist = sqlmap.queryForList("post.queryPostByIDs", param);
			for(PostListItemVO post : postlist){
				updatePostItemsForUserInfo(uid, post);
				String text = PsfHtmlUtils.decodeText(post.getContent());
				text = Smiley.replaceSmiley(PsfUtils.getShortStr(text, 200, post.getPostid(), post.getOtype()));
				text = PsfShortUrl.processShortUrl(text);
				
				post.setListContent(addTopicLink(text,post.getOtype(),post.getTypeid()));
				post.setPostpicList(queryPostPicByPostid(post.getPostid(),null));
				post.setProductList(queryPostProductByPostid(post.getPostid()));
				post.setBrandList(brandService.queryBrandByGuideId(post.getPostid(), new PageParam(1,3)).getList());//最多三个品牌
				
				//查询父帖
				if(post.getForwardid() != null){
					post.setParentPost(queryPostListItemById(post.getForwardid(),uid));
				}
			}
			result = new PageResult<PostListItemVO>(postlist, postids.length, pp.getPageSize());
		}
		return result;
	}
}
