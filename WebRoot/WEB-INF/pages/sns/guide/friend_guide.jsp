<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>好友指南</title>
	<psf:header/>
	<link href="/css/sns.css" rel="stylesheet" type="text/css"/>
	<script src="/js/sns/friend.js" type="text/javascript"></script>
	<script src="/js/sns/common.js" type="text/javascript"></script>
	<script src="/js/sns/index.js" type="text/javascript"></script>
	<script type="text/javascript">
		var options = {
			"type": null,
			"orderby":1,
			"keyword":null,
			"page":1,
			"guideTab":"${guideTab}"
		};
		
		$(document).ready(function(){
			loadFriendGuide(-1,-1,null,-1,-1);
		});
		
		function loadFriendGuide(type, orderby, keyword, page, guideTab){
			
			if(type != -1){
				options["type"] = type; 
			}if(orderby != -1){
				options["orderby"] = orderby;
				$("dl.tab03 dt a:eq("+(orderby-1)+")").addClass("current").siblings("a").removeClass("current");
			}if(keyword != null){
				options["keyword"] = keyword;
			}if(page != -1){
				options["page"] = page;
			}if(guideTab != -1){
				options["guideTab"] = guideTab;
			}
			//alert(options.type+":"+options.orderby+":"+options.keyword+":"+options.page);
			$("#post_list").load(
				"/sns/guide/guide_list",
				options
			);
		}
	</script>
</head>

<body>

<psf:shortcut/>
<psf:include page="/sns/components/share.jsp"></psf:include>
<div id="html_wrap">
<psf:snsHeader/>
<psf:snsTab current="guide"/>

<div id="sns_main" class="snsrbox s_clear">
	<div id="sns_left">
			<psf:include page="/sns/guide/guide_tab.jsp"/>
			<psf:set key="friendgroups" value="${friendgroups}"></psf:set>
			<psf:include page="/sns/guide/friend_guide_tab.jsp"/>
			<div id="post_list" class="post_list"></div>
	</div>
	<div id="sns_right">
		<psf:include page="/sns/guide/guide_right.jsp"/>
	</div>	
</div>
<psf:tail/>
</div>
</body>
</html>