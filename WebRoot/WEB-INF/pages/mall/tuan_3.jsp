<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>品上商城团页－组团成功</title>
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
        
            <li><em class="info"></em></li>
        	<li><em class="avatar"></em></li>
        	<li class="current"><em class="share"></em></li>
        
        </ul>
        
        <div class="group_content">
        
        	<div class="group_left"></div>
            
            <div class="group_share">
    
                <div class="share_info">
                
                    <h5>恭喜你已经成为团主了，发布给大家，让大家一起来围观，一起团！</h5>
                    <div class="msgbox">
                        我在品上丰100成为团主了，团购商品：耐克轻质跑步鞋一双，价格为199.00，在品上丰100，我的团购我做主，详细团介绍：这是一双超好的鞋！希望大家一起来购！            
                    </div>
                    <ul>
                        <li><input type="checkbox" /><label>发布到我的广播</label></li>
                        <li><input type="checkbox" /><label>发布到我的圈子</label></li>
                    </ul>
                
                </div>

                <div class="bottom"><a class="ok_button" href="#"></a></div>
            
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

<div class="group_dialog" style="border:1px #f00 solid;background:#fff;width:487px">

	<div class="layerTop_grad_orange">
    	
        <a class="close" href="#"></a>
        <h3>组团分享</h3>
    
    </div>
    
    <div class="group_share">
    
    	<div class="share_info share_notitle_info">
        
            <div class="msgbox">
            	我在品上丰100成为团主了，团购商品：耐克轻质跑步鞋一双，价格为199.00，在品上丰100，我的团购我做主，详细团介绍：这是一双超好的鞋！希望大家一起来购！            
            </div>
        
        </div>
        <dl class="share_list share_nobor_list">
        
        	<dt>分享：</dt>
            <dd>
            
            	<ul>
                
                	<li><a class="icon_mail" href="#"></a></li>
                    <li><a class="icon_qq" href="#"></a></li>
                    <li><a class="icon_msn" href="#"></a></li>
                    <li><a class="icon_sina" href="#"></a></li>
                    <li><a class="icon_t_qq" href="#"></a></li>
                    <li><a class="icon_ren" href="#"></a></li>
                    <li><a class="icon_kaixin" href="#"></a></li>
                    <li><a class="icon_dou" href="#"></a></li>
                
                </ul>
            
            </dd>
        
        </dl>
        
    </div>

</div>


</body>
</html>