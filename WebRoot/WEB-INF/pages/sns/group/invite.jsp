<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<script type="text/javascript">
	function loadInviteList(page){
		var param = "page="+page;
		$("#invitation_list").html("<div style='text-align:center;'><img src='/images/loading.gif'></div>");
		$("#invitation_list").load(
			"/sns/group/invite_list",
			param
		);
	}
	
	$(function(){
		loadInviteList(1);
	});
</script>

<div class="hor3-list">
	<div class="sns-statustitle"><h3>圈子邀请</h3></div>
	<div id="invitation_list"></div>
</div>