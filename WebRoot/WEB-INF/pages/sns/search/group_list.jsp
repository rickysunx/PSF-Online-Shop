<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<c:if test="${empty grouplist}">
<div class="right_nodata_big">没有相关数据哦，赶快去发布吧。</div>
</c:if>
<c:forEach items="${grouplist}" var="group">
<dl class="group_user_box">
	<dt style="width:80px;height:80px;"><a style="width:72px;height:72px;" href="/sns/group/detail?groupid=${group.groupid}" target="_blank"><img src="/pic/${group.logo}" alt="${group.groupname}"/></a></dt>
    <dd style="margin-left: 90px">
    	<h1 style="overflow: visible;">
    		<a href="/sns/group/detail?groupid=${group.groupid}" target="_blank">${group.groupname}</a><span>（群号：${10000+group.groupid}）</span>
    		<a class="addbtn02" style="float:right;font-size: 12px;font-weight: normal;cursor: pointer;"><em></em>加入圈子</a>
    	</h1>
        <div class="data">
      		<span><b>圈主：</b><a>${group.displayName}</a></span>
            <span><b>类别：</b><a>${group.groupclass}</a></span>
            <span><b>地区：</b><a>${group.zonename}</a></span>
            <span><b>创建：</b><a>${group.createtime}</a></span>
        </div>
        <div class="data">
      		<span><a href="#">圈友</a><b>${group.membercount}</b></span>|
            <span><a href="#">好友</a><b>${group.psfFriendCount }</b></span>|
            <span><a href="#">话题</a><b>${group.topicCount}</b></span>|
            <span><a href="#">发言</a><b>${group.postCount}</b></span>
        </div>
		<div class="info">
        	<b>圈子简介：</b>${group.intro}
        </div>
        <div>
        	<b>圈子标签：</b>${group.grouptag}
        </div>
    </dd>
</dl>
</c:forEach>
