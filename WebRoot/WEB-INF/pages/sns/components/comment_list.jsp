<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<script>
$(document).ready(function(){
	$(".smailylink").psfSmiley({
		target:function(e,m){
			$(m).parents("form").find("textarea").val($(m).parents("form").find("textarea").val()+e);
		},
		init:function(){
		}
	});
})
</script>
<div class="comment_list">
	<div class="comment_form">
		<form id="commentForm_${otype}_${oid}" action="/action/sns/add_comment" method="post">
		<input name="otype" value="${otype}" type="hidden"/>
		<input name="oid" value="${oid}" type="hidden"/>
		<input name="touid" value="${mainUid}" type="hidden"/>
		<!--<div><textarea name="content"></textarea></div>  //这是ie6,ie7的bug-->
        <textarea name="content"></textarea>
		<ul>
			<li><a class="smailylink" href="javascript:void(0)"><em></em>表情</a></li>
			<li><input name="addToBlog" type="checkbox" value="1"/><label>同时转发到我的广播</label></li>
			<li class="comment_form_right"><a class="comment_button" href="javascript:submitComment('commentForm_${otype}_${oid}');">发布</a></li>
		</ul>
		</form>
	</div>
	<c:forEach items="${commentList.list}" var="comment" varStatus="status1">
	<c:choose>
	<c:when test="${status1.count < 11}">
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
					<a href="javascript:delComment('${comment.commentid}',${param.otype},${param.oid});">删除</a>&nbsp;|&nbsp;
					</c:if>
					</c:otherwise>
					</c:choose>
					<!-- <a href="#">转发</a>&nbsp;| &nbsp;-->
					</span><a href="javascript:toggleCommentReply('${comment.commentid}');">回复</a></div>
					</c:if>
                    
                    <div class="comment_time">${comment.timepassed}</div>
                    
				</div>
			</div>
		</li>
		<c:forEach items="${comment.replyComments}" var="reply" varStatus="status2">
		<c:choose>
		<c:when test="${status2.count < 4}">
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
					<c:if test="${mainUid == loginPsfUid}">
					<a href="javascript:delComment('${reply.commentid}',${param.otype},${param.oid});">删除</a>&nbsp;|&nbsp;
					</c:if>
					</c:otherwise>
					</c:choose>
					<!-- <a href="#">转发</a>&nbsp;|&nbsp; -->
					</span><a href="javascript:toggleCommentReply('${comment.commentid}','${reply.commentid}','${reply.username}');">回复</a></div>
					</c:if>
					<div class="comment_time">${reply.timepassed}</div>
				</div>
			</div>
			<c:if test="${status2.count == 3 && (!status2.last)}">
			<div class="comment_expend_more" style="text-align:right;"><a href="javascript:openCommentReplyDialog(${comment.commentid},1);">更多回复&nbsp;>>>&nbsp;&nbsp;</a></div>
			</c:if>
		</li>
		</c:when>
		</c:choose>
		</c:forEach>
	</ul>
	</c:when>
	<c:when test="${status1.count == 11}">
	<div class="comment_expend_more"><a href="/sns/comment/list_all?otype=${otype}&oid=${oid}">展开更多品论</a></div>
	</c:when>
	</c:choose>
	</c:forEach>
</div>
<script type="text/javascript">
$("a[psftype='comment'][otype='${otype}'][oid='${oid}']").text("品论(${commentCount})");
initPsfTypes();
</script>
