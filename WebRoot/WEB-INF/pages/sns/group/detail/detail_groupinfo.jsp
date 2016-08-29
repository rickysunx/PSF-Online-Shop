<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<script type="text/javascript">
	function joinGroup(groupid, grouptype){
		$("#apply_dialog").psfDialog({"center":true,"modal":true});
		/**
		var param = "groupid="+groupid+"&grouptype="+grouptype;
		$.post(
			"/sns/group/apply",
			param,
			function(result){
				if(!result.success){
					$.psfInfoDialog(result.message);
					return false;
				}else{
					if(result.success == 1){
						$.psfInfoDialog(result.message);
						var content = '<a href="javascript:void(0)">已加入</a> | <a href="javascript:void(0)" onclick="quitGroup('+groupid+')">退出</a>'
						$(".statusbox").html(content);
						$(".invite_friend").removeClass("hide");
					}else if(result.success == 2){
						$.psfInfoDialog(result.message);
					}
				}
			},
			"json"
		);
		*/
	}
	
	function send_apply(formid){
		var content = $("#apply_reason").val();
		alert(content);
		if(content == undefined || $.trim(content)==''){
			$.psfInfoDialog("请输入申请说明！");
			return false;
		}
		var param = $("#"+formid).serialize();
		$.post(
			"/sns/group/apply",
			param,
			function(result){
				if(!result.success){
					$.psfInfoDialog(result.message);
					return false;
				}else{
					if(result.success == 1){
						$.psfInfoDialog(result.message);
						var content = '<a href="javascript:void(0)">已加入</a> | <a href="javascript:void(0)" onclick="quitGroup('+groupid+')">退出</a>'
						$(".statusbox").html(content);
						$(".invite_friend").removeClass("hide");
					}else if(result.success == 2){
						var content = '<a>申请正在审核中...</a>'
						$(".statusbox").html(content);
						$.psfInfoDialog(result.message);
					}
				}
			},
			"json"
		);
	}
	
	function closeApplyDialog(){
		$("#apply_dialog").psfDialogClose();
	}
	
	function quitGroup(groupid){
		var param = "quit=1&groupid="+groupid;
		if(confirm("确定退出该圈子?")){
			$.post(
				"/sns/group/manage/del_groupfriend",
				param,
				function(result){
					if(result.success){
						$.psfInfoDialog(result.message);
						var content = '<a href="javascript:void(0)" onclick="joinGroup('+result.groupid+','+result.grouptype+')">加入圈子</a>';
						$(".statusbox").html(content);
						$(".invite_friend").addClass("hide");
					}else{
						$.psfInfoDialog(result.message);
						return false;
					}
				},
				"json"
			);
		}
	}
	
</script>

<dl class="group_user_box">
	<dt><a href="#"><img src="/pic/${group.logo}" alt="${group.groupname}"/></a></dt>
    <dd>
    	<h1>${group.groupname}<span>（群号：${10000+group.groupid}）</span></h1>
        <div class="data">
      		<span><a href="#">圈友</a><b>${group.membercount}</b></span>
            <span><a href="#">品友</a><b>${group.psfFriendCount }</b></span>
            <span><a href="#">话题</a><b>${group.topicCount}</b></span>
            <span><a href="#">发言</a><b>${group.postCount}</b></span>
        </div>
        <p><b>类别：</b>${group.groupclass}</p>
        <p><span><b>地区：</b>${group.zonename}</span><span><b>创建时间：</b>${group.createtime}</span></p>
        <div class="info">
        	<b>简介：</b>${group.intro}
        </div>
        <div class="bottom">
            <!-- 圈子类型，如果圈子类型为私密，则不能申请加入 -->
	        <c:if test="${group.grouptype != 4}">
            <div class="statusbox">
	            <c:choose>
	            	<c:when test="${group.isJoin}">
	            		<c:if test="${group.role eq 2}">
	            			<a href="javascript:void(0)" onclick="dismiss(${group.groupid})">解散圈子</a>
	            		</c:if>
	            		<c:if test="${group.role != 2}">
	            			<a href="javascript:void(0)">已加入</a> | <a href="javascript:void(0)" onclick="quitGroup(${group.groupid})">退出</a>
	            		</c:if>
	            	</c:when>
	            	<c:otherwise>
	            		<c:if test="${group.isApplied}">
	            			<a>申请正在审核中...</a>
	            		</c:if>
	            		<c:if test="${!group.isApplied}">
	            			<a href="javascript:void(0)" onclick="joinGroup(${group.groupid},${group.grouptype})">加入圈子</a>
	            		</c:if>
	            	</c:otherwise>
	            </c:choose>
            </div>
            </c:if>
            
            <c:if test="${(group.role eq 1) || (group.role eq 2)}"><a class="manage" href="/sns/group/manage?groupid=${group.groupid}"><em></em>圈子管理</a></c:if>
            
           		<a class="invite_friend ${group.isJoin ? '' : 'hide'}" href="/sns/group/manage/inviteabout?groupid=${group.groupid}"><em></em>邀请好友</a>
            <c:if test="${group.grouptype != 4}">
            	<a class="brocast" href="javascript:void(0)" onclick="promoteGroup(${group.groupid})"><em></em>推荐到广播</a>
            </c:if>
        </div>
    </dd>
</dl>

<div id="apply_dialog" class="hide" style="height:143px;">
	<div class="layerTop">
		<a class="close" href="javascript:void(0)" onclick="closeApplyDialog()"></a>
		<h5>申请加入圈子——${group.groupname}</h5>
	</div>
	<div class="ask_for_follow" style="background:#fff;width:280px"> 
		<form id="apply_form"> 
			<input type="hidden" name="groupid" value="${group.groupid}"/>
			<input type="hidden" name="grouptype" value="${group.grouptype}"/>
			<div> 
				<h6><span>*</span> 申请理由：</h6> 
				<p><textarea id="apply_reason" name="content"></textarea></p> 
				<p class="ask_for_follow_buttons"> 
					<a class="psf_dialog_button" href="javascript:void(0)" onclick="send_apply('apply_form')">发送</a>&nbsp;&nbsp;
					<a class="psf_dialog_button" href="javascript:void(0)" onclick="closeApplyDialog()">取消</a> 
				</p> 
			</div> 
		</form> 
	</div> 
</div>