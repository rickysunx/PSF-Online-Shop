<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>隐私设置</title>
	<psf:header/>
	<link href="/css/sns.css" rel="stylesheet" type="text/css"/>
	<link href="/css/myinfo.css" rel="stylesheet" type="text/css"/>
	<script src="/js/sns/common.js" type="text/javascript"></script>

<script type="text/javascript">
	function initData(){
		$("#ap_msg"+${ap_msg}).attr("checked",true);
		$("#ap_wealthtype"+${ap_wealthtype}).attr("checked",true);
	}
	function savePrivate(){
		var ap_msg = $("input[name='ap_msg']:checked").val();
		var ap_wealthtype = $("input[name='ap_wealthtype']:checked").val();
		$.post(
			"/sns/myinfo/update_ap_private","ap_msg="+ap_msg+"&ap_wealthtype="+ap_wealthtype,
			function(data){
				if(data.success == 1){
					$(".addjob").psfDialog({"modal":true,"center":true});
					$("#ap_msg"+ap_msg).attr("checked",true);
					$("#ap_wealthtype"+ap_wealthtype).attr("checked",true);
				} else {

				}
			},"json"
		);
	}
	function closeButton(){
		$(".addjob").psfDialogClose();
	}
	$(document).ready(function(){
		initData();
	});
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
	<dl>
		<dt><span class="title"><b>隐私设置</b></span></dt>
		<dd><input type="radio" id="ap_msg1" name="ap_msg" value="1"/>允许所有人给我发私信</dd>
		<dd><input type="radio" id="ap_msg2" name="ap_msg" value="2"/>只允许好友、我关注的人给我发私信</dd>
		<dd><input type="radio" id="ap_msg3" name="ap_msg" value="3"/>不允许任何人给我发私信</dd>
	</dl>
	<dl>
		<dt><span class="title"><b>披漏设置</b></span></dt>
		<dd><input type="radio" id="ap_wealthtype1" name="ap_wealthtype" checked="checked"  value="1"/>全部公开个人财产情况</dd>
		<dd><input type="radio" id="ap_wealthtype2" name="ap_wealthtype" value="2"/>只公开积分情况</dd>
		<dd><input type="radio" id="ap_wealthtype3" name="ap_wealthtype" value="3"/>全部保密个人财产情况</dd>
	</dl>
	<center><input type="button" class="saveBtn" value="保存设置" onclick="savePrivate();"/></center>
	</div>
	</form>

	
	<div class="addjob" style="display: none">
   		<div class="addjobtitle">提示</div>
        <div class="savesuc">恭喜您，您的设置保存成功！</div>
        <center><input type="button" value="确 定" class="savebtn" onclick="closeButton()"/></center>                                            
     </div>
</div>
</body>
</html>