/**
 * @author 孙锐
 */
package psf.action.sns;

import java.util.List;

import psf.PsfAction;
import psf.common.PageParam;
import psf.common.PageResult;
import psf.common.PsfTime;
import psf.entity.TPic;
import psf.entity.TPost;
import psf.entity.TUser;
import psf.entity.TUserBalance;
import psf.framework.PsfException;
import psf.service.common.UserService;
import psf.service.sns.PostService;
import psf.vo.sns.PostListItemVO;
import psf.vo.sns.SnsUserInfoVO;

public class PostAction extends PsfAction {

	public void detail() throws Exception {
		Integer uid = getLoginUserId();
		if(uid != null){
			snsUserInfo(uid);
		}
		String uri = getURI();
		Integer postid = Integer.parseInt(uri.substring("/post/".length()));
		TPost post = postService.queryById(postid);
		Integer posttype = post.getPosttype();
		if(posttype.equals(1)){
			detailBlog(postid);
		}else if(posttype.equals(2)){
			detailShow(postid);
		}else if(posttype.equals(3)){
			detailExp(postid);
		}else if(posttype.equals(4)){
			detailGuide(postid);
		}
	}
	
	/**
	 * 获取SNS当前登录人的信息，set到snsUserInfo中
	 * @throws Exception
	 */
	public void snsUserInfo(Integer uid) throws Exception {
		SnsUserInfoVO snsUserInfo = new SnsUserInfoVO();
		TUser user = userService.queryUserByID(uid);
		TUserBalance  userBalance = userService.queryUserBalanceByUid(uid);
		snsUserInfo.setCash(userBalance.getCash());
		snsUserInfo.setCoins(userBalance.getCoins());
		snsUserInfo.setCoupon(userBalance.getCoupon());
		snsUserInfo.setExps(userBalance.getExps());
		snsUserInfo.setFans(userBalance.getFans());
		snsUserInfo.setFollows(userBalance.getFollows());
		snsUserInfo.setFriends(userBalance.getFriends());
		snsUserInfo.setGroupfriends(userBalance.getGroupfriends());
		snsUserInfo.setPoints(userBalance.getPoints());
		snsUserInfo.setVisits(userBalance.getVisitcount());
		snsUserInfo.setUsername(user.getUsername());
		if(user.getAvatarid() != null){
			TPic p = (TPic)picService.queryPicByPicId(user.getAvatarid());
			snsUserInfo.setAvatarFileName(user.getAvatarid()+"."+p.getFiletype());
		}else{
			snsUserInfo.setAvatarFileName("1.jpg");
		}
		set("snsUserInfo",snsUserInfo);
	}
	
	public void detailBlog(Integer postid) throws Exception {
		try{
			Integer uid = getLoginUserId();
			PostListItemVO postItem = null;
			if(postid == null){
				throw new PsfException("参数错误！");
			}else{
				PostService postService = new PostService();
				postItem = postService.queryPostListItemById(postid, uid);
			}
			set("postItem", postItem);
			UserService userService = new UserService();
			SnsUserInfoVO snsUserInfo = userService.queryUserInfo(uid, postItem.getUid());
			set("posterInfo", snsUserInfo);
			forward("blog");
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}
	
	public void detailShow(Integer postid) throws Exception {
		try{
			Integer uid = getLoginUserId();
			PostListItemVO postItem = null;
			if(postid == null){
				throw new PsfException("参数错误！");
			}else{
				PostService postService = new PostService();
				postItem = postService.queryPostListItemById(postid, uid);
			}
			set("postItem", postItem);
			UserService userService = new UserService();
			SnsUserInfoVO snsUserInfo = userService.queryUserInfo(uid, postItem.getUid());
			set("posterInfo", snsUserInfo);
			forward("show");
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}
	
	public void detailExp(Integer postid) throws Exception {
		try{
			Integer uid = getLoginUserId();
			PostListItemVO postItem = null;
			if(postid == null){
				throw new PsfException("参数错误！");
			}else{
				PostService postService = new PostService();
				postItem = postService.queryPostListItemById(postid, uid);
			}
			set("postItem", postItem);
			UserService userService = new UserService();
			SnsUserInfoVO snsUserInfo = userService.queryUserInfo(uid, postItem.getUid());
			set("posterInfo", snsUserInfo);
			forward("shopexp");
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}
	
	public void detailGuide(Integer postid) throws Exception {
		try{
			Integer uid = getLoginUserId();
			PostListItemVO postItem = null;
			if(postid == null){
				throw new PsfException("参数错误！");
			}else{
				PostService postService = new PostService();
				postItem = postService.queryPostListItemById(postid, uid);
			}
			set("postItem", postItem);
			UserService userService = new UserService();
			SnsUserInfoVO snsUserInfo = userService.queryUserInfo(uid, postItem.getUid());
			set("posterInfo", snsUserInfo);
			forward("guide");
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}
	
	/**
	 * 
	 * @throws Exception
	 */
	public void getPostList() throws Exception {
		Integer otype = p2int("otype");
		Integer orderby = p2int("order");
		Integer range = p2int("range");
		Integer page = p2int("page");
		if (page == null)
			page = 1;
		if (otype != null && otype == 0)
			otype = null;
		PageParam pp = new PageParam(page, 10);
		PageResult<PostListItemVO> itemsResult = postService.queryPostListItem(getLoginUserId(), otype, orderby, range, pp);
		set("postListItems", itemsResult.getList());
		
		set("curPage", page);	//当前页
		set("pageCount", itemsResult.getPageCount());	//页面数
		set("pt", new PsfTime().getTimeInSeconds());	//系统当前时间

	}

	private static final String[] type_names = new String[]{
		"发表信息", "广播", "秀场", "体验", "指南"//, "活动"
	};
	/**
	 * 
	 * @throws Exception
	 */
	public void getLastUpdatePostCount() throws Exception {
		/*
		try {
			Integer otype = p2int("otype");
			Integer range = p2int("range");
			Integer time = p2int("pt");
			Integer uid = getLoginUserId();

			set("name", type_names[otype]);
			
			if (otype != null && otype == 0)
				otype = null;
			
			Integer count = postService.queryAutoPostListCount(uid , otype, time , range);
			
			if(count > 0){
				set("count", count);
				set("success",1);
			}
		} catch (Exception e) {
			e.printStackTrace();
			set("success",0);
			set("info",e.getMessage());
		}
		*/
	}
	public void getLastUpdatePostList() throws Exception {
		Integer otype = p2int("otype");
		Integer range = p2int("range");
		Integer time = p2int("pt");
		Integer uid = getLoginUserId();

		if (otype != null && otype == 0)
			otype = null;
		
		List itemsResult = postService.queryAutoPostListItem(uid , otype, time , range);
	
		set("postListItems", itemsResult);
		set("pt", new PsfTime().getTimeInSeconds());	//系统当前时间
	}

}
