<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>基本信息1</title>
	<psf:header/>
	<link href="/css/sns.css" rel="stylesheet" type="text/css"/>
	<script src="/js/sns/friend.js" type="text/javascript"></script>
	<script src="/js/sns/index.js" type="text/javascript"></script>
	<script src="/js/sns/common.js" type="text/javascript"></script>
	<script type="text/javascript">
		var options = {
			"groupid" : ${group.groupid},
			"type" : 1
		};
		
		$(function(){
			loadManagePage(1);
		});
		
		function loadManagePage(type){
			var url = "";
			if(type != -1){
				options["type"] = type;
				$("dl.group_manage_tab dd ul li:eq("+(type-1)+")").addClass("current").siblings().removeClass("current");
				if(type == 1){
					url = "/sns/group/manage/info";
				}else if(type == 2){
					url = "/sns/group/manage/avatar";
				}else if(type==3){
					url = "/sns/group/manage/announcement";
				}else if(type==4){
					url = "/sns/group/manage/member";
				}else if(type==5){
					url = "/sns/group/manage/apply";
				}
			}
			$("#content").html("<div class='post_list_loading'><img src='/images/loading.gif'/></div>");
			$("#content").load(
				url,
				options
			);
		}
		
		/*	解散圈子 */
		function dismiss(groupid){
			if(confirm("确定要解散该圈子？")){
				if(groupid == undefined || groupid == ''){
					$.psfInfoDialog("参数错误");
					return false;
				}
				var param = "groupid="+groupid;
				$.post(
					"/sns/group/dismiss_group",
					param,
					function(result){
						if(result.success){
							window.location.href = "/sns/group/mygroup";
						}else{
							$.psfInfoDialog(result.message);
							return false;
						}
					},
					"json"
				);
			}
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
    	<div class="sns_group_manage_conwrap">
			<psf:include page="/sns/group/manage/title.jsp"/>
			<psf:include page="/sns/group/manage/tab.jsp"/>
			<div id="content"></div>
        </div>
	</div>	
	<div id="sns_right">
		<psf:include page="/sns/group/group_right.jsp"/>
	</div>	
</div>
<psf:tail/>
</div>
</body>
</html>