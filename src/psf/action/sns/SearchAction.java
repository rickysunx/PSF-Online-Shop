package psf.action.sns;

import psf.PsfAction;
import psf.common.PageParam;
import psf.common.PageResult;
import psf.service.common.FullSearchService;
import psf.vo.sns.GroupVO;
import psf.vo.sns.PostListItemVO;
import psf.vo.sns.SearchUserVO;
import psf.vo.sns.TopicVO;

public class SearchAction extends PsfAction {
	public void searchPage() throws Exception {
	}
	
	public void searchTab() throws Exception {
		Integer type = p2int("type");
		if(type == null){
			type = 0;
		}
		set("type", type);
		String keyword = p("keyword");
		if(keyword.equals("null") || keyword.equals("请输入关键字")){
			keyword = null;
		}
		set("keyword", keyword);
	}
	
	/**
	 * 处理搜索Action
	 * @throws Exception
	 */
	public void search() throws Exception {
		Integer type = p2int("type");
		if(type == null){
			type = 0;
		}
		set("type", type);
		String keyword = p("keyword");
		if(keyword.equals("null") || keyword.equals("请输入关键字") || keyword.equals("")){
			keyword = null;
		}
		Integer page = p2int("page");
		if(page == null){
			page = 1;
		}
		set("page",page);
		Integer orderby = p2int("orderby");
		if(orderby == null){
			orderby = 1;
		}
		set("orderby", orderby);
		PageParam pp = new PageParam(page, 20);
		FullSearchService searchService = new FullSearchService(type);
		Integer[][] ids = searchService.search(keyword);
		if(type.equals(0)){
			if(ids != null){
				Integer[] postids = ids[0];
				PageResult<PostListItemVO> posts = postService.queryPostByIDs(getLoginUserId(), postids, orderby, pp);
				if(posts != null){
					set("postListItems", posts.getList());
					set("pageCount", posts.getPageCount());
				}
				Integer[] uids = ids[1];
				PageParam pp2 = new PageParam(1,4);
				PageResult<SearchUserVO> users = userService.querySearchUserVOByIDs(getLoginUserId(), uids, pp2);
				if(users != null){
					set("userlist", users.getList());
					set("user_pageCount", users.getPageCount());
				}
			}
			forward("post");
		}else if(type>0 && type<5){
			if(ids != null && ids.length > 0){
				Integer[] postids = ids[0];
				PageResult<PostListItemVO> posts = postService.queryPostByIDs(getLoginUserId(), postids, orderby, pp);
				if(posts != null){
					set("postListItems", posts.getList());
					set("pageCount", posts.getPageCount());
				}
			}
			forward("post");
		}else if(type.equals(5)){
			if(ids != null && ids.length > 0){
				Integer[] uids = ids[0];
				PageResult<SearchUserVO> users = userService.querySearchUserVOByIDs(getLoginUserId(), uids, pp);
				if(users != null){
					set("userlist", users.getList());
					set("pageCount", users.getPageCount());
				}
			}
			forward("user");
		}else if(type.equals(6)){
			if(ids != null && ids.length > 0){
				Integer[] groupids = ids[0];
				PageResult<GroupVO> groups = groupService.querySearchGroupByIds(getLoginUserId(), groupids, orderby, pp);
				if(groups != null){
					set("grouplist", groups.getList());
					set("pageCount", groups.getPageCount());
				}
			}
			forward("group");
		}else if(type.equals(7)){
			if(ids != null && ids.length > 0){
				Integer[] topicids = ids[0];
				PageResult<TopicVO> topics = topicService.queryTopicVOByIds(topicids, orderby, pp);
				if(topics != null){
					set("topiclist", topics.getList());
					set("pageCount", topics.getPageCount());
				}
			}
			forward("topic");
		}
	}
}
