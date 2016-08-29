<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!-- 圈子指南二级页签 --> 
<script type="text/javascript">
	$(function(){
		initInput("search_guide","搜索指南");	//初始化搜索框
	});
</script>
<div class="tab_menu">
	<div class="searchbox01">
		<input id="search_guide" name="keyword" />
		<a class="searchbtn" href="javascript:void(0);" onclick="javascript:loadGroupFriendGuide(-1,-1,$('#search_guide').val(),1,-1)"></a>
	</div>
	<div class="linkbox">
		<dl groupid="0">
			<dt><a class="current" href="javascript:void(0)" onclick="javascript:loadGroupFriendGuide(0,-1,null,1,-1)"><span><span>全部</span></span></a></dt>
		</dl>
		<c:forEach items="${grouplist}" var="group" begin="0" end="3">
		<dl><dt>|</dt></dl>
		<dl groupid="${group.groupid}">
			<dt><a href="javascript:void(0)" onclick="javascript:loadGroupFriendGuide(${group.groupid},-1,null,1,-1)"><span><span>${group.groupname}</span></span></a></dt>
		</dl>
		</c:forEach>
		<!--
		<dl><dt>|</dt></dl>
		<dl>
			<dt><a href="#"><span><span>真心话</span></span></a></dt>
		</dl>
		<dl><dt>|</dt></dl>
		<dl>
			<dt><a href="#"><span><span>运动盛世</span></span></a></dt>
		</dl>
		<dl><dt>|</dt></dl>
		<dl>
			<dt><a href="#"><span><span>宅男宅女</span></span></a></dt>
		</dl>
		<dl><dt>|</dt></dl>
		-->
		<c:if test="${fn:length(grouplist)>4}">
		<dl class="dropmenu">
			<dt><a class="morebtn" href="#"><i>更多</i><span></span></a></dt>
			<dd>
				<ul>
					<c:forEach items="${grouplist}" var="group" begin="4">
					<li><a groupid="${group.groupid}" href="javascript:void(0)" onclick="javascript:loadGroupFriendGuide(${group.groupid},-1,null,1,-1)">${group.groupname}</a></li>
					</c:forEach>
				</ul>
				<!--
				<ul>
					<li><a class="icon icon-add" href="#"><em></em>创建分组</a></li>
					<li><a class="icon icon-adj" href="#"><em></em>调整分组顺序</a></li>
				</ul>
				-->
			</dd>
		</dl>
		</c:if>
	</div>
</div>