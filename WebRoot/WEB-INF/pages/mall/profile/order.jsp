<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>品上商城我的品上页</title>
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
        
        	<a href="#">首页</a> &gt; <a href="#">我的品上</a>　&gt; <a href="#">我的订单</a>
        
        </div>
        
        <div class="rows_content">
        
        	<div class="sidebar">
            
           		<div class="menu_side_box rows">
                
                	<div class="header"><h3>我的品上</h3></div>
                    <ul>
                    
                    	<li class="current"><a href="/profile/order">我的订单</a></li>
                        <li><a href="/profile/like">喜欢的商品</a></li>
                        <li><a href="/profile/aftersale">退换货管理</a></li>
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
            	
                 <div class="profile_search">
                 
                 	<select>
                    
                    	<option>近一个月订单</option>
                    
                    </select>
                    
                    <select>
                    
                    	<option>订单状态</option>
                    
                    </select>
                 
                 	<div class="searchbox">
                    	<a class="searchbtn" href="#"></a>
                        <div class="searchgroup">
                            <input id="search" />
                        </div>
                        <label>在您的订单里查找：</label>
                    </div>
                    
                 </div>
                 
              <div class="profile_order">
                 
               	 <div class="order_status">
                    
                    	<a href="#">未提交订单笔数：<b>2</b></a>
                        <a href="#">已完成订单笔数：<b>12</b></a>
                        <a href="#">已完成订单笔数：<b>5</b></a>
                        <a href="#">已完成订单笔数：<b>19</b></a>
                    
                 </div>
                    
                 <table class="profile_order_table" cellpadding="0">
                    
                   	 <colgroup>
                        
                         <col />
                         <col class="price" />
                         <col class="quantity" />
                         <col class="actions" />
                         <col class="pay_price" />
                         <col class="address" />
                         <col class="status" />
                        
                     </colgroup>
                        
                     <tbody>
                        
                       	 <tr class="thead">
                            
                           	 <th colspan="8">
                                
                               	 <span class="time">成交时间：2011-11-10 20：23</span>
                                 <div>
                                    
                                   	 <b>订单编号：1092390728962</b>
                                     <span>尚未提交体验，点击</span>
                                     <a href="#"><em></em>发布体验</a>
                                    
                                 </div>
                                
                               </th>
                            
                         </tr>
                        
                       	 <tr>
                            
                             <th>
                                
                               	 <a class="img"><img src="/images/mall/photo/photo01.png" alt="" /></a>
                                 <div class="desc">
                                    
                                   	 <h5><a href="#">冲金冠阿迪达斯android专柜正品2011年10月冬男针帜长裤</a></h5>
                                     <p>颜色分类：022504 服装尺码：2XL(成人)</p>
                                    
                                 </div>
                                
                             </th>
                             <td class="price"><span>266.00</span><p>(普通)</p></td>
                             <td class="quantity">1</td>
                             <td class="actions">
                                
                               	 <p><a class="show" href="#"><em></em>发布秀场</a></p>
                                 <p><a class="exp" href="#"><em></em>发布体验</a></p>
                                 <p><a class="order" href="#"><em></em>订单详情</a></p>
                                 <p><a class="buy" href="#"><em></em>继续购买</a></p>
                                
                             </td>
                             <td class="pay_price">
                                
                               	 <strong>280.00</strong>
                                 <p>(在线支付)</p>
                                
                             </td>
                             <td class="address">
                                
                               	 <span>梁先生</span>
                                 <p>中国北京朝阳区</p>
                                
                             </td>
                             <td class="status">
                                
                               	 <span class="success">交易成功</span>
                                 <p><a href="#">查看物流</a></p>
                                 <p><a href="#">申请退换货</a></p>
                                
                             </td>
                            
                         </tr>
                         <tr class="spe_row">
                            
                           	 <td></td>
                            
                         </tr>
                        
                     </tbody>
                        
                     <tbody>
                        
                       	 <tr class="thead">
                            
                           	 <th colspan="8">
                                
                               	 <span class="time">成交时间：2011-11-10 20：23</span>
                                 <div>
                                    
                                   	 <b>订单编号：1092390728962</b>
                                    
                                 </div>
                                
                               </th>
                            
                         </tr>
                        
                       	 <tr>
                            
                             <th>
                                
                               	 <a class="img"><img src="/images/mall/photo/photo01.png" alt="" /></a>
                                 <div class="desc">
                                    
                                   	 <h5><a href="#">冲金冠阿迪达斯android专柜正品2011年10月冬男针帜长裤</a></h5>
                                     <p>颜色分类：022504 服装尺码：2XL(成人)</p>
                                    
                                 </div>
                                
                             </th>
                             <td class="price"><span>266.00</span><p>(团购)</p></td>
                             <td class="quantity">1</td>
                             <td class="actions">

                                 <p><a class="order" href="#"><em></em>订单详情</a></p>
                                
                             </td>
                             <td class="pay_price">
                                
                               	 <strong>280.00</strong>
                                 <p>(在线支付)</p>
                                
                             </td>
                             <td class="address">
                                
                               	 <span>梁先生</span>
                                 <p>中国北京朝阳区</p>
                                
                             </td>
                             <td class="status">
                                
                               	 <span class="arrange">未提交</span>
                                 <p><a href="#">现在付款</a></p>
                                 <p><a href="#">取消订单</a></p>
                                 <p><a href="#">修改订单</a></p>
                                
                             </td>
                            
                         </tr>
                         <tr class="spe_row">
                            
                           	 <td></td>
                            
                         </tr>
                        
                     </tbody>
                        
                     <tbody>
                        
                       	 <tr class="thead">
                            
                           	 <th colspan="8">
                                
                               	 <span class="time">成交时间：2011-11-10 20：23</span>
                                 <div>
                                    
                                   	 <b>订单编号：1092390728962</b>
                                    
                                 </div>
                                
                               </th>
                            
                         </tr>
                        
                       	 <tr>
                            
                             <th>
                                
                               	 <a class="img"><img src="/images/mall/photo/photo01.png" alt="" /></a>
                                 <div class="desc">
                                    
                                   	 <h5><a href="#">冲金冠阿迪达斯android专柜正品2011年10月冬男针帜长裤</a></h5>
                                     <p>颜色分类：022504 服装尺码：2XL(成人)</p>
                                    
                                 </div>
                                
                             </th>
                             <td class="price"><span>266.00</span><p>(拼货)</p></td>
                             <td class="quantity">1</td>
                             <td class="actions">
                                
                                 <p><a class="order" href="#"><em></em>订单详情</a></p>
                                 <p><a class="buy" href="#"><em></em>继续购买</a></p>
                                
                             </td>
                             <td class="pay_price">
                                
                               	 <strong>280.00</strong>
                                 <p>(在线支付)</p>
                                
                             </td>
                             <td class="address">
                                
                               	 <span>梁先生</span>
                                 <p>中国北京朝阳区</p>
                                
                             </td>
                             <td class="status">
                                
                               	 <span class="close">交易关闭</span>
                                 <p><a href="#">删除订单</a></p>
                                
                             </td>
                            
                         </tr>
                         <tr class="spe_row">
                            
                           	 <td></td>
                            
                         </tr>
                        
                     </tbody>
                        
                     <tbody>
                        
                       	 <tr class="thead">
                            
                           	 <th colspan="8">
                                
                               	 <span class="time">成交时间：2011-11-10 20：23</span>
                                 <div>
                                    
                                   	 <b>订单编号：1092390728962</b>
                                    
                                 </div>
                                
                               </th>
                            
                         </tr>
                        
                       	 <tr>
                            
                             <th>
                                
                               	 <a class="img"><img src="/images/mall/photo/photo01.png" alt="" /></a>
                                 <div class="desc">
                                    
                                   	 <h5><a href="#">冲金冠阿迪达斯android专柜正品2011年10月冬男针帜长裤</a></h5>
                                     <p>颜色分类：022504 服装尺码：2XL(成人)</p>
                                    
                                 </div>
                                
                             </th>
                             <td class="price"><span>266.00</span><p>(普通)</p></td>
                             <td class="quantity">1</td>
                             <td class="actions">
                                
                               	 <p><a class="show" href="#"><em></em>发布秀场</a></p>
                                 <p><a class="exp" href="#"><em></em>发布体验</a></p>
                                 <p><a class="order" href="#"><em></em>订单详情</a></p>
                                 <p><a class="buy" href="#"><em></em>继续购买</a></p>
                                
                             </td>
                             <td rowspan="3" class="pay_price">
                                
                               	 <strong>280.00</strong>
                                 <p>(在线支付)</p>
                                
                             </td>
                             <td rowspan="3" class="address">
                                
                               	 <span>梁先生</span>
                                 <p>中国北京朝阳区</p>
                                
                             </td>
                             <td rowspan="3" class="status">
                                
                               	 <span class="success">交易成功</span>
                                 <p><a href="#">查看物流</a></p>
                                 <p><a href="#">申请退换货</a></p>
                                
                             </td>
                            
                         </tr>
                            
                         <tr>
                            
                             <th>
                                
                               	 <a class="img"><img src="/images/mall/photo/photo01.png" alt="" /></a>
                                 <div class="desc">
                                    
                                   	 <h5><a href="#">冲金冠阿迪达斯android专柜正品2011年10月冬男针帜长裤</a></h5>
                                     <p>颜色分类：022504 服装尺码：2XL(成人)</p>
                                    
                                 </div>
                                
                             </th>
                             <td class="price"><span>266.00</span><p>(团购)</p></td>
                             <td class="quantity">1</td>
                             <td class="actions">

                                 <p><a class="order" href="#"><em></em>订单详情</a></p>
                                
                             </td>
                         </tr>
                            
                         <tr>
                            
                             <th>
                                
                               	 <a class="img"><img src="/images/mall/photo/photo01.png" alt="" /></a>
                                 <div class="desc">
                                    
                                   	 <h5><a href="#">冲金冠阿迪达斯android专柜正品2011年10月冬男针帜长裤</a></h5>
                                     <p>颜色分类：022504 服装尺码：2XL(成人)</p>
                                    
                                 </div>
                                
                             </th>
                             <td class="price"><span>266.00</span><p>(拼货)</p></td>
                             <td class="quantity">1</td>
                             <td class="actions">
                                
                                 <p><a class="order" href="#"><em></em>订单详情</a></p>
                                 <p><a class="buy" href="#"><em></em>继续购买</a></p>
                                
                             </td>
                         </tr>
                            
                         <tr class="spe_row">
                            
                           	 <td></td>
                            
                         </tr>
                            
                        
                     	</tbody>
                    
                 	</table>
                 
                 	<div class="psf_page">
                        <span class="prev_next prev disabled"><em></em><i>上一页</i></span>
                        <span class="current">1</span>
                        <a onclick="javascript:loadPostList(-1,-1,-1,2);" href="#index_tab">2</a>
                        <a onclick="javascript:loadPostList(-1,-1,-1,3);" href="#index_tab">3</a>
                        <span class="dots">…</span>
                        <a onclick="javascript:loadPostList(-1,-1,-1,15);" href="#index_tab">15</a>
                        <a onclick="javascript:loadPostList(-1,-1,-1,2);" href="#index_tab" class="prev_next next"><i>下一页</i><em></em></a>
                    </div>
                 
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

<div style="border:1px #f00 solid;background:#fff;" class="profile_comment_dialog">

	<div class="layerTop_grad_orange">
    	
        <a href="#" class="close"></a>
        <h3>体验评价</h3>
    
    </div>
    
    <div class="post_list">
    
    	<div class="header"><em></em>触发您购买的相关信息</div>
        <div class="post_item">
            
            <dl class="post_left">
            
                <dt><a href="#"><img alt="" src="/images/mall/photo/photo02.png" /></a></dt>
                <dd>
                   
                   <p><a href="#" class="addbtn02 addbtn02_ok"><em></em>好友</a></p>
                   <p><a href="#" class="addbtn02 addbtn02_ok"><em></em>关注</a></p>
                   <!--<p><a href="#" class="addbtn02 addbtn02_ok">已关注</a></p>-->
                   
                </dd>
            
            </dl>
        
            <dl class="post_main">
            
            	<dt>
                	<a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a>
                </dt>
            	<dd>
                    <div class="post_header">
                    	<em class="post_postIcon icon_show"></em>
                        <div class="post_title">
                            <a href="#">我的包包</a>
                        </div>
                    </div>
                    <div class="post_content01">
                        此次发放的礼品卡为达人店铺专用卡，需在达人店铺中购买产品才能使用，但不限只在我的小店购买哦！此次发放...... &nbsp; <a href="#">查看全部</a>
                    </div>
                </dd>
            
        	</dl>
        
        </div>
        
        <div class="comment_btns">
        
        	<a class="ou_btn" href="#"><em></em><b>呕</b> 24</a>
            <a class="cai_btn" href="#"><em></em><b>踩</b> 1</a>
            <a class="ding_btn" href="#"><em></em><b>顶</b> 100</a>
            <a class="zan_btn" href="#"><em></em><b>赞</b> 30</a>
        
        </div>
        
        <div class="bottom"></div>
        
    
    </div>

</div>

</body>
</html>