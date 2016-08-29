<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!-- 好友秀场内容 -->

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
				<a href="#" class="avatar" psftype="card" uid="${postItem.uid}" href="#">胖大梨</a>
			</div>
			<em class="post_postIcon icon_blog"></em>
			<div class="post_title">标题</div>
			<div class="post_type"><a class="type" href="#">(鞋帽/女装)</a></div>
			<div class="post_show"><img src="/images/sns/default/temp/show_8bit.png" alt="" /></div>
			<div class="post_addTime">1分钟前</div>
		</div>
		<div class="post_content01">
			<p>用法1：拉不阿拉</p>
			<p class="p">大多数时候，忙碌的人们总是会缺少减肥的动机。爱美是所有女性的天性，可惜的是大多数 MM 都只中会光说不练，也就是整天想着要减肥，却没有实际的行动。这样只会让你永远徘徊在组偶决定的边缘，而是你苗条的身材也就会离你越来越远。<a href="#">查看全文...</a></p>
		</div>	
		
		<div class="imglist"><a href="#"><img src="/images/sns/photo/photo69.png" alt="" /></a><a href="#"><img src="/images/sns/photo/photo70.png" alt="" /></a><a href="#"><img src="/images/sns/photo/photo71.png" alt="" /></a><a href="#"><img src="/images/sns/photo/photo72.png" alt="" /></a><a href="#"><img src="/images/sns/photo/photo73.png" alt="" /></a></div>
		
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
		
		
		<div class="post_operations">
			<div class="post_actions">
                        <a href="http://www.jiathis.com/share" class="jiathis jiathis_txt jialike" target="_blank">分享(2)</a> |
                        <a href="javascript:void(0);" onclick="openTransmitDialog(${postItem.postid},'${postItem.displayName}',this);">转发(1)</a> |
                        <a href="javascript:void(0);" psftype="comment" otype="${postItem.otype}" oid="${postItem.postid}">品论(3)</a> |
                        <a id="ff_gd_${postItem.otype}_${postItem.postid}" >更多<em></em></a>
                    </div>
			<c:if test="${postItem.likedByMe}">
				<div class="post_like post_liked" liked="1" psftype="like" otype="${postItem.otype}" oid="${postItem.postid}"><a href="javascript:void(0);">已喜欢(${postItem.likeCount})</a></div>
			</c:if>
			<c:if test="${!postItem.likedByMe}">
				<div class="post_like" liked="0" psftype="like" otype="${postItem.otype}" oid="${postItem.postid}"><a href="javascript:void(0);">喜欢(${postItem.likeCount})</a></div>
			</c:if>
			
		</div>
		<div id="commentbox_${postItem.otype}_${postItem.postid}" class="commentbox"></div>
		<div class="likeUserList">
                    <a><img src="/images/sns/photo/photo12.png" /></a>
                    <a><img src="/images/sns/photo/photo13.png" /></a>
                    <a><img src="/images/sns/photo/photo14.png" /></a>
                    <a><img src="/images/sns/photo/photo15.png" /></a>
                </div>
	</div>
</div>
<div class="pages">					
	<a href="#"><em></em><i>上一页</i></a><a href="#">1</a><a href="#">2</a><a href="#">3</a><a href="#">4</a><a href="#">5</a><a href="#">6</a><a href="#" class="no">…</a><a href="#">50</a><a class="last" href="#"><i>下一页</i><em></em></a>
</div>