<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>品上商城购物车</title>
    <psf:header/>
	<link href="/css/mall.css" rel="stylesheet" type="text/css"/>
</head>

<body>
<psf:shortcut/>

<div id="html_wrap">

    <div id="mall_header">
    
    	<div class="top">
        
            <a id="logo" href="#"><img src="/images/mall/logo.png" alt="" /></a>
            <a href="#"><img src="/images/mall/photo/banner_big2.png" alt="" /></a>
            
        </div>
    
    </div>
    
        
    <div class="order_process_box">
    
        <ul class="process_header">
        
            <li class="current"><em class="mybuy"></em></li>
            <li><em class="order_confirm"></em></li>
            <li><em class="order_success"></em></li>
            <li><em class="order_post"></em></li>
        
        </ul>
        
        <div class="mybuybox">
        
            <div class="shopcar">
            
                <table cellpadding="0">
                    <tr>
                        <th colspan="2" class="name">商品详情</th>
                        <th class="type">购物类型</th>
                        <th class="price">成交价</th>
                        <th class="scope">赠送积分</th>
                        <th class="favor">优惠</th>
                        <th class="post">包邮</th>
                        <th class="num">数量</th>
                        <th class="oper">操作</th>
                    </tr>
<c:forEach var="cg" items="${cartList}">
	<tr>
	    <td class="img">
	        <a href="#"><img src="/ecimage/${cg.goods_thumb}" alt="" /></a>
	    </td>
	    <td class="name">
	    	<a href="/product?pid=${cg.pid}" target="_blank">${cg.goods_name}</a>
	    	<!--span>颜色分类：</span>白色 <span>尺码：</span>35-->
	    </td>
	    <td class="type">普通</td>
	    <td class="price">${cg.shop_price}</td>
	    <td class="scope"><!--84--></td>
	    <td class="favor"><!-- 比市场价优惠<b>200.00</b> --></td>
	    <td class="post"><em class="yes"></em></td>
	    <td class="num numInput">
	        <a class="minus" href="javascript:changeCartGoodsAmount(${cg.goods_id},'goodsAmt_${cg.goods_id}',true,-1);">-</a>
	        <input id="goodsAmt_${cg.goods_id}" value="${cg.pcount}" name="pcount" onchange="changeCartGoodsAmount(${cg.goods_id},'goodsAmt_${cg.goods_id}',true);"/>
	        <a class="add" href="javascript:changeCartGoodsAmount(${cg.goods_id},'goodsAmt_${cg.goods_id}',true,1);">+</a>
	    </td>
	    <td class="oper">
	        <p><a href="javascript:moveToLike(${cg.pid},true);">放入喜欢商品</a></p>
	        <p><a href="javascript:removeFromCart(${cg.pid},true);">删除</a></p>
	    </td>
	</tr>
</c:forEach>
                </table>
                
                <div class="pricebox">
                
                    <div class="price">
                        <h6>根据购物车的商品测算,您还需要支付邮费${expressAmount}元</h6><!--em></em-->
                        <div class="price_detail"><span>订单总价商品价<b>${totalAmount}</b></span> <span>邮费<b>${expressAmount}</b></span></div>
                    </div>
                    <div class="price_total">订单总计：<b>￥${payAmount}</b></div>
                    <div class="bottom">
                        <a class="continue_button" href="/mall"></a>
                        <a class="pay_button" href="/order/edit"></a>
                    </div>
                
                </div>
            
            </div>
            
            <div id="" style="display:none;">
                <div class="order_br_box">
                
                    <div class="header"><h3>喜欢的商品</h3></div>
                    <ul class="shop_comment_list">
                    
                        <li>
                        
                            <dl>
                            
                                <dd>
                                
                                    <div class="img"><a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a></div>
                                    <div class="info">
                                    
                                        <h5><a href="#">时尚男士秋冬款式写意短抽</a></h5>
                                        <p class="price">￥199 <span>￥499</span></p>
                                        <p class="like"><a href="#"><em></em>喜欢(34567)</a></p>
                                        <p class="combox">
                                        
                                            <span>商品评分：</span>
                                            <span class="icons">
                                                <em></em><em></em><em></em><em class="no"></em><em class="no"></em>
                                            </span>
                                        
                                        </p>
                                        <p class="bottom">
                                        
                                            <a href="#"><em></em>放入购物车 &gt;&gt;</a>
                                        
                                        </p>
                                    
                                    </div>
                                
                                </dd>
                            
                            </dl>
                        
                        </li>
                        
                        <li>
                        
                            <dl>
                            
                                <dd>
                                
                                    <div class="img"><a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a></div>
                                    <div class="info">
                                    
                                        <h5><a href="#">时尚男士秋冬款式写意短抽</a></h5>
                                        <p class="price">￥199 <span>￥499</span></p>
                                        <p class="like liked"><a href="#"><em></em>喜欢(34567)</a></p>
                                        <p class="combox">
                                        
                                            <span>商品评分：</span>
                                            <span class="icons">
                                                <em></em><em></em><em></em><em class="no"></em><em class="no"></em>
                                            </span>
                                        
                                        </p>
                                        <p class="bottom">
                                        
                                            <a href="#"><em></em>放入购物车 &gt;&gt;</a>
                                        
                                        </p>
                                    
                                    </div>
                                
                                </dd>
                            
                            </dl>
                        
                        </li>
                        
                        <li>
                        
                            <dl>
                            
                                <dd>
                                
                                    <div class="img"><a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a></div>
                                    <div class="info">
                                    
                                        <h5><a href="#">时尚男士秋冬款式写意短抽</a></h5>
                                        <p class="price">￥199 <span>￥499</span></p>
                                        <p class="like"><a href="#"><em></em>喜欢(34567)</a></p>
                                        <p class="combox">
                                        
                                            <span>商品评分：</span>
                                            <span class="icons">
                                                <em></em><em></em><em></em><em class="no"></em><em class="no"></em>
                                            </span>
                                        
                                        </p>
                                        <p class="bottom">
                                        
                                            <a href="#"><em></em>放入购物车 &gt;&gt;</a>
                                        
                                        </p>
                                    
                                    </div>
                                
                                </dd>
                            
                            </dl>
                        
                        </li>
                        
                        <li>
                        
                            <dl>
                            
                                <dd>
                                
                                    <div class="img"><a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a></div>
                                    <div class="info">
                                    
                                        <h5><a href="#">时尚男士秋冬款式写意短抽</a></h5>
                                        <p class="price">￥199 <span>￥499</span></p>
                                        <p class="like liked"><a href="#"><em></em>喜欢(34567)</a></p>
                                        <p class="combox">
                                        
                                            <span>商品评分：</span>
                                            <span class="icons">
                                                <em></em><em></em><em></em><em class="no"></em><em class="no"></em>
                                            </span>
                                        
                                        </p>
                                        <p class="bottom">
                                        
                                            <a href="#"><em></em>放入购物车 &gt;&gt;</a>
                                        
                                        </p>
                                    
                                    </div>
                                
                                </dd>
                            
                            </dl>
                        
                        </li>
                        
                        <li>
                        
                            <dl>
                            
                                <dd>
                                
                                    <div class="img"><a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a></div>
                                    <div class="info">
                                    
                                        <h5><a href="#">时尚男士秋冬款式写意短抽</a></h5>
                                        <p class="price">￥199 <span>￥499</span></p>
                                        <p class="like"><a href="#"><em></em>喜欢(34567)</a></p>
                                        <p class="combox">
                                        
                                            <span>商品评分：</span>
                                            <span class="icons">
                                                <em></em><em></em><em></em><em class="no"></em><em class="no"></em>
                                            </span>
                                        
                                        </p>
                                        <p class="bottom">
                                        
                                            <a href="#"><em></em>放入购物车 &gt;&gt;</a>
                                        
                                        </p>
                                    
                                    </div>
                                
                                </dd>
                            
                            </dl>
                        
                        </li>
                        
                        <li>
                        
                            <dl>
                            
                                <dd>
                                
                                    <div class="img"><a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a></div>
                                    <div class="info">
                                    
                                        <h5><a href="#">时尚男士秋冬款式写意短抽</a></h5>
                                        <p class="price">￥199 <span>￥499</span></p>
                                        <p class="like liked"><a href="#"><em></em>喜欢(34567)</a></p>
                                        <p class="combox">
                                        
                                            <span>商品评分：</span>
                                            <span class="icons">
                                                <em></em><em></em><em></em><em class="no"></em><em class="no"></em>
                                            </span>
                                        
                                        </p>
                                        <p class="bottom">
                                        
                                            <a href="#"><em></em>放入购物车 &gt;&gt;</a>
                                        
                                        </p>
                                    
                                    </div>
                                
                                </dd>
                            
                            </dl>
                        
                        </li>
                        
                        <li>
                        
                            <dl>
                            
                                <dd>
                                
                                    <div class="img"><a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a></div>
                                    <div class="info">
                                    
                                        <h5><a href="#">时尚男士秋冬款式写意短抽</a></h5>
                                        <p class="price">￥199 <span>￥499</span></p>
                                        <p class="like"><a href="#"><em></em>喜欢(34567)</a></p>
                                        <p class="combox">
                                        
                                            <span>商品评分：</span>
                                            <span class="icons">
                                                <em></em><em></em><em></em><em class="no"></em><em class="no"></em>
                                            </span>
                                        
                                        </p>
                                        <p class="bottom">
                                        
                                            <a href="#"><em></em>放入购物车 &gt;&gt;</a>
                                        
                                        </p>
                                    
                                    </div>
                                
                                </dd>
                            
                            </dl>
                        
                        </li>
                        
                        <li>
                        
                            <dl>
                            
                                <dd>
                                
                                    <div class="img"><a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a></div>
                                    <div class="info">
                                    
                                        <h5><a href="#">时尚男士秋冬款式写意短抽</a></h5>
                                        <p class="price">￥199 <span>￥499</span></p>
                                        <p class="like liked"><a href="#"><em></em>喜欢(34567)</a></p>
                                        <p class="combox">
                                        
                                            <span>商品评分：</span>
                                            <span class="icons">
                                                <em></em><em></em><em></em><em class="no"></em><em class="no"></em>
                                            </span>
                                        
                                        </p>
                                        <p class="bottom">
                                        
                                            <a href="#"><em></em>放入购物车 &gt;&gt;</a>
                                        
                                        </p>
                                    
                                    </div>
                                
                                </dd>
                            
                            </dl>
                        
                        </li>
                        
                        <li>
                        
                            <dl>
                            
                                <dd>
                                
                                    <div class="img"><a href="#"><img src="/images/mall/photo/photo01.png" alt="" /></a></div>
                                    <div class="info">
                                    
                                        <h5><a href="#">时尚男士秋冬款式写意短抽</a></h5>
                                        <p class="price">￥199 <span>￥499</span></p>
                                        <p class="like liked"><a href="#"><em></em>喜欢(34567)</a></p>
                                        <p class="combox">
                                        
                                            <span>商品评分：</span>
                                            <span class="icons">
                                                <em></em><em></em><em></em><em class="no"></em><em class="no"></em>
                                            </span>
                                        
                                        </p>
                                        <p class="bottom">
                                            <a href="#"><em></em>放入购物车 &gt;&gt;</a>
                                        </p>
                                    
                                    </div>
                                
                                </dd>
                            
                            </dl>
                        
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
            
            <div id="" style="display:none;">
            
                <div class="order_br_box">
                
                    <div class="header">
                        <h3>最佳拍档再推荐</h3>
                    </div>
                    <ul  class="partner_list">
                    
                        <li>
                        
                            <div class="img">
                            
                                <a href="#"><img alt="" src="/images/mall/photo/photo01.png"></a>
                            
                            </div>
                            
                            <p><a href="#">热情撞色宽纹珠地短抽...</a></p>
                            <p class="price">
                                <b>29.4</b>
                                <span>直减<b>10.00</b></span>
                            </p>
                            <p class="bottom"><a href="#"><em></em>放入购物车 &gt;&gt;</a></p>
                        
                        </li>
                        
                        <li>
                        
                            <div class="img">
                            
                                <a href="#"><img alt="" src="/images/mall/photo/photo01.png"></a>
                            
                            </div>
                            
                            <p><a href="#">热情撞色宽纹珠地短抽...</a></p>
                            <p class="price">
                                <b>29.4</b>
                                <span>直减<b>10.00</b></span>
                            </p>
                            <p class="bottom"><a href="#"><em></em>放入购物车 &gt;&gt;</a></p>
                        
                        </li>
                        
                        <li>
                        
                            <div class="img">
                            
                                <a href="#"><img alt="" src="/images/mall/photo/photo01.png"></a>
                            
                            </div>
                            
                            <p><a href="#">热情撞色宽纹珠地短抽...</a></p>
                            <p class="price">
                                <b>29.4</b>
                                <span>直减<b>10.00</b></span>
                            </p>
                            <p class="bottom"><a href="#"><em></em>放入购物车 &gt;&gt;</a></p>
                        
                        </li>
                        
                        <li>
                        
                            <div class="img">
                            
                                <a href="#"><img alt="" src="/images/mall/photo/photo01.png"></a>
                            
                            </div>
                            
                            <p><a href="#">热情撞色宽纹珠地短抽...</a></p>
                            <p class="price">
                                <b>29.4</b>
                                <span>直减<b>10.00</b></span>
                            </p>
                            <p class="bottom"><a href="#"><em></em>放入购物车 &gt;&gt;</a></p>
                        
                        </li>
                        
                        <li>
                        
                            <div class="img">
                            
                                <a href="#"><img alt="" src="/images/mall/photo/photo01.png"></a>
                            
                            </div>
                            
                            <p><a href="#">热情撞色宽纹珠地短抽...</a></p>
                            <p class="price">
                                <b>29.4</b>
                                <span>直减<b>10.00</b></span>
                            </p>
                            <p class="bottom"><a href="#"><em></em>放入购物车 &gt;&gt;</a></p>
                        
                        </li>
                        
                        <li>
                        
                            <div class="img">
                            
                                <a href="#"><img alt="" src="/images/mall/photo/photo01.png"></a>
                            
                            </div>
                            
                            <p><a href="#">热情撞色宽纹珠地短抽...</a></p>
                            <p class="price">
                                <b>29.4</b>
                                <span>直减<b>10.00</b></span>
                            </p>
                            <p class="bottom"><a href="#"><em></em>放入购物车 &gt;&gt;</a></p>
                        
                        </li>
                        
                        <li>
                        
                            <div class="img">
                            
                                <a href="#"><img alt="" src="/images/mall/photo/photo01.png"></a>
                            
                            </div>
                            
                            <p><a href="#">热情撞色宽纹珠地短抽...</a></p>
                            <p class="price">
                                <b>29.4</b>
                                <span>直减<b>10.00</b></span>
                            </p>
                            <p class="bottom"><a href="#"><em></em>放入购物车 &gt;&gt;</a></p>
                        
                        </li>
                        
                        <li>
                        
                            <div class="img">
                            
                                <a href="#"><img alt="" src="/images/mall/photo/photo01.png"></a>
                            
                            </div>
                            
                            <p><a href="#">热情撞色宽纹珠地短抽...</a></p>
                            <p class="price">
                                <b>29.4</b>
                                <span>直减<b>10.00</b></span>
                            </p>
                            <p class="bottom"><a href="#"><em></em>放入购物车 &gt;&gt;</a></p>
                        
                        </li>
                        
                        <li>
                        
                            <div class="img">
                            
                                <a href="#"><img alt="" src="/images/mall/photo/photo01.png"></a>
                            
                            </div>
                            
                            <p><a href="#">热情撞色宽纹珠地短抽...</a></p>
                            <p class="price">
                                <b>29.4</b>
                                <span>直减<b>10.00</b></span>
                            </p>
                            <p class="bottom"><a href="#"><em></em>放入购物车 &gt;&gt;</a></p>
                        
                        </li>
                        
                        <li>
                        
                            <div class="img">
                            
                                <a href="#"><img alt="" src="/images/mall/photo/photo01.png"></a>
                            
                            </div>
                            
                            <p><a href="#">热情撞色宽纹珠地短抽...</a></p>
                            <p class="price">
                                <b>29.4</b>
                                <span>直减<b>10.00</b></span>
                            </p>
                            <p class="bottom"><a href="#"><em></em>放入购物车 &gt;&gt;</a></p>
                        
                        </li>
                        
                        <li>
                        
                            <div class="img">
                            
                                <a href="#"><img alt="" src="/images/mall/photo/photo01.png"></a>
                            
                            </div>
                            
                            <p><a href="#">热情撞色宽纹珠地短抽...</a></p>
                            <p class="price">
                                <b>29.4</b>
                                <span>直减<b>10.00</b></span>
                            </p>
                            <p class="bottom"><a href="#"><em></em>放入购物车 &gt;&gt;</a></p>
                        
                        </li>
                        
                        <li>
                        
                            <div class="img">
                            
                                <a href="#"><img alt="" src="/images/mall/photo/photo01.png"></a>
                            
                            </div>
                            
                            <p><a href="#">热情撞色宽纹珠地短抽...</a></p>
                            <p class="price">
                                <b>29.4</b>
                                <span>直减<b>10.00</b></span>
                            </p>
                            <p class="bottom"><a href="#"><em></em>放入购物车 &gt;&gt;</a></p>
                        
                        </li>
                        
                        <li>
                        
                            <div class="img">
                            
                                <a href="#"><img alt="" src="/images/mall/photo/photo01.png"></a>
                            
                            </div>
                            
                            <p><a href="#">热情撞色宽纹珠地短抽...</a></p>
                            <p class="price">
                                <b>29.4</b>
                                <span>直减<b>10.00</b></span>
                            </p>
                            <p class="bottom"><a href="#"><em></em>放入购物车 &gt;&gt;</a></p>
                        
                        </li>
                        
                        <li>
                        
                            <div class="img">
                            
                                <a href="#"><img alt="" src="/images/mall/photo/photo01.png"></a>
                            
                            </div>
                            
                            <p><a href="#">热情撞色宽纹珠地短抽...</a></p>
                            <p class="price">
                                <b>29.4</b>
                                <span>直减<b>10.00</b></span>
                            </p>
                            <p class="bottom"><a href="#"><em></em>放入购物车 &gt;&gt;</a></p>
                        
                        </li>
                        
                        <li>
                        
                            <div class="img">
                            
                                <a href="#"><img alt="" src="/images/mall/photo/photo01.png"></a>
                            
                            </div>
                            
                            <p><a href="#">热情撞色宽纹珠地短抽...</a></p>
                            <p class="price">
                                <b>29.4</b>
                                <span>直减<b>10.00</b></span>
                            </p>
                            <p class="bottom"><a href="#"><em></em>放入购物车 &gt;&gt;</a></p>
                        
                        </li>
                        
                        <li>
                        
                            <div class="img">
                            
                                <a href="#"><img alt="" src="/images/mall/photo/photo01.png"></a>
                            
                            </div>
                            
                            <p><a href="#">热情撞色宽纹珠地短抽...</a></p>
                            <p class="price">
                                <b>29.4</b>
                                <span>直减<b>10.00</b></span>
                            </p>
                            <p class="bottom"><a href="#"><em></em>放入购物车 &gt;&gt;</a></p>
                        
                        </li>
                        
                        <li>
                        
                            <div class="img">
                            
                                <a href="#"><img alt="" src="/images/mall/photo/photo01.png"></a>
                            
                            </div>
                            
                            <p><a href="#">热情撞色宽纹珠地短抽...</a></p>
                            <p class="price">
                                <b>29.4</b>
                                <span>直减<b>10.00</b></span>
                            </p>
                            <p class="bottom"><a href="#"><em></em>放入购物车 &gt;&gt;</a></p>
                        
                        </li>
                        
                        <li>
                        
                            <div class="img">
                            
                                <a href="#"><img alt="" src="/images/mall/photo/photo01.png"></a>
                            
                            </div>
                            
                            <p><a href="#">热情撞色宽纹珠地短抽...</a></p>
                            <p class="price">
                                <b>29.4</b>
                                <span>直减<b>10.00</b></span>
                            </p>
                            <p class="bottom"><a href="#"><em></em>放入购物车 &gt;&gt;</a></p>
                        
                        </li>
                    
                    </ul>
                
                </div>
                
                <p class="more"><a href="#">上一页</a> <a href="#">下一页</a></p>
            
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