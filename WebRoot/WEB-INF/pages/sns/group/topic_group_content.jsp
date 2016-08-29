<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<c:if test="${empty postListItems}">
	<div class="post_no_data">没有相关数据哦，赶快去发布吧。</div>
</c:if>

<c:forEach items="${postListItems}" var="postItem">
    <div class="post_item">
        <div class="post_left">
            <div class="post_avatar" psftype="card" uid="${postItem.uid}">
                <a href="#"><img src="/pic/${postItem.avatarFileName}"/></a>
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
                    <a href="#" class="avatar" psftype="card" uid="${postItem.uid}" href="#">${postItem.userName}</a>
                </div>
                <em class="post_postIcon icon_user"></em>
                <div class="post_title"><a href="/sns/group/detail/topicdetail?topicid=${postItem.postid}">${postItem.title}</a></div>
                <!-- <div class="post_type"><a class="type" href="#">(鞋帽/女装)</a></div> -->
                <div class="post_addTime">${postItem.timepassed}</div>
            </div>
            <div class="post_content">
                <p>${postItem.listContent}</p>
            </div>	
            
            <c:if test="${!empty postItem.postpicList}">
            <div class="imglist">
            	<c:forEach items="${postItem.postpicList}" var="pic" begin="0" end="4">
            		<a href="#"><img src="/pic/${pic.picid}-1.${pic.fileType}" alt="" /></a>
            	</c:forEach>
            </div>
            </c:if>
            
            <c:if test="${!empty postItem.parentPost}">
			<div class="post_popupbox">
				<div class="arrow"></div>
				<div class="conbox">
					<div class="post_header">
						<div class="post_displayName">
							<a href="#" class="avatar" psftype="card" uid="${postItem.parentPost.uid}" href="#">${postItem.parentPost.userName}</a>
						</div>
						<em class="post_postIcon ${postItem.parentPost.iconClass}"></em>
						<c:if test="${!empty postItem.parentPost.title}">
							<div class="post_title"><a href="/post/${postItem.parentPost.postid}">${postItem.parentPost.title}</a></div>
						</c:if>
						<!-- <div class="post_type"><a class="type" href="#">(鞋帽/女装)</a></div> -->
						<!-- <div class="post_show"><img src="/images/sns/default/temp/show_8bit.png" alt="" /></div> -->
						<div class="post_addTime">${postItem.parentPost.timepassed}</div>
					</div>
					
					<div class="post_content">
						<p>${postItem.parentPost.listContent}</p>
					</div>
					
					<c:if test="${!empty postItem.parentPost.postpicList}">
						<div class="imglist">
							<c:forEach items="${postItem.parentPost.postpicList}" var="pic">
								<a href="/post/${postItem.parentPost.postid}"><img src="/pic/${pic.picid}-1.${pic.fileType}" alt="" /></a>
							</c:forEach>
						</div>
					</c:if>
					
					<div class="bottom">
						<div class="post_actions">
							<a href="/post/${postItem.parentPost.postid}">转发(${postItem.parentPost.forwardCount})</a> | <a href="/post/${postItem.parentPost.postid}">品论(${postItem.parentPost.commentCount})</a>
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
            
            <div class="post_operations">
                <div class="post_actions">
					<a href="javascript:void(0);">分享(${postItem.shareCount})</a> |
					<a href="javascript:void(0);" onclick="openTransmitDialog(${postItem.postid},'${postItem.userName}',this);">转发(${postItem.forwardCount})</a> |
					<a href="javascript:void(0);" psftype="comment" otype="${postItem.otype}" oid="${postItem.postid}">品论(${postItem.commentCount})</a> |
					<a id="ff_gd_${postItem.otype}_${postItem.postid}">更多<em></em></a>
					<script type="text/javascript">
					$("#ff_gd_${postItem.otype}_${postItem.postid}").psfMenu({
						pos:'over',title:'更多<em class="psfmore_icon_up"></em>',items:[
						<c:choose>
							<c:when test="${postItem.uid == loginPsfUid}">
								{name:"删除",handler:"delPost(${postItem.postid})"}
							</c:when>
							<c:otherwise>
								{name:"举报",handler:"void(0)"},
								{name:"黑名单",handler:"addBlacklist(${postItem.uid},'${postItem.userName}')"}
							</c:otherwise>
						</c:choose>
					]});
					</script>
				</div>
	            <c:if test="${postItem.likedByMe}">
					<div class="post_like post_liked"><a liked="1" psftype="like" otype="${postItem.otype}" oid="${postItem.postid}" href="javascript:void(0);">已喜欢(${postItem.likeCount})</a></div>
				</c:if>
				<c:if test="${!postItem.likedByMe}">
					<div class="post_like"><a liked="0" psftype="like" otype="${postItem.otype}" oid="${postItem.postid}" href="javascript:void(0);">喜欢(${postItem.likeCount})</a></div>
				</c:if>
				<span class="post_from">来自于 <a href="/sns/group/detail?groupid=${postItem.group.groupid}"><em></em>${postItem.group.groupname}</a></span>
                
            </div>
            
			<!-- 没有粉丝则不显示 -->
			<div id="like_user_list_${postItem.postid}" class="likeUserList">
				<c:if test="${!empty postItem.likeUserList}">
				<c:forEach items="${postItem.likeUserList}" var="fan">
					<a href="#" psftype="card" uid="${fan.uid}"><img src="/pic/${fan.avatarFileName}" /></a>
				</c:forEach>
				</c:if>
			</div>
			
			 <div id="commentbox_${postItem.otype}_${postItem.postid}" class="commentbox"></div>
        </div>
    </div>
</c:forEach> 

<c:if test="${!empty postListItems}">
	<psf:page pageCount="${pageCount}" page="${curPage}" href="#index_tab" action="javascript:loadGroupTopic(-1,-1,null,#page#);"></psf:page>
</c:if>
<script type="text/javascript">
initPsfTypes();
</script>   	
	<!--
    <div class="post_popupbox">
        <div class="arrow"></div>
        <div class="conbox">
            <div class="post_header">
                <div class="post_displayName">
                    <a href="#" class="avatar" psftype="card" uid="${postItem.uid}" href="#">胖大梨</a>
                </div>
                <em class="post_postIcon icon_blog"></em>
                <div class="post_title">标题</div>
                <div class="post_type"><a class="type" href="#">(鞋帽/女装)</a></div>
                <div class="post_show"><img src="/images/sns/default/temp/show_8bit.png" alt="" /></div>
                <div class="post_addTime">1分钟前</div>
            </div>
            <div class="post_content">
                
                <p>见过天马行空的街拍POSE，但还是佩服你的帅气</p>
            
            </div>
            <div class="imglist"><a href="#"><img src="/images/sns/photo/photo09.png" alt="" /></a></div>
            <div class="bottom">
                    
                <div class="post_actions">
                    <a href="javascript:void(0)">转发(30)</a> | <a href="javascript:void(0)">品论(74)</a>
                    
                </div>
                <span class="time">昨天13：25</span>
                <span>来自<a href="#">周博通微博管家</a></span>
            
            </div>
            
        </div>
    </div>
    -->