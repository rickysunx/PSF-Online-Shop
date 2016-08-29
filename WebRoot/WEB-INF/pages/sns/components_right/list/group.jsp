<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<div class="group_right_list">
	<c:if test="${empty groups.list}">
		<div class="right_nodata">${message}</div>
	</c:if>
	
	<c:forEach items="${groups.list}" var="group">
		<div class="group_right_item">
			<div class="group_right_pic">
				<a href="/sns/group/detail?groupid=${group.groupid}" target="_blank"><img src="/pic/${group.logo}" title="${group.groupname}"/></a>
			</div>
			<div class="group_right_name">
				<a href="/sns/group/detail?groupid=${group.groupid}" target="_blank" title="${group.groupname}">${group.groupname}</a>
			</div>
			<div class="group_right_user">
				<a href="#" title="${group.displayName}">${group.displayName}</a>
			</div>
			<div class="group_right_friend_count">
				圈友
				<span>${group.membercount}</span>
			</div>
			<div class="group_right_opic_count">
				话题
				<span>${group.postCount}</span>
			</div>
		</div>
	</c:forEach>
	
	<div class="group_right_right_prev_and_next">
		<c:if test="${groups.pageCount > 1}">
			<c:if test="${(typeid eq 1) || (typeid eq 2)|| (typeid eq 3)|| (typeid eq 4)}">
				<psf:simplepage pageCount="${groups.pageCount}" href="#index_tab" action="javascript:loadRecommend('${divid}',2,#page#,${typeid})" page="${page}"></psf:simplepage>	
			</c:if>
			<c:if test="${typeid eq 5}">
				<psf:simplepage pageCount="${groups.pagCount}" href="#index_tab" action="javascript:loadRecommend('${divid}',2,#page#,${typeid},{'uid':${uid}})" page="${page}"></psf:simplepage>
			</c:if>
		</c:if>
	</div>
	
</div>