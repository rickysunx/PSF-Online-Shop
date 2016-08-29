<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<c:forEach items="${postlist}" var="post">
	<c:if test="${post.isShow}">
		<li id="saying_${post.postid}">
	   		<div class="post_item">
	       		<dl class="post_left">
					<dt><a href="#"><img src="/pic/${post.avatarFileName}" alt="" /></a></dt>
					<dd>
	               	<p>秀场：<span>${post.showCount}</span></p>
	                   <p>体验：<span>${post.expCount}</span></p>
	                   <p>指南：<span>${post.guideCount}</span></p>
	               </dd>
	           </dl>
	           
	           <div class="post_main">
					<div class="post_header">
	                   <div class="post_displayName">
	                       <a href="#">${post.userName}</a>
	                   </div>
	                   <em class="icon_blog"></em>
	                   <div class="post_title"><a href="#">${post.topic.topictitle}</a></div>
	               </div>
	               <div class="post_content">
	               
	               	<p>${post.listContent}</p>
	                <!-- <div class="img"><a href="#"></a></div> -->   
	               
	               </div>
	               <div class="post_bottom">
						<span>${post.timepassed}</span>
						<a href="/sns/group/detail?groupid=${post.group.groupid}" target="_blank">来自：${post.group.groupname}</a>
	               </div>
	           </div>
	       </div>
	   </li>
   </c:if>
</c:forEach>
<li id="no_message" class="hide"><p>没有相关信息</p></li>
<script type="text/javascript">
	if($("li[id^='saying_']").length==0){
		$("#no_message").removeClass("hide");
	}else{
		$("#no_message").addClass("hide");
	}
</script>