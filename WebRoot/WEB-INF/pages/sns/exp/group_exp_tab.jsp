<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<script type="text/javascript">
	$(function(){
		initInput("search_shopexp","搜索体验");	//初始化搜索框
	});
</script>
<div class="tab_menu">
	<div class="searchbox01">
		<input id="search_shopexp" name="keyword" />
		<a class="searchbtn" href="javascript:void(0);" onclick="javascript:loadGroupFriendExp(-1,-1,$('#search_shopexp').val(),1,-1)"></a>
	</div>
	<div class="linkbox">
		<dl groupid="0">
			<dt><a class="current" href="javascript:void(0)" onclick="javascript:loadGroupFriendExp(0,-1,null,1,-1)"><span><span>全部</span></span></a></dt>
		</dl>
		<c:forEach items="${grouplist}" var="group" begin="0" end="3">
			<dl><dt>|</dt></dl>
			<dl groupid="${group.groupid}">
				<dt><a href="javascript:void(0)" onclick="javascript:loadGroupFriendExp(${group.groupid},-1,null,1,-1)"><span><span>${group.groupname}</span></span></a></dt>
			</dl>
		</c:forEach>
		
		<c:if test="${fn:length(grouplist)>4}">
		<dl class="dropmenu">
			<dt><a class="morebtn" href="#"><i>更多</i><span></span></a></dt>
			<dd>
				<ul>
					<c:forEach items="${grouplist}" var="group" begin="4">
					<li><a groupid="${group.groupid}" href="javascript:void(0)" onclick="javascript:loadGroupFriendExp(${group.groupid},-1,null,1,-1)">${group.groupname}</a></li>
					</c:forEach>
				</ul>
			</dd>
		</dl>
		</c:if>
	</div>
</div>