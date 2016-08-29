/**
 * SNS公共
 * @author 于淼
 */
package psf.action.sns;


import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpMethod;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.methods.GetMethod;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import psf.Psf;
import psf.PsfAction;
import psf.common.PageParam;
import psf.common.PageResult;
import psf.common.PageUtils;
import psf.common.PsfShortUrl;
import psf.common.PsfTime;
import psf.common.PsfUtils;
import psf.entity.TComment;
import psf.entity.TGroup;
import psf.entity.TPost;
import psf.entity.TPostPic;
import psf.entity.TPostTopic;
import psf.entity.TTopic;
import psf.entity.TUrl;
import psf.entity.TUser;
import psf.framework.PsfException;
import psf.service.sns.GroupService;
import psf.service.sns.PostService;
import psf.service.sns.TopicService;
import psf.vo.sns.AtUserVO;
import psf.vo.sns.CommentVO;
import psf.vo.sns.GroupVO;
import psf.vo.sns.LikeUserVO;
import psf.vo.sns.PostListItemVO;
import psf.vo.sns.SnsUserInfoVO;
import psf.vo.sns.TopicVO;

public class SnsAction extends PsfAction {

	public void index() throws Exception {
//		List<TUser> userList = userService.queryAllUsers();
//		for(TUser user:userList) {
//			userService.updateBalance(user.getUid());
//		}
	}
	
	public void getCard() throws Exception {
		Integer uid = p2int("uid");
		SnsUserInfoVO user = userService.queryUserInfo(getLoginUserId(), uid);
		set("cardUser",user);
	}

	public void getCommentReply() throws Exception {
		Integer commentid = p2int("commentid");
		Integer page = p2int("page");
		if (page == null)
			page = 1;
		CommentVO comment = commentService.queryCommentVOByID(getLoginUserId(), commentid);
		PageParam pp = new PageParam(page, 10);
		PageResult<CommentVO> commentList = commentService.queryCommentReply(getLoginUserId(), commentid, pp);
		set("comment", comment);
		set("replyComments", commentList);
		
		//要根据 otype 来进行判断是否为 post ，还有活动的可能，以后再加。 
		Integer mainUid = postService.queryById(comment.getOid()).getUid();
		set("mainUid", mainUid);	//当前帖子发表人的id。
		
		//获取分页样式数据
		int[] pages = PageUtils.getPages(page, commentList.getPageCount());
		set("pages", pages);
		
		set("curPage", page);	//当前页
		set("pageCount", commentList.getPageCount());	//页面数
		
		set("otype",comment.getOtype());
		set("oid",comment.getOid());
		set("loginUid",getLoginUserId());
	}
	public void getComment() throws Exception {
		Integer otype = p2int("otype");
		Integer oid = p2int("oid");
		
		//要根据 otype 来进行判断是否为 post ，还有活动的可能，以后再加。 
		Integer mainUid = postService.queryById(oid).getUid();
		set("mainUid", mainUid);	//当前帖子发表人的id。
		
//		System.out.println("getcomment,otype:"+otype+" oid:"+oid);
		PageResult<CommentVO> commentList = commentService.queryCommentByOid(getLoginUserId(), otype,oid, new PageParam(1,11));
		set("commentList", commentList);
		set("otype",otype);
		set("oid",oid);
		set("loginUid",getLoginUserId());
		set("commentCount",commentService.queryCountByOid(otype, oid));
	}


	public void getCommentList() throws Exception {
		Integer otype = p2int("otype");
		Integer oid = p2int("oid");
		Integer page = p2int("page");
		
		//要根据 otype 来进行判断是否为 post ，还有活动的可能，以后再加。 
		Integer mainUid = postService.queryById(oid).getUid();
		set("mainUid", mainUid);	//当前帖子发表人的id。
		
		if (page == null)
			page = 1;
		if (otype != null && otype == 0)
			otype = null;
		PageParam pp = new PageParam(page, 30);
		PageResult<CommentVO> commentList = commentService.queryCommentByOid(getLoginUserId(), otype,oid, pp);
		set("commentList", commentList);
		
		//获取分页样式数据
		int[] pages = PageUtils.getPages(page, commentList.getPageCount());
		set("pages", pages);
		
		set("curPage", page);	//当前页
		set("pageCount", commentList.getPageCount());	//页面数
		
		set("otype",otype);
		set("oid",oid);
		set("loginUid",getLoginUserId());
	}
	
	public void delComment() throws Exception {
		try {
			if(getLoginUserId() == null) {
				throw new PsfException("未登陆或超时，不能删除品论");
			}
			
			Integer commentid = p2int("commentid");
			if(commentid == null){
				throw new PsfException("参数错误");
			}
			TComment comment = commentService.queryCommentByID(commentid);
			if(comment == null){
				throw new PsfException("参数错误");
			}
			
			//判断是否为评论的作者
			if(! getLoginUserId().equals(comment.getUid())){
				
				//要根据 otype 来进行判断是否为 post ，还有活动的可能，以后再加。 
				Integer mainUid = postService.queryById(comment.getOid()).getUid();	
				
				//判断是否为帖子的作者。
				if(! getLoginUserId().equals(mainUid)){
					throw new PsfException("你不是作者");
				}
			}
			
			commentService.delComment(commentid);
			set("success",1);
		} catch (Exception e) {
			e.printStackTrace();
			set("success",0);
			set("info",e.getMessage());
		}
	}

	public void delPost() throws Exception {
		try {
			if(getLoginUserId() == null) {
				throw new PsfException("未登陆或超时，不能删除品论");
			}
			
			Integer postid = p2int("postid");
			if(postid == null){
				throw new PsfException("参数错误，操作失败");
			}
			TPost post = postService.queryById(postid);
			if(post == null){
				throw new PsfException("参数错误，操作失败");
			}
			
			if(! getLoginUserId().equals(post.getUid())){
				throw new PsfException("你不是作者，操作失败");
			}
			
			postService.delPost(postid);
			//删除与帖子相关的话题信息，更新话题发言
			List<TPostTopic> posttopics = topicService.queryPostTopicByPostId(postid);
			for(TPostTopic posttopic : posttopics){
				topicService.delPostTopic(posttopic);
				topicService.updateTopicPostCount(posttopic.getTopicid());
			}
			
			set("success",1);
		} catch (Exception e) {
			e.printStackTrace();
			set("success",0);
			set("info",e.getMessage());
		}
	}
	
	public void addBlacklist() throws Exception {
		try {
			if(getLoginUserId() == null) {
				throw new PsfException("未登陆或超时");
			}
			
			int blockuid = p2int("uid");
			int uid = getLoginUserId();
			
			snsService.addBlacklist(uid , blockuid);
			
			set("success",1);
		} catch (Exception e) {
			e.printStackTrace();
			set("success",0);
			set("info",e.getMessage());
		}
	}
	
	public void addComment() throws Exception {
		try {
			if(getLoginUserId() == null) {
				throw new PsfException("未登陆或超时，不能发布品论");
			}
			
			String content = p("content");
			
			Integer otype = p2int("otype");
			Integer oid = p2int("oid");
			Integer touid = p2int("touid");
			
			Integer commentid = p2int("commentid");
			
			Integer replyid = p2int("replyid");
			
			String addToBlog = p("addToBlog");	//同时发表到微薄
			
			if(content==null || content.trim().length()==0) {
				throw new PsfException("品论内容不能为空");
			}
			if(content.trim().length()>200) {
				throw new PsfException("品论内容不能超过200个字");
			}
			
			
			TComment cmt = new TComment();
			cmt.setAddip(getHexIP());
			cmt.setAddtime(new PsfTime().getTimeInSeconds());
			cmt.setContent(content);
			cmt.setDelflag(0);
			cmt.setUid(getLoginUserId());
			cmt.setHaschild(0);
			if(oid != null){	//toid和touid实时变动，replyid为最顶层评论ID
				//一级品论：toid与replyid相等，均等于0
				cmt.setOtype(otype);
				cmt.setOid(oid);
				cmt.setReplyid(0);
				cmt.setTouid(touid);
				cmt.setToid(0);
				
			} else if(replyid == null) {
				//二级回复:toid与replyid相等，且不为0
				
				//根据 commentid 查询 
				TComment tocmt = commentService.queryCommentByID(commentid); 
				cmt.setOtype(tocmt.getOtype());
				cmt.setOid(tocmt.getOid());
				cmt.setReplyid(commentid);
				cmt.setTouid(tocmt.getUid());
				cmt.setToid(commentid);
			} else {
				//三级以下回复：toid不等replyid，toid实时变动，父评论ID，replyid为最顶层评论ID
				//根据 commentid 查询 
				TComment tocmt = commentService.queryCommentByID(commentid); //最顶层评论
				//根据 replyid 查询 
				TComment recmt = commentService.queryCommentByID(replyid); //父评论
				
				cmt.setOtype(tocmt.getOtype());
				cmt.setOid(tocmt.getOid());
				cmt.setReplyid(commentid);
				cmt.setTouid(recmt.getUid());
				cmt.setToid(replyid);
				
			}

			commentService.addComment(cmt);
			
			otype = cmt.getOtype();
			oid = cmt.getOid();
			replyid = cmt.getReplyid();
			
			//同时发表到微薄
			if("1".equals(addToBlog)){
				TPost post = new TPost();
				post.setAddby(getLoginUserId());
				post.setAddip(getHexIP());
				post.setAddtime(new PsfTime().getTimeInSeconds());
				post.setDelflag(0);
				post.setPosttype(Psf.OTYPE_Blog);
				post.setUid(getLoginUserId());
				post.setContent(content+"//"+postService.queryById(oid).getContent());
				post.setClickcount(0);
				post.setCommentcount(0);
				post.setForwardcount(0);
				post.setSharecount(0);
				post.setForwardid(0);
				postService.addPost(post);
			}
			set("success",1);
			set("otype",otype);
			set("oid",oid);
		} catch (Exception e) {
			e.printStackTrace();
			set("success",0);
			set("info",e.getMessage());
		}
	}
	
	public void updateLike() throws Exception {
		Integer oid = p2int("oid");
		Integer otype = p2int("otype");
		Integer action = p2int("action");
		Integer uid = getLoginUserId();
		try {
			if(oid==null||otype==null) throw new Exception("有字段为空");
			if(uid==null) throw new Exception("未登录");
			if(action==1) {
				snsService.saveLike(uid, otype, oid);
			} else {
				snsService.delLike(uid, otype, oid);
			}
			Integer likeCount = snsService.queryLikeCountByOid(otype, oid);
			boolean likedByMe = snsService.isLikedByUid(uid, otype, oid);
			
			//重新获取粉丝
			PageParam pp_fans = new PageParam(1, 15);
			List<LikeUserVO> fans = snsService.queryLikeUserByOid(otype, oid, pp_fans).getList();
			set("fans", fans);
			
			set("success",1);
			set("likeCount",likeCount);
			set("likedByMe",likedByMe);
			set("oid",oid);
			set("otype",otype);
		} catch (Exception e) {
			e.printStackTrace();
			set("success",0);
			set("info",e.getMessage());
		}
		
	}

	public void updateRemark() throws Exception {
		try {
			int uid = getLoginUserId();
			Integer remarkuid = p2int("remarkuid");
			String remarkname = p("remarkname").trim();
			
			if(remarkuid==null || remarkuid==0) {
				throw new PsfException("参数错误");
			}
			if(remarkname==null || remarkname.length()==0) {
				snsService.delRemark(uid, remarkuid);
				set("success",1);
				return;
			}
			if(remarkname.trim().length()>20) {
				throw new PsfException("备注名称不能超过20个字");
			}
			
			snsService.updateRemark(uid, remarkuid, remarkname);
			set("success",1);
		} catch (Exception e) {
			e.printStackTrace();
			set("success",0);
			set("info",e.getMessage());
		}
		
	}
	
	public void addBlog() throws Exception {
		try {
			String blogContent = p("blogContent");
			if(blogContent==null || blogContent.trim().length()==0) {
				throw new PsfException("广播内容不能为空");
			}
			
			if(blogContent.trim().length()>200) {
				throw new PsfException("广播内容不能超过200个字");
			}
			
			String url = p("url");
			if(url != null){
				TUrl turl = new TUrl();
				turl.setOurl(url);
				turl.setUrltype(0);
				
				url = snsService.addUrl(turl);
				blogContent += "<a href='"+url+"'>"+url+"</a>";
			}
			if(getLoginUserId() == null){
				throw new Exception("未登录");
			}
			
			Integer [] picids = ps2int("picid");
			
			Integer forwardid = p2int("forwardid"); 
			Integer replyid = p2int("replyid");
			Integer groupid = p2int("groupid");	
			String groupids = p("groupids");	//转发多个圈子参数
			
			TPost post = new TPost();
			post.setUid(getLoginUserId());
			post.setContent(blogContent);
			post.setReplyid(0);
			post.setForwardid(0);
			post.setAddip(getHexIP());
			post.setAddby(Psf.AddBy_Web);
			post.setDelflag(0);
			post.setCommentcount(0);
			post.setSharecount(0);
			post.setForwardcount(0);
			post.setClickcount(0);
			if(forwardid != null){	//转发
				post.setForwardid(forwardid);
				post.setReplyid(replyid);	//当前回复或转发的帖子ID
				post.setPosttype(Psf.OTYPE_Forward);	//8：转发类型
				
				if(groupids == null){	//转发到广播
					post.setAddtime(new PsfTime().getTimeInSeconds());
					postService.addPost(post);
					
					if(replyid != null){	//更新转发数
						postService.updateForwardCount(replyid);
					}
					
					//转发微博同时评论
					Integer uid = p2int("uid");	
					if(uid != null){	//评论被转帖的作者
						TComment comment = new TComment();
						comment.setUid(getLoginUserId());
						comment.setTouid(uid);
						TPost post1 = postService.queryById(replyid);
						comment.setOtype(post1.getPosttype());
						comment.setOid(replyid);
						comment.setContent(blogContent);
						PsfTime time = new PsfTime();
						comment.setAddtime(time.getTimeInSeconds());
						comment.setAddip(getHexIP());
						comment.setHaschild(0);
						comment.setDelflag(0);
						commentService.addComment(comment);
					}
					Integer ouid = p2int("ouid");	//评论给原始帖主
					if(ouid != null){
						TComment comment = new TComment();
						comment.setUid(getLoginUserId());
						comment.setTouid(ouid);
						TPost post1 = postService.queryById(forwardid);
						comment.setOtype(post1.getPosttype());
						comment.setOid(forwardid);
						comment.setContent(blogContent);
						PsfTime time = new PsfTime();
						comment.setAddtime(time.getTimeInSeconds());
						comment.setAddip(getHexIP());
						comment.setHaschild(0);
						comment.setDelflag(0);
						commentService.addComment(comment);
					}
				}else{	//转发到多个圈子，如果是话题发言，则在转入的相应圈子创建了对应的话题
					List<String> topictitles = PsfUtils.getTopics(1, blogContent);
					post.setPosttype(Psf.OTYPE_Group);
					if(groupids.equals("")){
						throw new Exception("未选择转发圈子！");
					}
					String[] idStrs = groupids.split(",");
					for(String idStr : idStrs){
						Integer gid = Integer.parseInt(idStr);
						post.setTypeid(gid);
						post.setAddtime(new PsfTime().getTimeInSeconds());
						Integer postid = postService.addPost(post);
						
						if(replyid != null){	//更新转发数
							postService.updateForwardCount(replyid);
						}
						
						if(topictitles!=null && topictitles.size()>0){
							/*
							 * 如果转发的是话题发言,判断转入的圈子中是否有该话题，如果有，则更新该话题的发言数,添加话题和帖子的关联记录；
							 * 否则创建该话题以及其与帖子的关联记录
							 */
							for(String topictitle : topictitles){
								TTopic topic = topicService.queryTopicByRange(1, gid, topictitle);
								Integer topicid = null;
								if(topic != null){
									topicid = topic.getTopicid();
								}else{
									TTopic newTopic = new TTopic();
									newTopic.setTopictitle(topictitle);
									newTopic.setTopictype(1);	
									newTopic.setGroupid(gid);
									newTopic.setUid(getLoginUserId());
									newTopic.setPostcount(1);
									newTopic.setAddtime(new PsfTime().getTimeInSeconds());
									newTopic.setLastreplytime(new PsfTime().getTimeInSeconds());
									newTopic.setDelflag(0);
									topicid = topicService.addTopic(newTopic);
								}
								TPostTopic posttopic = new TPostTopic();
								posttopic.setPostid(postid);
								posttopic.setTopicid(topicid);
								topicService.addPostTopic(posttopic);
								topicService.updateTopicPostCount(topicid);
							}
						}
					}
				}
			}else{	//发微博或者话题
				post.setPosttype(Psf.OTYPE_Blog);
				
				List<String> topics = PsfUtils.getTopics(1,blogContent);
				if(topics != null && topics.size() > 0){	//发话题
					TopicService topicService = new TopicService();
					TTopic topic = new TTopic();
					topic.setUid(getLoginUserId());
					topic.setTopictype(0);	//默认普通话题
					topic.setGroupid(0);
					topic.setPostcount(1);
					topic.setDelflag(0);
					
					//帖子中话题内容添加链接
					if(groupid == null){
						for(String t : topics){
							blogContent = blogContent.replaceAll("#"+t+"#", "<a>#"+t+"#</a>");
						}
						post.setContent(blogContent);
					}else{	//圈子话题
						Integer flag = p2int("sendToBlog");
						if(flag != null){	//同时发表到广播
							post.setAddtime(new PsfTime().getTimeInSeconds());
							postService.addPost(post);
						}
						
						for(String t : topics){
							blogContent = blogContent.replaceAll("#"+t+"#", "<a href='/sns/group/detail/topicdetail/"+t+"_"+groupid+"'>#"+t+"#</a>");
						}
						post.setContent(blogContent);
						post.setPosttype(Psf.OTYPE_Group);
						post.setTypeid(groupid);
						
						topic.setTopictype(1);
						topic.setGroupid(groupid);
					}
					
					post.setAddtime(new PsfTime().getTimeInSeconds());
					Integer oid = postService.addPost(post);
					
					for(String topictitle : topics){
						Integer tid = null;
						TTopic temp = topicService.queryTopicByRange(topic.getTopictype(), topic.getGroupid(), topictitle);
						if(temp != null){	//如果该话题存在,更新该话题的发言
							tid = temp.getTopicid();
						}else{
							topic.setAddtime(new PsfTime().getTimeInSeconds());
							topic.setLastreplytime(new PsfTime().getTimeInSeconds());
							topic.setTopictitle(topictitle);
							tid = topicService.addTopic(topic);	
						}
						
						TPostTopic posttopic = new TPostTopic();
						posttopic.setPostid(oid);
						posttopic.setTopicid(tid);
						topicService.addPostTopic(posttopic);
						topicService.updateTopicPostCount(tid); //更新话题发言数
					}
				}else{	//发广播
					post.setPosttype(Psf.OTYPE_Blog);
					if(groupid != null){	//发圈子广播
						Integer flag = p2int("sendToBlog");
						if(flag != null){	//同时发表到首页广播
							post.setTypeid(null);
							post.setAddtime(new PsfTime().getTimeInSeconds());
							postService.addPost(post);
						}
						
						post.setPosttype(Psf.OTYPE_Group);
						post.setTypeid(groupid);
					}
					post.setAddtime(new PsfTime().getTimeInSeconds());
					Integer oid = postService.addPost(post);
					
					if(picids!=null && picids.length>0) {
						picService.updatePic(picids, oid, Psf.OTYPE_Blog);
						for (int picid:picids) {
							TPostPic postpic = new TPostPic();
							postpic.setIscover(0);
							postpic.setPicid(picid);
							postpic.setPostid(oid);
							postService.addPostPic(postpic);
						}
					}
				}
			}
			
			set("success",1);
			
		} catch (PsfException e) {
			set("success",0);
			set("info",e.getMessage());
		} catch (Exception e) {
			rollback();
			e.printStackTrace();
			set("success",0);
			set("info",e.getMessage());
		}
	}
	
	private static Document getURLContent(String url) throws Exception {
		Document doc = Jsoup.connect(url).userAgent("Mozilla").
				cookie("auth", "token").timeout(6000)
				.get();
		return doc;
	}
	
	public void saveRepublish() throws Exception {
		try {
			Integer uid = getLoginUserId();
			String title = p("title");
			String content = p("content");
			String picurl = p("picurl");
			String url = p("url");
			
			if(uid==null) throw new Exception("未登录不能发布");
			
			if(title==null || title.trim().length()==0) {
				throw new Exception("标题不能为空");
			}
			
			
			TUrl turl = new TUrl();
			turl.setOurl(url);
			turl.setUrltype(Psf.UrlType_Normal);
			String shortUrl = snsService.addUrl(turl);
			
			TPost post = new TPost();
			post.setPosttype(Psf.OTYPE_Blog);
			post.setTitle(title);
			post.setContent((content==null?"":content)+" "+shortUrl);
			post.setUid(getLoginUserId());
			post.setReplyid(0);
			post.setAddtime(new PsfTime().getTimeInSeconds());
			post.setAddip(getHexIP());
			post.setAddby(Psf.AddBy_Web);
			post.setDelflag(0);
			post.setCommentcount(0);
			post.setSharecount(0);
			post.setForwardcount(0);
			post.setClickcount(1);
			
			Integer postid = postService.addPost(post);
			
			/*抓取图片*/
			try {
				String fileName = "0.jpg";
				int index = picurl.lastIndexOf("/");
				if(index>0 && index<picurl.length()-1) {
					fileName = picurl.substring(index+1,picurl.length());
				}
				HttpClient hc = new HttpClient();
				HttpMethod method = new GetMethod(picurl);
				
				int status = hc.executeMethod(method);
				if(status==HttpStatus.SC_OK) {
					byte [] picdata = method.getResponseBody();
					Integer picid = picService.addPic(uid, fileName, picdata, postid, Psf.OTYPE_Blog, getHexIP());
					
					TPostPic pp = new TPostPic();
					pp.setIscover(0);
					pp.setPicid(picid);
					pp.setPictitle(null);
					pp.setPostid(postid);
					
					postService.addPostPic(pp);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			set("success",1);
		} catch (Exception e) {
			rollback();
			e.printStackTrace();
			set("success",0);
			set("info",e.getMessage());
		}
	}
	
	public void getPageInfo() throws Exception {
		try {
			String url = p("url");
			
			URL u = new URL(url);
			String host = u.getHost();
			
			Document doc = getURLContent(url);
			Element head = doc.head();
			Elements metaTitle = head.children().select("meta[name=title]");
			Elements metaDescrption = head.children().select("meta[name=description]");
			String title = null;
			String descrption = null;
			if(metaTitle.size()>0) {
				title = metaTitle.get(0).attr("content");
			} else {
				title = doc.title();
			}
			
			if(metaDescrption.size()>0) {
				descrption = metaDescrption.get(0).attr("content");
			} else {
				descrption = title;
			}
			
			Elements images = doc.select("img");
			
			List<String> imageSrcList = new ArrayList<String>();
			
			for(Element eImg:images) {
				String src = eImg.attr("src");
				if(src!=null && src.length()>0) {
					if(src.startsWith("http://")) {
						imageSrcList.add(src);
					} else {
						imageSrcList.add("http://"+host+src);
					}
				}
			}
			
			set("success",1);
			set("title",title);
			set("content",descrption);
			set("imageList",imageSrcList);
		} catch (Exception e) {
			e.printStackTrace();
			set("success",0);
			set("info",e.getMessage());
		}
	}
	
	public void getAtUser() throws Exception {
		Integer page = p2int("page");
		String name = p("name");
		Integer uid = getLoginUserId();
		
		try {
			if(uid==null) throw new Exception("未登录");
			if(page==null) page = 1;
			PageResult<AtUserVO> prAtUser = snsService.queryAtUser(uid, name, new PageParam(page, 10));
			
			set("success",1);
			set("showPrev",page>1);
			set("showNext",page<prAtUser.getPageCount());
			set("userList",prAtUser.getList());
		} catch (Exception e) {
			set("success",0);
			set("info",e.getMessage());
		}
		
		
	}
	
	/**
	 * 获取转发信息
	 * @throws Exception
	 */
	public void getForwardInfo() throws Exception {
		Integer type = p2int("type");
		Integer id = p2int("id");
		Integer objtype = p2int("objtype");
		if(objtype == null){
			objtype = 0;
		}
		set("objtype", objtype);
		Integer uid = getLoginUserId();
		try{
			if(uid == null) 
				throw new Exception("未登录");
			if(type == null || id == null)
				throw new Exception("参数错误");
			if(objtype != null && objtype.equals(1)){	//转发话题
				TopicVO topic = topicService.queryTopicById(id);
				set("topic", topic);
			}else{
				PostService postService = new PostService();
				PostListItemVO postItem = (PostListItemVO) postService.queryPostListItemById(id, uid);
				PostListItemVO parentPost = null;	//父帖
				if(postItem.getForwardid() != null){
					parentPost = (PostListItemVO) postService.queryPostListItemById(postItem.getForwardid(), uid);
				}
				set("postItem", postItem);
				set("parentPost", parentPost);
			}
			if(type.equals(2)){ //发私信
				TUser user = userService.queryUserByID(uid);
				PageResult<AtUserVO> atuser = snsService.queryAtUser(uid, user.getUsername(), new PageParam(1, 10));
				if(atuser != null){
					set("userlist", atuser.getList());
				}
			}else if(type.equals(3)){	//转发圈子
				GroupService groupService = new GroupService();
				Integer page = p2int("page");
				if(page == null){
					page = 1;
				}
				PageParam pp = new PageParam(page, 10);	
				PageResult<TGroup> groups = groupService.queryForwardGroupList(uid, pp);
				if(groups != null){
					set("grouplist", groups.getList());
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}


