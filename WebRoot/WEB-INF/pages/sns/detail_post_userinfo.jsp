<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<div class="headbox">
	<div class="status s_clear">
		<div class="headimg">
			<div>
				<a href="/sns/myinfo/info/avatar"><img src="/pic/${posterInfo.avatarFileName}" alt=""/></a>
			</div>
		</div>
        <div class="info">
			<h3>${posterInfo.username }</h3>
			<a class="rank" href="#">九品大虾</a>
			<p>来访：<span>${posterInfo.visits }</span></p>
			<p>积分：<span>${posterInfo.points }</span></p>
			<p>享金：<span>${posterInfo.coins }</span></p>
			<p>返卷：<span>${posterInfo.coupon }</span></p>
		</div>
	</div>
	<div class="medals">
		<c:if test="${posterInfo.medal > 0}">
			<c:forEach begin="0" end="${posterInfo.medal-1}">
				<img src="/images/sns/default/temp/medals.png" alt=""/>
			</c:forEach>
		</c:if>
	</div>
	<div class="bottom s_clear">
		<ul>
			<li><a href="#"><b>${posterInfo.follows }</b><br />我关注</a></li>
            <li><a href="#"><b>${posterInfo.fans }</b><br />被关注</a></li>
            <li><a href="/friend"><b>${posterInfo.friends }</b><br />好友</a></li>
            <li><a href="/group_all_member"><b>${posterInfo.groupfriends }</b><br />圈友</a></li>
		</ul>
	</div>           
 </div> 
