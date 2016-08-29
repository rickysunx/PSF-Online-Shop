<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

		<div class="sns-statustitle">
			<h3>${title}享金排行榜</h3>
		</div>
		
		<div class="coins_rank_list">
		
			<c:if test="${empty rankers.list}">
				<div class="right_nodata">${message}</div>
			</c:if>
		
			<c:forEach items="${rankers.list}" var="ranker">
				
				<div class="coins_rank_item">
					<div class="coins_rank_left">
						<div class="coins_rank_avatar">
							<a href="#" title="${ranker.username}"><img src="/pic/${ranker.avatarFileName}"/></a>
						</div>
						<c:if test="${loginPsfUid != ranker.uid}">
						<c:choose>
							<c:when test="${ranker.isFollow}">
								<div class="coins_rank_hasfollow" psftype="delfollow" uid="${ranker.uid}">
									<a href="javascript:delFollow(${ranker.uid},delFollowHandle2)">已关注</a>
								</div>
							</c:when>
							<c:otherwise>
								<div class="coins_rank_addfollow" psftype="addfollow" uid="${ranker.uid}">
									<a href="javascript:addFollow(${ranker.uid},addFollowHandle2)">加关注</a>
								</div>
							</c:otherwise>
						</c:choose>
						</c:if>
					</div>
					<div class="coins_rank_right">
						<div class="coins_rank_displayname"><a>${ranker.username}</a></div>
						<div class="coins_rank_coins">
							<span class="coins_rank_coins_key">享金:</span>
							<span class="coins_rank_coins_value">
								${ranker.coins}
							</span>
						</div>
						<div class="coins_rank_show">
							<span class="coins_rank_show_key">${(typeid eq 1) ? '秀场：' : ((typeid eq 2) ? '体验：' : '指南：')}</span>
							<span class="coins_rank_show_value">${(typeid eq 1) ? ranker.showCount : ((typeid eq 2) ? ranker.shopexpCount : ranker.guideCount)}</span>
						</div>
					</div>
				</div>
				
			</c:forEach>
			
			<div class="coins_rank_right_prev_and_next">
				<psf:simplepage pageCount="${pageCount}" href="#index_tab" action="javascript:rank('${divid}',#page#,${typeid})" page="${page}"></psf:simplepage>	
			</div>
		</div>
