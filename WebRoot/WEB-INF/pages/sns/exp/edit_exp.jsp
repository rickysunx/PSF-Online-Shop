<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>发布体验</title>
	<psf:header/>
	<script type="text/javascript" src="/js/sns/common.js"></script>
	<script type="text/javascript" src="/js/sns/index.js"></script>
	<link href="/css/sns.css" rel="stylesheet" type="text/css"/>
	<script src="/js/swfupload.js" type="text/javascript"></script>
	<script type="text/javascript" src="/js/ueditor/editor_config.js"></script>
	<script type="text/javascript" src="/js/ueditor/editor_ui_all.js"></script>
	<link rel="stylesheet" type="text/css" href="/js/ueditor/themes/default/ueditor.css"/>
	
<script type="text/javascript">
var expEditor = null;
$(document).ready(function(){
	expEditor = $("#expContent").editor(${loginPsfUid});
});
</script>
</head>

<body>
	<psf:shortcut/>
	<div id="html_wrap">
	<psf:snsHeader/>
	<psf:snsTab current="exp"/>
	<div id="sns_main" class="snsrbox s_clear">
		<div id="sns_left">
			<psf:include page="/sns/exp/edit_exp_content.jsp"/>
		</div>
		<div id="sns_right">
			<psf:include page="/sns/exp/exp_right.jsp"/>
		</div>
	</div>
	<psf:tail/>
	</div>
</body>
</html>