<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<div class="sns_imgtab">
	<h3><a href="/sns/guide/editguide"><em></em>发布新指南</a></h3>
	<img src="/images/sns/default/guidebg.png" alt="" /><div class="tab">
		<dl class="tab03">
			<dd>
				<ul>
					<li class="<psf:current key="guideTab" value="myguide"/>"><a href="/sns/guide">我的指南</a></li>
					<li class="<psf:current key="guideTab" value="friendguide"/>"><a href="/sns/guide/friendguide">好友指南</a></li>
					<li class="<psf:current key="guideTab" value="groupguide"/>"><a href="/sns/guide/groupguide">圈子指南</a></li>
					<li class="<psf:current key="guideTab" value="clubguide"/>"><a href="/sns/guide/clubguide">社区指南</a></li>
					<li class="<psf:current key="guideTab" value="relatedbrand"/>"><a href="/sns/guide/relatedbrand">相关品牌</a></li>
				</ul>
			</dd>
			<dt>
				<c:if test="${guideTab == 'myguide'}">
					<a class="current" href="javascript:void(0);" onclick="javascript:loadGuideList(-1,1,null,-1,-1)">最热</a>
					<a href="javascript:void(0);" onclick="javascript:loadGuideList(-1,2,null,-1,-1)">最新</a>
				</c:if>
				<c:if test="${guideTab == 'friendguide'}">
					<a class="current" href="javascript:void(0);" onclick="javascript:loadFriendGuide(-1,1,null,-1,-1)">最热</a>
					<a href="javascript:void(0);" onclick="javascript:loadFriendGuide(-1,2,null,-1,-1)">最新</a>
				</c:if>
				<c:if test="${guideTab == 'groupguide'}">
					<a class="current" href="javascript:void(0);" onclick="javascript:loadGroupFriendGuide(-1,1,null,-1,-1)">最热</a>
					<a href="javascript:void(0);" onclick="javascript:loadGroupFriendGuide(-1,2,null,-1,-1)">最新</a>
				</c:if>
				<c:if test="${guideTab == 'clubguide'}">
					<a class="current" href="javascript:void(0);" onclick="javascript:loadClubGuide(-1,1,null,-1,-1)">最热</a>
					<a href="javascript:void(0);" onclick="javascript:loadClubGuide(-1,2,null,-1,-1)">最新</a>
				</c:if>
				<c:if test="${guideTab == 'relatedbrand'}">
					<a class="current" href="javascript:void(0);" onclick="javascript:loadPostBrand(-1,1,null,-1,-1)">最热</a>
					<a href="javascript:void(0);" onclick="javascript:loadPostBrand(-1,2,null,-1,-1)">最新</a>
				</c:if>
			</dt>
		</dl>
	</div>
</div>