<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>品友的好友</title>
	<psf:header/>
    <link href="/css/sns.css" rel="stylesheet" type="text/css"/>
	<script src="/js/sns/friend.js" type="text/javascript"></script>
	<script src="/js/sns/common.js" type="text/javascript"></script>
</head>
<body>

<psf:shortcut/>
<div id="html_wrap">
<psf:snsHeader/>
<psf:snsTab current="friend"/>

<div id="sns_main" class="snsrbox s_clear">

	<div id="sns_left">
        <psf:include page="/sns/friend/friend_tab.jsp"/>
        <psf:include page="/sns/friend/psf_friend_tab.jsp"/>
        
        <div class="infolist" id="psffriend">
        </div>
	</div>
	
	<div id="sns_right">
		<psf:include page="/sns/friend/friend_right.jsp"/>
	</div>
	
</div>
<psf:tail/>
</div>
</body>
</html>