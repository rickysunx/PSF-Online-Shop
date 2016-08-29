<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>品上商城品友团页</title>
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
                <li class="current"><a class="green" href="#">品友团</a></li>
                <li><a class="blue" href="#">全部分类</a></li>
            </ul>
        
        </div>
    
    </div>

    <div id="main">
    
    	<div class="rows_content rows">
        
        	<div class="sidebar">
            
            	<div class="sortlist">
            
                    <h3 class="header">全部品友团分类</h3>
                    <dl>
                    
                    	<dt><a href="#"><b>时尚女装</b>(14206)</a></dt>
                        <dt><a href="#"><b>品质男装</b>(14206)</a></dt>
                        <dt><a href="#"><b>美妆护装</b>(14206)</a></dt>
                        <dt><a href="#"><b>运动户外</b>(14206)</a></dt>
                        <dt><a href="#"><b>鞋帽箱包</b>(14206)</a></dt>
                        <dt><a href="#"><b>手机数码</b>(14206)</a></dt>
                        <dt><a href="#"><b>妈妈宝宝</b>(14206)</a></dt>
                        <dt><a href="#"><b>食品保健</b>(14206)</a></dt>
                        <dt><a href="#"><b>礼品配饰</b>(14206)</a></dt>
                        <dt><a href="#"><b>家居家具</b>(14206)</a></dt>
                    
                    </dl>
                
                </div>
            
            </div>
            <div class="r_content">
            
                <div class="slide_banner slide_big_banner">
                
                    <a href="#"><img src="/images/mall/photo/banner_big_big.png" alt="" /></a>
                
                </div>
                
            </div>
        
        </div>
        
        <div class="shop_list_box">
            
            <div class="rheader">
            
            	<div class="searchbox">
                    <div class="searchgroup">
                        <input id="search" value="秀场、圈子、活动" />
                    </div>
                    <a class="searchbtn" href="#"></a>
                </div>
                <div class="nav">
                
                	<a class="current" href="#">最新</a>
                    <a href="#">已经成团</a>
                    <a href="#">与我相关的</a>
                    <a href="#">有我认识的人</a>
                
                </div>
                <em class="mygroup"></em>
            
            </div>
            
            <dl class="nav_tab">
            
            	<dd class="current"><a href="#">全部</a></dd>
                <dt>|</dt>
                <dd><a href="#">时尚女装</a></dd>
                <dt>|</dt>
                <dd><a href="#">品质男装</a></dd>
                <dt>|</dt>
                <dd><a href="#">美妆护理</a></dd>
                <dt>|</dt>
                <dd><a href="#">运动户外</a></dd>
                <dt>|</dt>
                <dd><a href="#">鞋帽箱包</a></dd>
                <dt>|</dt>
                <dd><a href="#">手机数码</a></dd>
                <dt>|</dt>
                <dd><a href="#">妈妈宝宝</a></dd>
                <dt>|</dt>
                <dd><a href="#">食品保健</a></dd>
                <dt>|</dt>
                <dd><a href="#">礼品配饰</a></dd>
                <dt>|</dt>
                <dd><a href="#">家居家具</a></dd>
            
            </dl>
            
            <script type="text/javascript">
			
				$(document).ready(function(){
			
					var s = $(".group_piclist").find(".group_detail");
					s.each(function(){
						 $(this).mouseenter(function(){
		
							$(this).addClass('hover');
						}).mouseleave(function(){
							$(this).removeClass('hover');
						});
					});
					
				});
			
			</script>
            
            <ul class="group_piclist">
            
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
                                    
                                    <div class="mygroupbox">
                                    
                                    	<div class="group_status">
                                            <dl>
                                            
                                                <dt><a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a></dt>
                                                <dd><a href="#">日立2.5寸500G移动硬盘坚固耐久便于使用</a></dd>
                                            
                                            </dl>
                                            <a class="group_price" href="#">￥20000</a>
                                            <div class="info">
                                            
                                            	<p class="price">品上价<em class="up"></em>15.00</p>
                                                <p class="name">五人团</p>
                                                <p class="time"><b>剩余时间：</b>07小时58分钟48秒</p>
                                                <i class="success"></i>
                                            
                                            </div>
                                            
                                        </div>
                                        <div class="group_des">
                                            全国今日团购：顺市直降！仅2899元，即享原价3099元的富士通LH531 14.1英寸笔记本电脑活力红！本次团购仅限500台优惠，机会难得！
                                        </div>
                                        <div class="group_detail">
                                        
                                        	<div class="left">
                                            
                                            	<h3>团信息</h3>
                                                <dl>
                                                
                                                	<dt>
                                                    	<a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a>
                                                    </dt>
                                                    <dd>
                                                    
                                                    	<h3><a href="#">南瓜团</a></h3>
                                                        <p>已参加15人</p>
                                                        <p>还缺<b>5人</b></p>
                                                    
                                                    </dd>
                                                
                                                </dl>
                                            
                                            </div>
                                            <div class="right">
                                            
                                            	<h3>团主</h3>
                                                <dl>
                                                
                                                	<dt>
                                                    	<a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a>
                                                    </dt>
                                                    <dd>
                                                    
                                                    	<h3><a href="#">melodi</a></h3>
                                                        <a href="#" class="addbtn02 addbtn02_ok"><em></em>好友</a>
                                                        <a href="#" class="addbtn02 addbtn02_ok"><em></em>关注</a>
                                                    
                                                    </dd>
                                                
                                                </dl>
                                                <a class="set_group_btn" href="#"><em></em>修改团信息</a>
                                            
                                            </div>
                                            
                                            <dl class="group_friends">
                                        
                                                <dt><b>10</b>个品友已经购买</dt>
                                                <dd>
                                                
                                                    <a href="#"><img alt="" src="/images/mall/photo/photo12.png"></a>
                                                    <a href="#"><img alt="" src="/images/mall/photo/photo13.png"></a>
                                                    <a href="#"><img alt="" src="/images/mall/photo/photo14.png"></a>
                                                    <a href="#"><img alt="" src="/images/mall/photo/photo12.png"></a>
                                                    <a href="#"><img alt="" src="/images/mall/photo/photo13.png"></a>
                                                    <a href="#"><img alt="" src="/images/mall/photo/photo14.png"></a>
                                                
                                                </dd>
                                            
                                            </dl>
                                        
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
                                    
                                    <div class="mygroupbox">
                                    
                                    	<div class="group_status">
                                            <dl>
                                            
                                                <dt><a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a></dt>
                                                <dd><a href="#">日立2.5寸500G移动硬盘坚固耐久便于使用</a></dd>
                                            
                                            </dl>
                                            <a class="group_price" href="#">￥20000</a>
                                            <div class="info">
                                            
                                            	<p class="price">品上价<em class="up"></em>15.00</p>
                                                <p class="name">五人团</p>
                                                <p class="time"><b>剩余时间：</b>07小时58分钟48秒</p>
                                                <i class="success"></i>
                                            
                                            </div>
                                            
                                        </div>
                                        <div class="group_des">
                                            全国今日团购：顺市直降！仅2899元，即享原价3099元的富士通LH531 14.1英寸笔记本电脑活力红！本次团购仅限500台优惠，机会难得！
                                        </div>
                                        <div class="group_detail">
                                        
                                        	<div class="left">
                                            
                                            	<h3>团信息</h3>
                                                <dl>
                                                
                                                	<dt>
                                                    	<a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a>
                                                    </dt>
                                                    <dd>
                                                    
                                                    	<h3><a href="#">南瓜团</a></h3>
                                                        <p>已参加15人</p>
                                                        <p>还缺<b>5人</b></p>
                                                    
                                                    </dd>
                                                
                                                </dl>
                                            
                                            </div>
                                            <div class="right">
                                            
                                            	<h3>团主</h3>
                                                <dl>
                                                
                                                	<dt>
                                                    	<a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a>
                                                    </dt>
                                                    <dd>
                                                    
                                                    	<h3><a href="#">melodi</a></h3>
                                                        <a href="#" class="addbtn02 addbtn02_ok"><em></em>好友</a>
                                                        <a href="#" class="addbtn02 addbtn02_ok"><em></em>关注</a>
                                                    
                                                    </dd>
                                                
                                                </dl>
                                                <a class="set_group_btn" href="#"><em></em>修改团信息</a>
                                            
                                            </div>
                                            
                                            <dl class="group_friends">
                                        
                                                <dt><b>10</b>个品友已经购买</dt>
                                                <dd>
                                                
                                                    <a href="#"><img alt="" src="/images/mall/photo/photo12.png"></a>
                                                    <a href="#"><img alt="" src="/images/mall/photo/photo13.png"></a>
                                                    <a href="#"><img alt="" src="/images/mall/photo/photo14.png"></a>
                                                    <a href="#"><img alt="" src="/images/mall/photo/photo12.png"></a>
                                                    <a href="#"><img alt="" src="/images/mall/photo/photo13.png"></a>
                                                    <a href="#"><img alt="" src="/images/mall/photo/photo14.png"></a>
                                                
                                                </dd>
                                            
                                            </dl>
                                        
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
                                    
                                    <div class="mygroupbox">
                                    
                                    	<div class="group_status">
                                            <dl>
                                            
                                                <dt><a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a></dt>
                                                <dd><a href="#">日立2.5寸500G移动硬盘坚固耐久便于使用</a></dd>
                                            
                                            </dl>
                                            <a class="group_price" href="#">￥20000</a>
                                            <div class="info">
                                            
                                            	<p class="price">品上价<em class="up"></em>15.00</p>
                                                <p class="name">五人团</p>
                                                <p class="time"><b>剩余时间：</b>07小时58分钟48秒</p>
                                                <i class="success"></i>
                                            
                                            </div>
                                            
                                        </div>
                                        <div class="group_des">
                                            全国今日团购：顺市直降！仅2899元，即享原价3099元的富士通LH531 14.1英寸笔记本电脑活力红！本次团购仅限500台优惠，机会难得！
                                        </div>
                                        <div class="group_detail">
                                        
                                        	<div class="left">
                                            
                                            	<h3>团信息</h3>
                                                <dl>
                                                
                                                	<dt>
                                                    	<a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a>
                                                    </dt>
                                                    <dd>
                                                    
                                                    	<h3><a href="#">南瓜团</a></h3>
                                                        <p>已参加15人</p>
                                                        <p>还缺<b>5人</b></p>
                                                    
                                                    </dd>
                                                
                                                </dl>
                                            
                                            </div>
                                            <div class="right">
                                            
                                            	<h3>团主</h3>
                                                <dl>
                                                
                                                	<dt>
                                                    	<a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a>
                                                    </dt>
                                                    <dd>
                                                    
                                                    	<h3><a href="#">melodi</a></h3>
                                                        <a href="#" class="addbtn02 addbtn02_ok"><em></em>好友</a>
                                                        <a href="#" class="addbtn02 addbtn02_ok"><em></em>关注</a>
                                                    
                                                    </dd>
                                                
                                                </dl>
                                                <a class="set_group_btn" href="#"><em></em>修改团信息</a>
                                            
                                            </div>
                                            
                                            <dl class="group_friends">
                                        
                                                <dt><b>10</b>个品友已经购买</dt>
                                                <dd>
                                                
                                                    <a href="#"><img alt="" src="/images/mall/photo/photo12.png"></a>
                                                    <a href="#"><img alt="" src="/images/mall/photo/photo13.png"></a>
                                                    <a href="#"><img alt="" src="/images/mall/photo/photo14.png"></a>
                                                    <a href="#"><img alt="" src="/images/mall/photo/photo12.png"></a>
                                                    <a href="#"><img alt="" src="/images/mall/photo/photo13.png"></a>
                                                    <a href="#"><img alt="" src="/images/mall/photo/photo14.png"></a>
                                                
                                                </dd>
                                            
                                            </dl>
                                        
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
                                    
                                    <div class="mygroupbox">
                                    
                                    	<div class="group_status">
                                            <dl>
                                            
                                                <dt><a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a></dt>
                                                <dd><a href="#">日立2.5寸500G移动硬盘坚固耐久便于使用</a></dd>
                                            
                                            </dl>
                                            <a class="group_price" href="#">￥20000</a>
                                            <div class="info">
                                            
                                            	<p class="price">品上价<em class="down"></em>15.00</p>
                                                <p class="name">五人团</p>
                                                <p class="time"><b>剩余时间：</b>07小时58分钟48秒</p>
                                                <i class="success"></i>
                                            
                                            </div>
                                            
                                        </div>
                                        <div class="group_des">
                                            全国今日团购：顺市直降！仅2899元，即享原价3099元的富士通LH531 14.1英寸笔记本电脑活力红！本次团购仅限500台优惠，机会难得！
                                        </div>
                                        <div class="group_detail">
                                        
                                        	<div class="left">
                                            
                                            	<h3>团信息</h3>
                                                <dl>
                                                
                                                	<dt>
                                                    	<a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a>
                                                    </dt>
                                                    <dd>
                                                    
                                                    	<h3><a href="#">南瓜团</a></h3>
                                                        <p>已参加15人</p>
                                                        <p>还缺<b>5人</b></p>
                                                    
                                                    </dd>
                                                
                                                </dl>
                                            
                                            </div>
                                            <div class="right">
                                            
                                            	<h3>团主</h3>
                                                <dl>
                                                
                                                	<dt>
                                                    	<a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a>
                                                    </dt>
                                                    <dd>
                                                    
                                                    	<h3><a href="#">melodi</a></h3>
                                                        <a href="#" class="addbtn02 addbtn02_ok"><em></em>好友</a>
                                                        <a href="#" class="addbtn02 addbtn02_ok"><em></em>关注</a>
                                                    
                                                    </dd>
                                                
                                                </dl>
                                                <a class="set_group_btn" href="#"><em></em>修改团信息</a>
                                            
                                            </div>
                                            
                                            <dl class="group_friends">
                                        
                                                <dt><b>10</b>个品友已经购买</dt>
                                                <dd>
                                                
                                                    <a href="#"><img alt="" src="/images/mall/photo/photo12.png"></a>
                                                    <a href="#"><img alt="" src="/images/mall/photo/photo13.png"></a>
                                                    <a href="#"><img alt="" src="/images/mall/photo/photo14.png"></a>
                                                    <a href="#"><img alt="" src="/images/mall/photo/photo12.png"></a>
                                                    <a href="#"><img alt="" src="/images/mall/photo/photo13.png"></a>
                                                    <a href="#"><img alt="" src="/images/mall/photo/photo14.png"></a>
                                                
                                                </dd>
                                            
                                            </dl>
                                        
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
                                    
                                    <div class="mygroupbox">
                                    
                                    	<div class="group_status">
                                            <dl>
                                            
                                                <dt><a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a></dt>
                                                <dd><a href="#">日立2.5寸500G移动硬盘坚固耐久便于使用</a></dd>
                                            
                                            </dl>
                                            <a class="group_price" href="#">￥20000</a>
                                            <div class="info">
                                            
                                            	<p class="price">品上价<em class="down"></em>15.00</p>
                                                <p class="name">五人团</p>
                                                <p class="time"><b>剩余时间：</b>07小时58分钟48秒</p>
                                                <i class="fail"></i>
                                            
                                            </div>
                                            
                                        </div>
                                        <div class="group_des">
                                            全国今日团购：顺市直降！仅2899元，即享原价3099元的富士通LH531 14.1英寸笔记本电脑活力红！本次团购仅限500台优惠，机会难得！
                                        </div>
                                        <div class="group_detail">
                                        
                                        	<div class="left">
                                            
                                            	<h3>团信息</h3>
                                                <dl>
                                                
                                                	<dt>
                                                    	<a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a>
                                                    </dt>
                                                    <dd>
                                                    
                                                    	<h3><a href="#">南瓜团</a></h3>
                                                        <p>已参加15人</p>
                                                        <p>还缺<b>5人</b></p>
                                                    
                                                    </dd>
                                                
                                                </dl>
                                            
                                            </div>
                                            <div class="right">
                                            
                                            	<h3>团主</h3>
                                                <dl>
                                                
                                                	<dt>
                                                    	<a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a>
                                                    </dt>
                                                    <dd>
                                                    
                                                    	<h3><a href="#">melodi</a></h3>
                                                        <a href="#" class="addbtn02 addbtn02_ok"><em></em>好友</a>
                                                        <a href="#" class="addbtn02 addbtn02_ok"><em></em>关注</a>
                                                    
                                                    </dd>
                                                
                                                </dl>
                                                <a class="set_group_btn" href="#"><em></em>修改团信息</a>
                                            
                                            </div>
                                            
                                            <dl class="group_friends">
                                        
                                                <dt><b>10</b>个品友已经购买</dt>
                                                <dd>
                                                
                                                    <a href="#"><img alt="" src="/images/mall/photo/photo12.png"></a>
                                                    <a href="#"><img alt="" src="/images/mall/photo/photo13.png"></a>
                                                    <a href="#"><img alt="" src="/images/mall/photo/photo14.png"></a>
                                                    <a href="#"><img alt="" src="/images/mall/photo/photo12.png"></a>
                                                    <a href="#"><img alt="" src="/images/mall/photo/photo13.png"></a>
                                                    <a href="#"><img alt="" src="/images/mall/photo/photo14.png"></a>
                                                
                                                </dd>
                                            
                                            </dl>
                                        
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