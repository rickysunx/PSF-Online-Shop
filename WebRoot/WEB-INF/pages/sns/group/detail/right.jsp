<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<script type="text/javascript">
	function loadGroupFriends(groupid, divid, type, page){	//type：1-管理员; 2-在线圈友 ;3-新人报道
		var param = "groupid="+groupid+"&divid="+divid+"&type="+type+"&page="+page;
		$("#"+divid).html("<div style='text-align:center;'><img src='/images/loading.gif'></div>");
		$('#'+divid).load(
			"/sns/group/detail/right_user",
			param
		);
	}
	
	function addFollowHandle5(uid){
		$(".follow_"+uid).addClass("hide");
		$(".unfollow_"+uid).removeClass("hide");
	}
	
	function delFollowHandle5(uid){
		$(".follow_"+uid).removeClass("hide");
		$(".unfollow_"+uid).addClass("hide");
	}
</script>

<psf:include page="/sns/group/detail/announcement.jsp"/>
<psf:include page="/sns/group/detail/groupinfo.jsp"/>

<c:if test="${(group.grouptype < 3) || (group.isJoin)}">
	<psf:include page="/sns/group/detail/hottopic.jsp"/>
</c:if>

<psf:include page="/sns/group/detail/onlinepsffriend.jsp"/>
<psf:include page="/sns/group/detail/newmember.jsp"/>
<psf:include page="/sns/group/detail/maybelike.jsp"/>