<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<c:if test="${empty postListItems}">
<div class="post_no_data">没有相关数据哦，赶快去发布吧。</div>
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
					<a href="/post/${postItem.postid}" target="_blank">
						${postItem.title}
					</a>
				</div>
				<div class="post_addTime">${postItem.timepassed}</div>
			</div>
<c:if test="${postItem.otype==1 || postItem.otype==5 || postItem.otype==7 || postItem.otype==8}"><psf:include page="/sns/components/post_content_blog.jsp"/></c:if>
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
			{name:"黑名单",handler:"addBlacklist(${postItem.uid},\"${postItem.userName}\");"}
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
				
			</div>
			<div id="commentbox_${postItem.otype}_${postItem.postid}" class="commentbox"></div>
			
			<!-- 没有粉丝则不显示 -->
			<div id="like_user_list_${postItem.postid}" class="likeUserList">
				<c:if test="${!empty postItem.likeUserList}">
				<c:forEach items="${postItem.likeUserList}" var="fan">
					<a href="javascript:void(0)" psftype="card" uid="${fan.uid}"><img src="/pic/${fan.avatarFileName}" /></a>
				</c:forEach>
				</c:if>
			</div>
			
		</div>
	</div>
</c:forEach>
<c:if test="${!empty postListItems}">
	<c:if test="${Tab eq 'group_detail_postlist'}">
		<psf:page pageCount="${pageCount}" page="${page}" href="#index_tab" action="javascript:loadGroupPost(-1,null,-1,#page#);"></psf:page>
	</c:if>
	<c:if test="${Tab eq 'topic_detail_postlist'}">
		<psf:page pageCount="${pageCount}" page="${page}" href="#index_tab" action="javascript:loadPostList(#page#,-1);"></psf:page>
	</c:if>
	
</c:if>

<script type="text/javascript">
initPsfTypes();
</script>

