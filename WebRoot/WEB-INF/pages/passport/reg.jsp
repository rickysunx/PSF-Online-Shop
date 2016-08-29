<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>登录页</title>	
	<psf:header/>
	<link href="/css/passport.css" rel="stylesheet" type="text/css"/>
	<script src="/js/passport/login.js" type="text/javascript"></script>
	<script>
	function changeCaptcha() {
		$("#captchaImg").attr("src","/captcha?t="+Math.random());
	}
	var reg_form={
			email:"",
			emailflag:false,
			username:"",
			usernameflag:false,
			password:"",
			pwdflag:false,
			pwd2flag:false,
			phone:"",
			uid:"",
			groupid:"",
			code:"",
			yzm:""
		};
	$(document).ready(function(){
		$("#reg_email").val("");
		$("#reg_userid").val("");
		$("#reg_phone").val("");
		//电子邮箱检测
		$("#reg_email").blur(function(){
			if(this.value!=""){
				var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
				if(!myreg.test(this.value))
				{
					$("#reg_email_text").replaceWith('<div id="reg_email_text" class="inputerror">邮箱格式错误</div>');
				}
				else{
					$("#reg_email_text").replaceWith('<span id="reg_email_text" style="position:relative;top:3px" ><img src="/images/loading.gif" /></span>');
					$.post("/reg_check_email",{email:this.value},function(data){
						if(data.success==1) {
							$("#reg_email_text").replaceWith('<div id="reg_email_text" class="inputsucc">邮箱可以注册</div>');
							reg_form["emailflag"]=true;
							reg_form["email"]=$("#reg_email").val();
							return;
						} else if(data.success==0) {
							$("#reg_email_text").replaceWith('<div id="reg_email_text" class="inputerror">邮箱已被注册</div>');
						}
					},"json")
				}
			}else{$("#reg_email_text").replaceWith('<div id="reg_email_text" class="inputerror">未输入邮箱地址</div>');}
			reg_form["emailflag"]=false;
		});
		//昵称检测
		$("#reg_userid").blur(function(){
			if(this.value!=""){
				$("#reg_userid_text").replaceWith('<span id="reg_userid_text" style="position:relative;top:3px" ><img src="/images/loading.gif" /></span>');
				$.post("/reg_check_username",{username:this.value},function(data){
					if(data.success==1) {
						$("#reg_userid_text").replaceWith('<div id="reg_userid_text" class="inputsucc">昵称可以注册</div>');
						reg_form["usernameflag"]=true;
						reg_form["username"]=$("#reg_userid").val();
						return;
					} else if(data.success==0) {
						$("#reg_userid_text").replaceWith('<div id="reg_userid_text" class="inputerror">昵称已被注册</div>');
					}else{
						
					}
				},"json")	
			}else{$("#reg_userid_text").replaceWith('<div id="reg_userid_text" class="inputerror">未输入昵称</div>');}
			reg_form["usernameflag"]=false;
		});
		//密码检测
		$("#reg_pwd").blur(function(){
			if(this.value!=""){
				if(this.value.length>=6 && this.value.length<=18){
					$("#reg_pwd_text").replaceWith('<div id="reg_pwd_text" class="inputsucc">密码可用</div>');
					reg_form["pwdflag"]=true;
					reg_form["password"]=$("#reg_pwd").val();
					if($("#reg_pwd2").val()!=""){$("#reg_pwd2").trigger("blur")}
					return;
				}else{
					$("#reg_pwd_text").replaceWith('<div id="reg_pwd_text" class="inputerror">密码长度应在6-18位之间</div>');
				}
			}else{$("#reg_pwd_text").replaceWith('<div id="reg_pwd_text" class="inputerror">未输入密码</div>');}
			reg_form["pwdflag"]=false;
		})
		$("#reg_pwd2").blur(function(){
			if(this.value!=""){
				if(this.value==$("#reg_pwd").val()){
					$("#reg_pwd2_text").replaceWith('<div id="reg_pwd2_text" class="inputsucc">两次输入的密码一致</div>');
					reg_form["pwd2flag"]=true;
					return;
				}else{$("#reg_pwd2_text").replaceWith('<div id="reg_pwd2_text" class="inputerror">两次输入的密码不一致</div>');}
			}
			reg_form["pwd2flag"]=false;
		})
		//注册码验证
		//注册按钮添加事件
		$("#sendbutton").click(function(){
		setTimeout(postreg,150);
		});
		
	})
	function postreg(){
	reg_form["phone"]=$("#reg_phone").val();
	reg_form["uid"]=$("#uid").val();
	reg_form["groupid"]=$("#groupid").val();
	reg_form["code"]=$("#code").val();
	reg_form["yzm"]=$("#reg_yzm").val();
		if(reg_form["emailflag"] && reg_form["usernameflag"] && reg_form["pwdflag"] && reg_form["pwd2flag"] ){
			if($("#agreebox").attr("checked")){
				$("#reg_agree_text").replaceWith('<span id="reg_agree_text"></span>');
				//alert("xxx");
				$.post("/reg_save",reg_form,function(data){
				alert(data.success);
					switch(data.success){
					case 0:
						$("#reg_email_text").replaceWith('<div id="reg_email_text" class="inputerror">邮箱已被注册</div>');
						reg_form["emailflag"]=false;
					break;
					case 1:
						$("#reg_userid_text").replaceWith('<div id="reg_userid_text" class="inputerror">昵称已被注册</div>');
						reg_form["usernameflag"]=false;
					break;
					case 2:
						$("#reg_email_text").replaceWith('<div id="reg_email_text" class="inputerror">邮箱已被注册</div>');
						reg_form["emailflag"]=false;
					break;
					case 3:
						if(data.info == 1){
							window.location.href="/sns";
						} else if(data.info == 2){
							window.location.href="/sns/friend";
						} else {
							window.location.href="/sns/group/detail?groupid="+data.groupid;
						}
						
					break;
					case 4:
						$("#reg_yzm_text").replaceWith('<div id="reg_yzm_text" class="inputerror">验证码错误</div>');
					break;
					}
				},"json")
			}else{
			$("#reg_agree_text").replaceWith('<div id="reg_agree_text" class="inputerror">未同意条约</div>');
			}
		}else{}
		
	}

	
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
        <div class="reg_content">
        
        	<dl class="login_header">
                <dt class="icon_reg"></dt>
                <dd><em></em>直接<a href="/login"><b>登陆</b></a>品上丰</dd>
            </dl>
            
            <form id="loginForm" action="/login_check" method="post">
	
			<input type="hidden" id="uid" name="uid" value="${uid }"/>
			<input type="hidden" id="groupid" name="groupid" value="${groupid }"/>
			<input type="hidden" id="code" name="code" value="${code }"/>
            <div class="reg_group">
            	<h5>必填项</h5>
                <div class="loginbox">
                    
                    <dl>
                        <dt>电子邮箱：</dt>
                        <dd>
                            <input id="reg_email" class="input_name"  value=""/>
                            <span id="reg_email_text" class="msg_info">站内信和您的品上丰账户安全</span>
                            <!--<p class="errmsg">错误信息</p>-->
                        </dd>
                    </dl>
                    <dl>
                        <dt>昵 &nbsp;&nbsp; 称：</dt>
                        <dd>
                            <input id="reg_userid" class="input_name" value=""/>
                            <span id="reg_userid_text" class="msg_info"><span>*</span> 用户名特殊字符除外的任意字符。</span>
                            <!--<p class="errmsg">错误信息</p>-->
                        </dd>
                    </dl>
                    <dl>
                        <dt>密 &nbsp;&nbsp; 码：</dt>
                        <dd>
                            <input id="reg_pwd" type="password" class="input_password"  value=""/>
                            <span id="reg_pwd_text" class="msg_info"><span>*</span> 密码为6-18为的任意字符组合</span>
                            <!--<p class="errmsg">错误信息</p>-->
                        </dd>
                    </dl>
                    <dl>
                        <dt>确认密码：</dt>
                        <dd>
                            <input id="reg_pwd2" type="password" class="input_password"  value=""/>
                            <span id="reg_pwd2_text" class="msg_info"><span>*</span> 请再次输入密码</span>
                            <!--<p class="errmsg">错误信息</p>-->
                        </dd>
                    </dl>
                    <dl>
                		<dt>验 证 码：</dt>
                    	<dd>
                    		<input class="input_validate" onClick="this.style.color='black';" id="reg_yzm" name="yzm"/>
							<img id="captchaImg" src="/captcha?s=<%=System.currentTimeMillis()%>" alt="验证码" />
                    	    <a href="javascript:changeCaptcha();"> 换一个？</a>
                    	    <span id="reg_yzm_text" class="msg_info"><span>*</span> 请正确输入验证码（不区分大小写）</span>
							<!--<p class="errmsg">错误信息</p>-->
                 	   </dd>
					</dl> 
                </div>
            </div>
            
            <div class="reg_group">
            	<h5>选填项 <span>(下列选填项日可以作为登陆依据)</span></h5>
                <div class="loginbox">
                    
                    <dl>
                    
                    	<dt>手机号码：</dt>
                        <dd>
                        
                        	<input id="reg_phone" class="input_name" type="password" value=""/>
                            <span class="msg_info">用户网站会员信息维护等服务使用，不会向第三方泄露</span>
                        
                        </dd>
                    
                    </dl>
                    <dl>
                    
                    	<dt></dt>
                        <dd>
                        
                        	<input id="agreebox" class="checkbox" type="checkbox" checked="checked" />
                            <a href="#">我同意品上丰100的网站的使用条约</a>
                            <span id="reg_agree_text"></span>
                        
                        </dd>
                    
                    </dl>
                    <dl class="btns">
                        <dt></dt>
                        <dd>
                            <a id="sendbutton" class="regbtn" href="#"></a>
                            <a href="/login">已有账号,直接登录>></a> 
                        </dd>
                    </dl>
                    
                </div>
            </div>
        	</form>	
        
        </div>
</div>

	<!--
    <div id="header">
    	<div id="logo"><a href="#"><img src="/images/passport/logo.gif" alt="logo" /></a></div>
        <div id="banner"><a href="#"><img src="/images/passport/banner.gif" alt="banner" /></a></div>
    </div>
    <div id="login_left">
    	<div id="logintheme"><img src="/images/passport/logintheme.jpg" /></div>
        <div id="login_text"><img src="/images/passport/login_text.jpg" /></div>
    </div>
    <div id="login_right">
    	<div id="login_header">
        	<div class=" logintitle"><img src="/images/passport/title.gif" /></div>
            <div class="loginicon">一分钟<a href="#" class="hongse"><strong>注册</strong></a>品上丰100，享受更多服务</div>
        </div>
        <div class="loginbox">
            <dl>
            <dt><b>必填项</b></dt>
            	<dd><span>电子邮箱：</span><input id="reg_email" type="text" class="inputbox"  value=""/><span id="reg_email_text">站内信和您的品上丰账户安全</span></dd>
            	<dd><span>昵&nbsp;&nbsp;&nbsp;&nbsp;称：</span><input id="reg_userid" type="text" class="inputbox"  value=""/><span id="reg_userid_text">用户名格式为6-18位的特殊字符除外的任意字符。</span></dd>
                <dd><span>密&nbsp;&nbsp;&nbsp;&nbsp;码：</span><input id="reg_pwd" type="password" class="inputbox"  value=""/><span id="reg_pwd_text">密码为6-18为的任意字符组合</span></dd>
                <dd><span>确认密码：</span><input id="reg_pwd2" type="password" class="inputbox"  value=""/><span id="reg_pwd2_text">请再次输入密码</span></dd>
            </dl>
              <dl>
              <br />
            <dt><b>选填项</b>(下列选项日后也可作为登录依据)</dt>
                <dd><span>手机号码：</span><input id="reg_phone" type="password" class="inputbox"  value=""/>用户网站会员信息维护等服务使用，不会向第三方泄露</dd>
                <dd><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><input id="agreebox" type="checkbox" checked="checked" /><a href="#" class="hongse"> 我同意品上丰100的网站的使用条约</a><span id="reg_agree_text"></span></dd>
                <dd><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><input  id="sendbutton"  type="button" value="" class="regbtn" /><span><a href="/login" class="hongse">已有账号,直接登录>></a></span></dd>
                <dd style="clear:both;"></dd>
            </dl> 
        </div>
    </div>
    
    -->
    
</body>
</html>