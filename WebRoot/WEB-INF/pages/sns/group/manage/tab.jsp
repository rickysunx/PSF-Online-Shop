<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<dl class="group_manage_tab tab03">
	<!-- 只有圈主才能解散圈子 -->
	<c:if test="${group.uid == loginPsfUid}">
		<dt>
	        <a href="javascript:void(0)" onclick="dismiss(${group.groupid})">解散该圈</a>
	    </dt>
    </c:if>
    <dd>
        <ul>
            <li class="current"><a href="javascript:void(0)" onclick="loadManagePage(1)">基本信息</a></li>
            <li><a href="javascript:void(0)" onclick="loadManagePage(2)">圈子头像</a></li>
            <li><a href="javascript:void(0)" onclick="loadManagePage(3)">公告设置</a></li>
            <li><a href="javascript:void(0)" onclick="loadManagePage(4)">成员管理</a></li>
            <li><a href="javascript:void(0)" onclick="loadManagePage(5)">处理申请</a></li>
        </ul>
    </dd>
</dl>
