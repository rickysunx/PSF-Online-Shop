<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<script type="text/javascript">
	function invite(groupid) {
		if($("#invite_friend_dialog").length==0){
			$("body").append("<div id='invite_friend_dialog' style='display:none;'></div>");
		}
		var options = {center: true, modal:true};
		var dialogId = $("#invite_friend_dialog").psfDialog(options, function(target){
			$("#invite_friend_dialog").html("<div style='text-align:center;'><img src='/images/loading.gif'></div>");
			$("#invite_friend_dialog").load("/sns/group/manage/invite_dialog",{"page":1,"groupid":groupid},function(){
				$("#psfDialog_"+dialogId).psfCenter();
			});
		});
	}
	
	function closeInviteDialog(){
		$("#invite_friend_dialog").psfDialogClose();
	}
	
	var invited_param = {
		"groupid" : ${group.groupid},
		"uids" : null,
		"page" : 1
	};
	function hasInvitedUser(uids,page){
		if(page != -1){
			invited_param["page"] = page;
		}if(uids != null){
			invited_param["uids"] = uids;
		}
		var param1 = "groupid="+invited_param["groupid"]+"&page="+invited_param["page"];
		if(invited_param["uids"] != null){
			param1 += "&"+invited_param["uids"];
		}
		$(".invite_selectbox").html("<div style='text-align:center;'><img src='/images/loading.gif'></div>");
		$(".invite_selectbox").load(
			"/sns/group/manage/hasinvited_userlist",
			param1
		);
	}
	
	/*	清空选择列表*/
	function clearUser(){
		hasInvitedUser("",1);
	}
	
	function submit_invitation() {
		var param = $("#selected_userform").serialize();
		if(param == ''){
			$.psfInfoDialog("请选择邀请对象!");
			return false;
		}
		var invitation = $("#invitation").val();
		if(invitation == undefined || invitation == ''){
			$.psfInfoDialog("请输入邀请说明!");
			return false;
		}
		param += "&groupid=${group.groupid}&invitation="+invitation;
		$.post(
			"/sns/group/save_invitation",
			param,
			function(result){
				if(result.success){
					$.psfInfoDialog("邀请成功!");
					clearUser();
					$("#invitation").val("");
				}else{
					$.psfInfoDialog(result.message);
					return false;
				}
			},
			"json"
		);
	}
	
	$(function(){
		hasInvitedUser(null,1);
	});
</script>

<dl class="invitebox">

	<dt>
    	<a href="/sns/group/manage/invitefriend?groupid=${group.groupid}">选择其他邀请方式&gt;&gt;</a>
        <h3>邀请他们加入</h3>
    </dt>
    
    <dd>
    	<h5><a href="javascript:void(0)" onclick="invite(${group.groupid})">立即邀请</a></h5>
        <div class="invite_selectbox"></div>
    </dd>
    
    <dd>
    	<h5><em></em>对他们说点什么</h5>
        <textarea id="invitation" name="invitation"></textarea>
        <div class="buttons">
        	<a href="javascript:void(0)" onclick="submit_invitation()">发送邀请</a>
        </div>
    </dd>

</dl>