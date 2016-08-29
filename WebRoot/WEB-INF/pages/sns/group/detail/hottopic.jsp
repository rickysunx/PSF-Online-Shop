<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<script type="text/javascript">
	function loadHotTopics(groupid, page){
		var param = "groupid="+groupid+"&page="+page;
		$("#right_topiclist").html("<div class='post_list_loading'><img src='/images/loading.gif'/></div>");
		$("#right_topiclist").load(
			"/sns/group/detail/right_topic",
			param
		);
	}
	
	$(function(){
		loadHotTopics(${group.groupid}, 1);
	});
</script>

<div class="group_right_list">
	<div class="group_body">
        <h5><a class="right" href="/sns/group/detail/topiclist?groupid=${group.groupid}">更多话题&gt;&gt;</a>热门话题</h5>
        <div id="right_topiclist"></div>
    </div>
</div>