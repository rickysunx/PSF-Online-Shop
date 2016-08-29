<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<script type="text/javascript">
	$(function(){
		loadGroupFriends(${group.groupid},"admin_list",1,1);
	});
</script>

<div class="group_right_list">
	<div class="group_body">
    	<div class="title">圈子资料</div>
        <h5>圈主</h5>
        <div class="list">
        	<dl>
            	<dt><a href="#"><img width="36px" height="36px" src="/pic/${creator.avatarFileName}" alt="" /></a></dt>
                <dd>
                	<h6><a href="#">${creator.username}</a></h6>
                    <c:if test="${creator.uid != loginPsfUid}">
                    <p>
                    	<a class="follow_${creator.uid} ${creator.isFollow ? 'hide' : ''}" href="javascript:void(0)" onclick="addFollow(${creator.uid},addFollowHandle5)">+关注</a>
                    	<a class="unfollow_${creator.uid} ${creator.isFollow ? '' : 'hide'}" href="javascript:void(0)" onclick="addFollow(${creator.uid},delFollowHandle5)">取消关注</a>
                    </p>
                    </c:if>
                </dd>
            </dl>
        </div>
        
        <h5>管理员</h5>
        <div id="admin_list"></div>
    </div>
</div>