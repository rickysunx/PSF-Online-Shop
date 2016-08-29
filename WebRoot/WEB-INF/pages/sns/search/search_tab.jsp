<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<c:if test="${type != 5}">
	<ul id="searchTab">
		<li class="active"><a href="javascript:void(0)" onclick="loadList(-1,null,1,-1)">最新</a></li>
		<li><a href="javascript:void(0)" onclick="loadList(-1,null,2,-1)">最热</a></li>
	</ul>
</c:if>