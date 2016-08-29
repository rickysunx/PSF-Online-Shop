<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<script type="text/javascript">
	/**
	*	邀请处理
	*   @param type  1-通过，2-拒绝，3-忽略
	*   @param applyid
	*/
	function handleInvite(type, applyid){
		var param = "type="+type+"&applyid="+applyid;
		
		$.post(
			"/sns/group/handle_apply",
			param,
			function(result){
				if(result.success){
					$.psfInfoDialog("操作成功");
					loadInviteList(1);
				}else{
					$.psfInfoDialog(result.message);
					return false;
				}
			},
			"json"
		);
	}
</script>
<div>
	<c:if test="${empty invitelist}">
		<!-- <div class="group_right_list_invite s_clear">当前您没有圈子邀请</div> -->
		<div class="right_nodata">当前您没有圈子邀请</div>
	</c:if>
	<c:forEach items="${invitelist}" var="invite">
	<div class="group_right_list_invite s_clear">
		<div class="group_right_list_invite_img"><img width="84px" height="69px" src="/pic/${invite.logo}"/></div>
		<div class="group_right_list_invite_text">
			<p>${invite.groupname}</p>
			<div><a href="javascript:void(0)" onclick="handleInvite(1,${invite.applyid})">接受</a>
			<a href="javascript:void(0)" onclick="handleInvite(2,${invite.applyid})">拒绝</a>
			<a href="javascript:void(0)" onclick="handleInvite(3,${invite.applyid})">忽略</a></div>
		</div>
	</div>
	</c:forEach>
</div>
<div class="product_right_right_prev_and_next">
	<psf:simplepage pageCount="${pageCount}" action="loadInviteList(#page#)" page="${page}"></psf:simplepage>
</div>
	