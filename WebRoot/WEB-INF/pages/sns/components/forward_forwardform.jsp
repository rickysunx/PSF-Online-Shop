<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<script>
$(document).ready(function(){
//$("#forward_forward_smaily").click(function(){alert("left:"+$(this).getElCoordinate().left+" top:"+$(this).getElCoordinate().top);});
//$("#forward_forward_smaily").click(function(){alert("left:"+$(this).position().left+" top:"+$(this).position().top);});

	$("#forward_forward_smaily").psfSmiley({
		target:function(e,m){
		$(m).parents("form").find("textarea").val($(m).parents("form").find("textarea").val()+e);
		},
		init:function(){
		}
	});
	$(".extMsg").toggle(function(){
		$(".extMsgbox").css("height","auto");
	},function(){
		$(".extMsgbox").css("height","18px");
	});
});
</script>
<div class="broadcastCon"> 
	<form id="sendTransmitForm"> 
		<c:if test="${objtype eq 0}">
			<input name="forwardid" type="hidden" value="${(!empty parentPost) ? parentPost.postid : postItem.postid}"/><!-- 记录最原始的转发记录 -->
			<input name="replyid" type="hidden" value="${postItem.postid}"/><!-- 当前转发的帖子ID，更新其转发数 -->
		</c:if>
		<c:if test="${objtype eq 1}">
			<input name="url" type="hidden" value="gt/${topic.topictitle}/${topic.groupid}"/>
		</c:if>
		
		<div class="broadHeader"> 
			<label for="br1" class="right">我也来说两句吧~</label> 
		</div> 
		<div>
			<textarea id="content" class="textarea" name="blogContent"><c:if test="${(objtype eq 0) && (!empty parentPost)}">//@${postItem.userName}: ${postItem.listContent}</c:if><c:if test="${objtype eq 1}">//@${topic.username} 在圈子"${topic.groupname}"里发起的话题挺不错的，大家一起来讨论吧！</c:if>
			</textarea>
		</div> 
		<div class="txtarea_bottom s_clear"> 
			<div class="face faceimg"> 
				<a id="forward_forward_smaily" href="javascript:void(0)"><em></em></a> 
			</div> 
			
			<c:if test="${objtype != 1}">
			<div class="ckgroup"> 
				<p><input id="p1" type="checkbox" name="uid" value="${postItem.uid}"/><label for="p1">同时评论给</label> <a href="#" id="transmitDialogName">${postItem.userName}</a></p> 
				<c:if test="${!empty parentPost}">
					<p><input id="p2" type="checkbox" name="ouid" value="${postItem.uid}"/><label for="p2">同时评论给原文作者</label> <a href="#" id="transmitDialogName2">${parentPost.userName}</a></p> 
				</c:if>
			</div> 
			</c:if>
			
			<div class="right"><a class="button11" href="javascript:sendTransmit();">转发</a></div> 
		</div> 
		<div class="extMsgbox"> 
			<div> 
				<a class="right extMsg" href="javascript:void(0)"></a>
				<c:if test="${objtype eq 0}">
					<a href="#">@${(empty parentPost)? postItem.userName : parentPost.userName}：</a>${(empty parentPost)? postItem.listContent : parentPost.listContent} 
				</c:if>
				<c:if test="${objtype eq 1}">
					提示：系统将生成一条原文短链接，占用一定字数。
				</c:if>
			</div> 
		</div> 
	</form>
</div>