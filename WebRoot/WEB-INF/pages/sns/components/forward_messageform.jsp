<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<script>
$(document).ready(function(){
//$("#forward_forward_smaily").click(function(){alert("left:"+$(this).getElCoordinate().left+" top:"+$(this).getElCoordinate().top);});

	$("#forward_message_smaily").psfSmiley({
		target:function(e,m){
		$(m).parents("form").find("textarea").val($(m).parents("form").find("textarea").val()+e);
		},
		init:function(){
		}
	});
	//收信人下拉
	$("#shouxinrenID").getPsfFriend("/action/sns/get_at_user",function(e){
		$("#shouxinrenUID").val(e);
		//alert($("#shouxinrenUID").val());
	});
});
</script>
<div class="send_msg"> 
	<form id="sendMsgToTa2"> 
		 
		<div class="send_msg_title"> 
			<h6>收信人：</h6> 
			<p> 
				<input id="shouxinrenID" type="text" name="touname" style="width:100px;height:18px;margin-top: 5px;">
				<input id="shouxinrenUID" type="hidden" name="msgtouid" value="" />
				<%--
				<select name="touid">
					<option value="">选择收信人</option>
					<c:forEach items="${userlist}" var="user">
						<option value="${user.uid}">${user.userName}<c:if test="${!empty user.remarkName}">(${user.remarkName})</c:if></option>
					</c:forEach>
				</select>
				--%>
			</p> 
		</div> 
		
		<div class="send_msg_content s_clear"> 
			<h6>内容：</h6> 
			<p> 
				<textarea name="content">给你推荐一条微博：-//@${postItem.userName}:${postItem.listContent}<c:if test="${!empty parentPost}">-//@${parentPost.userName}:${parentPost.listContent}</c:if>
				</textarea> 
			</p> 
		</div>
		 
		<div class="txtarea_bottom s_clear"> 
			<div class="face faceimg"> 
				<a id="forward_message_smaily" href="javascript:void(0)"> 
					<em></em> 
				</a> 
			</div> 
			<div class="right"> 
				<a class="button11" href="javascript:sendMsg('sendMsgToTa2');">转发</a> 
			</div> 
		</div> 
	</form> 
</div> 