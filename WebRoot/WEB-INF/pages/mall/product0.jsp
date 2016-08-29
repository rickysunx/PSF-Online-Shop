<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>品上商城单个商品页</title>
    <psf:header/>
	<link href="/css/mall.css" rel="stylesheet" type="text/css"/>
	<script src="/js/jquery.js" type="text/javascript"></script>
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
                <li class="current"><a href="#">首 &nbsp; 页</a></li>
                <li><a class="red" href="#">促 &nbsp; 销</a></li>
                <li><a class="pink" href="#">新 &nbsp; 品</a></li>
                <li><a class="green" href="#">品友团</a></li>
                <li><a class="blue" href="#">全部分类</a></li>
            </ul>
        
        </div>
        
        <div class="search_nav">
        
            <!--测试菜单,可作参考-->
            <script type="text/javascript">
            
                $(document).ready(function(){
                    
					$(".allsort_menu").mouseenter(function(){
						
						$(this).find('.menu_list').css({'visibility':'visible'});
						
					});
					$(".allsort_menu").mouseleave(function(){
						
						$(this).find('.menu_list').css({'visibility':'hidden'});
						
					});
					
                    var li = $(".allsort").find("li");
                    li.each(function(){
                         $(this).mouseenter(function(){
                            $(this).addClass('hover');
                        });
                         $(this).mouseleave(function(){
                            $(this).removeClass('hover');
                        });
                    });
                    
                });
            
            </script>
            <!--测试菜单,可作参考-->
        
            <div class="allsort allsort_menu">
                <h3>全部分类和品牌<em></em></h3>
                <div class="menu_list">
                
                    <ol>
                        <li>
                            <h6><span><em></em><i></i>时尚女装</span></h6>
                            <div class="subitem"><div class="subitem_body">
                                
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
                                
                            </div></div>
                        </li>
                        <li>
                            <h6><span><em class="icon_man"></em><i></i>品质男装</span></h6>
                            <div class="subitem"><div class="subitem_body">
                                
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
                                
                            </div></div>
                        </li>
                        <li>
                            <h6><span><em class="icon_huazhuang"></em><i></i>美妆护理</span></h6>
                            <div class="subitem"><div class="subitem_body">
                                
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
                                
                            </div></div>
                        </li>
                        <li>
                            <h6><span><em class="icon_sport"></em><i></i>运动户外</span></h6>
                            <div class="subitem"><div class="subitem_body">
                                
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
                                
                            </div></div>
                        </li>
                        <li>
                            <h6><span><em class="icon_package"></em><i></i>球鞋箱包</span></h6>
                            <div class="subitem"><div class="subitem_body">
                                
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
                                
                            </div></div>
                        </li>
                        <li>
                            <h6><span><em class="icon_tele"></em><i></i>手机数码</span></h6>
                            <div class="subitem"><div class="subitem_body">
                                
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
                                
                            </div></div>
                        </li>
                        <li>
                            <h6><span><em class="icon_baby"></em><i></i>妈妈宝贝</span></h6>
                            <div class="subitem"><div class="subitem_body">
                                
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
                                
                            </div></div>
                        </li>
                        <li>
                            <h6><span><em class="icon_food"></em><i></i>食品保健</span></h6>
                            <div class="subitem"><div class="subitem_body">
                                
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
                                
                            </div></div>
                        </li>
                        <li>
                            <h6><span><em class="icon_gift"></em><i></i>礼品配饰</span></h6>
                            <div class="subitem"><div class="subitem_body">
                                
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
                                
                            </div></div>
                        </li>
                        <li>
                            <h6><span><em class="icon_furniture"></em><i></i>家居家具</span></h6>
                            <div class="subitem"><div class="subitem_body">
                                
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
                                
                            </div></div>
                        </li>
                    </ol>
                
                </div>
            </div>
            <div class="search searchbox">
                <div class="searchgroup">
                    <input id="search" value="秀场、圈子、活动" />
                    <div class="select">
                        <a class="nowSelect" href="#"><i>秀场</i><em></em></a>
                        <div class="selOption">
                            
                            <div><a href="#">秀场</a></div>
                            <div><a href="#">圈子</a></div>
                            <div><a href="#">指南</a></div>
                            <div><a href="#">体验</a></div>
                            <div><a href="#">活动</a></div>
                            
                        </div>
                    </div>
                </div>
                <a class="searchbtn" href="#"></a>
            </div>
            <div class="link">
            
                <span>热门关键词：</span>
                <a href="#">T血</a> |
                <a href="#">连衣裙</a> |
                <a href="#">衬衫</a> |
                <a href="#">光面文胸</a> |
                <a href="#">塑身文胸</a> |
                <a href="#">凉鞋...</a>
            
            </div>
        
        </div>
    
    </div>
    
    <div id="main">
    
    	<div class="pathbox">
        
        	<a href="#">首页</a> &gt; <a href="#">服饰鞋帽</a> &gt; <a href="#">男装</a> &gt; <a href="#">JUSTYLE</a> &gt; <a href="#">简时尚品男士短抽</a>
        
        </div>
        
        <div class="rows_content">
        
        	<div class="v2_sidebar">
            
            	<div class="sort_side_box rows">
                
                	<div class="header"><h3>相关分类</h3></div>
                    <ul>
                    
                    	<li><a href="#">衬衫</a></li>
                        <li><a href="#">T血</a></li>
                        <li><a href="#">针织</a></li>
                        <li><a href="#">外套</a></li>
                        <li><a href="#">裤子</a></li>
                    
                    </ul>
                
                </div>
                
                <div class="sort_side_box rows">
                
                	<div class="header"><h3>同类品牌</h3></div>
                    <ol>
                    
                    	<li><a href="#">元气</a></li>
                        <li><a href="#">Westside</a></li>
                        <li><a href="#">酷</a></li>
                        <li><a href="#">斯波帝卡</a></li>
                        <li><a href="#">Genki</a></li>
                        <li><a href="#">千喜步步高</a></li>
                        <li><a href="#">圣迪勒</a></li>
                        <li><a href="#">JUSTYLE</a></li>
                        <li><a href="#">简时尚品</a></li>
                        <li><a href="#">保罗威特</a></li>
                    
                    </ol>
                
                </div>
                
                <div class="shop_side_list_box rows">
                
                	<div class="header">
                
                        <h3>该品牌其他推荐</h3>
                    
                    </div>
                
                	<ul>
                		<li class="current">
                        	<div class="img"><a href="#"><img alt="" src="/images/mall/photo/photo08.png"></a></div>
                            <div class="info">
                            
                            	<p class="name"><a href="#">日立2.5寸500G移动...</a></p>
                                <p class="price">￥199 <span>￥499</span></p>
                                <div class="bottom"><a class="like" href="#"></a></div>
                            
                            </div>  
                        </li>
                        <li>
                        	<div class="img"><a href="#"><img alt="" src="/images/mall/photo/photo08.png"></a></div>
                            <div class="info">
                            
                            	<p class="name"><a href="#">日立2.5寸500G移动...</a></p>
                                <p class="price">￥199 <span>￥499</span></p>
                                <div class="bottom"><a class="like" href="#"></a></div>
                            
                            </div>  
                        </li>
                        <li>
                        	<div class="img"><a href="#"><img alt="" src="/images/mall/photo/photo08.png"></a></div>
                            <div class="info">
                            
                            	<p class="name"><a href="#">日立2.5寸500G移动...</a></p>
                                <p class="price">￥199 <span>￥499</span></p>
                                <div class="bottom"><a class="like" href="#"></a></div>
                            
                            </div>  
                        </li>
                        <li>
                        	<div class="img"><a href="#"><img alt="" src="/images/mall/photo/photo08.png"></a></div>
                            <div class="info">
                            
                            	<p class="name"><a href="#">日立2.5寸500G移动...</a></p>
                                <p class="price">￥199 <span>￥499</span></p>
                                <div class="bottom"><a class="like" href="#"></a></div>
                            
                            </div>  
                        </li>
                        <li>
                        	<div class="img"><a href="#"><img alt="" src="/images/mall/photo/photo08.png"></a></div>
                            <div class="info">
                            
                            	<p class="name"><a href="#">日立2.5寸500G移动...</a></p>
                                <p class="price">￥199 <span>￥499</span></p>
                                <div class="bottom"><a class="like" href="#"></a></div>
                            
                            </div>  
                        </li>
                    </ul>
                    <p class="more"><a href="#">换一组 &gt;&gt;</a></p>
                
                </div>
                
                <div class="shop_side_list_box rows">
                
                	<div class="header">
                
                        <h3>喜欢该商品的品友</h3>
                    
                    </div>
                
                	<ul>
                		<li>
                        	<div class="img"><a href="#"><img alt="" src="/images/mall/photo/photo08.png"></a></div>
                            <div class="status">
                            
                            	<div class="buttons">
                                
                                	<a class="addbtn02 addbtn02_ok" href="#"><em></em>好友</a>
                                    <a class="addbtn02 addbtn02_ok" href="#"><em></em>关注</a>
                                
                                </div>
                                
                                <p>秀场 <a href="#">(7)</a></p>
                                <p>体验 <a href="#">(4)</a></p>
                                <p>指南 <a href="#">(19)</a></p>
                            
                            </div>
                        </li>
                        <li>
                        	<div class="img"><a href="#"><img alt="" src="/images/mall/photo/photo08.png"></a></div>
                            <div class="status">
                            
                            	<div class="buttons">
                                
                                	<a class="addbtn02 addbtn02_ok" href="#"><em></em>好友</a>
                                    <a class="addbtn02 addbtn02_ok" href="#"><em></em>关注</a>
                                
                                </div>
                                
                                <p>秀场 <a href="#">(7)</a></p>
                                <p>体验 <a href="#">(4)</a></p>
                                <p>指南 <a href="#">(19)</a></p>
                            
                            </div>
                        </li>
                        <li>
                        	<div class="img"><a href="#"><img alt="" src="/images/mall/photo/photo08.png"></a></div>
                            <div class="status">
                            
                            	<div class="buttons">
                                
                                	<a class="addbtn02 addbtn02_ok" href="#"><em></em>好友</a>
                                    <a class="addbtn02 addbtn02_ok" href="#"><em></em>关注</a>
                                
                                </div>
                                
                                <p>秀场 <a href="#">(7)</a></p>
                                <p>体验 <a href="#">(4)</a></p>
                                <p>指南 <a href="#">(19)</a></p>
                            
                            </div>
                        </li>
                        <li>
                        	<div class="img"><a href="#"><img alt="" src="/images/mall/photo/photo08.png"></a></div>
                            <div class="status">
                            
                            	<div class="buttons">
                                
                                	<a class="addbtn02 addbtn02_ok" href="#"><em></em>好友</a>
                                    <a class="addbtn02 addbtn02_ok" href="#"><em></em>关注</a>
                                
                                </div>
                                
                                <p>秀场 <a href="#">(7)</a></p>
                                <p>体验 <a href="#">(4)</a></p>
                                <p>指南 <a href="#">(19)</a></p>
                            
                            </div>
                        </li>
                        <li>
                        	<div class="img"><a href="#"><img alt="" src="/images/mall/photo/photo08.png"></a></div>
                            <div class="status">
                            
                            	<div class="buttons">
                                
                                	<a class="addbtn02 addbtn02_ok" href="#"><em></em>好友</a>
                                    <a class="addbtn02 addbtn02_ok" href="#"><em></em>关注</a>
                                
                                </div>
                                
                                <p>秀场 <a href="#">(7)</a></p>
                                <p>体验 <a href="#">(4)</a></p>
                                <p>指南 <a href="#">(19)</a></p>
                            
                            </div>
                        </li>
                    </ul>
                    <p class="more"><a href="#">上一组　下一组</a></p>
                
                </div>
                
                
                <div class="shop_side_list_box rows">
                
                	<div class="header">
                
                        <h3>看过此商品的顾客最终购买</h3>
                    
                    </div>
                
                	<ol>
                    
                    	<li>
                        
                        	<div class="img"><a href="#"><img alt="" src="/images/mall/photo/photo08.png"></a></div>
                            <div class="info">
                            
                            	<p class="content"><span>19.2%</span> <a href="#"><span>购买</span>热情撞色宽纹珠地短抽POLO（男装）碧绿色宽条纹</a></p>
                                <p class="price">￥99.00</p>
                            
                            </div>
                        
                        </li>
                        
                        <li>
                        
                        	<div class="img"><a href="#"><img alt="" src="/images/mall/photo/photo08.png"></a></div>
                            <div class="info">
                            
                            	<p class="content"><span>19.2%</span> <a href="#"><span>购买</span>热情撞色宽纹珠地短抽POLO（男装）碧绿色宽条纹</a></p>
                                <p class="price">￥99.00</p>
                            
                            </div>
                        
                        </li>
                        
                        <li>
                        
                        	<div class="img"><a href="#"><img alt="" src="/images/mall/photo/photo08.png"></a></div>
                            <div class="info">
                            
                            	<p class="content"><span>19.2%</span> <a href="#"><span>购买</span>热情撞色宽纹珠地短抽POLO（男装）碧绿色宽条纹</a></p>
                                <p class="price">￥99.00</p>
                            
                            </div>
                        
                        </li>
                        
                        <li>
                        
                        	<div class="img"><a href="#"><img alt="" src="/images/mall/photo/photo08.png"></a></div>
                            <div class="info">
                            
                            	<p class="content"><span>19.2%</span> <a href="#"><span>购买</span>热情撞色宽纹珠地短抽POLO（男装）碧绿色宽条纹</a></p>
                                <p class="price">￥99.00</p>
                            
                            </div>
                        
                        </li>
                        
                        <li>
                        
                        	<div class="img"><a href="#"><img alt="" src="/images/mall/photo/photo08.png"></a></div>
                            <div class="info">
                            
                            	<p class="content"><span>19.2%</span> <a href="#"><span>购买</span>热情撞色宽纹珠地短抽POLO（男装）碧绿色宽条纹</a></p>
                                <p class="price">￥99.00</p>
                            
                            </div>
                        
                        </li>
                    
                    </ol>
                
                </div>
                
                
                <div class="shop_side_list_box rows">
                
                	<div class="header">
                
                        <h3>看过此商品的顾客还看过</h3>
                    
                    </div>
                
                	<ol>
                    
                    	<li>
                        
                        	<div class="img"><a href="#"><img alt="" src="/images/mall/photo/photo08.png"></a></div>
                            <div class="info">
                            
                            	<p class="content"><span>19.2%</span> <a href="#"><span>购买</span>热情撞色宽纹珠地短抽POLO（男装）碧绿色宽条纹</a></p>
                                <p class="price">￥99.00</p>
                            
                            </div>
                        
                        </li>
                        
                        <li>
                        
                        	<div class="img"><a href="#"><img alt="" src="/images/mall/photo/photo08.png"></a></div>
                            <div class="info">
                            
                            	<p class="content"><span>19.2%</span> <a href="#"><span>购买</span>热情撞色宽纹珠地短抽POLO（男装）碧绿色宽条纹</a></p>
                                <p class="price">￥99.00</p>
                            
                            </div>
                        
                        </li>
                        
                        <li>
                        
                        	<div class="img"><a href="#"><img alt="" src="/images/mall/photo/photo08.png"></a></div>
                            <div class="info">
                            
                            	<p class="content"><span>19.2%</span> <a href="#"><span>购买</span>热情撞色宽纹珠地短抽POLO（男装）碧绿色宽条纹</a></p>
                                <p class="price">￥99.00</p>
                            
                            </div>
                        
                        </li>
                    
                    </ol>
                
                </div>
                
                
                <div class="shop_side_list_box rows">
                
                	<div class="header">
                
                        <h3>看过此商品的顾客还购买过</h3>
                    
                    </div>
                
                	<ol>
                    
                    	<li>
                        
                        	<div class="img"><a href="#"><img alt="" src="/images/mall/photo/photo08.png"></a></div>
                            <div class="info">
                            
                            	<p class="content"><span>19.2%</span> <a href="#"><span>购买</span>热情撞色宽纹珠地短抽POLO（男装）碧绿色宽条纹</a></p>
                                <p class="price">￥99.00</p>
                            
                            </div>
                        
                        </li>
                        
                        <li>
                        
                        	<div class="img"><a href="#"><img alt="" src="/images/mall/photo/photo08.png"></a></div>
                            <div class="info">
                            
                            	<p class="content"><span>19.2%</span> <a href="#"><span>购买</span>热情撞色宽纹珠地短抽POLO（男装）碧绿色宽条纹</a></p>
                                <p class="price">￥99.00</p>
                            
                            </div>
                        
                        </li>
                        
                        <li>
                        
                        	<div class="img"><a href="#"><img alt="" src="/images/mall/photo/photo08.png"></a></div>
                            <div class="info">
                            
                            	<p class="content"><span>19.2%</span> <a href="#"><span>购买</span>热情撞色宽纹珠地短抽POLO（男装）碧绿色宽条纹</a></p>
                                <p class="price">￥99.00</p>
                            
                            </div>
                        
                        </li>
                    
                    </ol>
                
                </div>
                
                
                <div class="shop_side_list_box rows">
                
                	<div class="header">
                
                        <h3>同类最热销</h3>
                    
                    </div>
                
                	<ol>
                    
                    	<li>
                        
                        	<div class="img"><a href="#"><img alt="" src="/images/mall/photo/photo08.png"></a></div>
                            <div class="info">
                            
                            	<p class="content"><span>19.2%</span> <a href="#"><span>购买</span>热情撞色宽纹珠地短抽POLO（男装）碧绿色宽条纹</a></p>
                                <p class="price">￥99.00</p>
                            
                            </div>
                        
                        </li>
                        
                        <li>
                        
                        	<div class="img"><a href="#"><img alt="" src="/images/mall/photo/photo08.png"></a></div>
                            <div class="info">
                            
                            	<p class="content"><span>19.2%</span> <a href="#"><span>购买</span>热情撞色宽纹珠地短抽POLO（男装）碧绿色宽条纹</a></p>
                                <p class="price">￥99.00</p>
                            
                            </div>
                        
                        </li>
                        
                        <li>
                        
                        	<div class="img"><a href="#"><img alt="" src="/images/mall/photo/photo08.png"></a></div>
                            <div class="info">
                            
                            	<p class="content"><span>19.2%</span> <a href="#"><span>购买</span>热情撞色宽纹珠地短抽POLO（男装）碧绿色宽条纹</a></p>
                                <p class="price">￥99.00</p>
                            
                            </div>
                        
                        </li>
                    
                    </ol>
                
                </div>
                
                <div class="shop_side_list_box rows">
                
                	<div class="header">
                
                        <h3>我最近看过</h3>
                        <a href="#">删除浏览记录</a>
                    
                    </div>
                
                	<ol>
                    
                    	<li>
                        
                        	<div class="img"><a href="#"><img alt="" src="/images/mall/photo/photo08.png"></a></div>
                            <div class="info">
                            
                            	<p class="content"><span>19.2%</span> <a href="#"><span>购买</span>热情撞色宽纹珠地短抽POLO（男装）碧绿色宽条纹</a></p>
                                <p class="price">￥99.00</p>
                            
                            </div>
                        
                        </li>
                        
                        <li>
                        
                        	<div class="img"><a href="#"><img alt="" src="/images/mall/photo/photo08.png"></a></div>
                            <div class="info">
                            
                            	<p class="content"><span>19.2%</span> <a href="#"><span>购买</span>热情撞色宽纹珠地短抽POLO（男装）碧绿色宽条纹</a></p>
                                <p class="price">￥99.00</p>
                            
                            </div>
                        
                        </li>
                        
                        <li>
                        
                        	<div class="img"><a href="#"><img alt="" src="/images/mall/photo/photo08.png"></a></div>
                            <div class="info">
                            
                            	<p class="content"><span>19.2%</span> <a href="#"><span>购买</span>热情撞色宽纹珠地短抽POLO（男装）碧绿色宽条纹</a></p>
                                <p class="price">￥99.00</p>
                            
                            </div>
                        
                        </li>
                    
                    </ol>
                
                </div>
                
            
            </div>
            <div class="v2_r_content">
            	
                <div class="shop_buyer rows">
                
                	<div class="property"><div class="property_wrap">
                    
                    	<h1><a href="#">热情撞色宽纹珠地短抽POLO(男款) 碧绿色宽条纹</a></h1>
                        
                        <div class="meta">
                        	<p>品 &nbsp;&nbsp; 牌：Victorinox 维氐　<a class="brand_icon" href="#"><img src="/images/mall/photo/logo13.png" alt="" /></a> <a class="brand" href="#">关注该品牌</a></p>
                            <div class="meta_img">
                                <dl class="share_info">
                                    <dt><img src="/images/mall/default/temp/xiangjin.png" alt="" /></dt>
                                    <dd>
                                        <p>累计<span>享金</span><b class="share_price">1000.00</b></p>
                                        <p><a href="#">如何获得享金</a></p>
                                    </dd>
                                </dl>
                                <p>商品编号：0048654</p>
                                <p class="psf_price">品　上　价：<b>￥10000.00</b></p>
                                <p class="price">
                                    <span>市场价：￥10000.00</span>
                                    <span>享金额：<b>10.00</b></span>
                                </p>
                                <p class="comment">
                                
                                    <span>商品评分：</span>
                                    <span class="icons">
                                        
                                        <em></em><em></em><em></em><em class="no"></em><em class="no"></em>
                                    
                                    </span>
                                    <a href="#">(已经有24人体验)</a>
                                
                                </p>
                            </div>
                        </div>
                        
                        <div class="key">
                        
                        
                        <!--可作参考-->
						<script type="text/javascript">
                                
                            $(document).ready(function(){
                                
                                $('.colorbox,.sizebox').mouseenter(function(){
                                
                                    var ul = $(this).find('ul');
                                    var morebtn = $(this).find('.more_btn');
        
                                    ul.addClass('more_ul');
                                    morebtn.addClass('more_btn_on');
                                }).mouseleave(function(){
                                    
                                    var ul = $(this).find('ul');
                                    var morebtn = $(this).find('.more_btn');
                                    
                                    ul.removeClass('more_ul');
                                    morebtn.removeClass('more_btn_on');
                                    
                                });
                                
                            });
                                
                        </script>
                        <!--可作参考-->
                        
                        
                        	<dl class="colorbox">
                            
                            	<dt>颜色：<b>灰色</b></dt>
                                <dd>
                    
                                    <a class="more_btn" href="javascript:void(0)"></a>
                                    <ul>
                                        <li>
                                            <a class="current" href="#">
                                                <span></span>
                                                <img src="/images/mall/buy/color/1.png" alt="" />
                                            </a>
                                        </li>
                                        
                                        <li>
                                            <a href="#">
                                                <span></span>
                                                <img src="/images/mall/buy/color/1.png" alt="" />
                                            </a>
                                        </li>
                                        
                                        <li>
                                            <a href="#">
                                                <span></span>
                                                <img src="/images/mall/buy/color/1.png" alt="" />
                                            </a>
                                        </li>
                                        
                                        <li>
                                            <a href="#">
                                                <span></span>
                                                <img src="/images/mall/buy/color/1.png" alt="" />
                                            </a>
                                        </li>
                                        
                                        <li>
                                            <a href="#">
                                                <span></span>
                                                <img src="/images/mall/buy/color/1.png" alt="" />
                                            </a>
                                        </li>
                                        
                                        <li>
                                            <a href="#">
                                                <span></span>
                                                <img src="/images/mall/buy/color/1.png" alt="" />
                                            </a>
                                        </li>
                                        
                                        <li>
                                            <a href="#">
                                                <span></span>
                                                <img src="/images/mall/buy/color/1.png" alt="" />
                                            </a>
                                        </li>
                                        
                                        <li>
                                            <a href="#">
                                                <span></span>
                                                <img src="/images/mall/buy/color/1.png" alt="" />
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <span></span>
                                                <img src="/images/mall/buy/color/1.png" alt="" />
                                            </a>
                                        </li>
                                        
                                    </ul>
                                </dd>
                            
                            </dl>
                            
                            <dl class="sizebox">
                            
                            	<dt>尺码：<b>未选择</b></dt>
                                <dd>
                                    <a class="more_btn" href="javascript:void(0)"></a>
                                    <ul>
                                        <li>
                                            <a class="current" href="#">
                                                <span></span>M
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <span></span>L
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <span></span>XL
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <span></span>XXL
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <span></span>L
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <span></span>XL
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <span></span>XXL
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <span></span>L
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <span></span>XL
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <span></span>XXL
                                            </a>
                                        </li>
                                    </ul>
                                </dd>
                            
                            </dl>
                            
                            <dl class="actions">
                            
                            	<dt>我要买：</dt>
                                <dd>
                                
                                
                                	<div class="amount">
                                        <div class="numInput">
                                            <a class="minus" href="javascript:void(0)">-</a><input value="640" name="pcount_306"><a class="add" href="#">+</a>
                                        </div>
                                        
                                        <div class="info">
                                        	<p><span class="color">颜色：灰色</span>　<span class="size">尺码：未选择</span></p>
                                            <p class="price">小计：<b>￥340.00</b></p>
                                        </div>                                        
                                    </div>
                                    
                                    <div class="btn_buy">
                                    
                                    	<a class="like" href="#"></a><a class="like_add" href="#"></a>
                                    	
                                    </div>
                                
                                </dd>
                            
                            </dl>
                            
                            <dl class="buy_select">
                            
                            	<dt>支付方式：</dt>
                                <dd>
                                
                                	<a href="#">货到付款</a> | <a href="#">在线支付</a> | <a href="#">邮政汇款</a> | <a href="#">礼品卡或虚拟帐户支付</a> | <a href="#">邮局网汇通汇款</a> | <a href="#">电话支付</a>
                                	
                                </dd>
                            
                            </dl>
                        
                        </div>
                    
                    </div></div>
                    <div class="gallery">
                    
                    	<div class="img"><img src="/images/mall/buy/mid/1.jpg" alt="" /></div>
                        
                        <div class="thumbbox">
                        
                        	<a class="prev" href="#"><em></em></a>
                            <a class="next" href="#"><em></em></a>
                            <div class="thumb">
                                <ul>
                                
                                    <li class="current"><a href="#"><img src="/images/mall/buy/small/1.jpg" alt="" /></a></li>
                                    <li><a href="#"><img src="/images/mall/buy/small/2.jpg" alt="" /></a></li>
                                    <li><a href="#"><img src="/images/mall/buy/small/3.jpg" alt="" /></a></li>
                                    <li><a href="#"><img src="/images/mall/buy/small/4.jpg" alt="" /></a></li>
                                
                                </ul>
                            </div>
                        
                        </div>
                    
                    </div>
                
                </div>
                
                <!--tab切换效果,可作参考-->
                <script type="text/javascript">
				
					$(document).ready(function(){
					
						var box = $(".media_mini_box");
						var content1 = box.find('.partner_content');
						var content2 = box.find('.mygroup_content');
						var dt = box.find('.tab dt');
						var dd = box.find('.tab dd');
						dt.click(function(){
							
							$(this).parent().removeClass("partner_tab");
							$(this).parent().removeClass("mygroup_tab");
							$(this).parent().addClass("partner_tab");
							content1.show();
							content2.hide();
							
						});
						dd.click(function(){
							
							$(this).parent().removeClass("mygroup_tab");
							$(this).parent().removeClass("partner_tab");
							$(this).parent().addClass("mygroup_tab");
							
							content1.hide();
							content2.show();
							
						});
					
					});
				
				</script>
                <!--tab切换效果,可作参考-->
                
            	<div class="media_mini_box rows">
                
                    <dl class="tab partner_tab">
                    
                        <dt></dt><dd></dd>
                        
                    </dl>
                    
                    <div class="partner_content">
                    
                        <div class="infobox">
                        
                        	<div class="total_price"><strong>拍档总价格：</strong><b>￥500.00</b>元</div>
                            <div class="price">
                            
                            	<p><b>品上价：</b><em></em> <b>100.00</b></p>
                                <p><b>市场价：</b><em></em> <b>300.00</b></p>
                            
                            </div>
                            
                            <div class="buy">
                            
                            	<b>选中优惠组合<br />请点击：</b>
                                <a class="partner_buy" href="#"></a>
                                
                            </div>
                            
                            <div class="right">
                            
                            	<a href="#">上一组</a>
                                <a href="#">下一组</a>
                            
                            </div>
    
                        </div>
                        
                        <div class="partner_list">
                        
                        	<ul class="current">
                            
                            	<li class="first">
                                
                                	<div class="img">
                                    
                                    	<a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a>
                                    
                                    </div>
                                    
                                    <p><a href="#">热情撞色宽纹珠地短抽...</a></p>
                                    <p class="price"><b>135</b></p>
                                
                                </li>
                                
                                <li>
                                
                                	<div class="img">
                                    
                                    	<a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a>
                                    
                                    </div>
                                    
                                    <p><input type="checkbox" /><a href="#">热情撞色宽纹珠地短抽...</a></p>
                                    <p class="price">
                                    	<span class="right">直减<b>10.00</b></span>
                                    	<b>29.4</b>
                                    </p>
                                
                                </li>
                                
                                <li>
                                
                                	<div class="img">
                                    
                                    	<a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a>
                                    
                                    </div>
                                    
                                    <p><input type="checkbox" /><a href="#">热情撞色宽纹珠地短抽...</a></p>
                                    <p class="price">
                                    	<span class="right">直减<b>10.00</b></span>
                                    	<b>29.4</b>
                                    </p>
                                
                                </li>
                                
                                <li>
                                
                                	<div class="img">
                                    
                                    	<a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a>
                                    
                                    </div>
                                    
                                    <p><input type="checkbox" /><a href="#">热情撞色宽纹珠地短抽...</a></p>
                                    <p class="price">
                                    	<span class="right">直减<b>10.00</b></span>
                                    	<b>29.4</b>
                                    </p>
                                
                                </li>
                                
                                <li>
                                
                                	<div class="img">
                                    
                                    	<a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a>
                                    
                                    </div>
                                    
                                    <p><input type="checkbox" /><a href="#">热情撞色宽纹珠地短抽...</a></p>
                                    <p class="price">
                                    	<span class="right">直减<b>10.00</b></span>
                                    	<b>29.4</b>
                                    </p>
                                
                                </li>
                            
                            </ul>
                            
                            <ul>
                            
                            	<li class="first">
                                
                                	<div class="img">
                                    
                                    	<a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a>
                                    
                                    </div>
                                    
                                    <p><a href="#">热情撞色宽纹珠地短抽...</a></p>
                                    <p class="price"><b>135</b></p>
                                
                                </li>
                                
                                <li>
                                
                                	<div class="img">
                                    
                                    	<a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a>
                                    
                                    </div>
                                    
                                    <p><input type="checkbox" /><a href="#">热情撞色宽纹珠地短抽...</a></p>
                                    <p class="price">
                                    	<span class="right">直减<b>10.00</b></span>
                                    	<b>29.4</b>
                                    </p>
                                
                                </li>
                                
                                <li>
                                
                                	<div class="img">
                                    
                                    	<a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a>
                                    
                                    </div>
                                    
                                    <p><input type="checkbox" /><a href="#">热情撞色宽纹珠地短抽...</a></p>
                                    <p class="price">
                                    	<span class="right">直减<b>10.00</b></span>
                                    	<b>29.4</b>
                                    </p>
                                
                                </li>
                                
                                <li>
                                
                                	<div class="img">
                                    
                                    	<a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a>
                                    
                                    </div>
                                    
                                    <p><input type="checkbox" /><a href="#">热情撞色宽纹珠地短抽...</a></p>
                                    <p class="price">
                                    	<span class="right">直减<b>10.00</b></span>
                                    	<b>29.4</b>
                                    </p>
                                
                                </li>
                                
                                <li>
                                
                                	<div class="img">
                                    
                                    	<a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a>
                                    
                                    </div>
                                    
                                    <p><input type="checkbox" /><a href="#">热情撞色宽纹珠地短抽...</a></p>
                                    <p class="price">
                                    	<span class="right">直减<b>10.00</b></span>
                                    	<b>29.4</b>
                                    </p>
                                
                                </li>
                            
                            </ul>
                        
                        </div>
                        
                    </div>
                    
                    
                    <div class="mygroup_content" style="display:none">
                    
                        <div class="infobox">
                        
                        	<div class="right">
                            
                            	<a href="#">我认识的人</a>
                                <a href="#">换一组</a>
                            
                            </div>
                        	<a class="mygroup_btn" href="#"></a>
    
                        </div>
                        
                        <ul class="mygroup_list">
                        
                            <li>
                            
                            	<div class="picborder">
                                    <table class="pictable">
                                        <tr>
                                            <td class="t_l"> </td>
                                            <td class="t_m">
                                                <div></div>
                                                <b></b>
                                                <em></em>
                                            </td>
                                            <td class="t_r"> </td>
                                        </tr>
                                        <tr>
                                            <td class="m_l"> </td>
                                            <td class="m_m">
                                                
                                                <div class="mygroup_box">
                                                
                                                	<div class="title"><h3>南瓜团</h3></div>
                                                    <dl class="info">
                                                    
                                                    	<dt>
                                                        
                                                        	<a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a>
                                                        
                                                        </dt>
                                                        <dd>
                                                        
                                                        	<p>价格：<b>￥10000.00</b></p>
                                                            <p><strong>20人团</strong></p>
                                                            <p>已参加15人，还缺<b>5人</b></p>
                                                            <p>结束时间：<b>3天</b></p>
                                                        
                                                        </dd>
                                                    
                                                    </dl>
                                                    <dl class="add_info">
                                                    
                                                    	<dt><a class="addgroup_btn" href="#"></a></dt>
                                                        <dd class="success"></dd>
                                                    
                                                    </dl>
                                                    
                                                    <div class="postbox">
                                                    
                                                    	<div class="header">团主</div>
                                                        <dl>
                                                        
                                                        	<dt><a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a></dt>
                                                            <dd>
                                                            
                                                            	<h3><a href="#">melodi</a></h3>
                                                                <p><span><a href="#">秀场</a>(10000)</span><span><a href="#">体验</a>(10000)</span><span><a href="#">指南</a>(10000)</span></p>
                                                                <div class="bottom">
                                                                
                                                                	<a class="addbtn02 addbtn02_ok" href="#"><em></em>好友</a>
                                                                    <a class="addbtn02 addbtn02_ok" href="#"><em></em>关注</a>
                                                                
                                                                </div>
                                                            
                                                            </dd>
                                                        
                                                        </dl>
                                                        <div class="header"><b>10</b>个品友已经购买</div>
                                                        <div class="friends">
                                                        
                                                        	<a href="#"><img src="/images/mall/photo/photo12.png" alt="" /></a>
                                                            <a href="#"><img src="/images/mall/photo/photo13.png" alt="" /></a>
                                                            <a href="#"><img src="/images/mall/photo/photo14.png" alt="" /></a>
                                                            <a href="#"><img src="/images/mall/photo/photo12.png" alt="" /></a>
                                                            <a href="#"><img src="/images/mall/photo/photo13.png" alt="" /></a>
                                                            <a href="#"><img src="/images/mall/photo/photo14.png" alt="" /></a>
                                                        
                                                        </div>
                                                    
                                                    </div>
                                                
                                                </div>
                                                
                                            </td>
                                            <td class="m_r"> </td>
                                        </tr>
                                        
                                        <tr>
                                            <td class="b_l"> </td>
                                            <td class="b_m">
                                                <em></em>
                                                <b></b>
                                                <div></div>
                                            </td>
                                            <td class="b_r"> </td>
                                        </tr>
                                    </table>
                                    <div class="shadow"></div>
                              	</div>
                            
                            
                            </li>
                            
                            <li>
                            
                            	<div class="picborder">
                                    <table class="pictable">
                                        <tr>
                                            <td class="t_l"> </td>
                                            <td class="t_m">
                                                <div></div>
                                                <b></b>
                                                <em></em>
                                            </td>
                                            <td class="t_r"> </td>
                                        </tr>
                                        <tr>
                                            <td class="m_l"> </td>
                                            <td class="m_m">
                                                
                                                <div class="mygroup_box">
                                                
                                                	<div class="title"><h3>南瓜团</h3></div>
                                                    <dl class="info">
                                                    
                                                    	<dt>
                                                        
                                                        	<a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a>
                                                        
                                                        </dt>
                                                        <dd>
                                                        
                                                        	<p>价格：<b>￥10000.00</b></p>
                                                            <p><strong>20人团</strong></p>
                                                            <p>已参加15人，还缺<b>5人</b></p>
                                                            <p>结束时间：<b>3天</b></p>
                                                        
                                                        </dd>
                                                    
                                                    </dl>
                                                    <dl class="add_info">
                                                    
                                                    	<dt><a class="addgroup_btn" href="#"></a></dt>
                                                        <dd class="fail"></dd>
                                                    
                                                    </dl>
                                                    
                                                    <div class="postbox">
                                                    
                                                    	<div class="header">团主</div>
                                                        <dl>
                                                        
                                                        	<dt><a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a></dt>
                                                            <dd>
                                                            
                                                            	<h3><a href="#">melodi</a></h3>
                                                                <p><span><a href="#">秀场</a>(10000)</span><span><a href="#">体验</a>(10000)</span><span><a href="#">指南</a>(10000)</span></p>
                                                                <div class="bottom">
                                                                
                                                                	<a class="addbtn02 addbtn02_ok" href="#"><em></em>好友</a>
                                                                    <a class="addbtn02 addbtn02_ok" href="#"><em></em>关注</a>
                                                                
                                                                </div>
                                                            
                                                            </dd>
                                                        
                                                        </dl>
                                                        <div class="header"><b>10</b>个品友已经购买</div>
                                                        <div class="friends">
                                                        
                                                        	<a href="#"><img src="/images/mall/photo/photo12.png" alt="" /></a>
                                                            <a href="#"><img src="/images/mall/photo/photo13.png" alt="" /></a>
                                                            <a href="#"><img src="/images/mall/photo/photo14.png" alt="" /></a>
                                                        
                                                        </div>
                                                    
                                                    </div>
                                                
                                                </div>
                                                
                                            </td>
                                            <td class="m_r"> </td>
                                        </tr>
                                        
                                        <tr>
                                            <td class="b_l"> </td>
                                            <td class="b_m">
                                                <em></em>
                                                <b></b>
                                                <div></div>
                                            </td>
                                            <td class="b_r"> </td>
                                        </tr>
                                    </table>
                                    <div class="shadow"></div>
                              	</div>
                            
                            
                            </li>
                            
                            <li>
                            
                            	<div class="picborder">
                                    <table class="pictable">
                                        <tr>
                                            <td class="t_l"> </td>
                                            <td class="t_m">
                                                <div></div>
                                                <b></b>
                                                <em></em>
                                            </td>
                                            <td class="t_r"> </td>
                                        </tr>
                                        <tr>
                                            <td class="m_l"> </td>
                                            <td class="m_m">
                                                
                                                <div class="mygroup_box">
                                                
                                                	<div class="title"><h3>南瓜团</h3></div>
                                                    <dl class="info">
                                                    
                                                    	<dt>
                                                        
                                                        	<a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a>
                                                        
                                                        </dt>
                                                        <dd>
                                                        
                                                        	<p>价格：<b>￥10000.00</b></p>
                                                            <p><strong>20人团</strong></p>
                                                            <p>已参加15人，还缺<b>5人</b></p>
                                                            <p>结束时间：<b>3天</b></p>
                                                        
                                                        </dd>
                                                    
                                                    </dl>
                                                    <dl class="add_info">
                                                    
                                                    	<dt><a class="addgroup_btn" href="#"></a></dt>
                                                        <dd class="success"></dd>
                                                    
                                                    </dl>
                                                    
                                                    <div class="postbox">
                                                    
                                                    	<div class="header">团主</div>
                                                        <dl>
                                                        
                                                        	<dt><a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a></dt>
                                                            <dd>
                                                            
                                                            	<h3><a href="#">melodi</a></h3>
                                                                <p><span><a href="#">秀场</a>(10000)</span><span><a href="#">体验</a>(10000)</span><span><a href="#">指南</a>(10000)</span></p>
                                                                <div class="bottom">
                                                                
                                                                	<a class="addbtn02 addbtn02_ok" href="#"><em></em>好友</a>
                                                                    <a class="addbtn02 addbtn02_ok" href="#"><em></em>关注</a>
                                                                
                                                                </div>
                                                            
                                                            </dd>
                                                        
                                                        </dl>
                                                        <div class="header"><b>10</b>个品友已经购买</div>
                                                        <div class="friends">
                                                        
                                                        	<a href="#"><img src="/images/mall/photo/photo12.png" alt="" /></a>
                                                            <a href="#"><img src="/images/mall/photo/photo13.png" alt="" /></a>
                                                            <a href="#"><img src="/images/mall/photo/photo14.png" alt="" /></a>
                                                            <a href="#"><img src="/images/mall/photo/photo12.png" alt="" /></a>
                                                            <a href="#"><img src="/images/mall/photo/photo13.png" alt="" /></a>
                                                            <a href="#"><img src="/images/mall/photo/photo14.png" alt="" /></a>
                                                        
                                                        </div>
                                                    
                                                    </div>
                                                
                                                </div>
                                                
                                            </td>
                                            <td class="m_r"> </td>
                                        </tr>
                                        
                                        <tr>
                                            <td class="b_l"> </td>
                                            <td class="b_m">
                                                <em></em>
                                                <b></b>
                                                <div></div>
                                            </td>
                                            <td class="b_r"> </td>
                                        </tr>
                                    </table>
                                    <div class="shadow"></div>
                              	</div>
                            
                            
                            </li>
                            
                        
                        </ul>
                        
                    </div>
                
                </div>
                
                
                <div class="media_mini_box rows">
                
                    <dl class="tab mygroup_tab">
                    
                        <dt></dt><dd></dd>
                        
                    </dl>
                    
                    <div class="mygroup_content">
                    
                        <div class="infobox">
                        
                        	<div class="right">
                            
                            	<a href="#">我认识的人</a>
                                <a href="#">换一组</a>
                            
                            </div>
                        	<a class="mygroup_btn" href="#"></a>
    
                        </div>
                        
                        <ul class="mygroup_list">
                        
                            <li>
                            
                            	<div class="picborder">
                                    <table class="pictable">
                                        <tr>
                                            <td class="t_l"> </td>
                                            <td class="t_m">
                                                <div></div>
                                                <b></b>
                                                <em></em>
                                            </td>
                                            <td class="t_r"> </td>
                                        </tr>
                                        <tr>
                                            <td class="m_l"> </td>
                                            <td class="m_m">
                                                
                                                <div class="mygroup_box">
                                                
                                                	<div class="title"><h3>南瓜团</h3></div>
                                                    <dl class="info">
                                                    
                                                    	<dt>
                                                        
                                                        	<a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a>
                                                        
                                                        </dt>
                                                        <dd>
                                                        
                                                        	<p>价格：<b>￥10000.00</b></p>
                                                            <p><strong>20人团</strong></p>
                                                            <p>已参加15人，还缺<b>5人</b></p>
                                                            <p>结束时间：<b>3天</b></p>
                                                        
                                                        </dd>
                                                    
                                                    </dl>
                                                    <dl class="add_info">
                                                    
                                                    	<dt><a class="addgroup_btn" href="#"></a></dt>
                                                        <dd class="success"></dd>
                                                    
                                                    </dl>
                                                    
                                                    <div class="postbox">
                                                    
                                                    	<div class="header">团主</div>
                                                        <dl>
                                                        
                                                        	<dt><a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a></dt>
                                                            <dd>
                                                            
                                                            	<h3><a href="#">melodi</a></h3>
                                                                <p><span><a href="#">秀场</a>(10000)</span><span><a href="#">体验</a>(10000)</span><span><a href="#">指南</a>(10000)</span></p>
                                                                <div class="bottom">
                                                                
                                                                	<a class="addbtn02 addbtn02_ok" href="#"><em></em>好友</a>
                                                                    <a class="addbtn02 addbtn02_ok" href="#"><em></em>关注</a>
                                                                
                                                                </div>
                                                            
                                                            </dd>
                                                        
                                                        </dl>
                                                        <div class="header"><b>10</b>个品友已经购买</div>
                                                        <div class="friends">
                                                        
                                                        	<a href="#"><img src="/images/mall/photo/photo12.png" alt="" /></a>
                                                            <a href="#"><img src="/images/mall/photo/photo13.png" alt="" /></a>
                                                            <a href="#"><img src="/images/mall/photo/photo14.png" alt="" /></a>
                                                            <a href="#"><img src="/images/mall/photo/photo12.png" alt="" /></a>
                                                            <a href="#"><img src="/images/mall/photo/photo13.png" alt="" /></a>
                                                            <a href="#"><img src="/images/mall/photo/photo14.png" alt="" /></a>
                                                        
                                                        </div>
                                                    
                                                    </div>
                                                
                                                </div>
                                                
                                            </td>
                                            <td class="m_r"> </td>
                                        </tr>
                                        
                                        <tr>
                                            <td class="b_l"> </td>
                                            <td class="b_m">
                                                <em></em>
                                                <b></b>
                                                <div></div>
                                            </td>
                                            <td class="b_r"> </td>
                                        </tr>
                                    </table>
                                    <div class="shadow"></div>
                              	</div>
                            
                            
                            </li>
                            
                            <li>
                            
                            	<div class="picborder">
                                    <table class="pictable">
                                        <tr>
                                            <td class="t_l"> </td>
                                            <td class="t_m">
                                                <div></div>
                                                <b></b>
                                                <em></em>
                                            </td>
                                            <td class="t_r"> </td>
                                        </tr>
                                        <tr>
                                            <td class="m_l"> </td>
                                            <td class="m_m">
                                                
                                                <div class="mygroup_box">
                                                
                                                	<div class="title"><h3>南瓜团</h3></div>
                                                    <dl class="info">
                                                    
                                                    	<dt>
                                                        
                                                        	<a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a>
                                                        
                                                        </dt>
                                                        <dd>
                                                        
                                                        	<p>价格：<b>￥10000.00</b></p>
                                                            <p><strong>20人团</strong></p>
                                                            <p>已参加15人，还缺<b>5人</b></p>
                                                            <p>结束时间：<b>3天</b></p>
                                                        
                                                        </dd>
                                                    
                                                    </dl>
                                                    <dl class="add_info">
                                                    
                                                    	<dt><a class="addgroup_btn" href="#"></a></dt>
                                                        <dd class="fail"></dd>
                                                    
                                                    </dl>
                                                    
                                                    <div class="postbox">
                                                    
                                                    	<div class="header">团主</div>
                                                        <dl>
                                                        
                                                        	<dt><a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a></dt>
                                                            <dd>
                                                            
                                                            	<h3><a href="#">melodi</a></h3>
                                                                <p><span><a href="#">秀场</a>(10000)</span><span><a href="#">体验</a>(10000)</span><span><a href="#">指南</a>(10000)</span></p>
                                                                <div class="bottom">
                                                                
                                                                	<a class="addbtn02 addbtn02_ok" href="#"><em></em>好友</a>
                                                                    <a class="addbtn02 addbtn02_ok" href="#"><em></em>关注</a>
                                                                
                                                                </div>
                                                            
                                                            </dd>
                                                        
                                                        </dl>
                                                        <div class="header"><b>10</b>个品友已经购买</div>
                                                        <div class="friends">
                                                        
                                                        	<a href="#"><img src="/images/mall/photo/photo12.png" alt="" /></a>
                                                            <a href="#"><img src="/images/mall/photo/photo13.png" alt="" /></a>
                                                            <a href="#"><img src="/images/mall/photo/photo14.png" alt="" /></a>
                                                        
                                                        </div>
                                                    
                                                    </div>
                                                
                                                </div>
                                                
                                            </td>
                                            <td class="m_r"> </td>
                                        </tr>
                                        
                                        <tr>
                                            <td class="b_l"> </td>
                                            <td class="b_m">
                                                <em></em>
                                                <b></b>
                                                <div></div>
                                            </td>
                                            <td class="b_r"> </td>
                                        </tr>
                                    </table>
                                    <div class="shadow"></div>
                              	</div>
                            
                            
                            </li>
                            
                            <li>
                            
                            	<div class="picborder">
                                    <table class="pictable">
                                        <tr>
                                            <td class="t_l"> </td>
                                            <td class="t_m">
                                                <div></div>
                                                <b></b>
                                                <em></em>
                                            </td>
                                            <td class="t_r"> </td>
                                        </tr>
                                        <tr>
                                            <td class="m_l"> </td>
                                            <td class="m_m">
                                                
                                                <div class="mygroup_box">
                                                
                                                	<div class="title"><h3>南瓜团</h3></div>
                                                    <dl class="info">
                                                    
                                                    	<dt>
                                                        
                                                        	<a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a>
                                                        
                                                        </dt>
                                                        <dd>
                                                        
                                                        	<p>价格：<b>￥10000.00</b></p>
                                                            <p><strong>20人团</strong></p>
                                                            <p>已参加15人，还缺<b>5人</b></p>
                                                            <p>结束时间：<b>3天</b></p>
                                                        
                                                        </dd>
                                                    
                                                    </dl>
                                                    <dl class="add_info">
                                                    
                                                    	<dt><a class="addgroup_btn" href="#"></a></dt>
                                                        <dd class="success"></dd>
                                                    
                                                    </dl>
                                                    
                                                    <div class="postbox">
                                                    
                                                    	<div class="header">团主</div>
                                                        <dl>
                                                        
                                                        	<dt><a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a></dt>
                                                            <dd>
                                                            
                                                            	<h3><a href="#">melodi</a></h3>
                                                                <p><span><a href="#">秀场</a>(10000)</span><span><a href="#">体验</a>(10000)</span><span><a href="#">指南</a>(10000)</span></p>
                                                                <div class="bottom">
                                                                
                                                                	<a class="addbtn02 addbtn02_ok" href="#"><em></em>好友</a>
                                                                    <a class="addbtn02 addbtn02_ok" href="#"><em></em>关注</a>
                                                                
                                                                </div>
                                                            
                                                            </dd>
                                                        
                                                        </dl>
                                                        <div class="header"><b>10</b>个品友已经购买</div>
                                                        <div class="friends">
                                                        
                                                        	<a href="#"><img src="/images/mall/photo/photo12.png" alt="" /></a>
                                                            <a href="#"><img src="/images/mall/photo/photo13.png" alt="" /></a>
                                                            <a href="#"><img src="/images/mall/photo/photo14.png" alt="" /></a>
                                                            <a href="#"><img src="/images/mall/photo/photo12.png" alt="" /></a>
                                                            <a href="#"><img src="/images/mall/photo/photo13.png" alt="" /></a>
                                                            <a href="#"><img src="/images/mall/photo/photo14.png" alt="" /></a>
                                                        
                                                        </div>
                                                    
                                                    </div>
                                                
                                                </div>
                                                
                                            </td>
                                            <td class="m_r"> </td>
                                        </tr>
                                        
                                        <tr>
                                            <td class="b_l"> </td>
                                            <td class="b_m">
                                                <em></em>
                                                <b></b>
                                                <div></div>
                                            </td>
                                            <td class="b_r"> </td>
                                        </tr>
                                    </table>
                                    <div class="shadow"></div>
                              	</div>
                            
                            
                            </li>
                            
                        
                        </ul>
                        
                    </div>
                
                </div>
                
                <div class="mall_list_box rows">
        
                    <ul class="tab">
                    
                        <li class="current"><a class="show" href="#"></a></li>
                        <li><a class="exp" href="#"></a></li>
                        <li><a class="guide" href="#"></a></li>
                    
                    </ul>
                    
                    <div class="listbox">
                    
                        <div class="header">
                        
                            <a href="#">上一组</a>
                            <a href="#">下一组</a>
                        
                        </div>
                        
                        <ul class="show_list">
                        
                            <li class="current">
                            
                                <dl>
                                
                                    <dt><a href="#"><img src="/images/mall/photo/photo02.png" alt="" /></a></dt>
                                    <dd>
                                    
                                        <div class="avatar"><a href="#"><img src="/images/mall/photo/photo03.png" alt="" /></a></div>
                                        <p><a href="#">花儿多朵朵八强,甜美风达人</a></p>
                                    
                                    </dd>
                                
                                </dl>
                            
                            </li>
                            <li>
                            
                                <dl>
                                
                                    <dt><a href="#"><img src="/images/mall/photo/photo02.png" alt="" /></a></dt>
                                    <dd>
                                    
                                        <div class="avatar"><a href="#"><img src="/images/mall/photo/photo03.png" alt="" /></a></div>
                                        <p><a href="#">花儿多朵朵八强,甜美风达人</a></p>
                                    
                                    </dd>
                                
                                </dl>
                            
                            </li>
                            <li>
                            
                                <dl>
                                
                                    <dt><a href="#"><img src="/images/mall/photo/photo02.png" alt="" /></a></dt>
                                    <dd>
                                    
                                        <div class="avatar"><a href="#"><img src="/images/mall/photo/photo03.png" alt="" /></a></div>
                                        <p><a href="#">花儿多朵朵八强,甜美风达人</a></p>
                                    
                                    </dd>
                                
                                </dl>
                            
                            </li>
                            <li>
                            
                                <dl>
                                
                                    <dt><a href="#"><img src="/images/mall/photo/photo02.png" alt="" /></a></dt>
                                    <dd>
                                    
                                        <div class="avatar"><a href="#"><img src="/images/mall/photo/photo03.png" alt="" /></a></div>
                                        <p><a href="#">花儿多朵朵八强,甜美风达人</a></p>
                                    
                                    </dd>
                                
                                </dl>
                            
                            </li>
                            <li>
                            
                                <dl>
                                
                                    <dt><a href="#"><img src="/images/mall/photo/photo02.png" alt="" /></a></dt>
                                    <dd>
                                    
                                        <div class="avatar"><a href="#"><img src="/images/mall/photo/photo03.png" alt="" /></a></div>
                                        <p><a href="#">花儿多朵朵八强,甜美风达人</a></p>
                                    
                                    </dd>
                                
                                </dl>
                            
                            </li>
                            <li>
                            
                                <dl>
                                
                                    <dt><a href="#"><img src="/images/mall/photo/photo02.png" alt="" /></a></dt>
                                    <dd>
                                    
                                        <div class="avatar"><a href="#"><img src="/images/mall/photo/photo03.png" alt="" /></a></div>
                                        <p><a href="#">花儿多朵朵八强,甜美风达人</a></p>
                                    
                                    </dd>
                                
                                </dl>
                            
                            </li>
                            <li>
                            
                                <dl>
                                
                                    <dt><a href="#"><img src="/images/mall/photo/photo02.png" alt="" /></a></dt>
                                    <dd>
                                    
                                        <div class="avatar"><a href="#"><img src="/images/mall/photo/photo03.png" alt="" /></a></div>
                                        <p><a href="#">花儿多朵朵八强,甜美风达人</a></p>
                                    
                                    </dd>
                                
                                </dl>
                            
                            </li>
                            <li>
                            
                                <dl>
                                
                                    <dt><a href="#"><img src="/images/mall/photo/photo02.png" alt="" /></a></dt>
                                    <dd>
                                    
                                        <div class="avatar"><a href="#"><img src="/images/mall/photo/photo03.png" alt="" /></a></div>
                                        <p><a href="#">花儿多朵朵八强,甜美风达人</a></p>
                                    
                                    </dd>
                                
                                </dl>
                            
                            </li>
                        
                        </ul>
                    
                    </div>
                
                </div>
                
                <div class="mall_list_box rows">
        
                    <ul class="tab">
                    
                        <li><a class="show" href="#"></a></li>
                        <li class="current"><a class="exp" href="#"></a></li>
                        <li><a class="guide" href="#"></a></li>
                    
                    </ul>
                    
                    <div class="listbox">
                    
                        <div class="header">
                        
                            <a href="#">上一组</a>
                            <a href="#">下一组</a>
                        
                        </div>
                        
                        <ul class="post_list">
                        
                        	<li class="current">
                            
                            	<div class="post_item">
                                
                                	<div class="post">
                                    
                                    	<dl class="post_left">
                                        
                                        	<dt><a href="#"><img src="/images/mall/photo/photo02.png" alt="" /></a></dt>
                                            <dd>
                                               <p>秀场：<span>0</span></p>                                               <p>体验：<span>0</span></p>
                                               <p>指南：<span>0</span></p>
                                           	</dd>
                                        
                                        </dl>
                                        
                                        <div class="post_main">
                                        
                                        	<div class="post_header">
                                                <div class="post_displayName">
                                                    <a href="#">MichiMak</a>
                                                </div>
                                            </div>
                                            <div class="post_content01">
                                            	此次发放的礼品卡为达人店铺专用卡，需在达人店铺中购买产品才能使用，但不限只在我的小店购买哦！此次发放...... &nbsp; <a href="#">查看全部</a>
                                            </div>
                                            <div class="imglist">
                                            	<a href="#"><img src="/images/mall/photo/photo15.png" alt="" /></a>
                                                <a href="#"><img src="/images/mall/photo/photo16.png" alt="" /></a>
                                                <a href="#"><img src="/images/mall/photo/photo17.png" alt="" /></a>
                                            </div>
                                            <div class="post_actions">
                                            
                                            	<a href="#">转发(30)</a> | <a href="#">品论(74)</a>
                                            
                                            </div>
                                        
                                        </div>
                                    
                                    </div>
                                    
                                    <div class="post_comment">
                                    
                                    	<h5>最新评论</h5>
                                        <dl class="commentbox">
                                        	
                                            <dt><a href="#"><img src="/images/mall/photo/photo17.png" alt="" /></a></dt>
                                            <dd>
                                            
                                            	<div class="comment_item_row1">
                                                    <span class="comment_username">洪洪：</span>
                                                    <span class="comment_content">不错啊，阿朗，这是你吗？</span>
                                                </div>
                                                <div class="comment_item_row2">
                
                                                    <div class="comment_time">2011-10-31 20:40</div>
                                                    
                                                </div>
                                            
                                            </dd>
                                        
                                        </dl>
                                    
                                    </div>
                                
                                </div>
                            
                            </li>
                            
                            <li>
                            
                            	<div class="post_item">
                                
                                	<div class="post">
                                    
                                    	<dl class="post_left">
                                        
                                        	<dt><a href="#"><img src="/images/mall/photo/photo02.png" alt="" /></a></dt>
                                            <dd>
                                               <p>秀场：<span>0</span></p>                                               <p>体验：<span>0</span></p>
                                               <p>指南：<span>0</span></p>
                                           	</dd>
                                        
                                        </dl>
                                        
                                        <div class="post_main">
                                        
                                        	<div class="post_header">
                                                <div class="post_displayName">
                                                    <a href="#">MichiMak</a>
                                                </div>
                                            </div>
                                            <div class="post_content01">
                                            	此次发放的礼品卡为达人店铺专用卡，需在达人店铺中购买产品才能使用，但不限只在我的小店购买哦！此次发放...... &nbsp; <a href="#">查看全部</a>
                                            </div>
                                            <div class="imglist">
                                            	<a href="#"><img src="/images/mall/photo/photo15.png" alt="" /></a>
                                                <a href="#"><img src="/images/mall/photo/photo16.png" alt="" /></a>
                                                <a href="#"><img src="/images/mall/photo/photo17.png" alt="" /></a>
                                            </div>
                                            <div class="post_actions">
                                            
                                            	<a href="#">转发(30)</a> | <a href="#">品论(74)</a>
                                            
                                            </div>
                                        
                                        </div>
                                    
                                    </div>
                                    
                                    <div class="post_comment">
                                    
                                    	<h5>最新评论</h5>
                                        <dl class="commentbox">
                                        	
                                            <dt><a href="#"><img src="/images/mall/photo/photo17.png" alt="" /></a></dt>
                                            <dd>
                                            
                                            	<div class="comment_item_row1">
                                                    <span class="comment_username">洪洪：</span>
                                                    <span class="comment_content">不错啊，阿朗，这是你吗？</span>
                                                </div>
                                                <div class="comment_item_row2">
                
                                                    <div class="comment_time">2011-10-31 20:40</div>
                                                    
                                                </div>
                                            
                                            </dd>
                                        
                                        </dl>
                                    
                                    </div>
                                
                                </div>
                            
                            </li>
                            
                            <li>
                            
                            	<div class="post_item">
                                
                                	<div class="post">
                                    
                                    	<dl class="post_left">
                                        
                                        	<dt><a href="#"><img src="/images/mall/photo/photo02.png" alt="" /></a></dt>
                                            <dd>
                                               <p>秀场：<span>0</span></p>                                               <p>体验：<span>0</span></p>
                                               <p>指南：<span>0</span></p>
                                           	</dd>
                                        
                                        </dl>
                                        
                                        <div class="post_main">
                                        
                                        	<div class="post_header">
                                                <div class="post_displayName">
                                                    <a href="#">MichiMak</a>
                                                </div>
                                            </div>
                                            <div class="post_content01">
                                            	此次发放的礼品卡为达人店铺专用卡，需在达人店铺中购买产品才能使用，但不限只在我的小店购买哦！此次发放...... &nbsp; <a href="#">查看全部</a>
                                            </div>
                                            <div class="imglist">
                                            	<a href="#"><img src="/images/mall/photo/photo15.png" alt="" /></a>
                                                <a href="#"><img src="/images/mall/photo/photo16.png" alt="" /></a>
                                                <a href="#"><img src="/images/mall/photo/photo17.png" alt="" /></a>
                                            </div>
                                            <div class="post_actions">
                                            
                                            	<a href="#">转发(30)</a> | <a href="#">品论(74)</a>
                                            
                                            </div>
                                        
                                        </div>
                                    
                                    </div>
                                    
                                    <div class="post_comment">
                                    
                                    	<h5>最新评论</h5>
                                        <dl class="commentbox">
                                        	
                                            <dt><a href="#"><img src="/images/mall/photo/photo17.png" alt="" /></a></dt>
                                            <dd>
                                            
                                            	<div class="comment_item_row1">
                                                    <span class="comment_username">洪洪：</span>
                                                    <span class="comment_content">不错啊，阿朗，这是你吗？</span>
                                                </div>
                                                <div class="comment_item_row2">
                
                                                    <div class="comment_time">2011-10-31 20:40</div>
                                                    
                                                </div>
                                            
                                            </dd>
                                        
                                        </dl>
                                    
                                    </div>
                                
                                </div>
                            
                            </li>
                            
                            <li>
                            
                            	<div class="post_item">
                                
                                	<div class="post">
                                    
                                    	<dl class="post_left">
                                        
                                        	<dt><a href="#"><img src="/images/mall/photo/photo02.png" alt="" /></a></dt>
                                            <dd>
                                               <p>秀场：<span>0</span></p>                                               <p>体验：<span>0</span></p>
                                               <p>指南：<span>0</span></p>
                                           	</dd>
                                        
                                        </dl>
                                        
                                        <div class="post_main">
                                        
                                        	<div class="post_header">
                                                <div class="post_displayName">
                                                    <a href="#">MichiMak</a>
                                                </div>
                                            </div>
                                            <div class="post_content01">
                                            	此次发放的礼品卡为达人店铺专用卡，需在达人店铺中购买产品才能使用，但不限只在我的小店购买哦！此次发放...... &nbsp; <a href="#">查看全部</a>
                                            </div>
                                            <div class="imglist">
                                            	<a href="#"><img src="/images/mall/photo/photo15.png" alt="" /></a>
                                                <a href="#"><img src="/images/mall/photo/photo16.png" alt="" /></a>
                                                <a href="#"><img src="/images/mall/photo/photo17.png" alt="" /></a>
                                            </div>
                                            <div class="post_actions">
                                            
                                            	<a href="#">转发(30)</a> | <a href="#">品论(74)</a>
                                            
                                            </div>
                                        
                                        </div>
                                    
                                    </div>
                                    
                                    <div class="post_comment">
                                    
                                    	<h5>最新评论</h5>
                                        <dl class="commentbox">
                                        	
                                            <dt><a href="#"><img src="/images/mall/photo/photo17.png" alt="" /></a></dt>
                                            <dd>
                                            
                                            	<div class="comment_item_row1">
                                                    <span class="comment_username">洪洪：</span>
                                                    <span class="comment_content">不错啊，阿朗，这是你吗？</span>
                                                </div>
                                                <div class="comment_item_row2">
                
                                                    <div class="comment_time">2011-10-31 20:40</div>
                                                    
                                                </div>
                                            
                                            </dd>
                                        
                                        </dl>
                                    
                                    </div>
                                
                                </div>
                            
                            </li>
                        
                        </ul>
                    
                    </div>
                
                </div>
                
                
                <div class="mall_list_box rows">
        
                    <ul class="tab">
                    
                        <li><a class="show" href="#"></a></li>
                        <li><a class="exp" href="#"></a></li>
                        <li class="current"><a class="guide" href="#"></a></li>
                    
                    </ul>
                    
                    <div class="listbox">
                    
                        <div class="header">
                        
                            <a href="#">上一组</a>
                            <a href="#">下一组</a>
                        
                        </div>
                        
                        <ul class="post_list">
                        
                        	<li class="current">
                            
                            	<div class="post_item">
                                
                                	<div class="post">
                                    
                                    	<dl class="post_left">
                                        
                                        	<dt><a href="#"><img src="/images/mall/photo/photo02.png" alt="" /></a></dt>
                                            <dd>
                                               <p>秀场：<span>0</span></p>                                               <p>体验：<span>0</span></p>
                                               <p>指南：<span>0</span></p>
                                           	</dd>
                                        
                                        </dl>
                                        
                                        <div class="post_main">
                                        
                                        	<div class="post_header">
                                                <div class="post_displayName">
                                                    <a href="#">阿朗</a>
                                                </div>
                                                <div class="post_title">
                                                	<a href="#">真丝围巾的八种用法</a>
                                                </div>
                                                <div class="post_type"><a href="#">(鞋帽/女装)</a></div>
                                            </div>
                                            <div class="post_content01">
                                            	此次发放的礼品卡为达人店铺专用卡，需在达人店铺中购买产品才能使用，但不限只在我的小店购买哦！此次发放...... &nbsp; <a href="#">查看全部</a>
                                            </div>
                                            <div class="imglist">
                                            	<a href="#"><img src="/images/mall/photo/photo15.png" alt="" /></a>
                                                <a href="#"><img src="/images/mall/photo/photo16.png" alt="" /></a>
                                                <a href="#"><img src="/images/mall/photo/photo17.png" alt="" /></a>
                                            </div>
                                            <div class="post_actions">
                                            
                                            	<a href="#">转发(30)</a> | <a href="#">品论(74)</a>
                                            
                                            </div>
                                        
                                        </div>
                                    
                                    </div>
                                    
                                    <div class="post_comment">
                                    
                                    	<h5>最新评论</h5>
                                        <dl class="commentbox">
                                        	
                                            <dt><a href="#"><img src="/images/mall/photo/photo17.png" alt="" /></a></dt>
                                            <dd>
                                            
                                            	<div class="comment_item_row1">
                                                    <span class="comment_username">洪洪：</span>
                                                    <span class="comment_content">不错啊，阿朗，这是你吗？</span>
                                                </div>
                                                <div class="comment_item_row2">
                
                                                    <div class="comment_time">2011-10-31 20:40</div>
                                                    
                                                </div>
                                            
                                            </dd>
                                        
                                        </dl>
                                    
                                    </div>
                                
                                </div>
                            
                            </li>
                            
                            <li>
                            
                            	<div class="post_item">
                                
                                	<div class="post">
                                    
                                    	<dl class="post_left">
                                        
                                        	<dt><a href="#"><img src="/images/mall/photo/photo02.png" alt="" /></a></dt>
                                            <dd>
                                               <p>秀场：<span>0</span></p>                                               <p>体验：<span>0</span></p>
                                               <p>指南：<span>0</span></p>
                                           	</dd>
                                        
                                        </dl>
                                        
                                        <div class="post_main">
                                        
                                        	<div class="post_header">
                                                <div class="post_displayName">
                                                    <a href="#">阿朗</a>
                                                </div>
                                                <div class="post_title">
                                                	<a href="#">真丝围巾的八种用法</a>
                                                </div>
                                                <div class="post_type"><a href="#">(鞋帽/女装)</a></div>
                                            </div>
                                            <div class="post_content01">
                                            	此次发放的礼品卡为达人店铺专用卡，需在达人店铺中购买产品才能使用，但不限只在我的小店购买哦！此次发放...... &nbsp; <a href="#">查看全部</a>
                                            </div>
                                            <div class="imglist">
                                            	<a href="#"><img src="/images/mall/photo/photo15.png" alt="" /></a>
                                                <a href="#"><img src="/images/mall/photo/photo16.png" alt="" /></a>
                                                <a href="#"><img src="/images/mall/photo/photo17.png" alt="" /></a>
                                            </div>
                                            <div class="post_actions">
                                            
                                            	<a href="#">转发(30)</a> | <a href="#">品论(74)</a>
                                            
                                            </div>
                                        
                                        </div>
                                    
                                    </div>
                                    
                                    <div class="post_comment">
                                    
                                    	<h5>最新评论</h5>
                                        <dl class="commentbox">
                                        	
                                            <dt><a href="#"><img src="/images/mall/photo/photo17.png" alt="" /></a></dt>
                                            <dd>
                                            
                                            	<div class="comment_item_row1">
                                                    <span class="comment_username">洪洪：</span>
                                                    <span class="comment_content">不错啊，阿朗，这是你吗？</span>
                                                </div>
                                                <div class="comment_item_row2">
                
                                                    <div class="comment_time">2011-10-31 20:40</div>
                                                    
                                                </div>
                                            
                                            </dd>
                                        
                                        </dl>
                                    
                                    </div>
                                
                                </div>
                            
                            </li>
                            
                            <li>
                            
                            	<div class="post_item">
                                
                                	<div class="post">
                                    
                                    	<dl class="post_left">
                                        
                                        	<dt><a href="#"><img src="/images/mall/photo/photo02.png" alt="" /></a></dt>
                                            <dd>
                                               <p>秀场：<span>0</span></p>                                               <p>体验：<span>0</span></p>
                                               <p>指南：<span>0</span></p>
                                           	</dd>
                                        
                                        </dl>
                                        
                                        <div class="post_main">
                                        
                                        	<div class="post_header">
                                                <div class="post_displayName">
                                                    <a href="#">阿朗</a>
                                                </div>
                                                <div class="post_title">
                                                	<a href="#">真丝围巾的八种用法</a>
                                                </div>
                                                <div class="post_type"><a href="#">(鞋帽/女装)</a></div>
                                            </div>
                                            <div class="post_content01">
                                            	此次发放的礼品卡为达人店铺专用卡，需在达人店铺中购买产品才能使用，但不限只在我的小店购买哦！此次发放...... &nbsp; <a href="#">查看全部</a>
                                            </div>
                                            <div class="imglist">
                                            	<a href="#"><img src="/images/mall/photo/photo15.png" alt="" /></a>
                                                <a href="#"><img src="/images/mall/photo/photo16.png" alt="" /></a>
                                                <a href="#"><img src="/images/mall/photo/photo17.png" alt="" /></a>
                                            </div>
                                            <div class="post_actions">
                                            
                                            	<a href="#">转发(30)</a> | <a href="#">品论(74)</a>
                                            
                                            </div>
                                        
                                        </div>
                                    
                                    </div>
                                    
                                    <div class="post_comment">
                                    
                                    	<h5>最新评论</h5>
                                        <dl class="commentbox">
                                        	
                                            <dt><a href="#"><img src="/images/mall/photo/photo17.png" alt="" /></a></dt>
                                            <dd>
                                            
                                            	<div class="comment_item_row1">
                                                    <span class="comment_username">洪洪：</span>
                                                    <span class="comment_content">不错啊，阿朗，这是你吗？</span>
                                                </div>
                                                <div class="comment_item_row2">
                
                                                    <div class="comment_time">2011-10-31 20:40</div>
                                                    
                                                </div>
                                            
                                            </dd>
                                        
                                        </dl>
                                    
                                    </div>
                                
                                </div>
                            
                            </li>
                            
                            <li>
                            
                            	<div class="post_item">
                                
                                	<div class="post">
                                    
                                    	<dl class="post_left">
                                        
                                        	<dt><a href="#"><img src="/images/mall/photo/photo02.png" alt="" /></a></dt>
                                            <dd>
                                               <p>秀场：<span>0</span></p>                                               <p>体验：<span>0</span></p>
                                               <p>指南：<span>0</span></p>
                                           	</dd>
                                        
                                        </dl>
                                        
                                        <div class="post_main">
                                        
                                        	<div class="post_header">
                                                <div class="post_displayName">
                                                    <a href="#">阿朗</a>
                                                </div>
                                                <div class="post_title">
                                                	<a href="#">真丝围巾的八种用法</a>
                                                </div>
                                                <div class="post_type"><a href="#">(鞋帽/女装)</a></div>
                                            </div>
                                            <div class="post_content01">
                                            	此次发放的礼品卡为达人店铺专用卡，需在达人店铺中购买产品才能使用，但不限只在我的小店购买哦！此次发放...... &nbsp; <a href="#">查看全部</a>
                                            </div>
                                            <div class="imglist">
                                            	<a href="#"><img src="/images/mall/photo/photo15.png" alt="" /></a>
                                                <a href="#"><img src="/images/mall/photo/photo16.png" alt="" /></a>
                                                <a href="#"><img src="/images/mall/photo/photo17.png" alt="" /></a>
                                            </div>
                                            <div class="post_actions">
                                            
                                            	<a href="#">转发(30)</a> | <a href="#">品论(74)</a>
                                            
                                            </div>
                                        
                                        </div>
                                    
                                    </div>
                                    
                                    <div class="post_comment">
                                    
                                    	<h5>最新评论</h5>
                                        <dl class="commentbox">
                                        	
                                            <dt><a href="#"><img src="/images/mall/photo/photo17.png" alt="" /></a></dt>
                                            <dd>
                                            
                                            	<div class="comment_item_row1">
                                                    <span class="comment_username">洪洪：</span>
                                                    <span class="comment_content">不错啊，阿朗，这是你吗？</span>
                                                </div>
                                                <div class="comment_item_row2">
                
                                                    <div class="comment_time">2011-10-31 20:40</div>
                                                    
                                                </div>
                                            
                                            </dd>
                                        
                                        </dl>
                                    
                                    </div>
                                
                                </div>
                            
                            </li>
                        
                        </ul>
                    
                    </div>
                
                </div>
                
                
                <div class="detailbox rows">
                
                	<ul class="tab">
                    
                    	<li class="current"><a href="#">商品详情</a></li>
                        <li><a href="#">商品咨询</a></li>
                        <li><a href="#">购买记录</a></li>
                        <li><a href="#">支付方式</a></li>
                        <li><a href="#">售后服务</a></li>
                    
                    </ul>
                    
                    <div class="shop_detail_content">
                    
                    	商品详情内容是由后台编辑产生的.
                    
                    </div>
                
                </div>
                
                <div class="detailbox rows">
                
                	<ul class="tab">
                    
                    	<li><a href="#">商品详情</a></li>
                        <li class="current"><a href="#">商品咨询</a></li>
                        <li><a href="#">购买记录</a></li>
                        <li><a href="#">支付方式</a></li>
                        <li><a href="#">售后服务</a></li>
                    
                    </ul>
                    
                    <div class="shop_answer_content">
                    
                    	<div class="answer_searchbox">
                        
                        	<div class="left">
                            
                            	<h5>咨询前请先搜索,方便又快捷：</h5>
                                <div class="searchbox">
                                    <div class="searchgroup">
                                        <input id="search" value="问题关键字" />
                                    </div>
                                    <a href="#" class="searchbtn"></a>
                                </div>
                            
                            </div>
                            
                            <div class="prompt_info">
                            
                            	<b>温馨提示：</b>因厂家更改产品包装、产地或者更换随机附件等没有任何提前通知，且每位咨询者购买情况、提问时间等不同，为此以下回复仅对提问者3天内有效，其他网友仅供参考！若由此给您带来不便请多多谅解，谢谢！
                            
                            </div>
                            
                        </div>
                        
                        <div class="answer_list">
                            
                            <div class="answer_form">
                            
                                <form action="">
                                
                                	<h3>我来提问</h3>
                                
                                    <textarea></textarea>

                                    <div class="txtarea_bottom">
                                    
                                        <div class="face faceimg">
                                        
                                            <a href="#"><em></em>表情</a>
                                        
                                        </div>
                                        
                                        <a class="button" href="#">提问</a>
                                    
                                    </div>
                                
                                </form>
                            
                            </div>
                            
                            <div class="answer_list_group">
                            
                                <ul class="answer_topic">
                                
                                    <li class="answer_title">
                                    
                                        <div class="answer_avatar"><img src="/images/mall/photo/photo16.png" alt="" /></div>
                                        <div class="answer_item_content">
                                        
                                            <div class="answer_row1">
                                            
                                                <b class="answer_username">洪洪：</b><span class="answer_content">您好!请问CX3和CX4有什么区别.好象参数都差不多的呀!</span>
                                            
                                            </div>
                                            <div class="answer_row2">
                                            
                                                <div class="answer_actions">
                                                
                                                    <a href="#">我来回答</a> | <a href="#">投诉</a>
                                                
                                                </div>
                                                <span class="answer_time">2010-7-14</span>
                                            
                                            </div>
                                        
                                        </div>
                                    
                                    </li>
                                    
                                </ul>
                                
                                <ul class="answer_topic">
                                
                                    <li class="answer_item answer_good_item">
                                    
                                        <div class="flag"><em></em>最佳答案</div>
                                        <div class="answer_avatar"><img src="/images/mall/photo/photo16.png" alt="" /></div>
                                        <div class="answer_item_content">
                                        
                                            <div class="answer_row1">
                                            
                                                <b class="answer_username">洪洪：</b><span class="answer_content">您好!请问CX3和CX4有什么区别.好象参数都差不多的呀!</span>
                                            
                                            </div>
                                            <div class="answer_row2">
                                            
                                                <div class="answer_actions">
                                                
                                                    <a href="#">品论(3)</a> | <a href="#">投诉</a>
                                                
                                                </div>
                                                <span class="answer_time">2010-7-14</span>
                                            
                                            </div>
                                        
                                        </div>
                                    
                                    </li>
                                    
                                    <li class="answer_item_indent">
                                    
                                        <div class="answer_avatar"><img src="/images/mall/photo/photo16.png" alt="" /></div>
                                        <div class="answer_item_content">
                                        
                                            <div class="answer_row1">
                                            
                                                <b class="answer_username">洪洪：</b><span class="answer_content">您好!请问CX3和CX4有什么区别.好象参数都差不多的呀!</span>
                                            
                                            </div>
                                            <div class="answer_row2">
                                            
                                                <div class="answer_actions">
                                                
                                                    <a href="#">回复</a> | <a href="#">投诉</a>
                                                
                                                </div>
                                                <span class="answer_time">2010-7-14</span>
                                            
                                            </div>
                                        
                                        </div>
                                    
                                    </li>
                                    
                                    <li class="answer_item_indent">
                                    
                                        <div class="answer_avatar"><img src="/images/mall/photo/photo16.png" alt="" /></div>
                                        <div class="answer_item_content">
                                        
                                            <div class="answer_row1">
                                            
                                                <b class="answer_username">洪洪：</b><span class="answer_content">您好!请问CX3和CX4有什么区别.好象参数都差不多的呀!</span>
                                            
                                            </div>
                                            <div class="answer_row2">
                                            
                                                <div class="answer_actions">
                                                
                                                    <a href="#">回复</a> | <a href="#">投诉</a>
                                                
                                                </div>
                                                <span class="answer_time">2010-7-14</span>
                                            
                                            </div>
                                        
                                        </div>
                                    
                                    </li>
                                    
                                    <li class="answer_item_indent">
                                    
                                        <div class="answer_avatar"><img src="/images/mall/photo/photo16.png" alt="" /></div>
                                        <div class="answer_item_content">
                                        
                                            <div class="answer_row1">
                                            
                                                <b class="answer_username">洪洪：</b><span class="answer_content">您好!请问CX3和CX4有什么区别.好象参数都差不多的呀!</span>
                                            
                                            </div>
                                            <div class="answer_row2">
                                            
                                                <div class="answer_actions">
                                                
                                                    <a href="#">回复</a> | <a href="#">投诉</a>
                                                
                                                </div>
                                                <span class="answer_time">2010-7-14</span>
                                            
                                            </div>
                                        
                                        </div>
                                    
                                    </li>
                                    <li class="answer_more">
                                    
                                        <a href="#">显示更多&gt;&gt;</a>	
                                    
                                    </li>
                                
                                </ul>
                                
                                <ul class="answer_topic">
                                
                                    <li class="answer_item">
                                    
                                        <div class="flag"><em></em>最佳答案</div>
                                        <div class="answer_avatar"><img src="/images/mall/photo/photo16.png" alt="" /></div>
                                        <div class="answer_item_content">
                                        
                                            <div class="answer_row1">
                                            
                                                <b class="answer_username">洪洪：</b><span class="answer_content">您好!请问CX3和CX4有什么区别.好象参数都差不多的呀!</span>
                                            
                                            </div>
                                            <div class="answer_row2">
                                            
                                                <div class="answer_actions">
                                                
                                                    <a href="#">品论(3)</a> | <a href="#">投诉</a>
                                                
                                                </div>
                                                <span class="answer_time">2010-7-14</span>
                                            
                                            </div>
                                        
                                        </div>
                                    
                                    </li>
                                
                                </ul>
                                
                                <ul class="answer_topic">
                                
                                    <li class="answer_item">
                                    
                                        <div class="flag"><em></em>最佳答案</div>
                                        <div class="answer_avatar"><img src="/images/mall/photo/photo16.png" alt="" /></div>
                                        <div class="answer_item_content">
                                        
                                            <div class="answer_row1">
                                            
                                                <b class="answer_username">洪洪：</b><span class="answer_content">您好!请问CX3和CX4有什么区别.好象参数都差不多的呀!</span>
                                            
                                            </div>
                                            <div class="answer_row2">
                                            
                                                <div class="answer_actions">
                                                
                                                    <a href="#">品论(3)</a> | <a href="#">投诉</a>
                                                
                                                </div>
                                                <span class="answer_time">2010-7-14</span>
                                            
                                            </div>
                                        
                                        </div>
                                    
                                    </li>
                                
                                </ul>
                                
                            </div>
                            
                            <div class="answer_list_group">
                            
                                <ul class="answer_topic">
                                
                                    <li class="answer_title">
                                    
                                        <div class="answer_avatar"><img src="/images/mall/photo/photo16.png" alt="" /></div>
                                        <div class="answer_item_content">
                                        
                                            <div class="answer_row1">
                                            
                                                <b class="answer_username">洪洪：</b><span class="answer_content">您好!请问CX3和CX4有什么区别.好象参数都差不多的呀!</span>
                                            
                                            </div>
                                            <div class="answer_row2">
                                            
                                                <div class="answer_actions">
                                                
                                                    <a href="#">我来回答</a> | <a href="#">投诉</a>
                                                
                                                </div>
                                                <span class="answer_time">2010-7-14</span>
                                            
                                            </div>
                                        
                                        </div>
                                    
                                    </li>
                                    
                                    <li class="answer_form">
                            
                                        <form action="">
                                        
                                            <textarea></textarea>
        
                                            <div class="txtarea_bottom">
                                            
                                                <div class="face faceimg">
                                                
                                                    <a href="#"><em></em>表情</a>
                                                
                                                </div>
                                                <div class="ckgroup">
                                                
                                                	<input type="checkbox" /><label>同时发送到我的广播</label>
                                                
                                                </div>
                                                
                                                <a class="button" href="#">回答</a>
                                            
                                            </div>
                                        
                                        </form>
                                    
                                    </li>
                                    
                                </ul>
                                
                                <ul class="answer_topic">
                                
                                    <li class="answer_item answer_good_item">
                                    
                                        <div class="flag"><em></em>最佳答案</div>
                                        <div class="answer_avatar"><img src="/images/mall/photo/photo16.png" alt="" /></div>
                                        <div class="answer_item_content">
                                        
                                            <div class="answer_row1">
                                            
                                                <b class="answer_username">洪洪：</b><span class="answer_content">您好!请问CX3和CX4有什么区别.好象参数都差不多的呀!</span>
                                            
                                            </div>
                                            <div class="answer_row2">
                                            
                                                <div class="answer_actions">
                                                
                                                    <a href="#">品论(3)</a> | <a href="#">投诉</a>
                                                
                                                </div>
                                                <span class="answer_time">2010-7-14</span>
                                            
                                            </div>
                                        
                                        </div>
                                    
                                    </li>
                                    
                                    <li class="answer_item_indent">
                                    
                                        <div class="answer_avatar"><img src="/images/mall/photo/photo16.png" alt="" /></div>
                                        <div class="answer_item_content">
                                        
                                            <div class="answer_row1">
                                            
                                                <b class="answer_username">洪洪：</b><span class="answer_content">您好!请问CX3和CX4有什么区别.好象参数都差不多的呀!</span>
                                            
                                            </div>
                                            <div class="answer_row2">
                                            
                                                <div class="answer_actions">
                                                
                                                    <a href="#">回复</a> | <a href="#">投诉</a>
                                                
                                                </div>
                                                <span class="answer_time">2010-7-14</span>
                                            
                                            </div>
                                        
                                        </div>
                                    
                                    </li>
                                    
                                    <li class="answer_item_indent">
                                    
                                        <div class="answer_avatar"><img src="/images/mall/photo/photo16.png" alt="" /></div>
                                        <div class="answer_item_content">
                                        
                                            <div class="answer_row1">
                                            
                                                <b class="answer_username">洪洪：</b><span class="answer_content">您好!请问CX3和CX4有什么区别.好象参数都差不多的呀!</span>
                                            
                                            </div>
                                            <div class="answer_row2">
                                            
                                                <div class="answer_actions">
                                                
                                                    <a href="#">回复</a> | <a href="#">投诉</a>
                                                
                                                </div>
                                                <span class="answer_time">2010-7-14</span>
                                            
                                            </div>
                                        
                                        </div>
                                    
                                    </li>
                                    
                                    <li class="answer_item_indent">
                                    
                                        <div class="answer_avatar"><img src="/images/mall/photo/photo16.png" alt="" /></div>
                                        <div class="answer_item_content">
                                        
                                            <div class="answer_row1">
                                            
                                                <b class="answer_username">洪洪：</b><span class="answer_content">您好!请问CX3和CX4有什么区别.好象参数都差不多的呀!</span>
                                            
                                            </div>
                                            <div class="answer_row2">
                                            
                                                <div class="answer_actions">
                                                
                                                    <a href="#">回复</a> | <a href="#">投诉</a>
                                                
                                                </div>
                                                <span class="answer_time">2010-7-14</span>
                                            
                                            </div>
                                        
                                        </div>
                                    
                                    </li>
                                    
                                    <li class="answer_form answer_subform">
                            
                                        <form action="">
                                        
                                            <textarea></textarea>
        
                                            <div class="txtarea_bottom">
                                            
                                                <div class="face faceimg">
                                                
                                                    <a href="#"><em></em>表情</a>
                                                
                                                </div>
                                                <div class="ckgroup">
                                                
                                                	<input type="checkbox" /><label>同时发送到我的广播</label>
                                                
                                                </div>
                                                
                                                <a class="button" href="#">回复</a>
                                            
                                            </div>
                                        
                                        </form>
                                    
                                    </li>
                                    
                                    
                                    <li class="answer_more">
                                    
                                        <a href="#">显示更多&gt;&gt;</a>	
                                    
                                    </li>
                                
                                </ul>
                                
                                <ul class="answer_topic">
                                
                                    <li class="answer_item">
                                    
                                        <div class="flag"><em></em>最佳答案</div>
                                        <div class="answer_avatar"><img src="/images/mall/photo/photo16.png" alt="" /></div>
                                        <div class="answer_item_content">
                                        
                                            <div class="answer_row1">
                                            
                                                <b class="answer_username">洪洪：</b><span class="answer_content">您好!请问CX3和CX4有什么区别.好象参数都差不多的呀!</span>
                                            
                                            </div>
                                            <div class="answer_row2">
                                            
                                                <div class="answer_actions">
                                                
                                                    <a href="#">品论(3)</a> | <a href="#">投诉</a>
                                                
                                                </div>
                                                <span class="answer_time">2010-7-14</span>
                                            
                                            </div>
                                        
                                        </div>
                                    
                                    </li>
                                
                                </ul>
                                
                                <ul class="answer_topic">
                                
                                    <li class="answer_item">
                                    
                                        <div class="flag"><em></em>最佳答案</div>
                                        <div class="answer_avatar"><img src="/images/mall/photo/photo16.png" alt="" /></div>
                                        <div class="answer_item_content">
                                        
                                            <div class="answer_row1">
                                            
                                                <b class="answer_username">洪洪：</b><span class="answer_content">您好!请问CX3和CX4有什么区别.好象参数都差不多的呀!</span>
                                            
                                            </div>
                                            <div class="answer_row2">
                                            
                                                <div class="answer_actions">
                                                
                                                    <a href="#">品论(3)</a> | <a href="#">投诉</a>
                                                
                                                </div>
                                                <span class="answer_time">2010-7-14</span>
                                            
                                            </div>
                                        
                                        </div>
                                    
                                    </li>
                                
                                </ul>
                                
                            </div>
                            
                            <div class="psf_page">
                                <span class="prev_next prev disabled"><em></em><i>上一页</i></span>
                                <span class="current">1</span>
                                <a href="#index_tab" onclick="javascript:loadPostList(-1,-1,-1,2);">2</a>
                                <a href="#index_tab" onclick="javascript:loadPostList(-1,-1,-1,3);">3</a>
                                <span class="dots">…</span>
                                <a href="#index_tab" onclick="javascript:loadPostList(-1,-1,-1,15);">15</a>
                                <a class="prev_next next" href="#index_tab" onclick="javascript:loadPostList(-1,-1,-1,2);"><i>下一页</i><em></em></a>
                            </div>
                        
                        </div>
                    
                    </div>
                
                </div>
                
                <div class="detailbox rows">
                
                	<ul class="tab">
                    
                    	<li><a href="#">商品详情</a></li>
                        <li><a href="#">商品咨询</a></li>
                        <li class="current"><a href="#">购买记录</a></li>
                        <li><a href="#">支付方式</a></li>
                        <li><a href="#">售后服务</a></li>
                    
                    </ul>
                    
                    <div class="buy_record_content">
                    
                    	<table cellpadding="0">
                        
                        	<tr>
                            	
                                <th>品友</th>
                                <th>数量</th>
                                <th>成交时间</th>
                                <th class="actions">相关体验及秀场</th>
                            
                            </tr>
                            
                            <tr>
                            
                            	<td class="name">麻袋</td>
                                <td class="num">1</td>
                                <td class="time">2011年10月30日</td>
                                <td class="actions"><a href="#">体验(20人评论)</a> <a href="#">秀场(15人评论)</a></td>
                            
                            </tr>
                            
                            <tr>
                            
                            	<td class="name">麻**</td>
                                <td class="num">1</td>
                                <td class="time">2011年10月30日</td>
                                <td class="actions"></td>
                            
                            </tr>
                        
                        </table>
                        
                        <div class="psf_page">
                            <span class="prev_next prev disabled"><em></em><i>上一页</i></span>
                            <span class="current">1</span>
                            <a href="#index_tab" onclick="javascript:loadPostList(-1,-1,-1,2);">2</a>
                            <a href="#index_tab" onclick="javascript:loadPostList(-1,-1,-1,3);">3</a>
                            <span class="dots">…</span>
                            <a href="#index_tab" onclick="javascript:loadPostList(-1,-1,-1,15);">15</a>
                            <a class="prev_next next" href="#index_tab" onclick="javascript:loadPostList(-1,-1,-1,2);"><i>下一页</i><em></em></a>
                        </div>
                    
                    </div>
                
                </div>
                
                <div class="detailbox rows">
                
                	<ul class="tab">
                    
                    	<li><a href="#">商品详情</a></li>
                        <li><a href="#">商品咨询</a></li>
                        <li><a href="#">购买记录</a></li>
                        <li class="current"><a href="#">支付方式</a></li>
                        <li><a href="#">售后服务</a></li>
                    
                    </ul>
                    
                    <div class="pay_mode_content">
                    
                    	<div class="msgbox">
                        
                        	<p><b>货到付款：</b>我们在以下省市开通了货到付款(其他城市正陆续开通),你可使用现金、移动POS机（部分地区支持刷卡）当前付款收货,点击城市名可查看详细配送范围及运费：</p>
                            <p class="city">
                            	<a href="#">北京</a>
                                <a href="#">上海</a>
                                <a href="#">广州</a>
                                <a href="#">广东（不含广州）</a>
                                <a href="#">天津</a>
                                <a href="#">杭州</a>
                                <a href="#">山东</a>
                                <a href="#">厦门</a>
                                <a href="#">武汉</a>
                                <a href="#">成都</a>
                                <a href="#">深州</a>
                                <a href="#">西安</a>
                                <a href="#">宁波</a>
                                <a href="#">东莞</a>
                                <a href="#">沈阳</a>
                                <a href="#">福州</a>
                                <a href="#">北京</a>
                                <a href="#">上海</a>
                                <a href="#">广州</a>
                                <a href="#">重庆</a>
                                <a href="#">天津</a>
                                <a href="#">杭州</a>
                                <a href="#">山东</a>
                                <a href="#">厦门</a>
                                <a href="#">武汉</a>
                                <a href="#">成都</a>
                                <a href="#">深州</a>
                                <a href="#">西安</a>
                                <a href="#">宁波</a>
                                <a href="#">东莞</a>
                                <a href="#">沈阳</a>
                                <a href="#">福州</a>
                                <a href="#">杭州</a>
                                <a href="#">山东</a>
                                <a href="#">厦门</a>
                                <a href="#">武汉</a>
                                <a href="#">成都</a>
                                <a href="#">深州</a>
                                <a href="#">西安</a>
                                <a href="#">宁波</a>
                                <a href="#">东莞</a>
                                <a href="#">沈阳</a>
                                <a href="#">福州</a>
                            </p>
                            <p><b>在线支付：</b>我们为您提供几乎全部银行的银行卡及信用卡在线支付，只要您开通了"网上支付"功能,即可进行在线支付，无需手续费，实时到帐，方便快捷，<a href="#">支付限额说明&gt;&gt;</a></p>
                        
                        </div>
                        
                        <div class="bankbox">
                        
                        	<div class="banklist">
                            
                            	<a href="#"><img src="/images/mall/photo/bank01.png" alt="" /></a>
                                <a href="#"><img src="/images/mall/photo/bank02.png" alt="" /></a>
                                <a href="#"><img src="/images/mall/photo/bank03.png" alt="" /></a>
                                <a href="#"><img src="/images/mall/photo/bank04.png" alt="" /></a>
                                <a href="#"><img src="/images/mall/photo/bank05.png" alt="" /></a>
                                <a href="#"><img src="/images/mall/photo/bank06.png" alt="" /></a>
                                <a href="#"><img src="/images/mall/photo/bank07.png" alt="" /></a>
                                <a href="#"><img src="/images/mall/photo/bank08.png" alt="" /></a>
                                <a href="#"><img src="/images/mall/photo/bank09.png" alt="" /></a>
                                <a href="#"><img src="/images/mall/photo/bank10.png" alt="" /></a>
                                <a href="#"><img src="/images/mall/photo/bank11.png" alt="" /></a>
                                <a href="#"><img src="/images/mall/photo/bank12.png" alt="" /></a>
                            
                            </div>
                            
                            <p>您还可以使用以下支付平台进行在线支付及帐户余额付款：<a href="#"><img src="/images/mall/photo/bank13.png" alt="" /></a> <a href="#"><img src="/images/mall/photo/bank14.png" alt="" /></a></p>
                        
                        </div>
                        
                        <div class="msgbox">
                        
                        	<p><b>来京东自提：</b>我们在以下省市开通了自提点(其他城市正陆续开通),您可就近选择自提点当面付款提货，无需支付运费，点击城市名可查看详细地点及公交线路：</p>
                            <p class="city">
                            	<a href="#">北京</a>
                                <a href="#">上海</a>
                                <a href="#">广州</a>
                                <a href="#">广东（不含广州）</a>
                                <a href="#">天津</a>
                                <a href="#">杭州</a>
                                <a href="#">山东</a>
                                <a href="#">厦门</a>
                                <a href="#">武汉</a>
                                <a href="#">成都</a>
                                <a href="#">深州</a>
                                <a href="#">西安</a>
                                <a href="#">宁波</a>
                                <a href="#">东莞</a>
                                <a href="#">沈阳</a>
                                <a href="#">福州</a>
                                <a href="#">北京</a>
                                <a href="#">上海</a>
                                <a href="#">广州</a>
                                <a href="#">重庆</a>
                                <a href="#">天津</a>
                                <a href="#">杭州</a>
                                <a href="#">山东</a>
                                <a href="#">厦门</a>
                                <a href="#">武汉</a>
                                <a href="#">成都</a>
                                <a href="#">深州</a>
                                <a href="#">西安</a>
                                <a href="#">宁波</a>
                                <a href="#">东莞</a>
                                <a href="#">沈阳</a>
                                <a href="#">福州</a>
                                <a href="#">杭州</a>
                                <a href="#">山东</a>
                                <a href="#">厦门</a>
                                <a href="#">武汉</a>
                                <a href="#">成都</a>
                                <a href="#">深州</a>
                                <a href="#">西安</a>
                                <a href="#">宁波</a>
                                <a href="#">东莞</a>
                                <a href="#">沈阳</a>
                                <a href="#">福州</a>
                            </p>
                            <p><b>分期付款：</b>单个商品价格在500元以上，可使用中国银行、招商银行发行的信用卡申请分期付款，支付3期、6期、12期付款，<a href="#">查看详细说明&gt;&gt;</a></p>
                        	<p><b>公司转帐：</b>您可以向京东公司的三个公司帐户汇款，到帐时间一般为款汇出后的1-5个工作日，<a href="#">查看公司帐户&gt;&gt;</a></p>
                            <p><b>邮局汇款：</b>您可通过邮局向京东商城付款，到帐时间一般为款汇出后的1-5个工作日，<a href="#">查看汇款地址&gt;&gt;</a></p>
                        
                        </div>
                    
                    </div>
                
                </div>
                
                
                <div class="detailbox rows">
                
                	<ul class="tab">
                    
                    	<li><a href="#">商品详情</a></li>
                        <li><a href="#">商品咨询</a></li>
                        <li><a href="#">购买记录</a></li>
                        <li><a href="#">支付方式</a></li>
                        <li class="current"><a href="#">售后服务</a></li>
                    
                    </ul>
                    
                    <div class="service_content">
                    
                    	<div class="msgbox">
                        
                        	<h5>货到付款：</h5>
                            <p>本产品全国联保，享受三包服务，质保期为：一年质保</p>
                            <p>如因质量问题或故障，凭厂商维修中心或特约维修点的质量检测证明，享受7日内退货，15日内换货，15日以上在质保期内享受免费保修等三包服务！</p>
                            <p>您可以查询本品牌在各地售后服务中心的联系方式，<a href="#">请点这儿查询.....</a></p>
                            <p>售后服务电话：800-810-8888</p>
                            <p>品牌官方网站：<a href="#">http://www.lenovo.com.cn/</a></p>
                        
                        </div>
                        
                        <div class="msgbox">
                        
                        	<h5>品上承诺：</h5>
                            <p>品上丰100向您保证所售商品均为正品，保证假一赔三，与您亲临商城选购的商品享受相同的质量保证．</p>
                            <p>品上丰100还为您提供具有竞争力的商品价格和奖励政策，请您放心购买！</p><br />
                            <p>注：因厂家会在没有任何提前通知的情况下更改产品包装、产地或者一些附件，本司不能确保客户收到的货物与商城图片、产地、附件说明完全一致．只能确保为正品正货！并且保证与当时市场上同样主流新品一致．若本商城没有及时更新，请大家谅解！</p>
                        
                        </div>
                        
                        <div class="msgbox">
                        
                        	<h5>特别说明：</h5>
                            <p>品上丰100所有商品信息、客户评价、商品咨询、网友评论等内容，是品上丰100重要的经营资源，未经许可，禁止非法转载使用</p>
                        
                        </div>
                    
                    </div>
                
                </div>
                
            
            </div>
        
        </div>
    
    </div>
    
    
    <!--品上商城购物车购买-->
    <div id="mall_header" style="border-top:1px #000 solid">
    
    	<div class="top">
        
            <a id="logo" href="#"><img src="/images/mall/logo.png" alt="" /></a>
            <a href="#"><img src="/images/mall/photo/banner_big1.png" alt="" /></a>
            
        </div>
    
    </div>
    
    <div id="main">
    
    	<div class="mall_assess_box rows">
        
        	<div class="prompt_header">
            
            	<h3>挑选您认为对你此次购买有帮助的<a href="#">秀场</a>、<a href="#">体验</a>或<a href="#">指南</a><em></em></h3>
                <a href="#">太麻烦　直接跳过　&gt;&gt;</a>
            
            </div>
            
            <div class="mall_assess_content">
            
            	<div class="mall_assess_left">
                
                	<h3>商品信息</h3>
                    <div class="img"><a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a></div>
                    <dl>
                    
                        <dt><b>商品名称：</b><span><a href="#">Aokang/奥康罗马风情时尚简约披跟一字扣凉鞋</a></span></dt>
                        <dd><b>品上价：</b><strong>399.00</strong></dd>
                    
                    </dl>
                
                </div>
                
                <div class="mall_assess_right">
                
                	<!--交互，可做参考-->
                	<script type="text/javascript">
					
						$(document).ready(function(){
							
							var arr = ['.mall_assess_right .show_list',
							'.mall_assess_right .exp_list',
							'.mall_assess_right .post_list'];
							
							$.each(arr,function(i,obj){
								var li = $(obj).find('li');
								
								li.click(function(){
									
									var index = li.index($(this));
									li.removeClass('current');
									li.find('input').attr('checked','false');
									
									li.eq(index).addClass('current');
									li.eq(index).find('input').attr('checked','true');
								});
							});
														
						});
					
					</script>
                    <!--交互，可做参考-->
                
                	<div class="mall_list_box">
                        
                        <div class="mall_assess_header">秀场</div>
                        <ul class="show_list">
                            
                            <li class="current">
                            
                                <div class="ok"></div>
                                <dl>
                                
                                    <dt><a href="#"><img src="/images/mall/photo/photo02.png" alt="" /></a></dt>
                                    <dd>
                                    
                                        <div class="avatar"><a href="#"><img src="/images/mall/photo/photo03.png" alt="" /></a></div>
                                        <p><a href="#">花儿多朵朵八强,甜美风达人</a></p>
                                    
                                    </dd>
                                
                                </dl>
                                <div class="radio"><input name="s" type="radio" checked/></div>
                            
                            </li>
                            <li>
                            
                            	<div class="ok"></div>
                                <dl>
                                
                                    <dt><a href="#"><img src="/images/mall/photo/photo02.png" alt="" /></a></dt>
                                    <dd>
                                    
                                        <div class="avatar"><a href="#"><img src="/images/mall/photo/photo03.png" alt="" /></a></div>
                                        <p><a href="#">花儿多朵朵八强,甜美风达人</a></p>
                                    
                                    </dd>
                                
                                </dl>
                                <div class="radio"><input name="s" type="radio" /></div>
                            
                            </li>
                            <li>
                            
                            	<div class="ok"></div>
                                <dl>
                                
                                    <dt><a href="#"><img src="/images/mall/photo/photo02.png" alt="" /></a></dt>
                                    <dd>
                                    
                                        <div class="avatar"><a href="#"><img src="/images/mall/photo/photo03.png" alt="" /></a></div>
                                        <p><a href="#">花儿多朵朵八强,甜美风达人</a></p>
                                    
                                    </dd>
                                
                                </dl>
                                <div class="radio"><input name="s" type="radio" /></div>
                            
                            </li>
                            <li>
                            
                            	<div class="ok"></div>
                                <dl>
                                
                                    <dt><a href="#"><img src="/images/mall/photo/photo02.png" alt="" /></a></dt>
                                    <dd>
                                    
                                        <div class="avatar"><a href="#"><img src="/images/mall/photo/photo03.png" alt="" /></a></div>
                                        <p><a href="#">花儿多朵朵八强,甜美风达人</a></p>
                                    
                                    </dd>
                                
                                </dl>
                                <div class="radio"><input name="s" type="radio" /></div>
                            
                            </li>
                        
                        </ul>
                    
                    </div>
                    
                    <div class="exp_list_box">
                    
                    	<div class="mall_assess_header">体验</div>
                        <ul class="exp_list">
                        
                        	<li class="current">
                            
                            	<div class="ok"></div>
                            	<dl>
                                
                                	<dt><a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a></dt>
                                    <dd><a href="#">此次发放的礼品卡为达人店铺专用卡，需在达人店铺中购买产品才能使用，但不限只在我的小......</a></dd>
                                
                                </dl>
                                <div class="radio"><input name="e" type="radio" checked/></div>
                            
                            </li>
                            
                            <li>
                            
                            	<div class="ok"></div>
                            	<dl>
                                
                                	<dt><a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a></dt>
                                    <dd><a href="#">此次发放的礼品卡为达人店铺专用卡，需在达人店铺中购买产品才能使用，但不限只在我的小......</a></dd>
                                
                                </dl>
                                <div class="radio"><input name="e" type="radio" /></div>
                            
                            </li>
                            
                            <li>
                            
                            	<div class="ok"></div>
                            	<dl>
                                
                                	<dt><a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a></dt>
                                    <dd><a href="#">此次发放的礼品卡为达人店铺专用卡，需在达人店铺中购买产品才能使用，但不限只在我的小......</a></dd>
                                
                                </dl>
                                <div class="radio"><input name="e" type="radio" /></div>
                            
                            </li>
                            
                            <li>
                            
                            	<div class="ok"></div>
                            	<dl>
                                
                                	<dt><a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a></dt>
                                    <dd><a href="#">此次发放的礼品卡为达人店铺专用卡，需在达人店铺中购买产品才能使用，但不限只在我的小......</a></dd>
                                
                                </dl>
                                <div class="radio"><input name="e" type="radio" /></div>
                            
                            </li>
                        
                        </ul>
                    
                    </div>
                    
                    
                    <div class="mall_list_box">
                        
                        <div class="mall_assess_header">指南</div>
                        <ul class="post_list">
                            
                            <li class="current">
                            
                            	<div class="ok"></div>
                                
                                <dl class="post_item">
                                    
                                    <dt class="post_left"><a href="#"><img src="/images/mall/photo/photo02.png" alt="" /></a></dt>
                                    
                                    <dd class="post_main">
                                    
                                        <div class="post_header">
                                            <div class="post_displayName">
                                                <a href="#">阿朗</a>
                                            </div>
                                            <div class="post_title">
                                                <a href="#">真丝围巾的八种用法</a>
                                            </div>
                                            <div class="post_type"><a href="#">(鞋帽/女装)</a></div>
                                        </div>
                                        <div class="post_content01">
                                            此次发放的礼品卡为达人店铺专用卡，需在达人店铺中购买产品才能使用，但不限只在我的小店购买哦！此次发放...... &nbsp; <a href="#">查看全部</a>
                                        </div>
                                    
                                    </dd>
                                        
                                </dl>
                                <div class="radio"><input name="g" type="radio" checked/></div>
                            
                            </li>
                            
                            <li>
                            
                            	<div class="ok"></div>
                            
                                <dl class="post_item">
                                    
                                    <dt class="post_left"><a href="#"><img src="/images/mall/photo/photo02.png" alt="" /></a></dt>
                                    
                                    <dd class="post_main">
                                    
                                        <div class="post_header">
                                            <div class="post_displayName">
                                                <a href="#">阿朗</a>
                                            </div>
                                            <div class="post_title">
                                                <a href="#">真丝围巾的八种用法</a>
                                            </div>
                                            <div class="post_type"><a href="#">(鞋帽/女装)</a></div>
                                        </div>
                                        <div class="post_content01">
                                            此次发放的礼品卡为达人店铺专用卡，需在达人店铺中购买产品才能使用，但不限只在我的小店购买哦！此次发放...... &nbsp; <a href="#">查看全部</a>
                                        </div>
                                    
                                    </dd>
                                    
                                </dl>
                                <div class="radio"><input name="g" type="radio" /></div>
                            
                            </li>
                        
                        </ul>
                    
                    </div>
                    
                    
                
                </div>
            
            </div>
            
            <div class="mall_assess_bottom">
            
            	<a class="button" href="#"></a>
                <a href="#">太麻烦　直接跳过　&gt;&gt;</a>
            
            </div>
        
        </div>
    
    </div>
    
    <!--品上商城购物车购买-->
    
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
        <h3>我爱团购 我来组团</h3>
    
    </div>
    
    <ul class="group_process">
    
    	<li class="current"><em class="info"></em></li>
        <li><em class="avatar"></em></li>
        <li><em class="share"></em></li>
    
    </ul>
    
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
        
        	<div class="prompt_info">
            
            	<p><b>提醒：</b>组织品友团，不但可以团便宜，还可以挣人气。</p>
                <p class="prompt_info_bottom">
                
                	品友团，你今天　<b>团了没有？</b>
                
                </p>
            
            </div>
            
            <a class="next_button" href="#"></a>
        
        </div>
    
    </div>

</div>


<div class="group_dialog" style="border:1px #f00 solid;background:#fff;width:487px">

	<div class="layerTop_grad_orange">
    	
        <a class="close" href="#"></a>
        <h3>我爱团购 我来组团</h3>
    
    </div>
    
    <ul class="group_process">
    
    	<li><em class="info"></em></li>
        <li class="current"><em class="avatar"></em></li>
        <li><em class="share"></em></li>
    
    </ul>
    <div class="group_avatar">
    
    	<div class="btns"><a class="uploadbtn" href="#"></a></div>
    
    	<div class="container">
            <div class="avatar_editor">
            
                <div class="avatarbox"></div>
                <div class="avatar_actions">
                
                    <a class="left_btn" href="#"><em></em>左转</a><a class="right_btn" href="#"><em></em>右转</a>
                
                </div>
            
            </div>
            <div class="avatar_result">
            
            	<div class="avatarbox"></div>
                <p><b>大尺寸头像</b>，180*180像素</p>
                <p class="prompt">(图像均为系统自动生成)</p>
            
            </div>
        </div>
        
        <div class="bottom">
        
        	<a class="next_button" href="#"></a>
        
        </div>
    
    </div>

</div>


<div class="group_dialog" style="border:1px #f00 solid;background:#fff;width:487px">

	<div class="layerTop_grad_orange">
    	
        <a class="close" href="#"></a>
        <h3>我爱团购 我来组团</h3>
    
    </div>
    
    <ul class="group_process">
    
    	<li><em class="info"></em></li>
        <li><em class="avatar"></em></li>
        <li class="current"><em class="share"></em></li>
    
    </ul>
    
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
        <dl class="share_list">
        
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
        <div class="bottom"><a class="ok_button" href="#"></a></div>
    
    </div>

</div>

<div class="mall_dialog" style="width:411px">

	<div class="layerTop_round"><div class="layerTop_title"><div>
    
    	<a class="close" href="#"></a>
    	<h3>加入购物车</h3>
    
    </div></div></div>

	<div class="mall_body">
    
    	<div class="buy_add_box">
        
        	<h2><em></em>已成功加入购物车!</h2>
            <div class="btns">
            
            	<a class="continue_button" href="#"></a><a class="view_button" href="#"></a><a class="pay_button" href="#"></a>
            
            </div>
        
        </div>
    
    </div>

</div>

<div class="mall_tab_dialog">

	<ul class="tab">
    
    	<li class="current"><a class="shop_info" href="#"></a></li>
        <li><a class="shop_intro" href="#"></a></li>
        <li><a class="show" href="#"></a></li>
        <li><a class="exp" href="#"></a></li>
        <li><a class="guide" href="#"></a></li>
    
    </ul>
    
    <div class="shop_buyer">
    
    	<a class="close" href="#"></a>
    
        <div class="property"><div class="property_wrap">
        
        	<h1><a href="#">热情撞色宽纹珠地短抽POLO(男款) 碧绿色宽条纹</a></h1>
            <div class="meta">
                <p>品 &nbsp;&nbsp; 牌：Victorinox 维氐　<a class="brand_icon" href="#"><img src="/images/mall/photo/logo13.png" alt="" /></a> <a class="brand" href="#">关注该品牌</a></p>
                <div class="meta_img">
                	<dl class="share_info">
                        <dt><img src="/images/mall/default/temp/xiangjin.png" alt="" /></dt>
                        <dd>
                            <p>累计<span>享金</span><b class="share_price">1000.00</b></p>
                            <p><a href="#">如何获得享金</a></p>
                        </dd>
                    </dl>
                    <p>商品编号：0048654</p>
                    <p class="psf_price">
                    	拍　档　价：<b>￥10000.00</b> <strong><em class="down"></em>10.00</strong>
                    </p>
                    <p class="price">
                        <span>市场价：￥10000.00</span>
                        <span>享金额：<b>10.00</b></span>
                    </p>
                    <p class="comment">
                        <span>商品评分：</span>
                        <span class="icons">
                            <em></em><em></em><em></em><em class="no"></em><em class="no"></em>
                        </span>
                        <a href="#">(已经有24人体验)</a>
                    </p>
                </div>
            </div>
            
            <div class="key">
            
                <dl class="colorbox">
                    <dt>颜色：<b>灰色</b></dt>
                    <dd>
                    
                    	<a class="more_btn" href="javascript:void(0)"></a>
                        <ul>
                            <li>
                                <a class="current" href="#">
                                    <span></span>
                                    <img src="/images/mall/buy/color/1.png" alt="" />
                                </a>
                            </li>
                            
                            <li>
                                <a href="#">
                                    <span></span>
                                    <img src="/images/mall/buy/color/1.png" alt="" />
                                </a>
                            </li>
                            
                            <li>
                                <a href="#">
                                    <span></span>
                                    <img src="/images/mall/buy/color/1.png" alt="" />
                                </a>
                            </li>
                            
                            <li>
                                <a href="#">
                                    <span></span>
                                    <img src="/images/mall/buy/color/1.png" alt="" />
                                </a>
                            </li>
                            
                            <li>
                                <a href="#">
                                    <span></span>
                                    <img src="/images/mall/buy/color/1.png" alt="" />
                                </a>
                            </li>
                            
                            <li>
                                <a href="#">
                                    <span></span>
                                    <img src="/images/mall/buy/color/1.png" alt="" />
                                </a>
                            </li>
                            
                            <li>
                                <a href="#">
                                    <span></span>
                                    <img src="/images/mall/buy/color/1.png" alt="" />
                                </a>
                            </li>
                            
                            <li>
                                <a href="#">
                                    <span></span>
                                    <img src="/images/mall/buy/color/1.png" alt="" />
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span></span>
                                    <img src="/images/mall/buy/color/1.png" alt="" />
                                </a>
                            </li>
                            
                        </ul>
                    </dd>
                </dl>
                
                <dl class="sizebox">
                    <dt>尺码：<b>未选择</b></dt>
                    <dd>
                    	<a class="more_btn" href="javascript:void(0)"></a>
                        <ul>
                            <li>
                                <a class="current" href="#">
                                    <span></span>M
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span></span>L
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span></span>XL
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span></span>XXL
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span></span>L
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span></span>XL
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span></span>XXL
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span></span>L
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span></span>XL
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span></span>XXL
                                </a>
                            </li>
                        </ul>
                    </dd>
                </dl>
                
                <dl class="actions">
                    <dt>我要买：</dt>
                    <dd>
                        <div class="amount">
                            <div class="numInput">
                                <a class="minus" href="javascript:void(0)">-</a><input value="640" name="pcount_306"><a class="add" href="#">+</a>
                            </div>
                            <div class="info">
                                <p><span class="color">颜色：灰色</span>　<span class="size">尺码：未选择</span></p>
                                <p class="price">小计：<b>￥340.00</b></p>
                            </div>                                        
                        </div>
                    </dd>
                </dl>
                
                <div class="btn_buy">
                   
                   	<a href="#" class="like"></a>
                    <a class="partner_add" href="#"></a>
                   
                </div>
            </div>
            
        
        </div></div>
        
        <div class="ver_gallery">
                    
            <div class="thumbbox">
            
            	<a class="prev" href="#"><em></em></a>
                <div class="thumb">
                
                	<ul>
                        <li class="current"><a href="#"><img src="/images/mall/buy/small/1.jpg" alt="" /></a></li>
                        <li><a href="#"><img src="/images/mall/buy/small/2.jpg" alt="" /></a></li>
                        <li><a href="#"><img src="/images/mall/buy/small/3.jpg" alt="" /></a></li>
                        <li><a href="#"><img src="/images/mall/buy/small/4.jpg" alt="" /></a></li>
                        <li><a href="#"><img src="/images/mall/buy/small/2.jpg" alt="" /></a></li>
                        <li><a href="#"><img src="/images/mall/buy/small/3.jpg" alt="" /></a></li>
                        <li><a href="#"><img src="/images/mall/buy/small/4.jpg" alt="" /></a></li>
                    </ul>
                
                </div>
                <a class="next" href="#"><em></em></a>
            
            </div>
            <div class="right">        
            	<div class="img"><img src="/images/mall/buy/mid/1.jpg" alt="" /></div>
                <div class="info">
                
                	<dl>
                    
                    	<dt>库存情况：</dt>
                        <dd>送至　北京　最近库房有货</dd>
                    	
                    </dl>
                    <dl>
                    
                    	<dt>运费说明：</dt>
                        <dd>全国不限区域，快递与EMS均为15元．</dd>
                    	
                    </dl>
                    <dl class="buy_select">
                        <dt>支付方式：</dt>
                        <dd>
                        
                            <a href="#">货到付款</a> | <a href="#">在线支付</a> | <a href="#">邮政汇款</a> | <a href="#">礼品卡或虚拟帐户支付</a> | <a href="#">邮局网汇通汇款</a> | <a href="#">电话支付</a>
                        </dd>
                    </dl>
                
                </div>
            </div>
        
        </div>
        
                   	
    
    </div>

</div>

</body>
</html>