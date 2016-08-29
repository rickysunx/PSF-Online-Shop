<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>品牌广播</title>
	<psf:header/>
	<link href="/css/sns.css" rel="stylesheet" type="text/css"/>
	<link href="/css/space.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="/js/sns/common.js"></script>
	<script type="text/javascript" src="/js/sns/index.js"></script>
	<script type="text/javascript">

	</script>
</head>
<body>
<psf:shortcut/>
<psf:include page="/sns/components/share.jsp"></psf:include>
<div id="html_wrap">
<psf:snsHeader/>
	<psf:snsTab/>
	<div id="sns_main" class="s_clear">
		<psf:include page="/sns/brand/edit_brandad_content.jsp" />
	</div>
	<psf:tail/>
</div>
</body>
</html>