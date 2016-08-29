<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>品上商城团页－基本信息</title>
    <psf:header/>
	<link href="/css/mall.css" rel="stylesheet" type="text/css"/>
    
    <!--测试商品列表交互效果,可作参考-->
    <script type="text/javascript">
    
		$(document).ready(function(){
			
			var s = $("ul.shop_list").find("li");
			s.each(function(){
				 $(this).mouseenter(function(){

					$(this).addClass('current');
				});
				 $(this).mouseleave(function(){
					$(this).removeClass('current');
				});
			});
			
		});
    
    </script>
    <!--测试商品列表交互效果,可作参考-->
    
</head>

<body>
<psf:shortcut/>

<div id="html_wrap">

	<div id="mall_header">
    
    	<div class="top">
        
            <a id="logo" href="#"><img src="/images/mall/logo.png" alt="" /></a>
            <a href="#"><img src="/images/mall/photo/banner_big3.png" alt="" /></a>
            
        </div>
    
    </div>

    <div class="group_process_box">
    
        <ul class="process_header">
        
            <li class="current"><em class="info"></em></li>
        	<li><em class="avatar"></em></li>
        	<li><em class="share"></em></li>
        
        </ul>
        
        <div class="group_content">
        
        	<div class="group_left"></div>
            <div class="group_info">
    
                <dl>
                
                    <dt>团名称：</dt>
                    <dd><input value="最多可以写15个字" /></dd>
                
                </dl>
                
                <dl>
                
                    <dt>团停止时间：</dt>
                    <dd class="group_time">
                    
                        <select class="year">
                        
                            <option>1986</option>
                        
                        </select>
                        <label>年</label>
                        <select class="month">
                        
                            <option>11</option>
                        
                        </select>
                        <label>月</label>
                        <select class="day">
                        
                            <option>07</option>
                        
                        </select>
                        <label>日</label>
                    
                    </dd> 
                
                </dl>
                
                <dl>
                
                    <dt>团停止时间：</dt>
                    <dd>
                    
                        <select class="type">
                        
                            <option>二人团</option>
                        
                        </select>
                    
                    </dd>
                </dl>
                
                <dl>
                
                    <dt>团介绍：</dt>
                    <dd>
                    
                        <textarea>输入100个字</textarea>
                    
                    </dd>
                </dl>
                
                <div class="bottom">
                    
                    <a class="next_button" href="#"></a>
                
                </div>
        
            </div>
            
        </div>
    
    </div>
</div>

<div id="footer"><div class="container">

	<div class="footer_help_list">
    
    	<dl class="guide">
        
        	<dt><em></em></dt>
            <dd>
                <h5><a href="#">新手指南</a></h5>
                <p><a href="#">注册新用户</a></p>
                <p><a href="#">网站订购流程</a></p>
                <p><a href="#">网站地图</a></p>
            </dd>
        
        </dl>
        <dl class="pay">
        
        	<dt><em></em></dt>
            <dd>
                <h5><a href="#">如何付款与退款</a></h5>
                <p><a href="#">支付方式</a></p>
                <p><a href="#">如何办理腿退款</a></p>
                <p><a href="#">发票制度说明</a></p>
            </dd>
        
        </dl>
        <dl class="distribution">
        
        	<dt><em></em></dt>
            <dd>
                <h5><a href="#">配送方式</a></h5>
                <p><a href="#">支付方式</a></p>
                <p><a href="#">如何办理腿退款</a></p>
                <p><a href="#">发票制度说明</a></p>
            </dd>
        
        </dl>
        <dl class="service">
        
        	<dt><em></em></dt>
            <dd>
                <h5><a href="#">售后服务</a></h5>
                <p><a href="#">退换货政策</a></p>
                <p><a href="#">如何办理退换货</a></p>
            </dd>
        
        </dl>
        <dl class="help">
        
        	<dt><em></em></dt>
            <dd>
                <h5><a href="#">帮助中心</a></h5>
                <p><a href="#">常见热点问题</a></p>
                <p><a href="#">联系我们</a></p>
                <p><a href="#">投诉与建议</a></p>
            </dd>
        
        </dl>
    
    </div>
    
    <div class="bottom">
    
    	<center><img src="/images/mall/kefu.png" alt="" /></center>
    
    </div>

</div></div>

</body>
</html>