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
import psf.entity.TPic;
import psf.entity.TPost;
import psf.entity.TPostPic;
import psf.entity.TPostProduct;
import psf.entity.TProductCate;
import psf.framework.PsfException;
import psf.service.common.PicService;
import psf.service.common.UserService;
import psf.service.mall.ProductService;
import psf.service.sns.FriendService;
import psf.service.sns.GroupService;
import psf.service.sns.PostService;
import psf.vo.sns.GroupVO;
import psf.vo.sns.PostListItemVO;
import psf.vo.sns.SnsUserInfoVO;
import psf.vo.sns.right.SnsRightProductVO;

public class ShowAction extends PsfAction {
	public void myShow() throws Exception {
		set("showTab","myshow");
	}
	public void friendShow() throws Exception {
		FriendService friendService = new FriendService();
		List<TFriendGroup> friendgroups = friendService.queryFriendGroupByUid(getLoginUserId());
		set("friendgroups", friendgroups);
		set("showTab","friendshow");
	}
	public void groupShow() throws Exception {
		GroupService groupService = new GroupService();
		PageParam pp = new PageParam(1,10);
		PageResult<GroupVO> groups = groupService.queryJoinGroupByUid(getLoginUserId(), pp);
		set("groups", groups);
		set("showTab","groupshow");
	}
	public void clubShow() throws Exception {
		PostService postService = new PostService();
		List<TProductCate> catelist = postService.queryProductCateByOrder(getLoginUserId());
		set("catelist",catelist);
		set("showTab","clubshow");
	}
	public void showProduct() throws Exception {
		set("showTab","showproduct");
	}
	public void editShow() throws Exception {
		set("showTab","editshow");
	}
	public void detailShow() throws Exception {
		try{
			Integer showid = p2int("showid");
			Integer uid = getLoginUserId();
			PostListItemVO postItem = null;
			if(showid == null){
				throw new PsfException("参数错误！");
			}else if(uid == null){
				throw new PsfException("用户未登录！");
			}else{
				PostService postService = new PostService();
				postItem = postService.queryPostListItemById(showid, uid);
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
	 * 秀场列表
	 * @throws Exception
	 */
	public void myShowList() throws Exception {
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
			if(keyword.equalsIgnoreCase("null") || keyword.equals("搜索秀场")){
				keyword = null;
			}
			set("keyword", keyword);
			Integer page = p2int("page");
			if(page == null){
				page = 1;
			}
			set("page", page);
			String showTab = p("showTab");
			set("showTab", showTab);
			PageParam pp = new PageParam(page,20);
			PageResult<PostListItemVO> posts = null;
			if(showTab.equals("myshow")){
				posts = postService.queryMyPost(uid, type, Psf.OTYPE_Show, orderby, keyword, pp);
				set("curTab", 1);
			}else if(showTab.equals("friendshow")){
				posts = postService.queryFriendPost(uid, type, Psf.OTYPE_Show, orderby, keyword, pp);
				set("curTab", 2);
			}else if(showTab.equals("groupshow")){
				posts = postService.queryGroupFriendPost(uid, type, Psf.OTYPE_Show, orderby, keyword, pp);
				set("curTab", 3);
			}else if(showTab.equals("clubshow")){
				posts = postService.queryClubPost(uid, type, Psf.OTYPE_Show, orderby, keyword, pp);
				set("curTab", 4);
			}else if(showTab.equals("showproduct")){
				PageParam pp1 = new PageParam(page, 6);
				PageResult<SnsRightProductVO> products = postService.queryPostProduct(uid, type, Psf.OTYPE_Show, orderby, keyword, pp1);
				if(products != null){
					set("productlist", products.getList());
					set("pageCount", products.getPageCount());
				}
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
	 * 获取秀场商品
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
			if(keyword.equalsIgnoreCase("null") || keyword.equals("搜索秀场商品")){
				keyword = null;
			}
			set("keyword", keyword);
			Integer page = p2int("page");
			if(page == null){
				page = 1;
			}
			set("page", page);

			PageParam pp = new PageParam(page,12);
			PageResult<SnsRightProductVO> products = postService.queryPostProduct(uid, type, Psf.OTYPE_Show, orderby, keyword, pp);
			if(products != null){
				set("productlist", products.getList());
				set("pageCount", products.getPageCount());
			}
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}
	/**
	 * 获得已购商品的品牌
	 * @throws Exception
	 */
	public void getProductCate() throws Exception {
		PostService postService = new PostService();
		
		Integer uid = p2int("uid");
		List<TProductCate> catelist = null;
		if(uid != null){
			catelist = postService.queryProductCateByOrder(uid);
			set("catelist",catelist);
		}
	}
	
	/**
	 * 根据品牌获取商品
	 * @throws Exception
	 */
	public void getProduct() throws Exception {
		try{
			PostService postService = new PostService();
			
			Integer page = p2int("page");
			if(page == null){
				page = 1;
			}
			set("page", page);
			
			Integer cateid = p2int("cateid");
			if(cateid == null){
				throw new PsfException("商品类参数错误");
			}
			set("cateid", cateid);
			
			String keyword = p("keyword");
			if(keyword.equalsIgnoreCase("null") || keyword.equals("商品搜索"))
				keyword = null;
			set("keyword", keyword);
			
			PageResult<SnsRightProductVO> products = null;
			PageParam pp = new PageParam(page, 16);
			products = postService.queryProductByOrder(cateid, getLoginUserId(), null, Psf.OTYPE_Show,keyword, pp);
			set("products", products);
			
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}
	
	/**
	 * 获取已选择商品列表
	 * @throws Exception
	 */
	public void getSelectedProduct() throws Exception{
		ProductService productService = new ProductService();
		
		Integer page = p2int("page");
		if(page == null){
			page = 1;
		}
		set("page", page);
		
		String pidsOfStr = p("pids");
		set("pids", pidsOfStr);
		
		PageResult<SnsRightProductVO> selectedProduct = null;
		if(pidsOfStr!=null && !pidsOfStr.equalsIgnoreCase("null") && !pidsOfStr.equals("")){
			String[] pids_str = p("pids").split(",");
			Integer[] pids = new Integer[pids_str.length];
			for(int i=0; i<pids_str.length; i++){
				pids[i] = Integer.valueOf(pids_str[i]);
			}
			
			PageParam pp = new PageParam(page, 6);
			selectedProduct = productService.querySelectedProduct(pids, pp);
			
			set("selectedProduct", selectedProduct);
		}
	}
	
	public void delShowPic() throws Exception {
		PicService picService = new PicService();
		
		Integer uid = p2int("uid");
		if(uid==null) {
			set("success",0);
			set("info","未登录，不能删除图片");
			return;
		}
		
		Integer picid = p2int("picid");
		if(picid != null){
			picService.delPic(picid);
			set("success", 1);
			set("picid", picid);
		}
	}
	
	public void saveShow() throws Exception {
		try{
			PostService postService = new PostService();
			PicService picService = new PicService();
			
			Integer uid = getLoginUserId();
			if(uid == null){
				set("success",0);
				set("info","未登录，不能发布秀场");
				return;
			}
			TPost post = new TPost();
			
			//设置主题、内容、用户ID、类型、时间
			String title = p("show_title");
			post.setTitle(title);
			String content = p("content");
			post.setContent(content);
			post.setUid(uid);
			post.setPosttype(Psf.OTYPE_Show);
			PsfTime time = new PsfTime();
			post.setAddtime(time.getTimeInSeconds());
			post.setForwardcount(0);
			post.setClickcount(0);
			post.setCommentcount(0);
			post.setSharecount(0);
			post.setLikecount(0);
			post.setDelflag(0);
			Integer postid = postService.addPost(post);
			
			//将秀场商品写入数据表
			Integer[] pids = ps2int("pid");
			for(Integer pid : pids){
				TPostProduct postProduct = new TPostProduct();
				postProduct.setPid(pid);
				postProduct.setPostid(postid);
				postProduct.setIscover(0);
				postService.addPostProduct(postProduct);
			}
			
			//将秀场图片写入t_pic表和t_post_pic表
			Integer cover = p2int("cover");
			Integer[] picids = ps2int("picid");
			for(Integer picid: picids){
				TPic pic = picService.queryPicByPicId(picid);
				TPostPic postpic = new TPostPic();
				postpic.setPicid(picid);
				pic.setOid(postid);
				postpic.setPostid(postid);
				String pictitle = p("intro_"+picid);
				pic.setPictitle(pictitle);
				postpic.setPictitle(pictitle);
				if(picid.equals(cover)){
					pic.setIscover(1);
					postpic.setIscover(1);
				}else{
					pic.setIscover(0);
					postpic.setIscover(0);
				}
				picService.updatePic(pic);
				postService.addPostPic(postpic);
			}
			
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
							PsfImage thumb1 = image.createThumb(-1, 135);
							PsfImage thumb2 = image.createThumb(500, -1);
							picService.saveThumb(picid, 1, thumb1.getBytes());
							picService.saveThumb(picid, 2, thumb2.getBytes());
						}
					}
				}
			}
			
			set("success", 1);
		}catch(Exception e){
			e.printStackTrace();
			set("success", 0);
			set("info","发布秀场失败!");
			return;
		}
	}
}
