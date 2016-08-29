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
import psf.entity.TPostBrand;
import psf.entity.TPostPic;
import psf.entity.TProductCate;
import psf.framework.PsfException;
import psf.service.common.UserService;
import psf.service.mall.BrandService;
import psf.service.sns.FriendService;
import psf.service.sns.GroupService;
import psf.service.sns.PostService;
import psf.vo.mall.BrandVO;
import psf.vo.sns.GroupVO;
import psf.vo.sns.PostListItemVO;
import psf.vo.sns.SnsUserInfoVO;

public class GuideAction extends PsfAction {
	public void myGuide() throws Exception {
		set("guideTab","myguide");
	}
	public void friendGuide() throws Exception {
		FriendService friendService = new FriendService();
		List<TFriendGroup> friendgroups = friendService.queryFriendGroupByUid(getLoginUserId());
		set("friendgroups", friendgroups);
		set("guideTab","friendguide");
	}
	public void groupGuide() throws Exception {
		GroupService groupService = new GroupService();
		PageParam pp = new PageParam(1,10);
		PageResult<GroupVO> groups = groupService.queryJoinGroupByUid(getLoginUserId(), pp);
		set("groups", groups);
		set("guideTab","groupguide");
	}
	public void clubGuide() throws Exception {
		PostService postService = new PostService();
		List<TProductCate> catelist = postService.queryProductCateByOrder(getLoginUserId());
		set("catelist",catelist);
		set("guideTab","clubguide");
	}
	public void relatedBrand() throws Exception {
		set("guideTab","relatedbrand");
	}
	public void editGuide() throws Exception {
		set("guideTab","editguide");
	}
	public void detailGuide() throws Exception {
		try{
			Integer guideid = p2int("guideid");
			Integer uid = getLoginUserId();
			PostListItemVO postItem = null;
			if(guideid == null){
				throw new PsfException("参数错误！");
			}else if(uid == null){
				throw new PsfException("用户未登录！");
			}else{
				PostService postService = new PostService();
				postItem = postService.queryPostListItemById(guideid, uid);
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
	 * 指南列表
	 * @throws Exception
	 */
	public void myGuideList() throws Exception {
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
			if(keyword.equalsIgnoreCase("null") || keyword.equals("搜索指南")){
				keyword = null;
			}
			set("keyword", keyword);
			Integer page = p2int("page");
			if(page == null){
				page = 1;
			}
			set("page", page);
			String guideTab = p("guideTab");
			set("guideTab", guideTab);
			PageParam pp = new PageParam(page,20);
			PageResult<PostListItemVO> posts = null;
			if(guideTab.equals("myguide")){
				posts = postService.queryMyPost(uid, type, Psf.OTYPE_Guide, orderby, keyword, pp);
				set("curTab",1);
			}else if(guideTab.equals("friendguide")){
				posts = postService.queryFriendPost(uid, type, Psf.OTYPE_Guide, orderby, keyword, pp);
				set("curTab",2);
			}else if(guideTab.equals("groupguide")){
				posts = postService.queryGroupFriendPost(uid, type, Psf.OTYPE_Guide, orderby, keyword, pp);
				set("curTab",3);
			}else if(guideTab.equals("clubguide")){
				posts = postService.queryClubPost(uid, type, Psf.OTYPE_Guide, orderby, keyword, pp);
				set("curTab",4);
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
	
	public void postBrand() throws Exception {
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
			if(keyword.equalsIgnoreCase("null") || keyword.equals("搜索指南品牌")){
				keyword = null;
			}
			set("keyword", keyword);
			Integer page = p2int("page");
			if(page == null){
				page = 1;
			}
			set("page", page);
			PageParam pp = new PageParam(page,20);
			PageResult<BrandVO> brands = postService.queryGuideBrand(uid, type, orderby, keyword, pp);
			if(brands != null){
				set("brandlist", brands.getList());
				set("pageCount", brands.getPageCount());
			}
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}
	
	/**
	 * 获取品牌选择对话框
	 * @throws Exception
	 */
	public void getSelectBrandDialog() throws Exception {
		Integer uid = p2int("uid");
		List<TProductCate> catelist = null;
		if(uid != null){
			catelist = productService.queryProductCateByLevel(1);
			set("catelist",catelist);
		}
		
		Integer cateid = p2int("cateid");
		if(cateid == null && catelist != null && catelist.size()>0)
			set("first", catelist.get(0).getCateid());
		else
			set("first", cateid);
	}
	
	/**
	 * 获取品牌列表
	 * @throws Exception
	 */
	public void getBrand() throws Exception {
		PostService postService = new PostService();
		
		Integer cateid = p2int("cateid");
		String keyword = p("keyword");
		if(keyword.equalsIgnoreCase("null") || keyword.equals("品牌搜索")){
			keyword = null;
		}
		Integer page = p2int("page");
		if(page == null){
			page = 1;
		}
		String selected_brandids = p("selected_brandids");
		set("cateid", cateid);
		set("keyword", keyword);
		set("page", page);
		set("selected_brandids", selected_brandids);
		
		Integer uid = getLoginUserId();
		if(uid != null){
			PageParam pp = new PageParam(page,12);
			PageResult<BrandVO> brands = postService.queryBrandByCate(cateid, uid, keyword, pp);
			set("brands", brands);
		}
	}
	
	/**
	 * 获取已选择品牌列表
	 * @throws Exception
	 */
	public void getSelectedBrand() throws Exception {
		BrandService brandService = new BrandService();
		
		Integer[] brandids = ps2int("brandid");	//这里通过品牌浮动框列表提交参数
		
		if(brandids == null){	//如果brandids为null，则判断从删除已选品牌传递的参数
			String selected_brandids = p("selected_brandids");
			if(selected_brandids != null && !selected_brandids.equals("")){
				String[] temp = selected_brandids.split(",");
				brandids = new Integer[temp.length];
				for(int i=0; i<temp.length; i++){
					brandids[i] = Integer.parseInt(temp[i]);
				}
			}
		}
		
		List<BrandVO> brandlist = null;
		if(brandids != null){
			brandlist = brandService.queryBrandVOs(brandids);
		}
		set("brandlist", brandlist);
		
		Integer cateid = p2int("cateid");
		set("cateid", cateid);
	}
	
	public void saveGuide() throws Exception {
		try{
			PostService postService = new PostService();
			
			Integer uid = getLoginUserId();
			if(uid == null){
				set("success",0);
				set("info","未登录，不能发布指南!");
				return;
			}
			Integer cateid = p2int("selected_cate");
			if(cateid == null){
				set("success",0);
				set("info","品牌分类不能为空!");
				return;
			}
			TPost post = new TPost();
			
			//设置主题、内容、用户ID、类型、时间
			String title = p("guide_title");
			post.setTitle(title);
			String content = p("content");
			post.setContent(content);
			post.setUid(uid);
			post.setPosttype(Psf.OTYPE_Guide);
			PsfTime time = new PsfTime();
			post.setAddtime(time.getTimeInSeconds());
			post.setAddip(getHexIP());
			post.setAddby(Psf.AddBy_Web);
			post.setForwardcount(0);
			post.setClickcount(0);
			post.setCommentcount(0);
			post.setSharecount(0);
			post.setLikecount(0);
			post.setDelflag(0);
			
			TProductCate cate = productService.queryParentCate(2, cateid);
			post.setCateid(cate.getCateid());
			
			Integer postid = postService.addPost(post);
			
			//将指南相关品牌数据写入数据库
			Integer[] brandids = ps2int("selected_brandid");
			for(Integer brandid : brandids){
				TPostBrand postbrand = new TPostBrand();
				postbrand.setPostid(postid);
				postbrand.setBrandid(brandid);
				postService.addPostBrand(postbrand);
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
							PsfImage thumb = image.createThumb(160, 160);
							picService.saveThumb(picid, 1, thumb.getBytes());
						}
						
					}
				}
			}
			
			set("success", 1);
		}catch(Exception e){
			e.printStackTrace();
			set("success", 0);
			set("info","发布指南失败!");
			return;
		}
	}
}
