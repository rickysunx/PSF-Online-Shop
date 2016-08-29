<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
            
<div class="rows">

    <h3>邀请好友关注我</h3>
    <h6>选择常用的邀请方式，邀请好友加入社区。收到邀请的人注册社区后，就会自动关注你哦</h6>

</div>

<div class="rows">

    <h3><a href="#">方法一：邀请链接</a></h3>
    
    <div class="info">
        <p>通过QQ、MSN、电子邮件发送邀请链接给你的朋友</p>
        <p>注册成功后他们会自动成为你的粉丝。</p>
    </div>
    
    <div class="row">
    
        <input id="psffriend_invite" class="link_input" value="${url }"/>
        <a href="javascript:void(0)" class="button" onclick="copyURL();">复制链接</a>
        
    </div>

</div>

<div class="rows">

    <h3><a href="#">方法二：邀请邮箱联系人</a></h3>
    
    <div class="info">
        <p>找找看，哪些人已经在品上社区了。</p>
        <p>品上丰100承诺：会对你的账号和密码绝对保密！。</p>
    </div>
    
    <dl>
    
        <dt>邮箱地址：</dt>
        <dd>
            
            <input class="mail_input" />
            <i>@</i>
            <select><option>请选择邮箱类型</option></select>
            
            <ul class="mail_select">
                
                <li class="current"><a href="#"><img src="/images/sns/photo/mail01.png" alt="" /></a></li>
                <li><a href="#"><img src="/images/sns/photo/mail02.png" alt="" /></a></li>
                <li><a href="#"><img src="/images/sns/photo/mail03.png" alt="" />></a></li>
                <li><a href="#"><img src="/images/sns/photo/mail04.png" alt="" />></a></li>
                <li><a href="#"><img src="/images/sns/photo/mail01.png" alt="" />></a></li>
                <li><a href="#"><img src="/images/sns/photo/mail02.png" alt="" />></a></li>
                <li><a href="#"><img src="/images/sns/photo/mail03.png" alt="" />></a></li>
                <li><a href="#"><img src="/images/sns/photo/mail04.png" alt="" />></a></li>
            
            </ul>
            
        </dd>
    
    </dl>
    
    <dl>
    
        <dt>邮箱密码：</dt>
        <dd><input type="password" class="mail_input" /></dd>
    
    </dl>
    
    <dl>
    
        <dt></dt>
        <dd><a class="button" href="#">查找</a></dd>
    
    </dl>

</div>

<div class="rows">

    <h3><a href="#">方法三：邮件邀请</a></h3>
    
    <div class="row">
    
        <input class="link_input" />
        <a  class="button" href="#">复制链接</a>
            
    </div>
    <p class="msg">请输入邮箱地址，多个邮箱地址请用"；"分隔</p>

</div>

