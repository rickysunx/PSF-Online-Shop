<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>个人体验全文内容</title>
	<psf:header/>
	<link href="/css/sns.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="/js/sns/friend.js"></script>
	<script type="text/javascript" src="/js/sns/index.js"></script>
	<script type="text/javascript" src="/js/sns/common.js"></script>
</head>

<body>

<psf:shortcut/>
<div id="html_wrap">
	<c:if test="${!empty loginPsfUid}">
		<psf:snsHeader/>
	</c:if>

<psf:snsTab current="exp"/>

<div id="sns_main" class="snsrbox s_clear">

	<div id="sns_left">
		 <psf:include page="/sns/exp/detail_exp_content.jsp"/>
	</div>
	
	<div id="sns_right">
		<psf:include page="/sns/exp/detail_exp_right.jsp"/>
	</div>
	
</div>
<psf:tail/>
</div>
</body>
</html>