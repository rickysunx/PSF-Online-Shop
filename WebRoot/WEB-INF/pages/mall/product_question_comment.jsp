<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<c:forEach var="cmt" items="${commentList}">
<li class="answer_item_indent">
	<div class="answer_avatar">
		<img src="/pic/${cmt.avatarpic}" alt="" />
	</div>
	<div class="answer_item_content">
		<div class="answer_row1">
			<b class="answer_username">${cmt.username}：</b> <span class="answer_content">${cmt.content}</span>
		</div>
		<div class="answer_row2">
			<div class="answer_actions">
				<a href="javascrip:toggleCommentForm(${a.postid})">回复</a> | <a href="#">投诉</a>
			</div>
			<span class="answer_time">${cmt.straddtime}</span>
		</div>
	</div>
</li>
</c:forEach>
<c:if test="${hasMore}"><!--more--></c:if>