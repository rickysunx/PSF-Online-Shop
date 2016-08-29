<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<script type="text/javascript">
	function delUser(uid){
		$("#user_"+uid).remove();
		var param = $("#selected_userform").serialize();
		param = param.replaceAll("selected_","");
		hasInvitedUser(param,1);
	}
</script>

<div class="header">
	<!-- <div class="right">最多可以选300位</div> -->
    <b>已选：</b><span>${empty selected_count ? 0 : selected_count}</span>位
</div>

<form id="selected_userform">  
<ul>
	<c:choose>
		<c:when test="${empty selected_userlist}">
		 	<c:forEach begin="0" end="4">
			    <li>
			    	<div class="addbtn">
			        	<a href="javascript:void(0)" onclick="invite(${groupid})"><em></em></a>
			        </div>
			    </li>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<c:forEach items="${selected_userlist}" var="user">
			<li id="user_${user.uid}">
		   		<div>
			       	<a class="close" href="javascript:delUser(${user.uid})"></a>
			       	<a href="#"><img src="/pic/${user.avatarFileName}" alt="" /></a>
		       </div>
		       <p><a href="#">${user.username}</a><input type="hidden" name="selected_uid" value="${user.uid}"/></p>
		    </li>
		    </c:forEach>
		    <li>
		    	<div class="addbtn">
		        	<a href="javascript:void(0)" onclick="invite(${groupid})"><em></em></a>
		        </div>
		    </li>
		</c:otherwise>
	</c:choose>
</ul>
</form> 
   
<div class="bottom">
	<c:if test="${!empty selected_userlist}">
		<div class="right">
	    	<psf:simplepage pageCount="${selected_pageCount}" action="javascript:hasInvitedUser(null,#page#);" page="${page}"></psf:simplepage>
	    </div>
    </c:if>
    <a href="javascript:void(0)" onclick="clearUser()"><em></em>清空列表</a>
</div>
       