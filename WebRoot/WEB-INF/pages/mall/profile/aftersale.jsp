<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>品上商城我的品上页-退换货管理</title>
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
        
        	<a href="#">首页</a> &gt; <a href="#">我的品上</a>　&gt; <a href="#">我的商品咨询</a>
        
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
            	
               <div class="profile_search">
               
                  <a class="returned_btn" href="#"></a>
               
               </div>
               
               <div class="profile_returned">
               
               		<table class="shopcar" cellpadding="0">
                    
                    	<tr>
                            <th class="name" colspan="2">商品详情</th>
                            <th class="order">涉及订单</th>
                            <th class="price">金额</th>
                            <th class="returned_con">退换货理由</th>
                            <th class="status">业务状态</th>
                            <th class="time">申请时间</th>
                        </tr>
                        
                        <tr>
                        	<td class="img"><a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a></td>
                            <td class="name">Ankang/奥康罗马风情时尚简约坡跟一字扣凉鞋 <span>颜色分类：</span>白色 <span>尺码：</span>35</td>
                            <td class="order">1234512345678<br /><a href="#">(退货)</a></td>
                            <td class="price">20000.00</td>
                            <td class="returned_con">质量不好,请予以退换</td>
                            <td class="status">业务状态</td>
                            <td class="time">2011.11.10</td>
                        </tr>
                        <tr>
                        	<td class="img"><a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a></td>
                            <td class="name">Ankang/奥康罗马风情时尚简约坡跟一字扣凉鞋 <span>颜色分类：</span>白色 <span>尺码：</span>35</td>
                            <td class="order">1234512345678<br /><a href="#">(退货)</a></td>
                            <td class="price">20000.00</td>
                            <td class="returned_con">质量不好,请予以退换</td>
                            <td class="status">业务状态</td>
                            <td class="time">2011.11.10</td>
                        </tr>
                        <tr>
                        	<td class="img"><a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a></td>
                            <td class="name">Ankang/奥康罗马风情时尚简约坡跟一字扣凉鞋 <span>颜色分类：</span>白色 <span>尺码：</span>35</td>
                            <td class="order">1234512345678<br /><a href="#">(退货)</a></td>
                            <td class="price">20000.00</td>
                            <td class="returned_con">质量不好,请予以退换</td>
                            <td class="status">业务状态</td>
                            <td class="time">2011.11.10</td>
                        </tr>
                    
                    </table>
                    
                    <div class="returned_detail">
                    
                    	<h3>品上退换货规则：</h3>
                        <h5>1、品上丰100严格遵循国家《三包》法规，对所售商品属行退货和换货的义务．</h5>
                        <p>"七天无理由退换货"：不影响二次销售并符合下条件，自顾客收到商品起（以货品签收单上的签收日期为准）七日内可退货、15日内可换货（定制商品除外）；客户可以直接网上处理或联系客服热线办理退换货事宜，客服热线：<span>xxx-xxx-xxxx</span></p>
                        <h5>特别说明，以下情况不予办理退换货：</h5>
                        <p>(1).任何非品上丰100出售的商品（序列号不符）；</p>
                        <p>(2).任何已拆封、已使用商品，不予办理换货，但有质量问题除外；</p>
                        <p>(3).任何因非正常使用及保管导致出现质量问题的商品；</p>
                        <p>(4).过保商品（超过三包保修期的商品）；</p>
                        <p>(5).非承担三包的修理者（即非厂商指定或特约维修点）拆动造成损坏的；</p>
                        <p>(6).非产品本身质量问题，如：兼容性问题，对于颜色，外观，形状不满意等；</p>
                        <p>(7).商品的外包装破损（包括包裹填充物、品牌包装箱子或外包装袋、包装盒外直接缠胶带），商品附件、说明书、保修单、标签、吊牌、发票、赠品等有缺失；</p>
                        <p>(8).密封产品原包装打开（如一次性封贴或者胶条封箱被拆开）；</p>
                        <p>(9).对于存储类产品，我们无法提供数据导出服务；</p>
                        <h6>请尽可能在返修前导出数据．如果在产品出现质量问题之前，您未及时导出数据，为了数据安全和完整，建议您直接联系相关厂商的特约维修点进行确认．</h6>
                        <h5>3.在商品无任何问题情况下七日内可以退货，只要未使用不影响二次销售，都可以全额退货．品上丰100所售均为全新品，为保护消费者利益，以下情况视为影响二次销售：</h5>
                        <p>(1).奢多品、高值品原厂封签移位、撕毁；</p>
                        <p>(2).手机、相机、笔记本产品原厂包装打开或安装电池开机启动；</p>
                        <p>(3).密封产品原包装打开；</p>
                        <p>(4).产品通电、过水、插入卡槽等已使用．</p>
                    
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

</body>
</html>