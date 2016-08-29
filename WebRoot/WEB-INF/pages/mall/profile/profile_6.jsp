<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>品上商城我的品上页-退换货－申请退换</title>
    <psf:header/>
	<link href="/css/mall.css" rel="stylesheet" type="text/css"/>
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
                    <input id="search" value="商品、品牌" />
                    <div class="select">
                        <a class="nowSelect" href="#"><i>综合</i><em></em></a>
                        <div class="selOption">
                            
                            <div><a href="#">综合</a></div>
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
        
        	<a href="#">首页</a> &gt; <a href="#">我的品上</a>　&gt; <a href="#">退换货管理</a>　&gt; <a href="#">申请退换货</a>
        
        </div>
        
        <div class="rows_content">
        
        	<div class="sidebar">
            
           		<div class="menu_side_box rows">
                
                	<div class="header"><h3>我的品上</h3></div>
                    <ul>
                    
                    	<li><a href="/profile/order">我的订单</a></li>
                        <li><a href="/profile/like">喜欢的商品</a></li>
                        <li class="current"><a href="/profile/aftersale">退换货管理</a></li>
                        <li><a href="/profile/ask">我的商品咨询</a></li>
                        <li><a href="/profile/complain">我的投诉</a></li>
                        <li><a href="#">我的财富</a></li>
                    
                    </ul>
                
                </div>
                
                <div class="shop_side_list_box rows">
                
                	<div class="header">
                
                        <h3>猜你喜欢的商品</h3>
                    
                    </div>
                
                	<ol>
                    
                    	<li>
                        
                        	<div class="img"><a href="#"><img alt="" src="/images/mall/photo/photo08.png" /></a></div>
                            <div class="info">
                            
                            	<p class="content"><span>19.2%</span> <a href="#"><span>购买</span>热情撞色宽纹珠地短抽POLO（男装）碧绿色宽条纹</a></p>
                                <p class="price">￥99.00</p>
                            
                            </div>
                        
                        </li>
                        
                        <li>
                        
                        	<div class="img"><a href="#"><img alt="" src="/images/mall/photo/photo08.png" /></a></div>
                            <div class="info">
                            
                            	<p class="content"><span>19.2%</span> <a href="#"><span>购买</span>热情撞色宽纹珠地短抽POLO（男装）碧绿色宽条纹</a></p>
                                <p class="price">￥99.00</p>
                            
                            </div>
                        
                        </li>
                        
                        <li>
                        
                        	<div class="img"><a href="#"><img alt="" src="/images/mall/photo/photo08.png" /></a></div>
                            <div class="info">
                            
                            	<p class="content"><span>19.2%</span> <a href="#"><span>购买</span>热情撞色宽纹珠地短抽POLO（男装）碧绿色宽条纹</a></p>
                                <p class="price">￥99.00</p>
                            
                            </div>
                        
                        </li>
                    
                    </ol>
                    
                    <p class="more"><a href="#">换一组</a></p>
                
                </div>
                
                <div class="shop_side_list_box rows">
                
                	<div class="header">
                
                        <h3>喜欢你购买商品的品友</h3>
                    
                    </div>
                
                	<ol class="list">
                		<li>
                        	<div class="img"><a href="#"><img alt="" src="/images/mall/photo/photo08.png" /></a></div>
                            <div class="status">
                            
                            	<h5><a href="#">胖达梨</a></h5>
                                <p>北京朝阳区</p>
                            	<p class="buttons">
                                
                                	<a class="addbtn02 addbtn02_ok" href="#"><em></em>好友</a>
                                    <a class="addbtn02 addbtn02_ok" href="#"><em></em>关注</a>
                                
                                </p>
                            
                            </div>
                            <p class="info">
                            
                            	<span>优秀<a href="#">(7)</a></span>
                                <span>体验<a href="#">(7)</a></span>
                                <span>指南<a href="#">(19)</a></span>
                            
                            </p>
                        </li>
                        
                        <li>
                        	<div class="img"><a href="#"><img alt="" src="/images/mall/photo/photo08.png" /></a></div>
                            <div class="status">
                            
                            	<h5><a href="#">胖达梨</a></h5>
                                <p>北京朝阳区</p>
                            	<p class="buttons">
                                
                                	<a class="addbtn02 addbtn02_ok" href="#"><em></em>好友</a>
                                    <a class="addbtn02 addbtn02_ok" href="#"><em></em>关注</a>
                                
                                </p>
                            
                            </div>
                            <p class="info">
                            
                            	<span>优秀<a href="#">(7)</a></span>
                                <span>体验<a href="#">(7)</a></span>
                                <span>指南<a href="#">(19)</a></span>
                            
                            </p>
                        </li>
                        
                        <li>
                        	<div class="img"><a href="#"><img alt="" src="/images/mall/photo/photo08.png" /></a></div>
                            <div class="status">
                            
                            	<h5><a href="#">胖达梨</a></h5>
                                <p>北京朝阳区</p>
                            	<p class="buttons">
                                
                                	<a class="addbtn02 addbtn02_ok" href="#"><em></em>好友</a>
                                    <a class="addbtn02 addbtn02_ok" href="#"><em></em>关注</a>
                                
                                </p>
                            
                            </div>
                            <p class="info">
                            
                            	<span>优秀<a href="#">(7)</a></span>
                                <span>体验<a href="#">(7)</a></span>
                                <span>指南<a href="#">(19)</a></span>
                            
                            </p>
                        </li>
                        
                    </ol>
                    <p class="more"><a href="#">上一组　下一组</a></p>
                
                </div>
            
            </div>
            <div class="r_content">
            	
                <div class="profile_returned">
                
                	<div class="profile_returned_box">
                    
                    	<div class="header"><h3>申请退换货</h3></div>
                    	<div class="returned_content">
                        
                            <dl>
                            
                                <dt>订单号：</dt>
                                <dd>
                                    <input class="input_order" value="1234512345678" />
                                    <a class="button" href="#">确定</a>
                                    <span class="msg">备注每次退换货只能选择一个订单号</span>
                                </dd>
                            
                            </dl>
                            
                            <dl class="aftersale">
                            
                                <dt>请选择您要退换的商品：</dt>
                                <dd>
                                
                                	<h6>一笔单据只能处理一个退换货商品，您可发起新单据处理其他商品的退换货问题</h6>
                                    <ul class="aftersale_selectbox">
                                    
                                    	<li>
                                            <div class="checkbox"><input type="checkbox" /></div>
                                            <div class="img"><a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a></div>
                                            <div class="info">
                                            	<a href="#">冲金冠阿迪达斯android专柜正品2011年10月冬天男针织长裤</a>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="checkbox"><input type="checkbox" /></div>
                                            <div class="img"><a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a></div>
                                            <div class="info">
                                            	<a href="#">冲金冠阿迪达斯android专柜正品2011年10月冬天男针织长裤</a>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="checkbox"><input type="checkbox" /></div>
                                            <div class="img"><a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a></div>
                                            <div class="info">
                                            	<a href="#">冲金冠阿迪达斯android专柜正品2011年10月冬天男针织长裤</a>
                                            </div>
                                        </li>
                                    
                                    </ul>
                                
                                </dd>
                            
                            </dl>
                            <dl>
                            
                            	<dt>退换货类型：</dt>
                                <dd>
                                
                                	<input class="radio" type="radio" /><label>退货</label>
                                    <input class="radio" type="radio" /><label>换货</label>
                                
                                </dd>
                            
                            </dl>
                            <dl class="aftersale_upload">
                            
                            	<dt>退换原因：</dt>
                                <dd class="aftersale_uploadbox">
                                
                                	<textarea></textarea>
                                    <div class="btns">
                                    
                                    	<a class="button" href="#">上传图片</a>
                                        <span class="msg">申请退换货时，出现质量或包装问题时，建议您拍照并上传图片，以方便我们审核，最多传5张图片</span>
                                    
                                    </div>
                                    <ul>
                                    
                                    	<li>
                                        
                                        	<div class="img"><a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a></div>
                                            <textarea>请为你的上传图片添加说明</textarea>
                                        
                                        </li>
                                        <li>
                                        
                                        	<div class="img"><a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a></div>
                                            <textarea>请为你的上传图片添加说明</textarea>
                                        
                                        </li>
                                    
                                    </ul>
                                
                                </dd>
                            
                            </dl>
                                
                        </div>
                        
                        <div class="returned_content">
                        
                        	<dl>
                            
                            	<dt></dt>
                                <dd>
                                
                                	<span class="msg">友情提醒：请仔细阅读您的信息，看是否一致，如有缺项的内容请及时补充，避免资金风险</span>
                                
                                </dd>
                            
                            </dl>
                            
                            <dl>
                            
                            	<dt>昵称：</dt>
                                <dd>melodi</dd>
                            
                            </dl>
                            <dl>
                            
                            	<dt>退款人姓名：</dt>
                                <dd>
                                
                                	<input class="input_name" value="梁广宇" />
                                    <span class="msg">备注：必须与您在线支付的卡一致</span>
                                
                                </dd>
                            
                            </dl>
                            <dl>
                            
                            	<dt>退款卡号：</dt>
                                <dd>
                                
                                	１２３４－３４５６－７８９０－２２
                                    <p class="msg">备注：为了您的资金安全，我们只支持资金原路返回，退款时间一般为1-2个工作日</p>
                                
                                </dd>
                            
                            </dl>
                            <dl>
                            
                            	<dt>证件号：</dt>
                                <dd>
                                
                                	<select>
                                    
                                    	<option>身份证号</option>
                                    
                                    </select>
                                    
                                    <input class="input_cert" value="440301197104114126" />
                                	
                                </dd>
                            
                            </dl>
                            <dl>
                            
                            	<dt>验证码：</dt>
                                <dd>
                                
                                	<input class="input_validate" />
                                    <img class="validateImg" src="/images/mall/validate.png" alt="" />
                                	
                                </dd>
                            
                            </dl>
                                
                        </div>
                        
                    </div>
                    
                    <div class="bottom"><a href="#"></a></div>
                
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