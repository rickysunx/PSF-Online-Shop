package psf.service.sns;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import psf.PsfService;
import psf.Smiley;
import psf.common.PageParam;
import psf.common.PageResult;
import psf.common.PsfHtmlUtils;
import psf.entity.TComment;
import psf.entity.TPost;
import psf.entity.TUserBalance;
import psf.service.common.UserService;
import psf.vo.sns.CommentVO;
import psf.vo.sns.SnsUserInfoVO;

/**
 * 品论
 * 
 * @author 肖慧
 */
public class CommentService extends PsfService {
	/**
	 * 添加评论
	 * 
	 * @param comment
	 * @throws Exception
	 */
	public void addComment(TComment comment) throws Exception {
		if(comment.getReplyid() == null){
			comment.setReplyid(0);
		}
		if(comment.getTouid() == null){
			comment.setTouid(0);
		}
		if(comment.getToid() == null){
			comment.setToid(0);
		}
		dao.insert(comment);
		
		if(comment.getReplyid() > 0){
			//二级品论删除后要修改上级品论的 haschild
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("commentid", comment.getReplyid());
			param.put("haschild", 1);
			sqlmap.update("comment.updateHaschild", param);
		}
		
		/*
		 * 修改原表的品论总数：使之达到数据同步。
		 * update at 2011-10-19 wangyf 
		 */
		sqlmap.update("post.updateCommentCountByPostid", comment.getOid());
	}

	/**
	 * 删除评论
	 * 
	 * @param commentid
	 * @throws Exception
	 */
	public void delComment(Integer commentid) throws Exception {
		TComment comment = (TComment) sqlmap.queryForObject("comment.queryCommentVOByID", commentid);
		
		sqlmap.update("comment.delete", commentid);
		
		if(comment.getReplyid() > 0){
			//二级品论删除后要修改上级品论的 haschild
			Integer count = (Integer) sqlmap.queryForObject("comment.countReplyComment", comment.getReplyid());
			
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("commentid", comment.getReplyid());
			param.put("haschild", count == 0 ? 0 : 1);
			sqlmap.update("comment.updateHaschild", param);
		}
		
		/*
		 * 修改原表的品论总数：使之达到数据同步。
		 * update at 2011-10-19 wangyf 
		 */
		sqlmap.update("post.updateCommentCountByPostid", comment.getOid());
			
	}

	/**
	 * 根据评论ID查询评论
	 * 
	 * @param commentid
	 * @return
	 * @throws Exception
	 */
	public TComment queryCommentByID(Integer commentid) throws Exception {
		return (TComment) sqlmap.queryForObject("comment.queryCommentVOByID", commentid);
	}

	/**
	 * 根据评论对象类型和对象ID分页查询评论
	 * 
	 * @param otype 对象类型
	 * @param oid 对象ID
	 * @param pp 分页参数
	 * @return
	 * @throws Exception
	 */
	public PageResult<CommentVO> queryCommentByOid(Integer uid, Integer otype, Integer oid, PageParam pp) throws Exception {
		UserService userService = new UserService();
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("otype", otype);
		param.put("oid", oid);
		Integer count = (Integer) sqlmap.queryForObject("comment.countOneCommentByOid", param);
		param.put("offset", pp.getOffset());
		param.put("pageSize", pp.getPageSize());
		List<CommentVO> commentlist = sqlmap.queryForList("comment.queryOneCommentByOid", param);
		for(CommentVO comment:commentlist){
			
			SnsUserInfoVO user = userService.queryUserInfo(uid, comment.getUid());
			
			//显示的名称：备注名、昵称、登录名
			comment.setUsername(user.getUsername());
			
			comment.setAvatarFileName(user.getAvatarFileName());
			//替换表情
			String content = comment.getContent();
			content = Smiley.replaceSmiley(content);
			comment.setContent(content);
			
			Map<String, Object> replyParam = new HashMap<String, Object>();
			replyParam.put("commentid", comment.getCommentid());
			replyParam.put("offset", 0);
			replyParam.put("pageSize", 4);
			
			List<CommentVO> replyComments = queryCommentReply(uid, comment.getCommentid(), new PageParam(1,4)).getList();
			
			comment.setReplyComments(replyComments);
		}
		return new PageResult<CommentVO>(commentlist, count, pp.getPageSize());
	}
	
	/**
	 * 查询对象的评论总数
	 * @param otype
	 * @param oid
	 * @return
	 * @throws Exception
	 */
	public Integer queryCountByOid(Integer otype, Integer oid) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("otype", otype);
		param.put("oid", oid);
		return (Integer) sqlmap.queryForObject("comment.countCommentByOid", param);
	}
	
	/**
	 * 查询圈子或者活动的发言数
	 * @param otype
	 * @param oid
	 * @return
	 * @throws Exception
	 */
	public Integer queryCommentCount(Integer otype, Integer oid) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("otype", otype);
		param.put("oid", oid);
		return (Integer) sqlmap.queryForObject("comment.queryCommentCount", param);
	}
	
	/**
	 * 查询最后一条评论
	 * @param oid
	 * @param otype
	 * @return
	 * @throws Exception
	 */
	public CommentVO queryLastByOid(Integer oid, Integer otype) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("otype", otype);
		param.put("oid", oid);
		return (CommentVO)sqlmap.queryForObject("comment.queryLastByOid", param);
	}

	public CommentVO queryCommentVOByID(Integer uid, Integer commentid) throws Exception {
		UserService userService = new UserService();
		
		CommentVO comment = (CommentVO) sqlmap.queryForObject("comment.queryCommentVOByID", commentid);

		SnsUserInfoVO user = userService.queryUserInfo(uid, comment.getUid());
		
		//显示的名称：备注名、昵称、登录名
		comment.setUsername(user.getUsername());
		
		comment.setAvatarFileName(user.getAvatarFileName());
		
		if(comment.getTouid()!= null && comment.getTouid() != 0){
			comment.setTousername(userService.queryUserByID(comment.getTouid()).getUsername());
		}
		return comment;
	}

	public PageResult<CommentVO> queryCommentReply(Integer uid, Integer commentid, PageParam pp) throws Exception {
		UserService userService = new UserService();

		Integer count = (Integer) sqlmap.queryForObject("comment.countReplyComment", commentid);
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("commentid", commentid);
		param.put("offset", pp.getOffset());
		param.put("pageSize", pp.getPageSize());
		
		List<CommentVO> replyComments = sqlmap.queryForList("comment.queryReplyComment", param);
		for(CommentVO replyComment: replyComments){


			SnsUserInfoVO user = userService.queryUserInfo(uid, replyComment.getUid());
			
			//显示的名称：备注名、昵称、登录名
			replyComment.setUsername(user.getUsername());
			
			replyComment.setAvatarFileName(user.getAvatarFileName());
			
			//替换表情
			String content = replyComment.getContent();
			content = Smiley.replaceSmiley(content);
			replyComment.setContent(content);
			
			if(replyComment.getTouid()!= null && replyComment.getTouid() != 0){
				replyComment.setTousername(userService.queryUserByID(replyComment.getTouid()).getUsername());
			}
		}
		return new PageResult<CommentVO>(replyComments, count, pp.getPageSize());
	}
	/**
	 * 我的评论
	 * @param uid
	 * @param pp
	 * @param type 0-全部，1-好友，2-我的关注，3-我的粉丝，4-我的圈子
	 * @return
	 * @throws Exception
	 */
	public PageResult<CommentVO> queryMyComment(Integer uid,PageParam pp,Integer type,String keyword) throws Exception {
		UserService userService = new UserService();
		PostService postService = new PostService();
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("uid", uid);
		map.put("pp", pp);
		map.put("type", type);
		map.put("keyword", keyword);
		
		Integer itemCount = (Integer)sqlmap.queryForObject("comment.queryMyCommentCount", map);
		List<CommentVO> list = sqlmap.queryForList("commnet.queryMyComment", map);
		
		for(CommentVO com : list){
			SnsUserInfoVO user = userService.queryUserInfo(uid, com.getTouid());
			com.setAvatarFileName(user.getAvatarFileName());
			if(com.getOtype() == 1){ //微博
				TPost post = postService.queryById(com.getOid());
				String text = PsfHtmlUtils.decodeText(post.getContent());
				text = Smiley.replaceSmiley(text);
				post.setContent(text);
				if(post.getContent().length() > 100){
					com.setCommentInfo(user.getUsername()+"的微博：'"+post.getContent().substring(0, 100)+"...'");
				} else {
					com.setCommentInfo(user.getUsername()+"的微博：'"+post.getContent()+"'");
				}
				
			} else if(com.getOtype() == 5){ //圈子
				TPost post = (TPost)sqlmap.queryForObject("comment.queryPostByCommentOid", com.getOid());
				String groupname = (String)sqlmap.queryForObject("comment.queryGroupByTypeid", post.getTypeid());
				com.setCommentInfo(user.getUsername()+"在'"+groupname+"'圈子的'"+post.getTitle()+"'话题");
			} else {
				String title = (String)sqlmap.queryForObject("comment.queryTitleByCommentOid", com.getOid());
				com.setCommentInfo(user.getUsername()+"'"+title+"'的帖子");
			}
			
		}
		return new PageResult<CommentVO>(list,itemCount,pp.getPageSize());
	}
	
	public PageResult<SnsUserInfoVO> queryAboutMyComment(Integer uid,PageParam pp,String keyword) throws Exception {
		UserService userService = new UserService();
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("uid", uid);
		map.put("pp", pp);
		map.put("keyword", keyword);
		Integer itemCount = (Integer)sqlmap.queryForObject("comment.queryAboutMyCommentCount", map);
		List<SnsUserInfoVO> list = sqlmap.queryForList("comment.queryAboutMyComment", map);
		for(SnsUserInfoVO user : list){
			SnsUserInfoVO userinfo = userService.queryUserInfo(uid, user.getUid());
			user.setAvatarFileName(userinfo.getAvatarFileName());
			user.setFollows(userinfo.getFollows());
			user.setFriends(userinfo.getFriends());
			user.setGroups(userinfo.getGroups());
			user.setNowZoneName(userinfo.getNowZoneName());
			user.setPubs(userinfo.getPubs());
			user.setUsername(userinfo.getUsername());
			user.setSex(userinfo.getSex());
			if(user.getOtype() == 1){ //微博
				String username = (String)sqlmap.queryForObject("comment.queryBlogByCommentOid", user.getOid());
				user.setAboutInfo("'"+username+"'的微博");
			} else if(user.getOtype() == 5){ //圈子
				TPost post = (TPost)sqlmap.queryForObject("comment.queryPostByCommentOid", user.getOid());
				String groupname = (String)sqlmap.queryForObject("comment.queryGroupByTypeid", post.getTypeid());
				user.setAboutInfo("'"+groupname+"'圈子的'"+post.getTitle()+"'话题");
			} else {
				String title = (String)sqlmap.queryForObject("comment.queryTitleByCommentOid", user.getOid());
				user.setAboutInfo("'"+title+"'的帖子");
			}
		}
		return new PageResult<SnsUserInfoVO>(list,itemCount,pp.getPageSize());
	}
	
	/**
	 * 查询圈子发言
	 * @param groupid 如果为null，则查询所有圈子的发言
	 * @param classid 评论类别 0-全部，1-微博，2-秀场，3-体验，4-指南
	 * @param orderby 1-最新，2-最热
	 * @param keyword
	 * @param pp
	 * @return
	 * @throws Exception
	 */
	public PageResult<CommentVO> queryGroupComment(Integer groupid, Integer classid, String keyword, Integer orderby, PageParam pp) throws Exception {
		UserService userService = new UserService();
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("groupid", groupid);
		map.put("classid", classid);
		map.put("keyword", keyword);
		Integer count = (Integer)sqlmap.queryForObject("comment.countGroupComment", map);
		PageResult<CommentVO> result = null;
		if(count > 0){
			map.put("offset", pp.getOffset());
			map.put("pageSize", pp.getPageSize());
			List<CommentVO> commentlist = sqlmap.queryForList("comment.queryGroupComment",map);
			for(CommentVO comment : commentlist){
				//设置用户名，用户头像，秀场、体验、指南数
				Integer uid = comment.getUid();
				SnsUserInfoVO userinfo = userService.queryUserInfo(null, uid);
				comment.setUsername(userinfo.getUsername());
				comment.setAvatarFileName(userinfo.getAvatarFileName());
				
				TUserBalance balance = userService.queryUserBalanceByUid(uid);
				comment.setShowCount(balance.getShowcount());
				comment.setShopexpCount(balance.getShopexpcount());
				comment.setGuideCount(balance.getGuidecount());
			}
			result = new PageResult<CommentVO>(commentlist, count, pp.getPageSize());
		}
		return result;
	}
}
