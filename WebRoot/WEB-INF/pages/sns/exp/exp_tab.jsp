<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<div class="sns_imgtab">
	<h3><a href="/sns/exp/editexp"><em></em>发布新体验</a></h3>
	<img src="/images/sns/default/shopexpbg.png" alt="" /><div class="tab">
	   <dl class="tab03">
		   <dd>
			   <ul>
				   <li class="<psf:current key="expTab" value="myexp"/>"><a href="/sns/exp">我的体验</a></li>
				   <li class="<psf:current key="expTab" value="friendexp"/>"><a href="/sns/exp/friendexp">好友体验</a></li>
				   <li class="<psf:current key="expTab" value="groupexp"/>"><a href="/sns/exp/groupexp">圈子体验</a></li>
				   <li class="<psf:current key="expTab" value="clubexp"/>"><a href="/sns/exp/clubexp">社区体验</a></li>
				   <li class="<psf:current key="expTab" value="expproduct"/>"><a href="/sns/exp/expproduct">体验商品</a></li>
			   </ul>
		   </dd>
		   <dt>
			  <c:if test="${expTab=='myexp'}">
				   <a class="current" href="javascript:void(0);" onclick="javascript:loadShopexpList(-1,1,null,-1,-1);">最新</a>
				   <a href="javascript:void(0);" onclick="javascript:loadShopexpList(-1,2,null,-1,-1);">最热</a>
			   </c:if>
			   <c:if test="${expTab=='friendexp'}">
				   <a class="current" href="javascript:void(0);" onclick="javascript:loadFriendShopexp(-1,1,null,-1,-1);">最新</a>
				   <a href="javascript:void(0);" onclick="javascript:loadFriendShopexp(-1,2,null,-1,-1);">最热</a>
			   </c:if>
			   <c:if test="${expTab=='groupexp'}">
				   <a class="current" href="javascript:void(0);" onclick="javascript:loadGroupFriendExp(-1,1,null,-1,-1);">最新</a>
				   <a href="javascript:void(0);" onclick="javascript:loadGroupFriendExp(-1,2,null,-1,-1);">最热</a>
			   </c:if>
			   <c:if test="${expTab=='clubexp'}">
				   <a class="current" href="javascript:void(0);" onclick="javascript:loadClubShopexp(-1,1,null,-1,-1);">最新</a>
				   <a href="javascript:void(0);" onclick="javascript:loadClubShopexp(-1,2,null,-1,-1);">最热</a>
			   </c:if>
			    <c:if test="${expTab=='expproduct'}">
				   <a class="current" href="javascript:void(0);" onclick="javascript:loadPostProduct(-1,1,null,-1);">最新</a>
				   <a href="javascript:void(0);" onclick="javascript:loadPostProduct(-1,2,null,-1);">最热</a>
			   </c:if>
		   </dt>
	   </dl>
	</div>
</div>