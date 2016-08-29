<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<psf:include page="/sns/components/smiley.jsp"></psf:include>
<!-- 我的体验内容 !!-->
<c:if test="${empty postListItems}">
	<div class="post_no_data">没有相关数据哦，赶快去发布吧。</div>
</c:if>

<c:forEach items="${postListItems}" var="postItem">
	<psf:set key="postItem" value="${postItem}"></psf:set>
	<div id="post_${postItem.postid}" class="post_item">
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
			<div class="post_header s_clear">
				<div class="post_displayName">
					<a href="#" class="avatar" psftype="card" uid="${postItem.uid}" href="#">${postItem.userName}</a>
				</div>
				<em class="post_postIcon icon_shopexp"></em>
				<div class="post_title"><a href="/post/${postItem.postid}" target="_blank">${postItem.title}</a></div>
				<div class="post_addTime">${postItem.timepassed}</div>
			</div>
			<psf:include page="/sns/components/post_content_shopexp.jsp"/>
			
			<!--		
			<div class="post_table">
			
				<div class="post_table_left">
				
					<div class="img"><a href="#"><img src="/images/sns/photo/photo74.png" alt="" /></a></div>
					<p>品上价：<b>￥4000</b></p>
					<p>体验数：<b>2000</b></p>
					<p class="post_combox">
						<span>用户点评：</span>
						<span class="icons"><em></em><em></em><em></em><em class="no"></em><em class="no"></em></span>
					</p>
				
				</div>
				
				<div class="post_table_right">
				
					<div class="postbox_shadow">
					
						<div class="arrow"></div>
						<div class="b_m"><div class="b_l"><div class="b_r">
						
							<div class="m_r"><div class="t_r">
							
								<div class="postbox">
								
									<p>东西还行，一分钱一分货，主要是快递超慢，终于等到了，才说超区，以往好的。东西还行，一分钱一分货，主要是快递超慢，终于等到了，才说超区，以往好的。东西还行，一分钱一分货，主要是快递超慢，终于等到了，才说超区萨克...<a href="#">查看</a></p>
									<div id="usero1" class="imglist">
									
										<a id="12" href="javascript:void(0)"><img src="/images/sns/photo/photo78.png" alt="" /></a><a id="13" href="javascript:void(0)"><img src="/images/sns/photo/photo79.png" alt="" /></a><a id="15"  href="javascript:void(0)"><img src="/images/sns/photo/photo80.png" alt="" /></a>
									
									</div>
									
								</div>
							</div></div>
						
						</div></div></div>
					
					</div>
				
				</div>
			
			</div>
			-->		
			
			<div class="post_operations">
				<div class="post_actions">
					<a href="javascript:openShareDialog(0,'','');">分享(${postItem.shareCount})</a> |
					<a href="javascript:void(0);" onclick="openTransmitDialog(${postItem.postid});">转发(${postItem.forwardCount})</a> |
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
								{name:"黑名单",handler:"addBlacklist(${postItem.uid},\"${postItem.userName}\");"}
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
			</div>
			
			<div id="commentbox_${postItem.otype}_${postItem.postid}"></div>
			
			<!-- 没有粉丝则不显示 -->
			<div id="like_user_list_${postItem.postid}" class="likeUserList">
				<c:if test="${!empty postItem.likeUserList}">
				<c:forEach items="${postItem.likeUserList}" var="fan">
					<a href="#" psftype="card" uid="${fan.uid}"><img src="/pic/${fan.avatarFileName}" /></a>
				</c:forEach>
				</c:if>
			</div>
		</div>
	</div>
</c:forEach>

<c:if test="${!empty postListItems}">
	<c:if test="${curTab eq 1}">
	<psf:page pageCount="${pageCount}" page="${page}" href="#index_tab" action="javascript:loadShopexpList(-1,-1,null,#page#,-1);"></psf:page>
	</c:if>
	<c:if test="${curTab eq 2}">
	<psf:page pageCount="${pageCount}" page="${page}" href="#index_tab" action="javascript:loadFriendShopexp(-1,-1,null,#page#,-1);"></psf:page>
	</c:if>
	<c:if test="${curTab eq 3}">
	<psf:page pageCount="${pageCount}" page="${page}" href="#index_tab" action="javascript:loadGroupFriendExp(-1,-1,null,#page#,-1);"></psf:page>
	</c:if>
	<c:if test="${curTab eq 4}">
	<psf:page pageCount="${pageCount}" page="${page}" href="#index_tab" action="javascript:loadClubShopexp(-1,-1,null,#page#,-1);"></psf:page>
	</c:if>
</c:if>
<script type="text/javascript">
initPsfTypes();
</script>