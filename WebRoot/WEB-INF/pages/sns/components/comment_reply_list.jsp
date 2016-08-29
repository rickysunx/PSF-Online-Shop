<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<div class="comment_list">
	<ul class="comment_topic" id="comment_topic_${comment.commentid}">
		<li class="comment_item">
			<div psftype="card" uid="${comment.uid}" class="comment_avatar">
				<img src="/pic/${comment.avatarFileName }"/>
			</div>
			<div class="comment_item_content ff_comment_button_show">
				<div class="comment_item_row1">
					<span psftype="card" uid="${comment.uid}" class="comment_username">${comment.username}：</span>
					<span class="comment_content" id="ff_comment_id_${comment.commentid}">${comment.delflag == 1 ? "该品论已删除。" : comment.content}</span>
				</div>
				<div class="comment_item_row2">
                
					<c:if test="${comment.delflag == 0}">
					<div class="comment_actions" id="ff_del_comment_id_${comment.commentid}"><span class="ff_comment_button_hide">
					<c:choose>
					<c:when test="${comment.uid == loginPsfUid}">
					<a href="javascript:delComment('${comment.commentid}',${param.otype},${param.oid});">删除</a>&nbsp;|&nbsp;
					</c:when>
					<c:otherwise>
					<a href="#">举报</a>&nbsp;|&nbsp;
					<a href="javascript:addBlacklist(${comment.uid},'${comment.username}');">黑名单</a>&nbsp;|&nbsp;
					<c:if test="${mainUid == loginPsfUid}">
					<a href="javascript:delComment('${reply.commentid}',${param.otype},${param.oid});">删除</a>&nbsp;|&nbsp;
					</c:if>
					</c:otherwise>
					</c:choose>
					<!-- <a href="#">转发</a>&nbsp;|&nbsp; -->
					</span><a href="javascript:toggleCommentReply('${comment.commentid}');">回复</a></div>
					</c:if>
                    
                    <div class="comment_time">${comment.timepassed}</div>
                    
				</div>
			</div>
		</li>
		<c:forEach items="${replyComments.list}" var="reply" varStatus="status2">
		<li class="comment_item comment_indent">
			<div psftype="card" uid="${reply.uid}" class="comment_avatar">
				<img src="/pic/${reply.avatarFileName }"/>
			</div>
			<div class="comment_item_content ff_comment_button_show">
				<div class="comment_item_row1">
					<span psftype="card" uid="${reply.uid}" class="comment_username">${reply.username}：</span>
					<span class="comment_content" id="ff_comment_id_${reply.commentid}">${reply.delflag == 1 ? "该品论已删除。" : reply.content}</span>
				</div>
				<div class="comment_item_row2">
					<c:if test="${reply.delflag == 0}">
					<div class="comment_actions" id="ff_del_comment_id_${comment.commentid}"><span class="ff_comment_button_hide">
					<c:choose>
					<c:when test="${reply.uid == loginPsfUid}">
					<a href="javascript:delComment('${reply.commentid}',${param.otype},${param.oid});">删除</a>&nbsp;|&nbsp;
					</c:when>
					<c:otherwise>
					<a href="#">举报</a>&nbsp;|&nbsp;
					<a href="javascript:addBlacklist(${reply.uid},'${reply.username}');">黑名单</a>&nbsp;|&nbsp;
					</c:otherwise>
					</c:choose>
					<!-- <a href="#">转发</a>&nbsp;|&nbsp; -->
					</span><a href="javascript:toggleCommentReply('${comment.commentid}','${reply.commentid}','${reply.username}');">回复</a></div>
					</c:if>
					<div class="comment_time">${reply.timepassed}</div>
				</div>
			</div>
		</li>
		</c:forEach>
	</ul>
<c:if test="${!empty replyComments.list}">
	<psf:page pageCount="${pageCount}" page="${curPage}" href="javascript:getCommentReply(${comment.commentid},#page#);" action=""></psf:page>
</c:if><input type="button" onclick="closeCommentReplyDialog();" value="关闭"></input>
</div>
<script type="text/javascript">
initPsfTypes();
</script>
