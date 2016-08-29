<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<script>
	//本页所有秀场图的json环境变量
	var allshow={
	};
</script>

<c:if test="${(type eq 0) && (!empty userlist)}">
	<div id="userList">
		<ul class="userBox">
			<c:forEach items="${userlist}" var="user">
			<li>
				<div class="userPic"><img src="/pic/${user.avatarFileName}" title="" width="63px;" height="63px;"/></div>
				<div class="userNews">
					<p class="cenTxt"><a href="#">${(empty user.remarkname) ? user.username : user.remarkname}</a></p>
					<p>粉丝：<span class="friend">${user.fanscount}</span></p>
					<p>
						<c:if test="${!user.isfollow}">
							<a href="#" class="addBtn">关注</a>
						</c:if>
						<c:if test="${!user.isfriend}">
							<a href="#" class="addBtn mar_left">好友</a>
						</c:if>
					</p>
				</div>
			</li>
			</c:forEach>
		</ul>
		<c:if test="${user_pageCount > 1}">
			<p class="more"><a href="">更多&gt;&gt;</a></p>
		</c:if>
	</div>
</c:if>

<c:if test="${empty postListItems}">
<div class="right_nodata_big">你想查找的东西可能在火星哦~</div>
</c:if>
<c:forEach var="postItem" items="${postListItems}">
<psf:set key="postItem" value="${postItem}"></psf:set>
	<div id="post_${postItem.postid}" class="post_item">
		<div class="post_left">
			<div class="post_avatar" psftype="card" uid="${postItem.uid}">
				<a href="javascript:void(0)"><img src="/pic/${postItem.avatarFileName}"/></a>
			</div>
			<div class="post_counts">
				<p>秀场：<span>${postItem.showCount}</span></p>
				<p>体验：<span>${postItem.expCount}</span></p>
				<p>指南：<span>${postItem.guideCount}</span></p>
			</div>
		</div>
		<div class="post_main">
			<div class="post_header s_clear">
				<div class="post_displayName">
					<a href="javascript:void(0)" class="avatar" psftype="card" uid="${postItem.uid}">${postItem.userName}</a>
				</div>
				<em class="post_postIcon ${postItem.iconClass}"></em>
				<div class="post_title">
					<a href="/post/${postItem.postid}" target="_blank">${postItem.title}</a>
				</div>
				<c:if test="${postItem.otype==4}">
					<div class="post_type"><a class="type" href="#">(${postItem.catename})</a></div>
				</c:if>
				<div class="post_addTime">${postItem.timepassed}</div>
			</div>
<c:if test="${postItem.otype==1 || postItem.otype==5 || postItem.otype==8}"><psf:include page="/sns/components/post_content_blog.jsp"/></c:if>
<c:if test="${postItem.otype==2}"><psf:include page="/sns/components/post_content_show.jsp"/></c:if>
<c:if test="${postItem.otype==3}"><psf:include page="/sns/components/post_content_shopexp.jsp"/></c:if>
<c:if test="${postItem.otype==4}"><psf:include page="/sns/components/post_content_guide.jsp"/></c:if>
			
			<div class="post_operations">
                <div class="post_actions">
					<a href="javascript:openShareDialog(${postItem.postid},'<psf:encode text="${postItem.title}" enc="utf-8" sharp="true"/>','<psf:encode text="${postItem.title}" enc="GBK" sharp="true" />');" >分享(${postItem.shareCount})</a>|
					<a href="javascript:void(0);" onclick="openTransmitDialog(${postItem.postid});">转发(${postItem.forwardCount})</a>|
					<a href="javascript:void(0);" psftype="comment" otype="${postItem.otype}" oid="${postItem.postid}">品论(${postItem.commentCount})</a>|
					<a id="ff_gd_${postItem.otype}_${postItem.postid}" >更多<em></em></a>
<script type="text/javascript">
$("#ff_gd_${postItem.otype}_${postItem.postid}").psfMenu({
	pos:'over',title:'更多<em class="psfmore_icon_up"></em>',items:[
	<c:choose>
		<c:when test="${postItem.uid == loginPsfUid}">
			{name:"删除",handler:"delPost(${postItem.postid})"}
		</c:when>
		<c:otherwise>
			{name:"举报",handler:"void(0)"},
			{name:"黑名单",handler:"addBlacklist(${postItem.uid},'${postItem.userName}');"}
		</c:otherwise>
	</c:choose>
]});
</script>
				</div>
                
				<c:if test="${postItem.likedByMe}">
					<div class="post_like post_liked"><a liked="1" psftype="like" otype="${postItem.otype}" oid="${postItem.postid}" href="javascript:void(0);">喜欢 ${postItem.likeCount}</a></div>
				</c:if>
				<c:if test="${!postItem.likedByMe}">
					<div class="post_like"><a liked="0" psftype="like" otype="${postItem.otype}" oid="${postItem.postid}" href="javascript:void(0);">喜欢 ${postItem.likeCount}</a></div>
				</c:if>
				<c:if test="${postItem.otype eq 5}">
					<span class="post_from">来自于 <a href="#"><em></em>${postItem.group.groupname}</a></span>
				</c:if>
			</div>
			
			<div id="commentbox_${postItem.otype}_${postItem.postid}" class="commentbox"></div>
			
			<!-- 没有粉丝则不显示 -->
			<div id="like_user_list_${postItem.postid}" class="likeUserList">
				<c:if test="${!empty postItem.likeUserList}">
				<c:forEach items="${postItem.likeUserList}" var="fan">
					<a href="javascript:void(0)" psftype="card" uid="${fan.uid}"><img src="/pic/${(empty fan.avatarFileName) ? '1.jpg' : fan.avatarFileName}" /></a>
				</c:forEach>
				</c:if>
			</div>
			
		</div>
	</div>
</c:forEach>
<c:if test="${!empty postListItems}">
	<psf:page pageCount="${pageCount}" page="${page}" href="#index_tab" action="javascript:loadPostList(-1,-1,-1,#page#);"></psf:page>
</c:if>

<script type="text/javascript">
initPsfTypes();
</script>