<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>后台登陆</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta http-equiv="Pragma" content="no-cache"/>
	<link href="/css/common.css" type="text/css" rel="stylesheet"/>
	<script src="/js/jquery.js" type="text/javascript"></script>
</head>

<body>
<form id="loginForm" action="/admin/login_check" method="post">
<div class="login">
	<div class="title">用户登录</div>
	<div>
		<div class="left">用户名</div>
		<div class="right"><input type="text" name="username"/></div>
	</div>
	<div>
		<div>密码</div>
		<div><input type="password" name="password"/></div>
	</div>
	<div>
		<div></div>
		<div>
			<input type="submit" value="登录"/>
			<b></b>
		</div>
	</div>
</div>
</form>
</body>
</html>