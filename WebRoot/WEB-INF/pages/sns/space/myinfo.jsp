<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<script type=text/javascript>
$(function(){
	$('#more li').hover(function(){
		$(this).children('ul').stop(true,true).show('slow');
	},function(){
		$(this).children('ul').stop(true,true).hide('slow');
	});
});
</script>
<div id="personal_page">
    	<div id="userpic"><a href="#"><img src="/images/sns/space_img/userheader.gif" alt="userName" /></a></div>
        <div id="information">
        	<div id="infortitle"><span class="title">品上丰100-张三</span><a href="#">(<span>Microsoft</span>)</a><a href="#">[修改备注]</a></div>
            <div><a href="#">http://www.psf100.com/user?id=010</a></div>
             <div class="usernav"></div>
            <div>关注<a href="#" class="number">321</a>粉丝<a href="#" class="number">124</a>好友<a href="#" class="number">343</a>圈子<a href="#" class="number">12</a>发表<a href="#" class="number">108</a></div>
             <div class="usernav"></div>
            <div id="show">阿斯达说的按时打算大扫荡阿斯达阿斯达阿斯达阿斯达阿斯达阿斯达阿斯达阿斯达阿斯达阿斯达阿斯达阿斯达阿斯达阿斯达阿斯达阿斯达阿斯达爱上</div>
            <div class="usernews"><span id="group">同事、朋友、智慧人生</span><span id="set">设置分组</span></div>
            <div class="usernav"></div>
           <div class="usernews">
           		<div class="addfriend"><a href="#">好友</a></div><div class="lock">以关注</div>
                <div id="userclick">
                <span class="email"><a href="#">发私信</a></span>
                <span class="weobo"><a href="#">求关注</a></span>
                <span class="more_btn">
	                <ul id="more" class="more_select">
						  <li><a href="#" target="_self"  class="moreMenu">更多</a>
						      <ul style="display:none;" class="moreBox">
							      <li><a href="#">引荐</a></li>
							      <li><a href="#">推荐</a></li>
							      <li><a href="#">黑名单</a></li>
							      <li><a href="#">举报</a></li>
						      </ul>
						 </li>
					</ul>
				</span>
                </div>
                
           </div>
        </div>
    </div>
