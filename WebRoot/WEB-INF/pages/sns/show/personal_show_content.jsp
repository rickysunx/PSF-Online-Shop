<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!-- SNS个人秀场 -->
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
		
		<div class="post_content01">
			
			<p>用法1:拉不阿拉</p>
			<p class="p">大多数时候,忙碌的人们总是会缺少减肥的动机.爱美是所有女性的天性,可惜的是大多数 MM 都只中会光说不练,也就是整天想着要减肥,却没有实际的行动.这样只会让你永远徘徊在做决定的边缘,而是你苗条的身材也就会离你越来越越远所谓低下钱庄而引起中小企业连锁倒闭在我看来根本是混乱视听.真正...<a href="#">查看全文</a></p>
		
		</div>
		
		<div class="post_imgviewer">
			
			<div class="imgview"><a href="#"><img src="/images/sns/photo/photo82.png" alt="" /></a>
				<div class="viewerbar"></div>
				<div class="control"><a class="prev" href="#"><em></em>向左转</a> | <a class="next" href="#"><em></em>向右转</a></div>
			</div>
			<div class="post_imglist">
	
				<ul>
					
					<li>
					
						<div class="img"><a href="#"><img src="/images/sns/photo/photo81.png" alt="" /></a></div>
						<p><a href="#">羊毛大衣针识</a></p>
						<p class="price">市场价:<span>279.00</span></p>
						<p>品上价:<b>127</b></p>
						<div class="bottom"><em></em><a href="#">去购买</a></div>
					
					</li>
					
					<li>
					
						<div class="img"><a href="#"><img src="/images/sns/photo/photo81.png" alt="" /></a></div>
						<p><a href="#">羊毛大衣针识</a></p>
						<p class="price">市场价:<span>279.00</span></p>
						<p>品上价:<b>127</b></p>
						<div class="bottom"><em></em><a href="#">去购买</a></div>
					
					</li>
					
					<li>
					
						<div class="img"><a href="#"><img src="/images/sns/photo/photo81.png" alt="" /></a></div>
						<p><a href="#">羊毛大衣针识</a></p>
						<p class="price">市场价:<span>279.00</span></p>
						<p>品上价:<b>127</b></p>
						<div class="bottom"><em></em><a href="#">去购买</a></div>
					
					</li>
					
					<li>
					
						<div class="img"><a href="#"><img src="/images/sns/photo/photo81.png" alt="" /></a></div>
						<p><a href="#">羊毛大衣针识</a></p>
						<p class="price">市场价:<span>279.00</span></p>
						<p>品上价:<b>127</b></p>
						<div class="bottom"><em></em><a href="#">去购买</a></div>
					
					</li>
				
				</ul>
			
			</div>
		
		</div>
		
		<div class="imglist">
			
			<ul>
				
				<li>
					<div><a href="#"><img src="/images/sns/photo/photo82.png" alt="" /></a></div>
					<p><a href="#">喜欢这样鞋子,超帅气,(*_*) 嘻嘻......</a></p>
				</li>
				
				<li>
					<div><a href="#"><img src="/images/sns/photo/photo82.png" alt="" /></a></div>
				</li>
				
				<li>
					<div><a href="#"><img src="/images/sns/photo/photo82.png" alt="" /></a></div>
				</li>
			
			</ul>
			
		
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
