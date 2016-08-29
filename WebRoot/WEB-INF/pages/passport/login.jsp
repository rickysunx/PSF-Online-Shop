<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>品上丰100登录页</title>	
	<psf:header/>
<link href="/css/common.css" rel="stylesheet" type="text/css"/>
	<link href="/css/passport.css" rel="stylesheet" type="text/css"/>
	<script src="/js/passport/login.js" type="text/javascript"></script>
	<script type="text/javascript">
	
	</script>
</head>

<body>
	<div id="header">
		<a href="#"><img src="/images/passport/logo.gif" alt="品上丰-分享就是价值" /></a>
        <div class="hold">
        	<img class="icon" src="/images/temp/pricewrap.png" alt="" />
            <a href="#"><img alt="" src="/images/temp/small-banner.png"></a>
        </div>
        
	</div>
    <div id="main">
        <div class="login_content">
            <dl class="login_header">
                <dt></dt>
                <dd><em></em><strong>一分钟<a href="/reg">注册</a>品上丰100，享受更多服务</strong></dd>
            </dl>
            <div class="loginbox">
            	<form id="loginForm" action="/login_check" method="post">
                <dl>
                	<dt>登 录 名：</dt>
                    <dd>
                    	<input id="loginUserName" name="username" type="text" class="input_name" value="可使用昵称、邮箱和手机登录" onClick="javascript:this.value='';this.style.color='black';" />
                        <!--<p class="errmsg">错误信息</p>-->
                    </dd>
                </dl>
                <dl>
                	<dt>密 &nbsp;&nbsp; 码：</dt>
                    <dd>
                    	<input id="loginUserPass" name="userpass" type="password" class="input_password" onClick="this.style.color='black';"/>
                        <!--<p class="errmsg">错误信息</p>-->
                    </dd>
                </dl>
                <%-- <dl>
                	<dt>验 证 码：</dt>
                    <dd>
                    	<input class="input_validate" onClick="this.style.color='black';" id="yzm" name="yzm"/>
                        <img id="captchaImg" src="/captcha?s=<%=System.currentTimeMillis()%>" alt="验证码" />
                        <a href="javascript:changeCaptcha();"> 换一个？</a>
                        <!--<p class="errmsg">错误信息</p>
                    </dd>
                </dl>  --%>
                <dl>
                	<dt></dt>
                	<dd><a href="#">忘记密码？</a></dd>
                </dl>
                <dl class="btns">
                	<dt></dt>
                    <dd>
                        <a id="loginSubmitButton" class="logbtn" href="#"></a>
                        <a href="reg">没有账号？
                        <b>现在注册</b></a>
                    </dd>
                </dl>
                <dl class="errmsg">
                	<dt></dt>
                    <dd id="info" class="errmsg"></dd>
                </dl>
                <div class="coll_list">
                
                	<h6>使用合作网站帐号登录品上丰：</h6>
                    <p>
                    
                    	<a class="qq" href="#"><em></em>QQ</a> |
                        <a class="sina" href="#"><em></em>新浪微博</a> |
                        <a class="renren" href="#"><em></em>人人网</a> |
                        <a class="kaixin" href="#"><em></em>开心网</a>
                    
                    </p>
                
                </div>
                        
                	<!--
                    <dd class="login"><span>登&nbsp;录&nbsp;名：</span><input id="loginUserName" name="username" type="text" class="inputbox" value="可使用昵称、邮箱和手机登录" onClick="javascript:this.value='';this.style.color='black';" /></dd>
                    <dd class="login"><span>密&nbsp;&nbsp;&nbsp;&nbsp;码：</span><input id="loginUserPass" name="userpass" type="password" class="inputbox" onClick="this.style.color='black';"/></dd>
                    <dd class="login"><div class="left_center left_centertext">验&nbsp;证&nbsp;码：</div><input type="text" class="inputbox yzm left_center"  value="" onClick="this.style.color='black';" /><img id="captchaImg" src="/captcha?s=<%=System.currentTimeMillis()%>" alt="验证码" class="left_center changeYZM" /><a href="javascript:changeCaptcha();"> 换一个？</a></dd>
                    <dd class="login"><a href="#">忘记密码？</a></dd>
                    <dd class="login"><input id="loginSubmitButton" type="button" class="logbtn" value="" /><a href="reg">没有账号？<b style="color:red;">现在注册</b></a></dd>
                    <dd class="login"><span id="info" style="color:red;"></span></dd>
                    <br />
                    <dd class="login">使用合作网站登录品上丰：</dd>
                    <dd class="login">
                        <div class="friendlogin qq"><a href="#">QQ</a></div>
                        <div class="friendlogin sina"><a href="#">新浪微博</a></div>
                    </dd>
                    -->
                
            	</form>	
            </div>
        </div>
    </div>
<!--  
<div class="loginFormDiv">
	<form id="loginForm" action="/login_check" method="post">
	<table>
		<tr>
			<td height="30px">用户名</td>
			<td><input id="loginUserName" name="username" type="text"/></td>
		</tr>
		<tr>
			<td height="30px">密码</td>
			<td><input id="loginUserPass" name="userpass" type="password"/></td>
		</tr>
		<tr>
			<td height="30px"></td>
			<td><input id="loginSubmitButton" type="button" value="登录"/><span id="info" style="color:red;"></span></td>
		</tr>
	</table>
	</form>
</div>-->
<!--psf:include page="/sns/components_float/loginbox.jsp"/-->
</body>
</html>