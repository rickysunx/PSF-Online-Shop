<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<c:if test="${empty topiclist}">
<div class="post_no_data">没有相关数据哦，赶快去发布吧。</div>
</c:if>

<c:forEach items="${topiclist}" var="topic">
<div class="post_item">
   <div class="post_left">
       <div class="post_numbox">
       	<b>${topic.postcount}</b>
           <span>发言</span>
       </div>
   </div>
      
    <div class="post_main">
        <div class="post_topic_header">
            <h3><a href="/gt/${topic.topictitle}/${topic.groupid}">${topic.topictitle}</a></h3>
            <p><a href="#">@${topic.username}</a>　${topic.timepassed} 发起</p>
        </div>
        <c:if test="${!empty topic.latestpost}">
			<div class="post_topic_popupbox">
	        	<div class="arrow"></div>
	            <div class="conbox">
	            	<a href="#">@${topic.latestpost.userName}：</a>${topic.latestpost.listContent}
	            </div>
	        </div>
	        <div class="post_actions">
	        	<a href="javascript:void(0)" onclick="openTransmitDialog(${topic.topicid}, 1)">转发</a> | <a href="/gt/${topic.topictitle}/${topic.groupid}">参与</a>
	        </div>
        </c:if>
    </div>
</div>
</c:forEach>
<script type="text/javascript">
	initPsfTypes();
</script>