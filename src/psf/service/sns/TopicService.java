package psf.service.sns;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import psf.PsfService;
import psf.common.PageParam;
import psf.common.PageResult;
import psf.entity.TGroup;
import psf.entity.TPostTopic;
import psf.entity.TTopic;
import psf.service.common.UserService;
import psf.vo.sns.GroupVO;
import psf.vo.sns.PostListItemVO;
import psf.vo.sns.SnsUserInfoVO;
import psf.vo.sns.TopicVO;

public class TopicService extends PsfService {
	public Integer addTopic(TTopic topic) throws Exception {
		return dao.insert(topic);
	}
	
	public Integer addPostTopic(TPostTopic posttopic) throws Exception {
		return dao.insert(posttopic);
	}
	
	public void delPostTopic(TPostTopic posttopic) throws Exception {
		sqlmap.delete("topic.delPostTopic",posttopic);
	}
	
	public void delTopic(Integer topicid) throws Exception {
		sqlmap.delete("topic.delTopic", topicid);
	}
	
	/**
	 * 查询话题数
	 * @param topictype 话题类型 null-全部话题
	 * @param groupid 圈子ID null-全部类型话题
	 * @return
	 * @throws Exception
	 */
	public Integer queryTopicCount(Integer topictype, Integer groupid) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("topictype", topictype);
		param.put("groupid", groupid);
		return (Integer)sqlmap.queryForObject("topic.queryTopicCount", param);
	}
	
	/**
	 * 查询话题
	 * @param topictype null-所有圈子，0-普通话题，1-圈子话题
	 * @param type 0-全部,1-我发起的，2-好友发起的
	 * @param uid 当前用户ID
	 * @param groupid 圈子ID null-所有圈子
	 * @param keyword
	 * @param orderby 1-最新，2-最热
	 * @param pp
	 * @return
	 * @throws Exception
	 */
	public PageResult<TopicVO> queryTopicVOByUid(Integer topictype, Integer type, Integer uid, Integer groupid, String keyword, Integer orderby, PageParam pp) throws Exception {
		GroupService groupService = new GroupService();
		PostService postService = new PostService();
		UserService userService = new UserService();
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("topictype", topictype);
		param.put("type", type);
		param.put("uid", uid);
		param.put("groupid", groupid);
		param.put("keyword", keyword);
		Integer count = (Integer)sqlmap.queryForObject("topic.countTopicVOByUid", param);
		PageResult<TopicVO> result = null;
		if(count > 0){
			param.put("orderby", orderby);
			param.put("offset", pp.getOffset());
			param.put("pageSize", pp.getPageSize());
			List<TopicVO> topiclist = sqlmap.queryForList("topic.queryTopicVOByUid", param);
			//设置用户头像，圈子名称，圈子logo，最新一条发言
			for(TopicVO topic : topiclist){
				SnsUserInfoVO userinfo = userService.queryUserInfo(uid, topic.getUid());
				topic.setAvatarFileName(userinfo.getAvatarFileName());
				//topic.setAvatarFileName("1.jpg");	//暂时统一设置为匿名头像
				
				GroupVO gvo = groupService.queryGroupById(topic.getGroupid(), uid);
				topic.setGroupid(gvo.getGroupid());
				topic.setGroupname(gvo.getGroupname());
				topic.setGrouplogo(gvo.getLogo());
				
				if(gvo.getGrouptype()>2 && !gvo.getIsJoin()){	//如果为半公开圈和私密圈，只有加入者才能看见里面的话题和发言
					topic.setIsShow(false);
				}
				
				PageParam pp_1 = new PageParam(1,1);
				PageResult<PostListItemVO> posts = postService.queryGroupPost(0, uid, null, topic.getTopicid(), null, 1, pp_1);
				if(posts != null){
					topic.setLatestpost(posts.getList().get(0));
				}
			}
			result = new PageResult<TopicVO>(topiclist, count, pp.getPageSize());
		}
		return result;
	}
	
	/**
	 * 查询指定话题
	 * @param topicid
	 * @return
	 * @throws Exception
	 */
	public TopicVO queryTopicById(Integer topicid) throws Exception {
		GroupService groupService =  new GroupService();
		TopicVO topic = (TopicVO)sqlmap.queryForObject("topic.queryTopicById",topicid);
		TGroup group = groupService.queryGroupById(topic.getGroupid());
		topic.setGroupname(group.getGroupname());
		return topic;
	}
	
	/**
	 * 更新话题发言数
	 * @param topicid
	 * @throws Exception
	 */
	public void updateTopicPostCount(Integer topicid) throws Exception {
		sqlmap.update("topic.updateTopicPostCount", topicid);
	}
	
	/**
	 * 查询与帖子相关的话题ID
	 * @param postid
	 * @return
	 * @throws Exception
	 */
	public List<TPostTopic> queryPostTopicByPostId(Integer postid) throws Exception {
		return sqlmap.queryForList("topic.queryPostTopicByPostId", postid);
	}
	
	/**
	 * 查询帖子中指定标题的话题
	 * @param postid
	 * @param title
	 * @return
	 * @throws Exception
	 */
	public Integer queryTopicIdByTitle(Integer postid, String title) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("postid", postid);
		param.put("title", title);
		return (Integer)sqlmap.queryForObject("topic.queryTopicIdByTitle", param);
	}
	
	/**
	 * 查询该话题是否存在，不同圈子话题可以相同，圈子内外话题可以相同
	 * @param topictype
	 * @param groupid
	 * @param title
	 * @return
	 * @throws Exception
	 */
	public TTopic queryTopicByRange(Integer topictype, Integer groupid, String title) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("topictype", topictype);
		param.put("groupid", groupid);
		param.put("title", title);
		return (TTopic)sqlmap.queryForObject("topic.queryTopicByRange", param);
	}
	public Boolean isTopicExist(Integer topictype, Integer groupid, String title) throws Exception{
		Boolean flag = false;
		TTopic topic = queryTopicByRange(topictype, groupid, title);
		if(topic != null){
			flag = true;
		}
		return flag;
	}
	
	public TopicVO queryTopicByGroupId(Integer groupid, String title) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("title", title);
		param.put("groupid", groupid);
		return (TopicVO)sqlmap.queryForObject("topic.queryTopicByGroupId", param);
	}
	
	/**
	 * 检索话题
	 * @param topicids
	 * @param orderby
	 * @param pp
	 * @return
	 * @throws Exception
	 */
	public PageResult<TopicVO> queryTopicVOByIds(Integer[] topicids, Integer orderby, PageParam pp) throws Exception {
		PostService postService = new PostService();
		
		PageResult<TopicVO> result = null;
		if(topicids != null && topicids.length > 0){
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("topicids", topicids);
			param.put("orderby", orderby);
			param.put("offset", pp.getOffset());
			param.put("pageSize", pp.getPageSize());
			List<TopicVO> topiclist = sqlmap.queryForList("post.queryTopicVOByIds", param);
			for(TopicVO topic : topiclist){
				PageParam pp_1 = new PageParam(1,1);
				PageResult<PostListItemVO> posts = postService.queryGroupPost(0, null, null, topic.getTopicid(), null, 1, pp_1);
				if(posts != null){
					topic.setLatestpost(posts.getList().get(0));
				}
			}
			result = new PageResult<TopicVO>(topiclist, topicids.length, pp.getPageSize());
		}
		return result;
	}
}
