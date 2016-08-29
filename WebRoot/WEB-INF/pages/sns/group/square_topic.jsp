<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<c:if test="${empty topiclist}">
	<div class="post_no_data">当前没有话题，赶紧去发布吧！</div>	
</c:if>
<input id="topic_page" type="hidden" name="page" value="${page}"/>
<input id="topic_pageCount" type="hidden" name="pageCount" value="${pageCount}"/>
<script type="text/javascript">
	if($('#topic_pageCount').val() > 1){
		$("#next_topic").show();
	}else{
		$("#next_topic").hide();
	}
</script>
<c:forEach items="${topiclist}" var="topic">
	<c:if test="${topic.isShow}">
		<li>
	   	   <div class="right">
	       	   <div><b>${topic.postcount}</b>发言</div>
	           <p><a href="/gt/${topic.topictitle}/${topic.groupid}" target="_blank">去围观</a></p>
	       </div>
	       <dl>
	       	   <dt><a href="/sns/group/detail?groupid=${topic.groupid}" target="_blank"><img src="/pic/${topic.grouplogo}" alt="" /></a></dt>
	           <dd>
	           	   <h3><a href="/gt/${topic.topictitle}/${topic.groupid}" target="_blank">#${topic.topictitle}#</a></h3>
	               <p>圈名：${topic.groupname}</p>
	           </dd>
	       </dl>
	   </li>
   </c:if>
</c:forEach>