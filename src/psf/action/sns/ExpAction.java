package psf.action.sns;

import java.util.List;

import psf.Psf;
import psf.PsfAction;
import psf.common.FileNameAndType;
import psf.common.PageParam;
import psf.common.PageResult;
import psf.common.PsfHtmlUtils;
import psf.common.PsfImage;
import psf.common.PsfTime;
import psf.entity.TFriendGroup;
import psf.entity.TPost;
import psf.entity.TPostPic;
import psf.entity.TPostProduct;
import psf.entity.TProductCate;
import psf.framework.PsfException;
import psf.service.common.UserService;
import psf.service.sns.FriendService;
import psf.service.sns.GroupService;
import psf.service.sns.PostService;
import psf.vo.sns.GroupVO;
import psf.vo.sns.PostListItemVO;
import psf.vo.sns.SnsUserInfoVO;
import psf.vo.sns.right.SnsRightProductVO;

public class ExpAction extends PsfAction {
	public void myExp() throws Exception {
		set("expTab","myexp");
	}
	public void friendExp() throws Exception {
		FriendService friendService = new FriendService();
		List<TFriendGroup> friendgroups = friendService.queryFriendGroupByUid(getLoginUserId());
		set("friendgroups", friendgroups);
		set("expTab","friendexp");
	}
	public void groupExp() throws Exception {
		GroupService groupService = new GroupService();
		PageParam pp = new PageParam(1,10);
		PageResult<GroupVO> groups = groupService.queryJoinGroupByUid(getLoginUserId(), pp);
		set("groups", groups);
		set("expTab","groupexp");
	}
	public void clubExp() throws Exception {
		PostService postService = new PostService();
		List<TProductCate> catelist = postService.queryProductCateByOrder(getLoginUserId());
		set("catelist",catelist);
		set("expTab","clubexp");
	}
	public void expProduct() throws Exception {
		set("expTab","expproduct");
	}
	public void editExp() throws Exception {
		set("expTab","editexp");
	}
	public void detailExp() throws Exception {
		try{
			Integer shopexpid = p2int("shopexpid");
			Integer uid = getLoginUserId();
			PostListItemVO postItem = null;
			if(shopexpid == null){
				throw new PsfException("参数错误！");
			}else if(uid == null){
				throw new PsfException("用户未登录！");
			}else{
				PostService postService = new PostService();
				postItem = postService.queryPostListItemById(shopexpid, uid);
			}
			set("postItem", postItem);
			UserService userService = new UserService();
			SnsUserInfoVO snsUserInfo = userService.queryUserInfo(uid, postItem.getUid());
			set("posterInfo", snsUserInfo);
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}
	
	/**
	 * 体验列表
	 * @throws Exception
	 */
	public void myShopexpList() throws Exception {
		PostService postService = new PostService();
		try{
			Integer uid = getLoginUserId();
			if(uid == null){
				throw new PsfException("您尚未登录！");
			}
			Integer type = p2int("type");
			set("type",type);
			Integer orderby = p2int("orderby");
			set("orderby", orderby);
			String keyword = p("keyword");
			if(keyword.equalsIgnoreCase("null") || keyword.equals("搜索体验")){
				keyword = null;
			}
			set("keyword", keyword);
			Integer page = p2int("page");
			if(page == null){
				page = 1;
			}
			set("page", page);
			String expTab = p("expTab");
			set("expTab", expTab);
			PageParam pp = new PageParam(page,20);
			PageResult<PostListItemVO> posts = null;
			if(expTab.equals("myexp")){
				posts = postService.queryMyPost(uid, type, Psf.OTYPE_Shopexp, orderby, keyword, pp);
				set("curTab", 1);
			}else if(expTab.equals("friendexp")){
				posts = postService.queryFriendPost(uid, type, Psf.OTYPE_Shopexp, orderby, keyword, pp);
				set("curTab", 2);
			}else if(expTab.equals("groupexp")){
				posts = postService.queryGroupFriendPost(uid, type, Psf.OTYPE_Shopexp, orderby, keyword, pp);
				set("curTab", 3);
			}else if(expTab.equals("clubexp")){
				posts = postService.queryClubPost(uid, type, Psf.OTYPE_Shopexp, orderby, keyword, pp);
				set("curTab", 4);
			}
			if(posts != null){
				set("postListItems", posts.getList());
				set("pageCount", posts.getPageCount());
			}
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}
	
	/**
	 * 获取体验商品
	 * @throws Exception
	 */
	public void postProduct() throws Exception {
		PostService postService = new PostService();
		try{
			Integer uid = getLoginUserId();
			if(uid == null){
				throw new PsfException("您尚未登录！");
			}
			Integer type = p2int("type");
			set("type",type);
			Integer orderby = p2int("orderby");
			set("orderby", orderby);
			String keyword = p("keyword");
			if(keyword.equalsIgnoreCase("null") || keyword.equals("搜索体验商品")){
				keyword = null;
			}
			set("keyword", keyword);
			Integer page = p2int("page");
			if(page == null){
				page = 1;
			}
			set("page", page);

			PageParam pp = new PageParam(page,12);
			PageResult<SnsRightProductVO> products = postService.queryPostProduct(uid, type, Psf.OTYPE_Shopexp, orderby, keyword, pp);
			if(products != null){
				set("productlist", products.getList());
				set("pageCount", products.getPageCount());
			}
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}
	
	public void selectProduct() throws Exception {
		Integer uid = getLoginUserId();
		Integer cateid = p2int("cateid");
		Integer pub = p2int("pub");
		Integer page = p2int("page");
		String keyword = p("keyword");
		if(cateid == null || cateid == 0){
			cateid = null;
		}
		if(keyword == null || "".equals(keyword)){
			keyword = null;
		}
		if (page == null)
			page = 1;
		PageParam pp = new PageParam(page, 1);
		PageResult<SnsRightProductVO> productList = postService.queryProductByOrder(cateid, uid, pub, 3,keyword, pp);
		List<TProductCate> productcates = postService.queryProductCateByOrder(uid);
		set("productcates",productcates);
		set("productList",productList);
		if(cateid == null || cateid == 0){
			set("cateid",0);
		} else {
			set("cateid",cateid);
		}
		if(pub == null){
			set("pub",-1);
		} else {
			set("pub",pub);
		}	
		set("keyword",keyword);
		set("curPage", page);	//当前页
		set("pageCount", productList.getPageCount());	//页面数
	}
	public void saveExp() throws Exception {
		Integer pid = p2int("pid");
		Integer score = p2int("score");
		String content = p("content");
		String pname = p("pname");
		System.out.println("pname:"+pname+" content:"+content);
		try {
			if( pid == null ){
				set("success",1);
				set("info","请选择商品");
			} else if ( score == null || score == 0) {
				set("success",1);
				set("info","请给商品评分");
			} else {
				
				TPost post = new TPost();
				post.setAddip(getHexIP());
				post.setAddtime(new PsfTime().getTimeInSeconds());
				post.setClickcount(0);
				post.setCommentcount(0);
				post.setContent(content);
				post.setDelflag(0);
				post.setForwardcount(0);
				post.setLikecount(0);
				post.setPosttype(3);
				post.setReplyid(0);
				post.setSharecount(0);
				post.setTitle(pname+" 购物体验");
				post.setUid(getLoginUserId());
				int postid = postService.addPost(post);
				TPostProduct postProduct = new TPostProduct();
				postProduct.setPostid(postid);
				postProduct.setPid(pid);
				postProduct.setIscover(0);
				postService.addPostProduct(postProduct);
				
				List<String> imageList = PsfHtmlUtils.decodeImages(content);
				
				for(String img:imageList) {
					if(img.startsWith("/pic/")) {
						String fileName = img.substring("/pic/".length());
						FileNameAndType fnt = new FileNameAndType(fileName);
						Integer picid = null;
						try {
							picid = Integer.parseInt(fnt.getFileName());
						} catch (Exception e) {}
						if(picid!=null) {
							TPostPic pp = new TPostPic();
							pp.setIscover(0);
							pp.setPicid(picid);
							pp.setPostid(postid);
							postService.addPostPic(pp);
							
							byte [] picData = picService.getPicData(picid, 0);
							if(picData!=null) {
								PsfImage image = new PsfImage(picData);
								PsfImage thumb1 = image.createThumb(-1, 50);
								PsfImage thumb2 = image.createThumb(380, -1);
								picService.saveThumb(picid, 1, thumb1.getBytes());
								picService.saveThumb(picid, 2, thumb2.getBytes());
							}
							
						}
					}
				}
				
				
				set("success",0);
			}
		}catch(Exception e){
			e.printStackTrace();
			set("success",1);
			set("info",e.getMessage());
		}
		
	}

}
