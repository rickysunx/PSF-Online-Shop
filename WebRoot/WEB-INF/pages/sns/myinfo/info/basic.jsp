<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>基本资料</title>
	<psf:header/>
	<link href="/css/sns.css" rel="stylesheet" type="text/css"/>
	<link href="/css/myinfo.css" rel="stylesheet" type="text/css"/>
	<script src="/js/sns/common.js" type="text/javascript"></script>
	
<script type="text/javascript">


function submitBasicInfo() {
	$.post("/action/sns/myinfo/save_info_basic",$("#basicInfoForm").serialize(),
		function(data){
			if(data.success==1) {
				$("#infoDialog").psfDialog({"modal":true,"center":true});
			} else {
				$.psfInfoDialog("保存出错："+data.info,3000);
			}
		},"json"
	);
}

function closeInfoDialog() {
	$("#infoDialog").psfDialogClose();
	window.location.reload();
}

function onBirthdayChange() {
	var year = $("select[name='birthday_year']").val();
	var month = $("select[name='birthday_month']").val();
	if(year!=0 && month!=0) {
		var days = getDaysByMonth(year,month);
		$("select[name='birthday_date']").empty();
		$("select[name='birthday_date']").append("<option value='0'>-日-</option>");
		for(var i=1;i<=days;i++) {
			$("select[name='birthday_date']").append("<option value='"+i+"'>"+i+"日</option>");
		}
	}
}

function initBirthday() {
	var thisyear = new Date().getFullYear();
	for(var year=1900;year<=thisyear;year++) {
		$("select[name='birthday_year']").append(
			"<option value='"+year+"'>"+year+"年</option>");
	}
	for(var month=1;month<=12;month++) {
		$("select[name='birthday_month']").append(
			"<option value='"+month+"'>"+month+"月</option>");
	}
	
	$("select[name='birthday_year']").change(function(){
		onBirthdayChange();
	});
	
	$("select[name='birthday_month']").change(function(){
		onBirthdayChange();
	});
}

var zones = ${zones};


function findZoneById(zoneid) {
	for(var i=0;i<zones.length;i++) {
		if(zones[i].zoneid==zoneid) return zones[i];
	}
	return null;
}

function initZone() {
	$("select[name='nowzone_provice']").append("<option value='0'>-请选择-</option>");
	$("select[name='homezone_provice']").append("<option value='0'>-请选择-</option>");
	$.each(zones,function(i,zone){
		$("select[name='nowzone_provice']").append("<option value='"+zone.zoneid+"'>"+zone.zonename+"</option>");
		$("select[name='homezone_provice']").append("<option value='"+zone.zoneid+"'>"+zone.zonename+"</option>");
	});
	
	$("select[name='nowzone_provice']").change(function(){
		var zoneid = $(this).val();
		var zone = findZoneById(parseInt(zoneid));
		$("select[name='nowzone_city']").empty();
		$("select[name='nowzone_city']").append("<option value='0'>-请选择-</option>");
		if(zone) {
			$.each(zone.children,function(i,z){
				$("select[name='nowzone_city']").append("<option value='"+z.zoneid+"'>"+z.zonename+"</option>");
			});
		}
		
	});
	
	$("select[name='homezone_provice']").change(function(){
		var zoneid = $(this).val();
		var zone = findZoneById(parseInt(zoneid));
		$("select[name='homezone_city']").empty();
		$("select[name='homezone_city']").append("<option value='0'>-请选择-</option>");
		if(zone) {
			$.each(zone.children,function(i,z){
				$("select[name='homezone_city']").append("<option value='"+z.zoneid+"'>"+z.zonename+"</option>");
			});
		}
		
	});
}

function initData() {
	
	$.each($("input[name='sex']"),function(i,sex) {
		if($(sex).val()==${user.sex}) {
			$(sex).attr("checked",true);
		}
	});
	
	$.each($("input[name='snsstatus']"),function(i,snsstatus){
		if($(snsstatus).val()==${user.snsstatus}) {
			$(snsstatus).attr("checked",true);
		}
	});
	
	$("select[name='nowzone_provice']").val(${nowzone.level1id});
	$("select[name='nowzone_provice']").change();
	$("select[name='nowzone_city']").val(${nowzone.zoneid});
	
	$("select[name='homezone_provice']").val(${homezone.level1id});
	$("select[name='homezone_provice']").change();
	$("select[name='homezone_city']").val(${homezone.zoneid});
	
	<c:if test="${!empty user.birthday}">
		var birthday = '${user.birthday}';
		var year = parseInt(birthday.substr(0,4));
		var month = parseInt(birthday.substr(4,2));
		var date = parseInt(birthday.substr(6,2));
		$("select[name='birthday_year']").val(year);
		$("select[name='birthday_month']").val(month);
		$("select[name='birthday_year']").change();
		$("select[name='birthday_date']").val(date);
	</c:if>
	
	
}


$(document).ready(function(){
	initBirthday();
	initZone();
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
	<psf:include page="/sns/myinfo/info/info_tab.jsp"></psf:include>
	
	<div class="myinfo_tip">提示：带<em>*</em>的项目为必填项，请尽量完善您的个人资料，便于账号维护。</div>
	
	<form id="basicInfoForm">
	<ul class="myinfo_basic_form">
		<li>
			<h1>昵称：</h1>
			<p><input class="short_input" type="text" name="username" value="${user.username}"/><b>*</b></p>
		</li>
		<li>
			<h1>真实姓名：</h1>
			<p><input class="short_input" type="text" name="realname" value="${user.realname}"/></p>
		</li>
		<li>
			<h1>性别：</h1>
			<p><input name="sex" value="1" type="radio"/>男 <input name="sex" value="2" type="radio"/>女 <input name="sex" value="0" type="radio"/>保密</p>
		</li>
		<li>
			<h1>个人签名：</h1>
			<p><textarea name="signature">${user.signature}</textarea></p>
		</li>
		<li>
			<h1>所在地：</h1>
			<p>
				<select name="nowzone_provice"></select>
				<select name="nowzone_city"></select>
			</p>
		</li>
		<li>
			<h1>家乡：</h1>
			<p>
				<select name="homezone_provice"></select>
				<select name="homezone_city"></select>
			</p>
		</li>
		<li>
			<h1>手机：</h1>
			<p><input name="mobile" class="long_input" type="text" value="${user.mobile}"/></p>
		</li>
		<li>
			<h1>Email：</h1>
			<p><input name="email" class="long_input" type="text" value="${user.email}"/></p>
		</li>
		<li>
			<h1>QQ：</h1>
			<p><input name="qq" class="long_input" type="text" value="${user.qq}"/></p>
		</li>
		<li>
			<h1>交友状态</h1>
			<p><input name="snsstatus" type="radio" value="1"/>单身 <input name="snsstatus" type="radio" value="2"/>热恋 <input name="snsstatus" type="radio" value="3"/>已婚 <input name="snsstatus" type="radio" value="0"/>保密</p>
		</li>
		<li>
			<h1>生日：</h1>
			<p>
				<select name="birthday_year">
					<option value="0">-年份-</option>
				</select>
				<select name="birthday_month">
					<option value="0">-月-</option>
				</select>
				<select name="birthday_date">
					<option value="0">-日-</option>
				</select>
			</p>
		</li>
		<li class="button_row">
			<h1>　</h1>
			<p><input onclick="submitBasicInfo();" type="button" value="保存资料"/></p>
		</li>
	</ul>
	</form>
	<div id="infoDialog" class="addjob" style="display:none;">
   		<div class="addjobtitle">提示</div>
        <div class="savesuc">恭喜您，您的资料保存成功！</div>
        <center><input onclick="closeInfoDialog();" type="submit" value="确 定" class="savebtn" /></center>
     </div>
</div>

	
</body>
</html>