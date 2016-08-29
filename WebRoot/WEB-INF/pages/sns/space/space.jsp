<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>个人空间</title>
	<psf:header/>
	<link href="/css/sns.css" rel="stylesheet" type="text/css"/>
	<link href="/css/space.css" rel="stylesheet" type="text/css"/>
	<script src="/js/sns/jquery.js" type="text/javascript"></script>
	<script src="/js/sns/common.js" type="text/javascript"></script>
</head>

<body>

<psf:shortcut/>
<div id="html_wrap">
<psf:snsHeader/>
<psf:snsTab current=""/>

<div id="sns_main" class="snsrbox s_clear">

	<div id="sns_left">
		<psf:include page="/sns/space/myinfo.jsp"/>
		<psf:include page="/sns/space/pic.jsp"/>
		<psf:include page="/sns/space/tab.jsp"/>
		<psf:include page="/sns/space/content.jsp"/>
	</div>
	
	<div id="sns_right">
		<psf:include page="/sns/space/right.jsp"/>
	</div>
	
</div>
<psf:tail/>
</div>
</body>
</html>