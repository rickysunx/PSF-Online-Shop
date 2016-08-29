<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>


<c:forEach var="p" items="${showPostList}">
	<li>
	    <dl>
	        <dt><a target="_blank" href="/post/${p.postid}"><img width="160px" height="160px" src="/pic/${p.coverpic}" alt="" /></a></dt>
	        <dd>
	            <div class="avatar"><a href="#"><img width="34px" height="34px" src="/pic/${p.avatarpic}" alt="" /></a></div>
	            <p><a target="_blank" href="/post/${p.postid}">${p.title}</a></p>
	        </dd>
	    </dl>
	</li>
</c:forEach>

<c:forEach var="exp" items="${expPostList}">
<li class="current">
	<div class="post_item">
		<div class="post">
			<dl class="post_left">
				<dt>
					<a target="_blank" href="/post/${exp.postid}"><img src="/pic/${exp.userpic}" alt="" />
					</a>
				</dt>
				<dd>
					<p>
						秀场：<span>${exp.showcount }</span>
					</p>
					<p>
						体验：<span>${exp.shopexpcount }</span>
					</p>
					<p>
						指南：<span>${exp.guidecount }</span>
					</p>
				</dd>
			</dl>

			<div class="post_main">
				<div class="post_header">
					<div class="post_displayName">
						<a href="#">${exp.username}</a>
					</div>
				</div>
				<div class="post_content01">
					${exp.content}<a target="_blank" href="/post/${exp.postid}">查看全部</a>
				</div>
				<div class="imglist">
					<c:forEach var="p" items="${exp.picList }">
						<a href="#none"><img src="/pic/${p.picname }" alt=""/></a>
					</c:forEach>
				</div>
				<div class="post_actions">
					<a href="#">转发(${exp.forwardcount})</a> | <a href="#">品论(${exp.commentcount})</a>
				</div>
			</div>
		</div>

<c:if test="${exp.commentid!=null}">
	<div class="post_comment">
		<h5>最新评论</h5>
		<dl class="commentbox">
			<dt>
				<a href="#"><img src="/images/mall/photo/photo17.png" alt="" />
				</a>
			</dt>
			<dd>
				<div class="comment_item_row1">
					<span class="comment_username">${exp.cusername}：</span> <span
						class="comment_content">${exp.commentContent}</span>
				</div>
				<div class="comment_item_row2">
					<div class="comment_time">2011-10-31 20:40</div>
				</div>
			</dd>
		</dl>
	</div>
</c:if>
	</div>
</li>
</c:forEach>  


<c:forEach var="g" items="${guidePostList}">                   
<li class="current">
   	<div class="post_item">
       	<div class="post">
           	<dl class="post_left">
               	<dt><a href="#"><img src="/pic/${g.userpic}" alt="" /></a></dt>
                   <dd>
                      <p>秀场：<span>${g.showCount}</span></p>
                      <p>体验：<span>${g.expCount}</span></p>
                      <p>指南：<span>${g.guideCount}</span></p>
                  	</dd>
               </dl>
               
               <div class="post_main">
               	<div class="post_header">
                       <div class="post_displayName">
                           <a href="#">${g.username }</a>
                       </div>
                       <div class="post_title">
                       	<a target="_blank" href="/post/${g.postid }">${g.title }</a>
                       </div>
                       <div class="post_type"><a target="_blank" href="#">${g.cat_name }</a></div>
                   </div>
                   <div class="post_content01">
                   		${g.postcontent}<a target="_blank" href="/post/${g.postid }">查看全部</a>
                   </div>
                   <div class="imglist">
                   	  <c:forEach var="p" items="${g.picList}">
                   		<a href="#none"><img height="40" src="/pic/${p.picname}" alt="" /></a>
                   	  </c:forEach>
                   </div>
                   <div class="post_actions">
                   	<a href="#">转发(${g.forwardcount})</a> | 
                   	<a href="#">品论(${g.commentcount})</a>
                   </div>
               </div>
           </div>
           
           <c:if test="${g.commentid!=null}">
	           <div class="post_comment">
	           	<h5>最新评论</h5>
	               <dl class="commentbox">
	                   <dt><a href="#"><img src="/images/mall/photo/photo17.png" alt="" /></a></dt>
	                   <dd>
	                   	<div class="comment_item_row1">
	                           <span class="comment_username">${g.cusername}：</span>
	                           <span class="comment_content">${g.commentcontent}</span>
	                       </div>
	                       <div class="comment_item_row2">
	                           <div class="comment_time">2011-10-31 20:40</div>
	                       </div>
	                   </dd>
	               </dl>
	           </div>
           </c:if>
       </div>
</li>
</c:forEach>  


<script type="text/javascript">

$("#goods_${snsPost}_prev").hide();
$("#goods_${snsPost}_next").hide();

<c:if test="${showPrev}">
	$("#goods_${snsPost}_prev").show();
	$("#goods_${snsPost}_prev").attr("href","javascript:refreshSnsPost(${snsPostType},${page-1})");
</c:if>

<c:if test="${showNext}">
	$("#goods_${snsPost}_next").show();
	$("#goods_${snsPost}_prev").attr("href","javascript:refreshSnsPost(${snsPostType},${page+1})");
</c:if>

</script>


