<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<%-- 
<script>//我也来说两句吧
$(document).ready(function(){

	$(".loginbox_float").psfDialog({
	top:100,
	left:100,
	width:453
	});
})
</script>
--%>

<h1 class="loginbox_title"></h1>
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
            <a href="#">忘记密码？</a>
            <!--<p class="errmsg">错误信息</p>-->
        </dd>
    </dl>
    <dl>
        <dt>验 证 码：</dt>
        <dd>
            <input class="input_validate" onClick="this.style.color='black';" />
            <img id="captchaImg" src="/captcha?s=<%=System.currentTimeMillis()%>" alt="验证码" />
            <a href="javascript:changeCaptcha0();"> 换一个？</a>
            <!--<p class="errmsg">错误信息</p>-->
        </dd>
    </dl>
    <dl class="btns">
        <dt></dt>
        <dd>
            <a id="loginSubmitButton" class="logbtn" href="#"></a>
            <div><a href="javascript:closeLoginDialog();">取消登录</a> |　<a href="#">现在<span>注册</span></a></div>
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
            <a class="wangyi" href="#"><em></em>网易</a> |
            <a class="renren" href="#"><em></em>人人网</a> |
            <a class="sina" href="#"><em></em>新浪微博</a> |
            <a class="kaixin" href="#"><em></em>开心网</a> |
            <a href="#">更多&gt;&gt;</a>
        
        </p>
    
    </div>
    </form>	
</div>

