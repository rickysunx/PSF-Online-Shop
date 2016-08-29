<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>品上商城购物车确认</title>
    <psf:header/>
	<link href="/css/mall.css" rel="stylesheet" type="text/css"/>
	<script src="/js/jquery.js" type="text/javascript"></script>
</head>

<body>
<psf:shortcut/>

<div id="html_wrap">

    <!--品上商城购物车购买-->
    <div id="mall_header">
    
    	<div class="top">
        
            <a id="logo" href="#"><img src="/images/mall/logo.png" alt="" /></a>
            <a href="#"><img src="/images/mall/photo/banner_big2.png" alt="" /></a>
            
        </div>
    
    </div>
    
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

</body>
</html>