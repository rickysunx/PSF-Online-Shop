<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>品上商城全部分类页-全部商品分类</title>
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
            <div class="hold"><img class="icon" src="/images/temp/pricewrap.png" alt="" /><a href="#"><img src="/images/temp/small-banner.png" alt="" /></a></div>
        
            <a id="logo" href="#"><img src="/images/mall/logo.png" alt="" /></a>
            <span>
                <a href="#"><img src="/images/mall/youhui.png" alt="" /></a>
                <a href="#"><img src="/images/mall/tuihuo.png" alt="" /></a>
                <a href="#"><img src="/images/mall/fenxiang.png" alt="" /></a>
                <a href="#"><img src="/images/mall/anquan.png" alt="" /></a>
            </span>
        </div>
        
        <div class="navgation">
    
            <ul>
                <li><a href="#">首 &nbsp; 页</a></li>
                <li><a class="red" href="#">促 &nbsp; 销</a></li>
                <li><a class="pink" href="#">新 &nbsp; 品</a></li>
                <li><a class="green" href="#">品友团</a></li>
                <li class="current"><a class="blue" href="#">全部分类</a></li>
            </ul>
        
        </div>
    
    </div>

    <div class="sortbox">
    
    	<ul class="tab">
        
        	<li class="current"><a href="#">全部商品分类</a></li>
            <li><a href="#">全部品牌</a></li>
        
        </ul>
        
        <div class="all_sort_box">
        
        	<div class="header">
                <h3>快捷进入二级分类页,请点击</h3>
                <ul class="sort_item">
                
                	<li><a href="#"><em class="icon_woman"></em>时尚女装</a></li>
                    <li><a href="#"><em class="icon_man"></em>品质男装</a></li>
                    <li><a href="#"><em class="icon_huazhuang"></em>美妆护装</a></li>
                    <li><a href="#"><em class="icon_sport"></em>运动户外</a></li>
                    <li><a href="#"><em class="icon_package"></em>鞋帽箱包</a></li>
                    <li><a href="#"><em class="icon_tele"></em>手机数码</a></li>
                    <li><a href="#"><em class="icon_baby"></em>妈妈宝宝</a></li>
                    <li><a href="#"><em class="icon_food"></em>食品保健</a></li>
                    <li><a href="#"><em class="icon_gift"></em>礼品配饰</a></li>
                    <li><a href="#"><em class="icon_furniture"></em>家具家居</a></li>
                
                </ul>
            </div>
            
            <div class="all_sort_table">
                <table cellpadding="0" cellspacing="6">
                
                    <tr>
                    
                        <td>
                        
                            <h3><em class="icon_woman"></em>时尚女装</h3>
                              
                            <div class="subitem">        
                                <div class="left">
                                
                                    <h5>选择分类</h5>
                                    <dl>
                                    
                                        <dt>女装</dt>
                                        <dd><a href="#">t血</a> | <a href="#">吊带背心</a> | <a href="#">雪纺衫</a> | <a href="#">衬衫</a> | <a href="#">针织衫</a> | <a href="#">短外套</a> | <a href="#">连衣裙</a> | <a href="#">半身裙</a> | <a href="#">牛仔裤</a> | <a href="#">短裤</a> | <a href="#">休闲裤</a></dd>
                                    
                                    </dl>
                                    <dl>
                                    
                                        <dt>女士内衣</dt>
                                        <dd><a href="#">文胸</a> | <a href="#">内裤</a> | <a href="#">文胸套装</a> | <a href="#">睡裙</a> | <a href="#">睡衣套装</a> | <a href="#">塑身内衣</a> | <a href="#">泳装</a> | <a href="#">袜子</a></dd>
                                    
                                    </dl>
                                
                                </div>
                                <div class="right">
                                
                                    <h5>热销品牌</h5>
                                    <p>
                                        <a href="#">艾格</a> | <a href="#">歌利娅</a> | <a href="#">珂罗娜</a> | <a href="#">菌佳妮</a> | <a href="#">唐狮</a> | <a href="#">七格格</a> | <a href="#">南梦</a> | <a href="#">以纯</a> | <a href="#">菌曼</a> | <a href="#">O.SA</a> | <a href="#">裂棉</a> | <a href="#">花园街19号</a>       
                                    </p>
                                    <h5>最新品牌</h5>
                                    <p>
                                        <a href="#">艾格</a> | <a href="#">歌利娅</a> | <a href="#">珂罗娜</a> | <a href="#">菌佳妮</a> | <a href="#">唐狮</a> | <a href="#">七格格</a> | <a href="#">南梦</a> | <a href="#">以纯</a> | <a href="#">菌曼</a> | <a href="#">O.SA</a> | <a href="#">裂棉</a> | <a href="#">花园街19号</a>       
                                    </p>
                                
                                </div>
                            </div>
                        
                        </td>
                        <td>
                        
                            <h3><em class="icon_man"></em>品质男装</h3>
                              
                            <div class="subitem">        
                                <div class="left">
                                
                                    <h5>选择分类</h5>
                                    <dl>
                                    
                                        <dt>女装</dt>
                                        <dd><a href="#">t血</a> | <a href="#">吊带背心</a> | <a href="#">雪纺衫</a> | <a href="#">衬衫</a> | <a href="#">针织衫</a> | <a href="#">短外套</a> | <a href="#">连衣裙</a> | <a href="#">半身裙</a> | <a href="#">牛仔裤</a> | <a href="#">短裤</a> | <a href="#">休闲裤</a></dd>
                                    
                                    </dl>
                                    <dl>
                                    
                                        <dt>女士内衣</dt>
                                        <dd><a href="#">文胸</a> | <a href="#">内裤</a> | <a href="#">文胸套装</a> | <a href="#">睡裙</a> | <a href="#">睡衣套装</a> | <a href="#">塑身内衣</a> | <a href="#">泳装</a> | <a href="#">袜子</a></dd>
                                    
                                    </dl>
                                    <dl>
                                    
                                        <dt>女士内衣</dt>
                                        <dd><a href="#">文胸</a> | <a href="#">内裤</a> | <a href="#">文胸套装</a> | <a href="#">睡裙</a> | <a href="#">睡衣套装</a> | <a href="#">塑身内衣</a> | <a href="#">泳装</a> | <a href="#">袜子</a></dd>
                                    
                                    </dl>
                                    <dl>
                                    
                                        <dt>女士内衣</dt>
                                        <dd><a href="#">文胸</a> | <a href="#">内裤</a> | <a href="#">文胸套装</a> | <a href="#">睡裙</a> | <a href="#">睡衣套装</a> | <a href="#">塑身内衣</a> | <a href="#">泳装</a> | <a href="#">袜子</a></dd>
                                    
                                    </dl>
                                    <dl>
                                    
                                        <dt>女士内衣</dt>
                                        <dd><a href="#">文胸</a> | <a href="#">内裤</a> | <a href="#">文胸套装</a> | <a href="#">睡裙</a> | <a href="#">睡衣套装</a> | <a href="#">塑身内衣</a> | <a href="#">泳装</a> | <a href="#">袜子</a></dd>
                                    
                                    </dl>
                                
                                </div>
                                <div class="right">
                                
                                    <h5>热销品牌</h5>
                                    <p>
                                        <a href="#">艾格</a> | <a href="#">歌利娅</a> | <a href="#">珂罗娜</a> | <a href="#">菌佳妮</a> | <a href="#">唐狮</a> | <a href="#">七格格</a> | <a href="#">南梦</a> | <a href="#">以纯</a> | <a href="#">菌曼</a> | <a href="#">O.SA</a> | <a href="#">裂棉</a> | <a href="#">花园街19号</a>       
                                    </p>
                                    <h5>最新品牌</h5>
                                    <p>
                                        <a href="#">艾格</a> | <a href="#">歌利娅</a> | <a href="#">珂罗娜</a> | <a href="#">菌佳妮</a> | <a href="#">唐狮</a> | <a href="#">七格格</a> | <a href="#">南梦</a> | <a href="#">以纯</a> | <a href="#">菌曼</a> | <a href="#">O.SA</a> | <a href="#">裂棉</a> | <a href="#">花园街19号</a>       
                                    </p>
                                
                                </div>
                            </div>
                        
                        </td>
                    
                    </tr>
                    <tr>
                    
                        <td>
                        
                            <h3><em class="icon_huazhuang"></em>美妆护理</h3>
                              
                            <div class="subitem">        
                                <div class="left">
                                
                                    <h5>选择分类</h5>
                                    <dl>
                                    
                                        <dt>女装</dt>
                                        <dd><a href="#">t血</a> | <a href="#">吊带背心</a> | <a href="#">雪纺衫</a> | <a href="#">衬衫</a> | <a href="#">针织衫</a> | <a href="#">短外套</a> | <a href="#">连衣裙</a> | <a href="#">半身裙</a> | <a href="#">牛仔裤</a> | <a href="#">短裤</a> | <a href="#">休闲裤</a></dd>
                                    
                                    </dl>
                                    <dl>
                                    
                                        <dt>女士内衣</dt>
                                        <dd><a href="#">文胸</a> | <a href="#">内裤</a> | <a href="#">文胸套装</a> | <a href="#">睡裙</a> | <a href="#">睡衣套装</a> | <a href="#">塑身内衣</a> | <a href="#">泳装</a> | <a href="#">袜子</a></dd>
                                    
                                    </dl>
                                
                                </div>
                                <div class="right">
                                
                                    <h5>热销品牌</h5>
                                    <p>
                                        <a href="#">艾格</a> | <a href="#">歌利娅</a> | <a href="#">珂罗娜</a> | <a href="#">菌佳妮</a> | <a href="#">唐狮</a> | <a href="#">七格格</a> | <a href="#">南梦</a> | <a href="#">以纯</a> | <a href="#">菌曼</a> | <a href="#">O.SA</a> | <a href="#">裂棉</a> | <a href="#">花园街19号</a>       
                                    </p>
                                
                                </div>
                            </div>
                        
                        </td>
                        <td>
                        
                            <h3><em class="icon_sport"></em>运动户外</h3>
                              
                            <div class="subitem">        
                                <div class="left">
                                
                                    <h5>选择分类</h5>
                                    <dl>
                                    
                                        <dt>女装</dt>
                                        <dd><a href="#">t血</a> | <a href="#">吊带背心</a> | <a href="#">雪纺衫</a> | <a href="#">衬衫</a> | <a href="#">针织衫</a> | <a href="#">短外套</a> | <a href="#">连衣裙</a> | <a href="#">半身裙</a> | <a href="#">牛仔裤</a> | <a href="#">短裤</a> | <a href="#">休闲裤</a></dd>
                                    
                                    </dl>
                                
                                </div>
                                <div class="right">
                                
                                    <h5>热销品牌</h5>
                                    <p>
                                        <a href="#">艾格</a> | <a href="#">歌利娅</a> | <a href="#">珂罗娜</a> | <a href="#">菌佳妮</a> | <a href="#">唐狮</a> | <a href="#">七格格</a> | <a href="#">南梦</a> | <a href="#">以纯</a> | <a href="#">菌曼</a> | <a href="#">O.SA</a> | <a href="#">裂棉</a> | <a href="#">花园街19号</a>       
                                    </p>
                                    <h5>最新品牌</h5>
                                    <p>
                                        <a href="#">艾格</a> | <a href="#">歌利娅</a> | <a href="#">珂罗娜</a> | <a href="#">菌佳妮</a> | <a href="#">唐狮</a> | <a href="#">七格格</a> | <a href="#">南梦</a> | <a href="#">以纯</a> | <a href="#">菌曼</a> | <a href="#">O.SA</a> | <a href="#">裂棉</a> | <a href="#">花园街19号</a>       
                                    </p>
                                
                                </div>
                            </div>
                        
                        </td>
                    
                    </tr>
                    <tr>
                    
                        <td>
                        
                            <h3><em class="icon_package"></em>鞋帽箱包</h3>
                              
                            <div class="subitem">        
                                <div class="left">
                                
                                    <h5>选择分类</h5>
                                    <dl>
                                    
                                        <dt>女装</dt>
                                        <dd><a href="#">t血</a> | <a href="#">吊带背心</a> | <a href="#">雪纺衫</a> | <a href="#">衬衫</a> | <a href="#">针织衫</a> | <a href="#">短外套</a> | <a href="#">连衣裙</a> | <a href="#">半身裙</a> | <a href="#">牛仔裤</a> | <a href="#">短裤</a> | <a href="#">休闲裤</a></dd>
                                    
                                    </dl>
                                
                                </div>
                                <div class="right">
                                
                                    <h5>热销品牌</h5>
                                    <p>
                                        <a href="#">艾格</a> | <a href="#">歌利娅</a> | <a href="#">珂罗娜</a> | <a href="#">菌佳妮</a> | <a href="#">唐狮</a> | <a href="#">七格格</a> | <a href="#">南梦</a> | <a href="#">以纯</a> | <a href="#">菌曼</a> | <a href="#">O.SA</a> | <a href="#">裂棉</a> | <a href="#">花园街19号</a>       
                                    </p>
                                
                                </div>
                            </div>
                        
                        </td>
                        <td>
                        
                            <h3><em class="icon_tele"></em>手机数码</h3>
                              
                            <div class="subitem">        
                                <div class="left">
                                
                                    <h5>选择分类</h5>
                                
                                </div>
                                <div class="right">
                                
                                    <h5>热销品牌</h5>
                                
                                </div>
                            </div>
                        
                        </td>
                    
                    </tr>
                    <tr>
                    
                        <td>
                        
                            <h3><em class="icon_baby"></em>妈妈宝宝</h3>
                              
                            <div class="subitem">        
                                <div class="left">
                                
                                    <h5>选择分类</h5>
                                    <dl>
                                    
                                        <dt>女装</dt>
                                        <dd><a href="#">t血</a> | <a href="#">吊带背心</a> | <a href="#">雪纺衫</a> | <a href="#">衬衫</a> | <a href="#">针织衫</a> | <a href="#">短外套</a> | <a href="#">连衣裙</a> | <a href="#">半身裙</a> | <a href="#">牛仔裤</a> | <a href="#">短裤</a> | <a href="#">休闲裤</a></dd>
                                    
                                    </dl>
                                    <dl>
                                    
                                        <dt>女士内衣</dt>
                                        <dd><a href="#">文胸</a> | <a href="#">内裤</a> | <a href="#">文胸套装</a> | <a href="#">睡裙</a> | <a href="#">睡衣套装</a> | <a href="#">塑身内衣</a> | <a href="#">泳装</a> | <a href="#">袜子</a></dd>
                                    
                                    </dl>
                                
                                </div>
                                <div class="right">
                                
                                    <h5>热销品牌</h5>
                                    <p>
                                        <a href="#">艾格</a> | <a href="#">歌利娅</a> | <a href="#">珂罗娜</a> | <a href="#">菌佳妮</a> | <a href="#">唐狮</a> | <a href="#">七格格</a> | <a href="#">南梦</a> | <a href="#">以纯</a> | <a href="#">菌曼</a> | <a href="#">O.SA</a> | <a href="#">裂棉</a> | <a href="#">花园街19号</a>       
                                    </p>
                                    <h5>最新品牌</h5>
                                    <p>
                                        <a href="#">艾格</a> | <a href="#">歌利娅</a> | <a href="#">珂罗娜</a> | <a href="#">菌佳妮</a> | <a href="#">唐狮</a> | <a href="#">七格格</a> | <a href="#">南梦</a> | <a href="#">以纯</a> | <a href="#">菌曼</a> | <a href="#">O.SA</a> | <a href="#">裂棉</a> | <a href="#">花园街19号</a>       
                                    </p>
                                
                                </div>
                            </div>
                        
                        </td>
                        <td>
                        
                            <h3><em class="icon_food"></em>食品保健</h3>
                              
                            <div class="subitem">        
                                <div class="left">
                                
                                    <h5>选择分类</h5>
                                    <dl>
                                    
                                        <dt>女装</dt>
                                        <dd><a href="#">t血</a> | <a href="#">吊带背心</a> | <a href="#">雪纺衫</a> | <a href="#">衬衫</a> | <a href="#">针织衫</a> | <a href="#">短外套</a> | <a href="#">连衣裙</a> | <a href="#">半身裙</a> | <a href="#">牛仔裤</a> | <a href="#">短裤</a> | <a href="#">休闲裤</a></dd>
                                    
                                    </dl>
                                    <dl>
                                    
                                        <dt>女士内衣</dt>
                                        <dd><a href="#">文胸</a> | <a href="#">内裤</a> | <a href="#">文胸套装</a> | <a href="#">睡裙</a> | <a href="#">睡衣套装</a> | <a href="#">塑身内衣</a> | <a href="#">泳装</a> | <a href="#">袜子</a></dd>
                                    
                                    </dl>
                                    <dl>
                                    
                                        <dt>女士内衣</dt>
                                        <dd><a href="#">文胸</a> | <a href="#">内裤</a> | <a href="#">文胸套装</a> | <a href="#">睡裙</a> | <a href="#">睡衣套装</a> | <a href="#">塑身内衣</a> | <a href="#">泳装</a> | <a href="#">袜子</a></dd>
                                    
                                    </dl>
                                    <dl>
                                    
                                        <dt>女士内衣</dt>
                                        <dd><a href="#">文胸</a> | <a href="#">内裤</a> | <a href="#">文胸套装</a> | <a href="#">睡裙</a> | <a href="#">睡衣套装</a> | <a href="#">塑身内衣</a> | <a href="#">泳装</a> | <a href="#">袜子</a></dd>
                                    
                                    </dl>
                                    <dl>
                                    
                                        <dt>女士内衣</dt>
                                        <dd><a href="#">文胸</a> | <a href="#">内裤</a> | <a href="#">文胸套装</a> | <a href="#">睡裙</a> | <a href="#">睡衣套装</a> | <a href="#">塑身内衣</a> | <a href="#">泳装</a> | <a href="#">袜子</a></dd>
                                    
                                    </dl>
                                
                                </div>
                                <div class="right">
                                
                                    <h5>热销品牌</h5>
                                    <p>
                                        <a href="#">艾格</a> | <a href="#">歌利娅</a> | <a href="#">珂罗娜</a> | <a href="#">菌佳妮</a> | <a href="#">唐狮</a> | <a href="#">七格格</a> | <a href="#">南梦</a> | <a href="#">以纯</a> | <a href="#">菌曼</a> | <a href="#">O.SA</a> | <a href="#">裂棉</a> | <a href="#">花园街19号</a>       
                                    </p>
                                    <h5>最新品牌</h5>
                                    <p>
                                        <a href="#">艾格</a> | <a href="#">歌利娅</a> | <a href="#">珂罗娜</a> | <a href="#">菌佳妮</a> | <a href="#">唐狮</a> | <a href="#">七格格</a> | <a href="#">南梦</a> | <a href="#">以纯</a> | <a href="#">菌曼</a> | <a href="#">O.SA</a> | <a href="#">裂棉</a> | <a href="#">花园街19号</a>       
                                    </p>
                                
                                </div>
                            </div>
                        
                        </td>
                    
                    </tr>
                    <tr>
                    
                        <td>
                        
                            <h3><em class="icon_gift"></em>礼品配饰</h3>
                              
                            <div class="subitem">        
                                <div class="left">
                                
                                    <h5>选择分类</h5>
                                    <dl>
                                    
                                        <dt>女装</dt>
                                        <dd><a href="#">t血</a> | <a href="#">吊带背心</a> | <a href="#">雪纺衫</a> | <a href="#">衬衫</a> | <a href="#">针织衫</a> | <a href="#">短外套</a> | <a href="#">连衣裙</a> | <a href="#">半身裙</a> | <a href="#">牛仔裤</a> | <a href="#">短裤</a> | <a href="#">休闲裤</a></dd>
                                    
                                    </dl>
                                    <dl>
                                    
                                        <dt>女士内衣</dt>
                                        <dd><a href="#">文胸</a> | <a href="#">内裤</a> | <a href="#">文胸套装</a> | <a href="#">睡裙</a> | <a href="#">睡衣套装</a> | <a href="#">塑身内衣</a> | <a href="#">泳装</a> | <a href="#">袜子</a></dd>
                                    
                                    </dl>
                                
                                </div>
                                <div class="right">
                                
                                    <h5>热销品牌</h5>
                                    <p>
                                        <a href="#">艾格</a> | <a href="#">歌利娅</a> | <a href="#">珂罗娜</a> | <a href="#">菌佳妮</a> | <a href="#">唐狮</a> | <a href="#">七格格</a> | <a href="#">南梦</a> | <a href="#">以纯</a> | <a href="#">菌曼</a> | <a href="#">O.SA</a> | <a href="#">裂棉</a> | <a href="#">花园街19号</a>       
                                    </p>
                                
                                </div>
                            </div>
                        
                        </td>
                        <td>
                        
                            <h3><em class="icon_furniture"></em>家居家具</h3>
                              
                            <div class="subitem">        
                                <div class="left">
                                
                                    <h5>选择分类</h5>
                                    <dl>
                                    
                                        <dt>女装</dt>
                                        <dd><a href="#">t血</a> | <a href="#">吊带背心</a> | <a href="#">雪纺衫</a> | <a href="#">衬衫</a> | <a href="#">针织衫</a> | <a href="#">短外套</a> | <a href="#">连衣裙</a> | <a href="#">半身裙</a> | <a href="#">牛仔裤</a> | <a href="#">短裤</a> | <a href="#">休闲裤</a></dd>
                                    
                                    </dl>
                                
                                </div>
                                <div class="right">
                                
                                    <h5>热销品牌</h5>
                                    <p>
                                        <a href="#">艾格</a> | <a href="#">歌利娅</a> | <a href="#">珂罗娜</a> | <a href="#">菌佳妮</a> | <a href="#">唐狮</a> | <a href="#">七格格</a> | <a href="#">南梦</a> | <a href="#">以纯</a> | <a href="#">菌曼</a> | <a href="#">O.SA</a> | <a href="#">裂棉</a> | <a href="#">花园街19号</a>       
                                    </p>
                                    <h5>最新品牌</h5>
                                    <p>
                                        <a href="#">艾格</a> | <a href="#">歌利娅</a> | <a href="#">珂罗娜</a> | <a href="#">菌佳妮</a> | <a href="#">唐狮</a> | <a href="#">七格格</a> | <a href="#">南梦</a> | <a href="#">以纯</a> | <a href="#">菌曼</a> | <a href="#">O.SA</a> | <a href="#">裂棉</a> | <a href="#">花园街19号</a>       
                                    </p>
                                
                                </div>
                            </div>
                        
                        </td>
                    
                    </tr>
                
                </table>
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