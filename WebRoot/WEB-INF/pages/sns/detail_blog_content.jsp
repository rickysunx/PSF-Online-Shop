<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<c:if test="${!empty loginPsfUid}">
	<psf:include page="/sns/user_sign.jsp"/>
</c:if>

<div class="post_wrapbox">
	
	<div class="post_list">
		<div class="post_item">
		
			<div class="post_header">
				<em class="post_postIcon icon_blog"></em>
				<div class="post_title">${postItem.title}</div>
				<div class="post_addTime">${postItem.timepassed}</div>
			</div>
			
			<div class="post_content01">
				<p class="p">${postItem.content}</p>
			</div>
			
			<c:forEach items="${postItem.postpicList}" var="pic">
				<script>
				$(document).ready(function(){
					$("#detailimg_${pic.picid}").parents(".post_imgviewer").mouseenter(function(){
					$(this).find(".control").stop(true).animate( {top:14}, 200 );
					}).mouseleave(function(){
					$(this).find(".control").stop(true).animate( {top:-24}, 200 );
					});
					//图片旋转
					$("#detailimg_${pic.picid} img")[0].onload=function(){				
						var rotate = new Rotate($("#detailimg_${pic.picid} img")[0]);
						$("#detailimg_${pic.picid}").siblings(".control").find(".prev").click(function(){
							rotate.runLeft();
						});
						$("#detailimg_${pic.picid}").siblings(".control").find(".next").click(function(){
							rotate.runRight();
						});
					}
				})
				</script>
				<div class="post_imgviewer">
					<div class="imgview">
						<a id="detailimg_${pic.picid}" href="#"><img src="/pic/${pic.picid}.${pic.fileType}" alt="" /></a>
						<div class="control" style="top:-24px;"><a class="prev" href="javascript:void(0)"><em></em>向左转</a> | <a class="next" href="javascript:void(0)"><em></em>向右转</a></div>
					</div>
					<p>${pic.pictitle}</p>
				</div>
			</c:forEach>
			
			<div class="post_operations">
				<div class="post_actions">
					<a href="javascript:openShareDialog(${postItem.postid},'<psf:encode text="${postItem.title}" enc="utf-8" sharp="true"/>','<psf:encode text="${postItem.title}" enc="GBK" sharp="true" />');" >分享(${postItem.shareCount})</a>|
					<a href="javascript:void(0);" onclick="openTransmitDialog(${postItem.postid},'${postItem.userName}',this);">转发(${postItem.forwardCount})</a>|
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
				<script type="text/javascript">
					$(function(){
						toggleComment($(".post_actions a:eq(2)"));
					});
				</script>
				<c:if test="${postItem.likedByMe}">
					<div class="post_like post_liked"><a liked="1" psftype="like" otype="${postItem.otype}" oid="${postItem.postid}" href="javascript:void(0);">已喜欢(${postItem.likeCount})</a></div>
				</c:if>
				<c:if test="${!postItem.likedByMe}">
					<div class="post_like"><a liked="0" psftype="like" otype="${postItem.otype}" oid="${postItem.postid}" href="javascript:void(0);">喜欢(${postItem.likeCount})</a></div>
				</c:if>
			</div>
			
			
			
			<!-- 没有粉丝则不显示 -->
			<div id="like_user_list_${postItem.postid}" class="likeUserList">
				<c:if test="${!empty postItem.likeUserList}">
				<c:forEach items="${postItem.likeUserList}" var="fan">
					<a href="javascript:void(0)" psftype="card" uid="${fan.uid}"><img src="/pic/${fan.avatarFileName}" /></a>
				</c:forEach>
				</c:if>
			</div>
			
			<div id="commentbox_${postItem.otype}_${postItem.postid}" class="commentbox"></div>
		
		</div>
	</div>
</div>
<script type="text/javascript">
initPsfTypes();
</script>
