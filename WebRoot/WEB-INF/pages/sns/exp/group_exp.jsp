<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>圈子的体验</title>
	<psf:header/>
	<link href="/css/sns.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="/js/sns/friend.js"></script>
	<script type="text/javascript" src="/js/sns/common.js"></script>
	<script type="text/javascript" src="/js/sns/index.js"></script>
	<script type="text/javascript">
		var options = {
			"type": null,
			"orderby":1,
			"keyword":null,
			"page":1,
			"expTab":"${expTab}"
		};
		$(function(){
			loadGroupFriendExp(0,-1,null,-1,-1);
		});
		
		function loadGroupFriendExp(groupid,orderby,keyword,page,expTab){
			if(groupid != -1){
				$("div.linkbox dl[groupid='"+groupid+"'] dt a").addClass("current");
				$("div.linkbox dl[groupid='"+groupid+"']").siblings("dl[groupid]").find("dt a").removeClass("current");
				options["type"] = groupid;
			}
			if(orderby != -1){
				options["orderby"] = orderby;
				$("dl.tab03 dt a:eq("+(orderby-1)+")").addClass("current").siblings("a").removeClass("current");
			}
			if(keyword != null){
				options["keyword"] = keyword;
			}
			if(page != -1){
				options["page"] = page;
			}if(expTab != -1){
				options["expTab"] = expTab;
			}
			
			$("#post_list").html("<div style='text-align:center;'><img src='/images/loading.gif'></div>");
			$("#post_list").load(
				"/sns/exp/shopexp_list",
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
<psf:snsTab current="exp"/>

<div id="sns_main" class="snsrbox s_clear">

	<div id="sns_left">
		<psf:include page="/sns/exp/exp_tab.jsp"/>
		<psf:set key="grouplist" value="${groups.list}"></psf:set>
		<psf:include page="/sns/exp/group_exp_tab.jsp"/>
		<div id="post_list" class="post_list"></div>
	</div>
	
	<div id="sns_right">
		<psf:include page="/sns/exp/exp_right.jsp"/>
	</div>
	
</div>
<psf:tail/>
</div>
</body>
</html>