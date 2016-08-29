<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>品上商城全部分类页-全部品牌</title>
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
        
        	<li><a href="#">全部商品分类</a></li>
            <li class="current"><a href="#">全部品牌</a></li>
        
        </ul>
        
        <div class="all_sort_box">
        
        	<div class="sort_menu">
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
            
            <div class="brand_list_box">
            
            	<h3 class="title">推荐品牌</h3>
                <ul>
                
                	<li>
                    
                    	<div class="logo_card_info">
                            <h6><a href="#">Dior/品牌故事</a></h6>
                            <div class="logo"><!-- logo品牌最大尺寸是124 x 84 -->
                                <img src="/images/mall/photo/logo10.png" alt="" />
                            </div>
                            <div class="bottom">
                            	<p>好友推荐：<span>1000</span></p>
                                <p>相关指南：<span>300</span></p>
                                <div><a class="like" href="#"><em></em>(300)</a></div>
                            </div>
                        </div>
                    
                    </li>
                    
                    <li>
                    
                    	<div class="logo_card_info">
                            <h6><a href="#">Dior/品牌故事</a></h6>
                            <div class="logo"><!-- logo品牌最大尺寸是124 x 84 -->
                                <img src="/images/mall/photo/logo10.png" alt="" />
                            </div>
                            <div class="bottom">
                            	<p>好友推荐：<span>1000</span></p>
                                <p>相关指南：<span>300</span></p>
                                <div><a class="like liked" href="#"><em></em>(300)</a></div>
                            </div>
                        </div>
                    
                    </li>
                    
                    <li>
                    
                    	<div class="logo_card_info">
                            <h6><a href="#">Dior/品牌故事</a></h6>
                            <div class="logo"><!-- logo品牌最大尺寸是124 x 84 -->
                                <img src="/images/mall/photo/logo10.png" alt="" />
                            </div>
                            <div class="bottom">
                            	<p>好友推荐：<span>1000</span></p>
                                <p>相关指南：<span>300</span></p>
                                <div><a class="like" href="#"><em></em>(300)</a></div>
                            </div>
                        </div>
                    
                    </li>
                    
                    <li>
                    
                    	<div class="logo_card_info">
                            <h6><a href="#">Dior/品牌故事</a></h6>
                            <div class="logo"><!-- logo品牌最大尺寸是124 x 84 -->
                                <img src="/images/mall/photo/logo10.png" alt="" />
                            </div>
                            <div class="bottom">
                            	<p>好友推荐：<span>1000</span></p>
                                <p>相关指南：<span>300</span></p>
                                <div><a class="like liked" href="#"><em></em>(300)</a></div>
                            </div>
                        </div>
                    
                    </li>
                    
                    <li>
                    
                    	<div class="logo_card_info">
                            <h6><a href="#">Dior/品牌故事</a></h6>
                            <div class="logo"><!-- logo品牌最大尺寸是124 x 84 -->
                                <img src="/images/mall/photo/logo10.png" alt="" />
                            </div>
                            <div class="bottom">
                            	<p>好友推荐：<span>1000</span></p>
                                <p>相关指南：<span>300</span></p>
                                <div><a class="like" href="#"><em></em>(300)</a></div>
                            </div>
                        </div>
                    
                    </li>
                    
                    <li>
                    
                    	<div class="logo_card_info">
                            <h6><a href="#">Dior/品牌故事</a></h6>
                            <div class="logo"><!-- logo品牌最大尺寸是124 x 84 -->
                                <img src="/images/mall/photo/logo10.png" alt="" />
                            </div>
                            <div class="bottom">
                            	<p>好友推荐：<span>1000</span></p>
                                <p>相关指南：<span>300</span></p>
                                <div><a class="like liked" href="#"><em></em>(300)</a></div>
                            </div>
                        </div>
                    
                    </li>
                    <li>
                    
                    	<div class="logo_card_info">
                            <h6><a href="#">Dior/品牌故事</a></h6>
                            <div class="logo"><!-- logo品牌最大尺寸是124 x 84 -->
                                <img src="/images/mall/photo/logo10.png" alt="" />
                            </div>
                            <div class="bottom">
                            	<p>好友推荐：<span>1000</span></p>
                                <p>相关指南：<span>300</span></p>
                                <div><a class="like" href="#"><em></em>(300)</a></div>
                            </div>
                        </div>
                    
                    </li>
                    
                    <li>
                    
                    	<div class="logo_card_info">
                            <h6><a href="#">Dior/品牌故事</a></h6>
                            <div class="logo"><!-- logo品牌最大尺寸是124 x 84 -->
                                <img src="/images/mall/photo/logo10.png" alt="" />
                            </div>
                            <div class="bottom">
                            	<p>好友推荐：<span>1000</span></p>
                                <p>相关指南：<span>300</span></p>
                                <div><a class="like liked" href="#"><em></em>(300)</a></div>
                            </div>
                        </div>
                    
                    </li>
                
                </ul>
            
            </div>
            
            <div class="brand_list_box">
            
            	<h3 class="title">其它品牌</h3>
                <ul>
                
                	<li>
                    
                    	<div class="logo_card_info">
                            <h6><a href="#">Dior/品牌故事</a></h6>
                            <div class="logo"><!-- logo品牌最大尺寸是124 x 84 -->
                                <img src="/images/mall/photo/logo10.png" alt="" />
                            </div>
                            <div class="bottom">
                            	<p>好友推荐：<span>1000</span></p>
                                <p>相关指南：<span>300</span></p>
                                <div><a class="like" href="#"><em></em>(300)</a></div>
                            </div>
                        </div>
                    
                    </li>
                    
                    <li>
                    
                    	<div class="logo_card_info">
                            <h6><a href="#">Dior/品牌故事</a></h6>
                            <div class="logo"><!-- logo品牌最大尺寸是124 x 84 -->
                                <img src="/images/mall/photo/logo10.png" alt="" />
                            </div>
                            <div class="bottom">
                            	<p>好友推荐：<span>1000</span></p>
                                <p>相关指南：<span>300</span></p>
                                <div><a class="like liked" href="#"><em></em>(300)</a></div>
                            </div>
                        </div>
                    
                    </li>
                    
                    <li>
                    
                    	<div class="logo_card_info">
                            <h6><a href="#">Dior/品牌故事</a></h6>
                            <div class="logo"><!-- logo品牌最大尺寸是124 x 84 -->
                                <img src="/images/mall/photo/logo10.png" alt="" />
                            </div>
                            <div class="bottom">
                            	<p>好友推荐：<span>1000</span></p>
                                <p>相关指南：<span>300</span></p>
                                <div><a class="like" href="#"><em></em>(300)</a></div>
                            </div>
                        </div>
                    
                    </li>
                    
                    <li>
                    
                    	<div class="logo_card_info">
                            <h6><a href="#">Dior/品牌故事</a></h6>
                            <div class="logo"><!-- logo品牌最大尺寸是124 x 84 -->
                                <img src="/images/mall/photo/logo10.png" alt="" />
                            </div>
                            <div class="bottom">
                            	<p>好友推荐：<span>1000</span></p>
                                <p>相关指南：<span>300</span></p>
                                <div><a class="like liked" href="#"><em></em>(300)</a></div>
                            </div>
                        </div>
                    
                    </li>
                    
                    <li>
                    
                    	<div class="logo_card_info">
                            <h6><a href="#">Dior/品牌故事</a></h6>
                            <div class="logo"><!-- logo品牌最大尺寸是124 x 84 -->
                                <img src="/images/mall/photo/logo10.png" alt="" />
                            </div>
                            <div class="bottom">
                            	<p>好友推荐：<span>1000</span></p>
                                <p>相关指南：<span>300</span></p>
                                <div><a class="like" href="#"><em></em>(300)</a></div>
                            </div>
                        </div>
                    
                    </li>
                    
                    <li>
                    
                    	<div class="logo_card_info">
                            <h6><a href="#">Dior/品牌故事</a></h6>
                            <div class="logo"><!-- logo品牌最大尺寸是124 x 84 -->
                                <img src="/images/mall/photo/logo10.png" alt="" />
                            </div>
                            <div class="bottom">
                            	<p>好友推荐：<span>1000</span></p>
                                <p>相关指南：<span>300</span></p>
                                <div><a class="like liked" href="#"><em></em>(300)</a></div>
                            </div>
                        </div>
                    
                    </li>
                    <li>
                    
                    	<div class="logo_card_info">
                            <h6><a href="#">Dior/品牌故事</a></h6>
                            <div class="logo"><!-- logo品牌最大尺寸是124 x 84 -->
                                <img src="/images/mall/photo/logo10.png" alt="" />
                            </div>
                            <div class="bottom">
                            	<p>好友推荐：<span>1000</span></p>
                                <p>相关指南：<span>300</span></p>
                                <div><a class="like" href="#"><em></em>(300)</a></div>
                            </div>
                        </div>
                    
                    </li>
                
                </ul>
            
            </div>
            
            <div class="psf_page">
                <span class="prev_next prev disabled"><em></em><i>上一页</i></span>
                <span class="current">1</span>
                <span class="prev_next next disabled"><i>下一页</i><em></em></span>
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