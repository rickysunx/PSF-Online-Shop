<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!-- 我的体验内容 -->
<div class="post_item">
	<div class="post_left">
		<div class="post_avatar" psftype="card" uid="${postItem.uid}">
			<a href="#"><img src="/pic/11.jpg"/></a>
		</div>
		<div class="post_counts">
			<p>秀场：<span>1</span></p>
			<p>体验：<span>1</span></p>
			<p>指南：<span>1</span></p>
		</div>
	</div>
	<div class="post_main">
		<div class="post_header">
			<div class="post_displayName">
				<a href="#" class="avatar" psftype="card" uid="${postItem.uid}" href="#">胖大梨</a>
			</div>
			<em class="post_postIcon icon_blog"></em>
			<div class="post_title">测试</div>
			<div class="post_addTime">30分钟前</div>
		</div>
		
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
								<div class="imglist">
								
									<a href="#"><img src="/images/sns/photo/photo78.png" alt="" /></a><a href="#"><img src="/images/sns/photo/photo79.png" alt="" /></a><a href="#"><img src="/images/sns/photo/photo80.png" alt="" /></a>
								
								</div>
								
							</div>
						</div></div>
					
					</div></div></div>
				
				</div>
			
			</div>
		
		</div>
		
		<div class="post_operations">
			<div class="post_actions">
				<a href="javascript:void(0);">分享(1)</a> |
				<a href="javascript:void(0);">转发(2)</a> |
				<a href="javascript:void(0);" psftype="comment" otype="${postItem.otype}" oid="${postItem.postid}">品论(1)</a> |
				<a>更多<em></em></a>
			</div>
				<div class="post_like post_liked" liked="1" psftype="like" otype="${postItem.otype}" oid="${postItem.postid}"><a href="javascript:void(0);">已喜欢(1)</a></div>
				<!-- 
				<div class="post_like" liked="0" psftype="like" otype="${postItem.otype}" oid="${postItem.postid}"><a href="javascript:void(0);">喜欢(1)</a></div>
 					-->
			
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

<div class="post_item">
	<div class="post_left">
		<div class="post_avatar" psftype="card" uid="${postItem.uid}">
			<a href="#"><img src="/pic/11.jpg"/></a>
		</div>
		<div class="post_counts">
			<p>秀场：<span>1</span></p>
			<p>体验：<span>1</span></p>
			<p>指南：<span>1</span></p>
		</div>
	</div>
	<div class="post_main">
		<div class="post_header">
			<div class="post_displayName">
				<a href="#" class="avatar" psftype="card" uid="${postItem.uid}" href="#">胖大梨</a>
			</div>
			<em class="post_postIcon icon_blog"></em>
			<div class="post_title">测试</div>
			<div class="post_addTime">30分钟前</div>
		</div>
		
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
			
				<div class="postbox_shadow postbox_shadow_big">
				
					<div class="arrow"></div>
					<div class="b_m"><div class="b_l"><div class="b_r">
					
						<div class="m_r"><div class="t_r">
						
							<div class="postbox">
							
								<p>东西还行，一分钱一分货，主要是快递超慢，终于等到了，才说超区，以往好的。东西还行，一分钱一分货，主要是快递超慢，终于等到了，才说超区，以往好的。东西还行，一分钱一分货，主要是快递超慢，终于等到了，才说超区萨克...<a href="#">查看</a></p>
								<div class="imglist">
								
									<a href="#"><img src="/images/sns/photo/photo75.png" alt="" /></a><a href="#"><img src="/images/sns/photo/photo76.png" alt="" /></a><a href="#"><img src="/images/sns/photo/photo77.png" alt="" /></a>
								
								</div>
								
							</div>
						</div></div>
					
					</div></div></div>
				
				</div>
			
			</div>
		
		</div>
		
		<div class="post_operations">
			<div class="post_actions">
				<a href="javascript:void(0);">分享(1)</a> |
				<a href="javascript:void(0);">转发(2)</a> |
				<a href="javascript:void(0);" psftype="comment" otype="${postItem.otype}" oid="${postItem.postid}">品论(1)</a> |
				<a>更多<em></em></a>
			</div>
				<div class="post_like post_liked" liked="1" psftype="like" otype="${postItem.otype}" oid="${postItem.postid}"><a href="javascript:void(0);">已喜欢(1)</a></div>
				<!-- 
				<div class="post_like" liked="0" psftype="like" otype="${postItem.otype}" oid="${postItem.postid}"><a href="javascript:void(0);">喜欢(1)</a></div>
 					-->
			
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
