<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<dl class="group_manage_user_box">

	<dt><a href="/sns/group/detail?groupid=${group.groupid}"><img src="/pic/${group.logo}" alt="" /></a></dt>
    <dd>
    	<h1><a href="/sns/group/detail?groupid=${group.groupid}">${group.groupname}</a></h1>
        <h4><em></em>${group.groupTypeName}</h4>
        <h4>群号:${10000+group.groupid}</h4>
    </dd>

</dl>