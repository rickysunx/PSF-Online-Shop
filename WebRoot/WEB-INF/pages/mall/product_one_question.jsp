<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<ul class="answer_topic">
	<li class="answer_title">
		<div class="answer_avatar">
			<img src="/pic/${q.avatarpic}" alt="" />
		</div>
		<div class="answer_item_content">
			<div class="answer_row1">
				<b class="answer_username">${q.username}：</b><span class="answer_content">${q.content}</span>
			</div>
			<div class="answer_row2">
				<div class="answer_actions">
					<a href="javascript:toggleAnswerForm(${q.postid});">我来回答</a> | <a href="#">投诉</a>
				</div>
				<span class="answer_time">${q.straddtime}</span>
			</div>
		</div>
	</li>

	<li class="answer_form" id="answer_container_${q.postid}" style="display: none;">
		<form id="answer_form_${q.postid}" action="">
			<input name="replyid" type="hidden" value="${q.postid}" />
			<input name="pid" type="hidden" value="${q.typeid}" />
			<textarea name="content"></textarea>
			<div class="txtarea_bottom">
				<div class="face faceimg">
					<a href="#"><em></em>表情</a>
				</div>
				<div class="ckgroup">
					<input type="checkbox" />
					<label>同时发送到我的广播</label>
				</div>
				<a class="button" href="javascript:submitGoodsAnswer(${q.postid});">回答</a>
			</div>
		</form>
	</li>
</ul>


<ul class="answer_topic">
	<c:forEach var="a" items="${q.answerList}">
		<li class="answer_item">
			<div class="flag">
				<em></em>最佳答案
			</div>
			<div class="answer_avatar">
				<img src="/pic/${a.avatarpic}" alt="" />
			</div>
			<div class="answer_item_content">
				<div class="answer_row1">
					<b class="answer_username">${a.username}：</b><span class="answer_content">${a.content}</span>
				</div>
				<div class="answer_row2">
					<div class="answer_actions">
						<a href="javascript:toggleCommentForm(${a.postid});">品论(${a.commentcount})</a> | <a href="#">投诉</a>
					</div>
					<span class="answer_time">${a.straddtime}</span>
				</div>
			</div>
		</li>

		<c:forEach var="cmt" items="${a.commentList}">
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
							<a href="javascript:toggleCommentForm(${a.postid});">回复</a> | <a href="#">投诉</a>
						</div>
						<span class="answer_time">${cmt.straddtime}</span>
					</div>
				</div>
			</li>
		</c:forEach>

		<c:if test="${a.hasMore}">
			<li id="goods_comment_more_${a.postid}" class="answer_more">
				<a href="javascript:showMoreComment(${a.postid},2);">显示更多评论&gt;&gt;</a>
			</li>
		</c:if>

		<li id="answer_comment_${a.postid}" class="answer_form answer_subform" style="display: none;">
			<form id="answer_comment_form_${a.postid}" action="">
				<input type="hidden" name="qid" value="${q.postid}" />
				<input type="hidden" name="aid" value="${a.postid}" />
				<textarea name="content"></textarea>
				<div class="txtarea_bottom">
					<div class="face faceimg">
						<a href="#"><em></em>表情</a>
					</div>
					<div class="ckgroup">
						<input type="checkbox" />
						<label>同时发送到我的广播</label>
					</div>
					<a class="button" href="javascript:submitGoodsAnswerComment(${a.postid});">回复</a>
				</div>
			</form>
		</li>
	</c:forEach>

	<c:if test="${q.hasMore}">
		<li id="goods_answer_more_${q.postid}" class="answer_more">
			<a href="javascript:showMoreAnswer(${q.postid},2);">显示更多答案&gt;&gt;</a>
		</li>
	</c:if>
</ul>