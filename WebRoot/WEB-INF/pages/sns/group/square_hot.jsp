<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<c:if test="${empty grouplist}">
	<div class="post_no_data">当前类别没有圈子，赶紧去创建吧！</div>	
</c:if>

 <ul>
	<c:forEach items="${grouplist}" var="group">
    <li>
        <div class="img"><a href="/sns/group/detail?groupid=${group.groupid}" target="_blank"><img src="/pic/${group.logo}" alt="" /></a></div>
        <div class="info">
            <h5><a href="/sns/group/detail?groupid=${group.groupid}" target="_blank">${group.groupname}</a></h5>
            <p><a href="#"><em></em>${group.membercount}</a></p>
            <p><a class="topic" href="#"><em></em>${group.postCount}</a></p>
        </div>
    </li>
   </c:forEach> 
</ul>


<div class="bottom">
	<psf:simplepage pageCount="${pageCount}" href="#index_tab" action="javascript:getHotGroup(-1,#page#)" page="${page}"></psf:simplepage>	
</div>
