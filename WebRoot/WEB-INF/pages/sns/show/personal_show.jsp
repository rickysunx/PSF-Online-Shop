<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>我的秀场</title>
	<psf:header/>
	<link href="/css/sns.css" rel="stylesheet" type="text/css"/>
</head>

<body>
<psf:include page="/sns/components/share.jsp"></psf:include>
<psf:shortcut/>
<div id="html_wrap">
<psf:snsHeader/>
<psf:snsTab current="show"/>

<div id="sns_main" class="snsrbox s_clear">

	<div id="sns_left">
		<psf:include page="/sns/show/show_tab.jsp"/>
		<psf:include page="/sns/show/personal_show_tab.jsp"/>
		<div class="post_list">
			<psf:include page="/sns/show/personal_show_content.jsp"/>
		</div>
	</div>
	
	<div id="sns_right">
		<psf:include page="/sns/show/show_right.jsp"/>
	</div>
	
</div>
<psf:tail/>
</div>
</body>
</html>