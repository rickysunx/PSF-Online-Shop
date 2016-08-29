<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<script type=text/javascript>
$(function(){
	$('.more_btn').hover(function(){
		$(this).css({'position':'relative'});
		$(this).children('ol').stop(true,true).show('slow');
	},function(){
		$(this).children('ol').stop(true,true).hide('slow');
	});
});
</script>

<dl class="brand_user_box">

	<dt><a href="#"><img src="/pic/1028.jpg" alt="" /></a></dt>
    <dd>
    
    	<h3>阿里巴巴</h3>
        <h6><a href="#">http://weibo.com/nike</a></h6>
        <div class="data">
      		<span><a href="#">关注</a><b>10</b></span>
            <span><a href="#">粉丝</a><b>2300000</b></span>
            <span><a href="#">好友</a><b>245</b></span>
            <span><a href="#">圈子</a><b>2</b></span>
            <span><a href="#">发表</a><b>210</b></span>
        </div>
        <div class="info"><b>品牌宣言：</b>阿斯达说的按时打算大扫荡阿斯达阿斯达阿斯达阿斯达阿斯达阿斯达阿斯达阿斯达阿斯达阿斯达阿斯达阿斯达阿斯达阿斯达阿斯达阿斯达阿阿斯达阿斯达阿斯达阿斯达阿斯达阿斯达阿斯达阿斯达阿斯达爱上</div>
        <div class="group">
        
        	<div class="name"><em></em>同事、帮助者、智慧人生</div>
            <a href="#"><em></em>设置分组</a>
        
        </div>
        <div class="bottom">
        
        	<ul>
            
            	<li><a class="email" href="#"><em></em>我要留言</a></li>
                <li><a class="weobo" href="#"><em></em>我要留言</a></li>
                <li class="more_btn">
                	<a href="#">更多<em></em></a>
                    <ol>
                    
                    	<li><a class="edit" href="#"><i></i>编辑广告</a></li>
                        <li><a class="fabu" href="#"><i></i>活动发布</a></li>
                        <li><a class="hmd" href="#"><i></i>加入黑名单</a></li>
                        <li><a class="jubao" href="#"><i></i>举报</a></li>
                    
                    </ol>
                </li>
            
            </ul>
        	<a href="#" class="addbtn02 addbtn02_ok"><em></em>好友</a>
            <a href="#" class="addbtn02 addbtn02_ok">已关注</a>
        
        </div>
    
    </dd>

</dl>