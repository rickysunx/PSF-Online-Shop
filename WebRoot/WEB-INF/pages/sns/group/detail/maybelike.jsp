<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<script type="text/javascript">
	function loadRecommendGroup(groupid, page){
		var param = "groupid="+groupid+"&page="+page;
		$("#maylike_groups").html("<div class='post_list_loading'><img src='/images/loading.gif'/></div>");
		$("#maylike_groups").load(
			"/sns/group/detail/right_group",
			param
		);
	}
	
	$(function(){
		loadRecommendGroup(${group.groupid},1);
	});
</script>

<div class="group_right_list">
	<div class="group_body">
        <h5>猜你喜欢的圈子</h5>
        <div id="maylike_groups"></div>
    </div>
</div>