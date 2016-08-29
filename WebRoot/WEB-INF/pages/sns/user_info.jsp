<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<div class="headbox">
	<div class="status s_clear">
		<div class="headimg">
			<div>
				<a href="/sns/myinfo/info/avatar"><img src="/pic/${snsUserInfo.avatarFileName}" alt=""/></a>
			</div>
			<p><a href="/sns/myinfo/info/basic">编辑个人资料</a></p>
		</div>
        <div class="info">
			<h3>${snsUserInfo.username }</h3>
			<a class="rank" href="#">九品大虾</a>
			<p>来访：<span>${snsUserInfo.visits }</span></p>
			<p>积分：<span>${snsUserInfo.points }</span></p>
			<p>享金：<span>${snsUserInfo.coins }</span></p>
			<p>返卷：<span>${snsUserInfo.coupon }</span></p>
		</div>
	</div>
	<div class="bottom s_clear">
		<ul>
			<li><a href="#"><b>${snsUserInfo.follows }</b><br />关注</a></li>
            <li><a href="#"><b>${snsUserInfo.fans }</b><br />粉丝</a></li>
            <li><a href="/friend"><b>${snsUserInfo.friends }</b><br />好友</a></li>
            <li><a href="/group_all_member"><b>${snsUserInfo.publiccount}</b><br />发表</a></li>
		</ul>
	</div>
	<psf:include page="/sns/components_right/list/medals.jsp"/>          
 </div> 
