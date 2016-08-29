<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<div class="tab_menu">

    <div class="searchbox01">
    
       	<c:choose>
			<c:when test="${empty keyword}"><input value="输入昵称或备注" id="fans_keyword" onclick="this.value=''"/></c:when>
			<c:otherwise><input value="${keyword }" id="fans_keyword"/></c:otherwise>
		</c:choose>
    	<a class="searchbtn" href="javascript:findByKeyword(3);"></a>
    </div>

</div>