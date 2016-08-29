<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<div class="sns_imgtab">
	<h3><a href="/sns/group/editgroup"><em></em>申请创建圈子</a></h3>
	<img src="/images/sns/default/guidebg.png" alt="" /><div class="tab">
		<dl class="tab03">
			<dd>
				<ul>
					<li class="<psf:current key="groupTab" value="topicgroup"/>"><a href="/sns/group">圈子发言</a></li>
					<li class="<psf:current key="groupTab" value="mygroup"/>"><a href="/sns/group/mygroup">我的圈子</a></li>
					<li class="<psf:current key="groupTab" value="squaregroup"/>"><a href="/sns/group/squaregroup">圈子广场</a></li>
				</ul>
			</dd>
			<dt>
			<c:if test="${groupTab == 'topicgroup'}">
				<a class="current" href="javascript:void(0)" onclick="loadGroupTopic(-1,1,null,-1)">最新</a>
				<a href="javascript:void(0)" onclick="loadGroupTopic(-1,2,null,-1)">最热</a>
			</c:if>
			<c:if test="${groupTab == 'mygroup'}">
				<a class="current" href="javascript:void(0)" onclick="getMyGroup(-1,1,null,-1)">最新</a>
				<a href="javascript:void(0)" onclick="getMyGroup(-1,2,null,-1)">最热</a>
			</c:if>
			</dt>
		</dl>
	</div>
</div>