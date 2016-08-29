<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

	<div id="autoPostCount" onclick='getLastUpdatePostList("autoPost", "/action/sns/get_last_update_post_list")'></div>
	<form id="autoPostForm" style="display:none;">
		<input name="otype" value="${ param.otype }"/>
		<input name="order" value="${ param.order }"/>
		<input name="range" value="${ param.range }"/>
		<input name="pt" value="${ pt }"/>
	</form>
	<script type="text/javascript">
		startLastUpdatePost("autoPost", "/action/sns/get_last_update_post_count");
	</script>
<c:if test="${empty postListItems}">
<div class="post_no_data">没有相关数据哦，赶快去发布吧。</div>
</c:if>
<c:forEach var="postItem" items="${postListItems}">
	<div class="post_item">
		<div class="post_left">
			<div class="post_avatar" psftype="card" uid="${postItem.uid}">
				<a href="#"><img src="/pic/11.jpg"/></a>
			</div>
			<div class="post_counts">
				<p>秀场：<span>${postItem.showCount}</span></p>
				<p>体验：<span>${postItem.expCount}</span></p>
				<p>指南：<span>${postItem.guideCount}</span></p>
			</div>
		</div>
		<div class="post_main">
			<div class="post_header">
				<div class="post_displayName">
					<a href="#" class="avatar" psftype="card" uid="${postItem.uid}">${postItem.displayName}</a>
				</div>
				<em class="post_postIcon ${postItem.iconClass}"></em>
				<div class="post_title">${postItem.title}</div>
				<div class="post_addTime">${postItem.timepassed}</div>
			</div>
			<div class="post_content">${postItem.content}</div>
			<div class="post_operations">
				<div class="post_actions">
					<a href="http://www.jiathis.com/share" class="jiathis jiathis_txt jialike" target="_blank">分享(${postItem.shareCount})<a class=""></a></a>|
					<a href="javascript:void(0);">转发(${postItem.forwardCount})</a>|
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
			{name:"黑名单",handler:"addBlacklist(${postItem.uid});"}
		</c:otherwise>
	</c:choose>
]});
					</script>
				</div>
				<c:if test="${postItem.likedByMe}">
					<div class="post_like post_liked" liked="1" psftype="like" otype="${postItem.otype}" oid="${postItem.postid}"><a href="javascript:void(0);">已喜欢(${postItem.likeCount})</a></div>
				</c:if>
				<c:if test="${!postItem.likedByMe}">
					<div class="post_like" liked="0" psftype="like" otype="${postItem.otype}" oid="${postItem.postid}"><a href="javascript:void(0);">喜欢(${postItem.likeCount})</a></div>
				</c:if>
				
			</div>
			<div id="commentbox_${postItem.otype}_${postItem.postid}"></div>
			<div class="likeUserList">
				<a><img src="/images/sns/photo/photo12.png" /></a>
				<a><img src="/images/sns/photo/photo13.png" /></a>
				<a><img src="/images/sns/photo/photo14.png" /></a>
				<a><img src="/images/sns/photo/photo15.png" /></a>
			</div>
		</div>
	</div>
</c:forEach>
<script type="text/javascript">
initPsfTypes();
</script>