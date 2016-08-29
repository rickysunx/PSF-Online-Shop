<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>SNS首页</title>
	<psf:header/>
	<link href="/css/sns.css" rel="stylesheet" type="text/css"/>
	<script src="/js/sns/friend.js" type="text/javascript"></script>
	<script src="/js/sns/common.js" type="text/javascript"></script>
	<script src="/js/sns/index.js" type="text/javascript"></script>
	<script src="/js/common/CJL.0.1.min.js" type="text/javascript"></script>
	<script src="/js/common/ImageTrans.js" type="text/javascript"></script>
	<script src="/js/swfupload.js" type="text/javascript"></script>
</head>

<body>
<psf:include page="/sns/components/share.jsp"></psf:include>
<psf:shortcut/>
<psf:include page="/sns/components/mblog_dialog.jsp"/>
<script>
$(document).ready(function(){

});
</script>
<div class="index_border">
	<div class="index_border_left"></div>
	<div class="index_border_right"></div>
</div>
<div id="html_wrap">
    <psf:snsHeader/>
    <psf:snsTab current="index"/>
    
    <div id="sns_main" class="snsrbox s_clear">
        <div id="sns_left">
			<psf:include page="/sns/index_ad.jsp" />
			<psf:include page="/sns/mblog_form.jsp"/>
			<psf:include page="/sns/index_tab.jsp"/>
			<div id="sns_index_post_list" class="post_list"></div>

        </div>
    
        <div id="sns_right">
            <psf:snsUserInfo/>
            <div style="padding:5px 0;background-color:#FFF">
            	<a><img src="/images/sns/default/temp/sns_rightimg.png" /></a>
            </div>
            <psf:include page="/sns/recommend.jsp"/>
            <psf:include page="/sns/visitors.jsp"/>
            <psf:include page="/sns/bad_report.jsp"/>
        </div>

    </div>
	<psf:tail/>
</div>

<div class="pic_popup" style="display:none;width:225px;border:1px #f00 solid;background:#fff">
	<div class="pics">
        <a href="#"><img src="/images/sns/photo/photo64.png" alt="" /></a><a href="#"><img src="/images/sns/photo/photo64.png" alt="" /></a>
    </div>
</div>

<div class="logo_popup" style="display:none;width:162px;border:1px #f00 solid;background:#fff">
	<div class="logo_list">
    	<div><a class="like" href="#"></a><a href="#"><img src="/images/sns/photo/logo01.png" alt="" /></a></div>
        <div><a class="like" href="#"></a><a href="#"><img src="/images/sns/photo/logo02.png" alt="" /></a></div>
        <div><a class="like" href="#"></a><a href="#"><img src="/images/sns/photo/logo03.png" alt="" /></a></div>
    </div>
</div>
</body>
</html>