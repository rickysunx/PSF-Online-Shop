<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>我的圈子</title>
	<psf:header/>
	<link href="/css/sns.css" rel="stylesheet" type="text/css"/>
	<script src="/js/sns/index.js" type="text/javascript"></script>
	<script src="/js/sns/common.js" type="text/javascript"></script>
	<script type="text/javascript">
		var options = {
			"type" : 1,
			"orderby" : 1,
			"keyword" : null,
			"page" : 1
		}; 
		
		$(function(){
			getMyGroup(-1,-1,null,-1);
		});
		
		function getMyGroup(type, orderby, keyword, page){
			if(type != -1){
				options["type"] = type;
				var index = 2*type - 2;
				$("div.linkbox dl:eq("+index+") dt a").addClass("current");
				$("div.linkbox dl:eq("+index+")").siblings().find("dt a").removeClass("current");
			}if(orderby != -1){
				options["orderby"] = orderby;
				$("dl.tab03 dt a:eq("+(orderby-1)+")").addClass("current").siblings().removeClass("current");
			}if(keyword != null){
				options["keyword"] = keyword;
			}if(page != -1){
				options["page"] = page;
			}
			$('#group_list').html("<div class='post_list_loading'><img src='/images/loading.gif'/></div>");
			$('#group_list').load(
				"/sns/group/my_group_list",
				options
			);
		}
	</script>
</head>

<body>
<psf:shortcut/>
<div id="html_wrap">
<psf:snsHeader/>
<psf:snsTab current="group"/>
<div id="sns_main" class="snsrbox s_clear">
	<div id="sns_left">
		<psf:include page="/sns/group/group_tab.jsp"/>
		<psf:include page="/sns/group/my_group_tab.jsp"/>
		<div id="group_list"></div>
	</div>	
	<div id="sns_right">
		<psf:include page="/sns/group/group_right.jsp"/>
	</div>	
</div>
<psf:tail/>
</div>
</body>
</html>