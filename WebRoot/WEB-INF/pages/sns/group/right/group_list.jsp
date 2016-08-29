<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<script type="text/javascript">
	/**
	function join(groupid, grouptype){
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
						$("#join_group"+groupid).addClass("hide");
						$("#quit_group"+groupid).removeClass("hide");
					}else if(result.success == 2){
						$.psfInfoDialog(result.message);
					}
				}
			},
			"json"
		);
	}
	
	function quit(groupid){
		var param = "quit=1&groupid="+groupid;	//quit=1表示单个圈友删除
		if(confirm("确定退出该圈子?")){
			$.post(
				"/sns/group/manage/del_groupfriend",
				param,
				function(result){
					if(result.success){
						$.psfInfoDialog(result.message);
						$("#join_group"+groupid).removeClass("hide");
						$("#quit_group"+groupid).addClass("hide");
					}else{
						$.psfInfoDialog(result.message);
						return false;
					}
				},
				"json"
			);
		}
	}*/
</script>

<div class="list">
	<c:if test="${empty grouplist}">
		<p style="text-align:center">当前没有推荐的圈子</p>
	</c:if>
	<c:forEach items="${grouplist}" var="group">
	<dl>
		<dt><a href="/sns/group/detail?groupid=${group.groupid}" target="_blank"><img width="34px;" height="34px;" src="/pic/${group.logo}" alt="" /></a></dt>
	    <dd>
	    	<h6><a href="/sns/group/detail?groupid=${group.groupid}" target="_blank">${group.groupname}</a></h6>
	    	<c:if test="${group.grouptype != 4}">
	        	<p>
	        		<!--
	        		<a id="join_group${group.groupid}" href="javascript:void(0)" class="${group.isJoin ? 'hide' : ''}" onclick="join(${group.groupid},${group.grouptype})">加入</a>
	        		<a id="quit_group${group.groupid}" href="javascript:void(0)" class="${group.isJoin ? '' : 'hide'}" onclick="quit(${group.groupid})">退出</a>
	        		-->
	        		<a href="/sns/group/detail?groupid=${group.groupid}" class="${group.isJoin ? 'hide' : ''}" target="_blank">加入</a>
	        		<a class="${group.isJoin ? '' : 'hide'}" style="color: gray;">已加入</a>
	        	</p>
	        </c:if>
	    </dd>
	</dl>
	</c:forEach>
</div>
<div class="more">
	<psf:simplepage pageCount="${pageCount}" action="javascript:loadRecommendGroup(${groupid},#page#)" page="${page}"></psf:simplepage>
</div>
    	