<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<div class="psf_friend_right_list">
	
	<c:if test="${empty users.list}">
		<div class="right_nodata">${message}</div>
	</c:if>
	
	<c:forEach items="${users.list}" var="user">
		<div class="psf_friend_item">
			<div class="psf_friend_pic">
				<a href="#"><img src="/pic/${user.avatarFileName}"/></a>
			</div>
			<div class="psf_friend_username">
				<a>${user.username}</a>
			</div>
			
			
			<c:choose>
				<c:when test="${user.isFollow}">
					<div class="btns" style="text-align:center;" psftype="delfollow" uid="${user.uid}">
						<a href="javascript:delFollow(${user.uid},delFollowHandle1)" class="okbtn"><em></em>已关注</a>
					</div>
				</c:when>
				<c:otherwise>
					<div class="psf_friend_addfollow" psftype="addfollow" uid="${user.uid}">
						<a href="javascript:addFollow(${user.uid},addFollowHandle1)">加关注</a>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</c:forEach>
	
	<!-- 组数大于1才显示 -->
		<div class="psf_friend_right_prev_and_next">
       		<c:if test="${users.pageCount > 1 }" >
       			<c:if test="${(typeid eq 1) || (typeid eq 2) || (typeid eq 3)}">
       				<psf:simplepage pageCount="${users.pageCount}" href="#index_tab" action="javascript:loadRecommend('${divid}',1,#page#,${typeid})" page="${page}"></psf:simplepage>	
	       		</c:if>
	       		<c:if test="${(typeid eq 4) || (typeid eq 5) || (typeid eq 6)}">
	       			<psf:simplepage pageCount="${users.pageCount}" href="#index_tab" action="javascript:loadRecommend('${divid}',1,#page#,${typeid},{'postid':${postid}})" page="${page}"></psf:simplepage>	
	       		</c:if>
	       		<c:if test="${(typeid eq 7) || (typeid eq 8) || (typeid eq 9)|| (typeid eq 10)}">
	       			<psf:simplepage pageCount="${users.pageCount}" href="#index_tab" action="javascript:loadRecommend('${divid}',1,#page#,${typeid},{'uid':${uid}})" page="${page}"></psf:simplepage>	
	       		</c:if>
       		</c:if>
		</div>

</div>