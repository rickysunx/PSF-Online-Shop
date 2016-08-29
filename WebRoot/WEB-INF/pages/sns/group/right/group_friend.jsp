<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<c:if test="${empty userlist}">
	<div style="text-align">${message}</div>
</c:if>
<div class="list">
	<c:forEach items="${userlist}" var="user">
		<dl>
	    	<dt><a href="#"><img width="36px" height="36px" src="/pic/${user.avatarFileName}" alt="" /></a></dt>
	        <dd>
	        	<h6><a href="#">${user.username}</a></h6>
	        	<c:if test="${user.uid != loginPsfUid}">
	            <p>
	            	<a class="follow_${user.uid} ${user.isFollow ? 'hide' : ''}" href="javascript:void(0)" onclick="addFollow(${user.uid},addFollowHandle5)">+关注</a>
                    <a class="unfollow_${user.uid} ${user.isFollow ? '' : 'hide'}" href="javascript:void(0)" onclick="addFollow(${user.uid},delFollowHandle5)">取消关注</a>
	            </p>
	            </c:if>
	        </dd>
	    </dl>
    </c:forEach>
</div>
<div class="more">
	<psf:simplepage pageCount="${pageCount}" action="javascript:loadGroupFriends(${groupid},'${divid}',${type},#page#)" page="${page}"></psf:simplepage>
</div>