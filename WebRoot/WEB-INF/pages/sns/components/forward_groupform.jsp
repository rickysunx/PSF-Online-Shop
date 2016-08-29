<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<script>
$(document).ready(function(){
//$("#forward_forward_smaily").click(function(){alert("left:"+$(this).getElCoordinate().left+" top:"+$(this).getElCoordinate().top);});

	$("#forward_group_smaily").psfSmiley({
		target:function(e,m){
		$(m).parents("form").find("textarea").val($(m).parents("form").find("textarea").val()+e);
		},
		init:function(){
		}
	});
	
	$("#forwardbox_button").click(function(){
		$(".forwardbox_list").show().css("top",$(this).position().top+this.offsetHeight).css("left",$(this).position().left);
	});
	$(".forwardbox_list .button .cancel").click(function(){$(".forwardbox_list").hide()});
	$(".forwardbox_list .button .submit").click(function(){
		var groupids = "";
		var groupnames = "";
		$(".forwardbox_list ul :checkbox:checked").each(function(){
			//alert($(this).val());
			//alert($(this).parent().text());
			groupids += $(this).val()+",";
			groupnames += $(this).parent().text()+",";
		});
		groupnames = $.trim(groupnames).substr(0,groupnames.length-1);
		$("#groupids").val(groupids);
		$("#group_names").text(groupnames);
		$(".select_group").hide();
		$(".selected").show();
		$(".forwardbox_list").hide();
	});
});
</script>
	<div class="send_msg"> 
		<form id="sendTransmitForm"> 
			<c:if test="${objtype eq 0}">
				<input type="hidden" value="${(!empty parentPost) ? parentPost.postid : postItem.postid}" name="forwardid"/>
				<input type="hidden" value="${postItem.postid}" name="replyid"/>
			</c:if>
			<c:if test="${objtype eq 1}">
				<input name="url" type="hidden" value="gt/${topic.topictitle}/${topic.groupid}"/>
				<input type="hidden" value="0" name="forwardid"/>
				<input type="hidden" value="0" name="replyid"/>
			</c:if>
			<input id="groupids" type="hidden" name="groupids"/>
			
			<div class="send_msg_title selected" style="display:none;">
				<span id="selected_group_title" style="color:#0D3F92;margin-left:10px;">你所选择的圈子:</span>
			</div>
			<div class="send_msg_title selected" style="display:none;">
				<p id="group_names" style="margin-left:10px;"></p>
			</div>
			
			<div class="send_msg_title select_group"> 
				<h6 >选择圈子：</h6> 
				<p> 
					<a id="forwardbox_button" class="button11" href="javascript:void(0)">选择圈子</a>
				</p> 
				<div class="forwardbox_list" style="display:none">
					<c:if test="${empty grouplist}">
						<p>您当前没有加入圈子</p>
					</c:if>
					<c:if test="${!empty grouplist}">
						<ul class="s_clear">
							<c:forEach items="${grouplist}" var="group">
								<li><input type="checkbox" value="${group.groupid}"/>${group.groupname}</li>
							</c:forEach>
						</ul>
					</c:if>
					<div class="button"><a href="javascript:void(0)" class="submit">确定</a><a href="javascript:void(0)" class="cancel">取消</a>
					<!-- <a href="javascript:void(0)">上一组</a><a href="javascript:void(0)">下一组</a> --></div>
				</div>
			</div> 
			
			<div class="send_msg_content s_clear"> 
				<h6>内容：</h6> 
				<p> 
					<c:if test="${objtype eq 0}">
						<textarea name="blogContent">转发微博：-//@${postItem.userName}:${postItem.listContent}<c:if test="${!empty parentPost}">-//@${parentPost.userName}:${parentPost.listContent}</c:if>
						</textarea>
					</c:if>
					<c:if test="${objtype eq 1}">
						<textarea name="blogContent">//@${topic.username} 在圈子"${topic.groupname}"里发起的话题挺不错的，大家一起来讨论吧！</textarea>
					</c:if>
				</p> 
			</div> 
			
			<div class="txtarea_bottom s_clear"> 
				<div class="face faceimg"> 
					<a id="forward_group_smaily" href="javascript:void(0)"> 
						<em></em> 
					</a> 
				</div> 
				
				<div class="right"> 
					<a class="button11" href="javascript:void(0)" onclick="sendTransmit();">转发</a> 
				</div> 
			</div> 
		</form> 
	</div> 