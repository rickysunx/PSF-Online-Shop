<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%><%@page import="psf.vo.sns.PostListItemVO"%><%@page import="java.net.URLEncoder"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<div class="post_content">
	${postItem.listContent}
	<div class="imglist">
	<c:forEach var="postpic" items="${postItem.postpicList}">
		<script>
			$(document).ready(function(){
				new showobject("${postpic.picid}",[]);
			});
			</script>
		<a id="${postpic.picid}" href="javascript:void(0)"><img src='/pic/${postpic.picid}-1.${postpic.fileType}'/></a>
	</c:forEach>
	</div>
	
	<c:if test="${!empty postItem.forwardid && postItem.forwardid !=0 && empty postItem.parentPost}">
		<div class="post_popupbox">
			<div class="arrow"></div>
			<div class="conbox">原文已被删除!</div>
		</div>
	</c:if>
	<c:if test="${!empty postItem.forwardid && postItem.forwardid !=0 && !empty postItem.parentPost}">
	<div class="post_popupbox">
		<div class="arrow"></div>
		<div class="conbox">
			<div class="post_header">
				<div class="post_displayName">
					<a href="#" class="avatar" psftype="card" uid="${postItem.parentPost.uid}" href="#">${postItem.parentPost.userName}</a>
				</div>
				<em class="post_postIcon ${postItem.parentPost.iconClass}"></em>
				<c:if test="${!empty postItem.parentPost.title}">
					<div class="post_title"><a href="/post/${postItem.parentPost.postid}" target="_blank">${postItem.parentPost.title}</a></div>
				</c:if>
				<c:if test="${postItem.parentPost.otype==4}">
					<div class="post_type"><a class="type" href="#">(${postItem.parentPost.catename})</a></div>
				</c:if>
				<!-- <div class="post_show"><img src="/images/sns/default/temp/show_8bit.png" alt="" /></div> -->
				<div class="post_addTime">${postItem.parentPost.timepassed}</div>
			</div>
			
			<div class="post_content">
				<p>${postItem.parentPost.listContent}</p>
			</div>
			
			<c:if test="${!empty postItem.parentPost.postpicList}">
				<div class="imglist">
					<c:forEach items="${postItem.parentPost.postpicList}" var="pic">
						<a href="/post/${postItem.parentPost.postid}" target="_blank"><img src="/pic/${pic.picid}-1.${pic.fileType}" alt="" /></a>
					</c:forEach>
				</div>
			</c:if>
			
			<div class="bottom">
				<div class="post_actions">
					<a href="/post/${postItem.parentPost.postid}" target="_blank">转发(${postItem.parentPost.forwardCount})</a> | <a href="/post/${postItem.parentPost.postid}" target="_blank">品论(${postItem.parentPost.commentCount})</a>
				</div>
				<c:if test="${postItem.parentPost.otype eq 5}">
					<span class="post_from">来自于 <a href="/sns/group/detail?groupid=${postItem.parentPost.group.groupid}"><em></em>${postItem.parentPost.group.groupname}</a></span>
				</c:if>
				<!-- 
				<span class="time">昨天13：25</span>
				<span>来自<a href="#">周博通微博管家</a></span>
				-->
			</div>
		</div>
	</div>
	</c:if>
	
</div>
