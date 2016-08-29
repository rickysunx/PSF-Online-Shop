<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>黑名单</title>
	<psf:header/>
	<link href="/css/sns.css" rel="stylesheet" type="text/css"/>
	<link href="/css/myinfo.css" rel="stylesheet" type="text/css"/>
	<script src="/js/sns/common.js" type="text/javascript"></script>

<script type="text/javascript">
	function delFromBlacklist(buid){
		if(confirm("确认从黑名单中解除？")){
			$.post(
					"/sns/myinfo/del_blacklist","blockuid="+buid,
					function(data){
						if(data.success == 1){
							$.psfInfoDialog("删除成功");
							$("#blacklistCount").text( $("#blacklistCount").text()-1 );
							$("#blacklist_"+buid).remove();	
						} else {
							$.psfInfoDialog("删除失败："+data.info,2000);
						}
					},"json"
			);
		}
	}
</script>
</head>

<body>
<psf:shortcut/>

<div id="html_wrap">
	<psf:snsHeader/>
	<psf:snsTab/>
	<psf:include page="/sns/myinfo/tab.jsp"/>
	<form>
	<div class="jobtime">
		<div class="title navclass"><b>黑名单</b>(<span class="redText" id="blacklistCount">${count }</span>)</div>
		<div class="senTitle navclass">被加入黑名单的用户将无法关注你、评论你、发私信给你，若移除黑名单，将讲复所有功能。</div>
		<ul class="blacklist">
			<c:forEach items="${users}" var="user">
			<li id="blacklist_${user.uid }">
				<div class="userAvatar">
					<a href="#"><img src="/pic/${user.avatarFileName }" title="userName"/></a>
				</div>
				<div class="userNews">
					<p><b><a href="#">${user.username }</a></b></p>
					<p>状态：<span>已加入黑名单</span></p>
				</div>
				<div class="Manage">
					<a href="javascript:delFromBlacklist(${user.uid });">从该组解除</a>
				</div>
			</li>
			</c:forEach>
		</ul>
	</div>
	</form>

	<div class="addjob" style="display: none">
   		<div class="addjobtitle">提示</div>
        <div class="savesuc">恭喜您，您的设置保存成功！</div>
        <center><input type="submit" value="确 定" class="savebtn" /></center>                                           
     </div>
	</div>
</body>
</html>