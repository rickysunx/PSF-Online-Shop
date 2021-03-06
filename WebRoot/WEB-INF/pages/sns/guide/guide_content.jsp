<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<psf:include page="/sns/components/smiley.jsp"></psf:include>
<script>
	//本页所有秀场图的json环境变量
	var allshow={
	};
	
	$(function(){
		$("*[psftype='brand']").hover(function(){
			var postid = $(this).attr("postid");
			var top = $(this).offset().top;
			var left = $(this).offset().left;
			var width = $(this).width();
			var height = $(this).height();
			//alert(top+":"+left+":"+width+":"+height);
			//top = top + height + 5;
			left = left + width + 20;
			var options = {"top":top,"left":left};
			var dialogid = $("#brand_list_"+postid).psfDialog(options);
			$(this).attr("dialogid",dialogid);
		},function(){
			var dialogid = $(this).attr("dialogid");
			$("#psfDialog_"+dialogid).psfDialogClose();
		});
	});
</script>
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
		<div class="post_header">
			<div class="post_displayName">
				<a href="#" class="avatar" psftype="card" uid="${postItem.uid}" href="#">${postItem.userName}</a>
			</div>
			<em class="post_postIcon icon_guide"></em>
			<div class="post_title"><a href="/post/${postItem.postid}" target="_blank">${postItem.title}</a></div>
			<div class="post_type"><a class="type" href="#">(${postItem.catename})</a></div>
			<div class="post_brand"><a class="activeflag activeflag-green" href="/post/${postItem.postid}" target="_blank" dialogid="" psftype="brand" postid="${postItem.postid}">相关品牌</a></div>
			<div id="brand_list_${postItem.postid}" class="logo_popup" style="width:162px;border:1px gray solid;background:#fff;display:none;">
				<div class="logo_list">
			    	<c:forEach items="${postItem.brandList}" var="brand">
			    		<div><a class="like" href="#"></a><a href="#"><img width="148px" height="73" src="/pic/${brand.logoName}" alt="${brand.brandname}" /></a></div>
			        </c:forEach>
			    </div>
			</div>
		</div>
		
		<psf:include page="/sns/components/post_content_guide.jsp"></psf:include>
		
		<div class="post_operations">
			<div class="post_actions">
                <a href="javascript:openShareDialog(0,'','');" class="">分享(${postItem.shareCount })</a> |
                <a href="javascript:void(0);" onclick="openTransmitDialog(${postItem.postid});">转发(${postItem.forwardCount})</a> |
                <a href="javascript:void(0);" psftype="comment" otype="${postItem.otype}" oid="${postItem.postid}">品论(${postItem.commentCount})</a> |
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
				<div class="post_like post_liked"><a liked="1" psftype="like" otype="${postItem.otype}" oid="${postItem.postid}" href="javascript:void(0);">已喜欢(${postItem.likeCount})</a></div>
			</c:if>
			<c:if test="${!postItem.likedByMe}">
				<div class="post_like"><a liked="0" psftype="like" otype="${postItem.otype}" oid="${postItem.postid}" href="javascript:void(0);">喜欢(${postItem.likeCount})</a></div>
			</c:if>
			
		</div>
		<div id="commentbox_${postItem.otype}_${postItem.postid}" class="commentbox"></div>
		
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
	<psf:page pageCount="${pageCount}" page="${page}" href="#index_tab" action="javascript:loadGuideList(-1,-1,null,#page#,-1);"></psf:page>
	</c:if>
	<c:if test="${curTab eq 2}">
	<psf:page pageCount="${pageCount}" page="${page}" href="#index_tab" action="javascript:loadFriendGuide(-1,-1,null,#page#,-1);"></psf:page>
	</c:if>
	<c:if test="${curTab eq 3}">
	<psf:page pageCount="${pageCount}" page="${page}" href="#index_tab" action="javascript:loadGroupFriendGuide(-1,-1,null,#page#,-1);"></psf:page>
	</c:if>
	<c:if test="${curTab eq 4}">
	<psf:page pageCount="${pageCount}" page="${page}" href="#index_tab" action="javascript:loadClubGuide(-1,-1,null,#page#,-1);"></psf:page>
	</c:if>
</c:if>

<script type="text/javascript">
initPsfTypes();
</script>