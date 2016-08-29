<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<ul>
	<c:if test="${empty topiclist}">
		<li><p style="text-align:align;">当前圈子没有话题</p></li>
	</c:if>
    <c:forEach items="${topiclist}" var="topic">
    	<li><a href="/gt/${topic.topictitle}/${topic.groupid}">${topic.topictitle}<span>(${topic.postcount})</span></a></li>
	</c:forEach>
</ul>
<div class="more">
	<psf:simplepage pageCount="${pageCount}" action="javascript:loadHotTopics(${groupid},#page#)" page="${page}"></psf:simplepage>
</div>
    	