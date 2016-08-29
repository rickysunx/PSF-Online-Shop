<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>			


<div class="name_card">
	<div class="card_infowrap">
		<dl class="namebox s_clear">
			<dt class="imgborder">
				<a href="#"><img src="/pic/${cardUser.avatarFileName }" alt="" /></a>
			</dt>
			<dd>
				<div class="row">
					<c:if test="${cardUser.sex eq 0}"></c:if>
					<c:if test="${cardUser.sex eq 1}"><span class="sex man"></span></c:if>
					<c:if test="${cardUser.sex eq 2}"><span class="sex woman"></span></c:if>
					<div class="name">
						<input name='remarkuid' type='hidden' value='${cardUser.uid}'/>
						<a href="#"><b>${cardUser.username}</b></a>
						<c:if test="${(cardUser.uid != loginPsfUid)}">
						<c:choose>
							<c:when test="${empty cardUser.oname}">
								<a href="javascript:openRemarkDialog(${cardUser.uid},'${cardUser.oname}','${cardUser.username}');">[添加备注]</a>
							</c:when>
							<c:otherwise>
								(${cardUser.oname})&nbsp;&nbsp;<a href="javascript:openRemarkDialog(${cardUser.uid},'${cardUser.oname}','${cardUser.username}');">[修改备注]</a>
							</c:otherwise>
						</c:choose>
						</c:if>
						</form>
					</div>
				</div>
				<div class="row">
					<c:choose>
					<c:when test="${cardUser.snsstatus == 1}">
						<span class="sex danshen"></span>
					</c:when>
					<c:when test="${cardUser.snsstatus == 2}">
						<span class="sex xin"></span>
					</c:when>
					<c:when test="${cardUser.snsstatus == 3}">
						<span class="sex hua"></span>
					</c:when>
					</c:choose>
					<div class="name">&nbsp;${cardUser.nowZoneName}</div>
				</div>
				<div class="data">
					<span><a href="#">关注</a>${cardUser.follows }</span><span><a href="#">粉丝</a>${cardUser.fans }</span><span><a href="#">圈子</a>${cardUser.groups }</span><span><a href="#">发表</a>${cardUser.pubs }</span>
				</div>
			</dd>
		</dl>
		<div class="sign">
			<b>个人签名：</b>${cardUser.signature}
		</div>
		<dl class="medal s_clear">
			<dt>勋章：</dt>
			<dd>
			<c:forEach begin="1" end="${cardUser.medal}">
			<img src="/images/sns/default/temp/medals.png" alt=""/>
			</c:forEach>
			</dd>
		</dl>
	</div>
	<c:if test="${(cardUser.uid != loginPsfUid)}">
	<div class="linkbox">
		<div class="overlinkbox">
		<c:choose>
		<c:when test="${cardUser.isfriend}">
			<a class="addbtn02" href="#">已好友</a>
		</c:when>
		<c:otherwise>
			<a class="addbtn02" href="javascript:void(0)" onclick="openAskForFriendDialog('${cardUser.uid }','${cardUser.username }',this);"><em></em>好友</a>
		</c:otherwise>
		</c:choose>
			<c:choose>
			<c:when test="${cardUser.isfollow}">
				<c:choose>
				<c:when test="${cardUser.isfans}">
					<a class="twofollow" href="javascript:void(0)" onclick="delFollow(${cardUser.uid});"><em></em>关注</a>
				</c:when>
				<c:otherwise>
					<a class="addbtn02" href="javascript:void(0)" onclick="delFollow(${cardUser.uid});">已关注</a>
				</c:otherwise>
				</c:choose>
			</c:when>
			<c:otherwise>
				<a class="addbtn02" href="javascript:void(0)" onclick="addFollow(${cardUser.uid});"><em></em>关注</a>
			</c:otherwise>
			</c:choose>
		</div>
		<div class="links">
			<c:if test="${((cardUser.isfriend || cardUser.isfans))}">
			<span><a href="javascript:void(0)" onclick="openSendMsgDialog('${cardUser.uid }','${cardUser.username }',this);" >发信</a></span>
			</c:if>
			<c:if test="${(!(cardUser.isfriend || cardUser.isfans))}">
			<span><a href="javascript:void(0)" onclick="openAskForFollowDialog('${cardUser.uid }','${cardUser.username }',this);">求关注</a></span>
			</c:if>
			<span><a href="javascript:void(0)" onclick="showTopDialog('#recombox')">推荐</a></span>
			<c:if test="${((cardUser.isfriend || cardUser.isfollow))}">
			<span><a href="javascript:void(0)" onclick="showTopDialog('#setGroupbox')">设置分组</a></span>
			</c:if>
		</div>
	</div>
	</c:if>
</div>
