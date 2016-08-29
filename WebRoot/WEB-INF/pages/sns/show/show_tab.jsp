<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<div class="sns_imgtab">
	<h3 class="show"><a href="/sns/show/editshow"><em></em>发布新秀场</a></h3>
	<img src="/images/sns/default/showbg.png" alt="" /><div class="tab">
	   <dl class="tab03">
		   <dd>
			   <ul>
				   <li class="<psf:current key="showTab" value="myshow"/>"><a href="/sns/show">我的秀场</a></li>
				   <li class="<psf:current key="showTab" value="friendshow"/>"><a href="/sns/show/friendshow">好友秀场</a></li>
				   <li class="<psf:current key="showTab" value="groupshow"/>"><a href="/sns/show/groupshow">圈子秀场</a></li>
				   <li class="<psf:current key="showTab" value="clubshow"/>"><a href="/sns/show/clubshow">社区秀场</a></li>
				   <li class="<psf:current key="showTab" value="showproduct"/>"><a href="/sns/show/showproduct">秀场商品</a></li>
			   </ul>
		   </dd>
		   <dt>
		   		<c:if test="${showTab=='myshow'}">
				   <a class="current" href="javascript:void(0);" onclick="javascript:loadShowList(-1,1,null,-1,-1);">最新</a>
				   <a href="javascript:void(0);" onclick="javascript:loadShowList(-1,2,null,-1,-1);">最热</a>
			   </c:if>
			   <c:if test="${showTab=='friendshow'}">
				   <a class="current" href="javascript:void(0);" onclick="javascript:loadFriendShow(-1,1,null,-1,-1);">最新</a>
				   <a href="javascript:void(0);" onclick="javascript:loadFriendShow(-1,2,null,-1,-1);">最热</a>
			   </c:if>
			   <c:if test="${showTab=='groupshow'}">
				   <a class="current" href="javascript:void(0);" onclick="javascript:loadGroupFriendShow(-1,1,null,-1,-1);">最新</a>
				   <a href="javascript:void(0);" onclick="javascript:loadGroupFriendShow(-1,2,null,-1,-1);">最热</a>
			   </c:if>
			   <c:if test="${showTab=='clubshow'}">
				   <a class="current" href="javascript:void(0);" onclick="javascript:loadClubShow(-1,1,null,-1,-1);">最新</a>
				   <a href="javascript:void(0);" onclick="javascript:loadClubShow(-1,2,null,-1,-1);">最热</a>
			   </c:if>
			   <c:if test="${showTab=='showproduct'}">
				   <a class="current" href="javascript:void(0);" onclick="javascript:loadPostProduct(-1,1,null,-1);">最新</a>
				   <a href="javascript:void(0);" onclick="javascript:loadPostProduct(-1,2,null,-1);">最热</a>
			   </c:if>
		   </dt>
	   </dl>
	</div>
	<map name="friendmap">
		<area coords="25,39,84,87" href="javascript:void(0)" onclick="showTopDialog('#friendbox')" shape="rect" />
		<area coords="133,16,209,69" href="javascript:void(0)" onclick="showTopDialog('#friendbox')" shape="rect" />
		<area coords="226,26,302,79" href="javascript:void(0)" onclick="showTopDialog('#friendbox')" shape="rect" />
	</map>
</div>