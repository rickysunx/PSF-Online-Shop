<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>${pageTitle }</title>
    <psf:header/>
	<link href="/css/mall.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="/js/mall/common.js"></script>
<script type="text/javascript">

function goodsShowImage(img_id) {
	$("#goods_thumb_list > li").removeClass("current");
	$("#goods_big_image").attr("src",$("#img_"+img_id).attr("img_url"));
	$("#imgli_"+img_id).addClass("current");
}

$(document).ready(function(){
	
});
</script>

</head>

<body>
<psf:shortcut/>

<div id="cartDialog" class="mall_dialog" style="width:411px;display:none;">
	<div class="layerTop_round"><div class="layerTop_title"><div>
    	<a class="close" href="javascript:closeCartDialog();"></a>
    	<h3>加入购物车</h3>
    </div></div></div>
	<div class="mall_body">
    	<div class="buy_add_box">
        	<h2><em></em>已成功加入购物车!</h2>
            <div class="btns">
            	<a class="continue_button" href="javascript:closeCartDialog();"></a>
            	<a class="view_button" target="_blank" href="/cart"></a>
            	<a class="pay_button" target="_blank" href="/order/add"></a>
            </div>
        </div>
    </div>
</div>

<div id="html_wrap">
	<div id="mall_header">
    	<psf:include page="/mall/header.jsp"/>
    	<psf:include page="/mall/search.jsp"/>
    </div>
    
    <div id="main">
    	<div class="pathbox">
        	${cateNav}
        </div>
        
        <div class="rows_content">
        	<div class="v2_sidebar">
            	<div class="sort_side_box rows">
                	<div class="header"><h3>相关分类</h3></div>
                    <ul>
    <li><a href="/list?cateid=${currCate.cat_id}">${currCate.cat_name}</a></li>
<c:forEach var="bc" items="${brotherCateList}">
	<li><a href="/list?cateid=${bc.cat_id}">${bc.cat_name}</a></li>
</c:forEach>
                    </ul>
                </div>
                
                <div class="sort_side_box rows">
                	<div class="header"><h3>同类品牌</h3></div>
                    <ol>
<c:forEach var="b" items="${brandsOfThisCate}">
	<li><a href="/list?cateid=${currCate.cat_id}&brandid=${b.brand_id}">${b.brand_name}</a></li>
</c:forEach>
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
                    	<h1><a href="#">${goods.goods_name}</a></h1>
                        <div class="meta">
                        	<p>品 &nbsp;&nbsp; 牌：${goods.brand_name}　<!--a class="brand_icon" href="#"><img src="/images/mall/photo/logo13.png" alt="" /></a--> <a class="brand" href="#">关注该品牌</a></p>
                            <div class="meta_img">
                                <dl class="share_info">
                                    <dt><img src="/images/mall/default/temp/xiangjin.png" alt="" /></dt>
                                    <dd>
                                        <p>累计<span>享金</span><b class="share_price">1000.00</b></p>
                                        <p><a href="#">如何获得享金</a></p>
                                    </dd>
                                </dl>
                                <p>商品编号：${goods.goods_sn }</p>
                                <p class="psf_price">品　上　价：<b>￥${goods.shop_price}</b></p>
                                <p class="price">
                                    <span>市场价：￥${goods.market_price }</span>
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

<script type="text/javascript">
var attrList = ${jsonAttrList};

function goodsAttrClicked(attr_id,goods_attr_id) {
	var attr = null;
	$.each(attrList,function(i,a){
		if(a.attr_id==attr_id) {
			attr = a;
		}
	});
	if(attr==null) return;
	$.each(attr.attr_children,function(i,ga){
		$("#goods_attr_"+ga.goods_attr_id).removeClass("current");
	});
	$("#goods_attr_"+goods_attr_id).addClass("current");
	updateGoodsAttrInfo();
	
}

function updateGoodsAttrInfo() {
	var info = "";
	var attrInput = "";
	$.each(attrList,function(i,attr){
		var sel = undefined;
		$.each(attr.attr_children,function(j,ga){
			var theClass = $("#goods_attr_"+ga.goods_attr_id).attr("class");
			if(theClass=="current") {
				sel = ga.attr_value;
			}
		});
		info += attr.attr_name+"："+(sel==null?"未选择":sel)+"&nbsp;&nbsp;";
		if(sel) attrInput += "<input name='goodsAttr' type='hidden' attr_id='"+
			attr.attr_id+"' value='"+sel+"' />";
	});
	$("#goodsAttrSelectedInfo").html(info);
	$("#goodsBuyAttrContainer").html(attrInput);
}

function amountChange(n) {
	var oldAmount = parseInt($("#goods_amount").val());
	var newAmount = oldAmount+n;
	if(newAmount<=0) newAmount = 1;
	if(newAmount>100) newAmount = 100;
	$("#goods_amount").val(newAmount);
	updateMoneyAmount();
}

function updateMoneyAmount() {
	var goodsAmount = parseInt($("#goods_amount").val());
	var moneyAmount = ${goods.shop_price}*goodsAmount;
	$("#goods_money_amount").text("￥"+moneyAmount.toFixed(2));
}
</script>


                        
                        <div class="key">
<c:forEach var="attr" items="${attrList}">
<dl class="sizebox">
	<dt>${attr.attr_name}：<b></b></dt>
    <dd>
        <ul>
        <c:forEach var="ga" items="${attr.attr_children}">
            <li>
            	<a id="goods_attr_${ga.goods_attr_id}" href="javascript:goodsAttrClicked(${attr.attr_id},${ga.goods_attr_id});"><span></span>${ga.attr_value}</a>
            </li>
        </c:forEach>
        </ul>
    </dd>
</dl>
</c:forEach>                            
                            <dl class="actions">
                            	<dt>我要买：</dt>
                                <dd>
                                	<div class="amount">
                                        <div class="numInput">
                                        <form id="goodsBuyForm">
											<input type="hidden" name="goods_id" value="${goods.goods_id}"/>
											<div id="goodsBuyAttrContainer" style="display:none;"></div>
											<a class="minus" href="javascript:amountChange(-1);">-</a>
                                            <input onchange="updateMoneyAmount();" id="goods_amount" value="1" name="goods_amount"/>
                                            <a class="add" href="javascript:amountChange(1);">+</a>
                                        </form>
                                        </div>
                                        <div class="info">
                                        	<p id="goodsAttrSelectedInfo"></p>
                                            <p class="price">小计：<b id="goods_money_amount">￥${goods.shop_price}</b></p>
                                        </div>                                        
                                    </div>
                                    
                                    <div class="btn_buy">
                                    	<a class="like" href="#"></a>
                                    	<a class="like_add" href="javascript:addToCart();"></a>
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
                    	<div class="img">
<c:if test="${!empty goodsImageList}">
<img id="goods_big_image" src="/ecimage/${goodsImageList[0].img_url}"/>
</c:if>
                    	</div>
                        <div class="thumbbox">
                        	<a class="prev" href="#"><em></em></a>
                            <a class="next" href="#"><em></em></a>
                            <div class="thumb">
                                <ul id="goods_thumb_list">
<c:forEach var="img" items="${goodsImageList}" varStatus="s">
	<li id="imgli_${img.img_id}" <c:if test="${s.first}">class="current"</c:if>><a id="img_${img.img_id}" href="javascript:goodsShowImage('${img.img_id}');" img_url="/ecimage/${img.img_url}"><img src="/ecimage/${img.thumb_url}" alt="" /></a></li>
</c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
<script type="text/javascript">
function changeToGroupBuyTab() {
	$("#combine_buy_tab").hide();
	$("#group_buy_tab").show();
}
function changeToCombineBuyTab() {
	$("#group_buy_tab").hide();
	$("#combine_buy_tab").show();
}
function refreshCombineBuyList(page) {
	$("#combine_buy_goods_list").load(
		"/action/mall/get_combine_buy_goods",
		{'goods_id':'${goods.goods_id}','page':page},
		function() {
			
		}
	);
}
function checkCombineBuyGoods(goods_id) {
	var checked = $("#combine_check_"+goods_id).attr("checked");
	if(checked) {
		if($("#combine_buy_form > input[value='"+goods_id+"']").length==0) {
			$("#combine_buy_form").append("<input name='goods_id' _price='"
					+ $("#combine_check_"+goods_id).attr("_price")
					+ "' value='"+goods_id+"'/>");
		}
	} else {
		$("#combine_buy_form > input[value='"+goods_id+"']").remove();
	}
	
	var price_sum = ${goods.shop_price};
	$.each($("#combine_buy_form > input"),function(i,o){
		var price = $(o).attr("_price");
		price_sum=price_sum+parseFloat(price);
	});
	
	$("#combine_buy_price").text("￥"+price_sum.toFixed(2));
	$("#combine_buy_shop_price").text(price_sum.toFixed(2));
	$("#combine_buy_market_price").text(price_sum.toFixed(2));
}
</script>
            	<div id="combine_buy_tab" class="media_mini_box rows">
                    <dl class="tab partner_tab">
                        <dt><a href="javascript:void(0)"></a></dt>
                        <dd><a href="javascript:void(0)" onmouseover="changeToGroupBuyTab();"></a></dd>
                    </dl>
                    
                    <div class="partner_content">
                        <div class="infobox">
                        	<div class="total_price"><strong>拍档总价格：</strong><b id="combine_buy_price">￥${goods.shop_price}</b>元</div>
                            <div class="price">
                            	<p><b>品上价：</b><em></em> <b id="combine_buy_shop_price">${goods.shop_price}</b></p>
                                <p><b>市场价：</b><em></em> <b id="combine_buy_market_price">${goods.shop_price}</b></p>
                            </div>
                            
                            <div class="buy">
                            	<b>选中优惠组合<br />请点击：</b>
                                <a class="partner_buy" href="#"></a>
                            </div>
                            
                            <div class="right">
                            	<a id="combine_buy_prev" href="#" style="display:none;">上一组</a>
                                <a id="combine_buy_next" href="javascript:refreshCombineBuyList(2);" <c:if test="${!combineGoodsListNext}">style="display:none;"</c:if>>下一组</a>
                            </div>
    
                        </div>
<form id="combine_buy_form" style="display:none;">
	
</form>
                        <div id="combine_buy_goods_list" class="partner_list">
                        	<ul class="current">
                            	<li class="first">
                                	<div class="img">
                                    	<img src="/ecimage/${goods.goods_thumb}" alt=""/>
                                    </div>
                                    <p>${goods.goods_name}</p>
                                    <p class="price"><b>${goods.shop_price }</b></p>
                                </li>
<c:forEach var="g" items="${combineGoodsList}">
	<li>
		<div class="img">
	    	<a href="/product?pid=${g.goods_id}" target="_blank"><img src="/ecimage/${g.goods_thumb}" alt="" /></a>
	    </div>
	    
	    <p><input id="combine_check_${g.goods_id}" _price="${g.shop_price}" type="checkbox" value="${g.goods_id}" onclick="checkCombineBuyGoods(${g.goods_id});"/><a href="/product?pid=${g.goods_id}" target="_blank">${g.goods_name}</a></p>
	    <p class="price">
	    	<span class="right">直减<b>10.00</b></span>
	    	<b>${g.shop_price}</b>
	    </p>
	</li>
</c:forEach>
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
                
                
                <div id="group_buy_tab" class="media_mini_box rows" style="display:none;">
                    <dl class="tab mygroup_tab">
                        <dt><a href="javascript:void(0)" onmouseover="changeToCombineBuyTab();"></a></dt>
                        <dd><a href="javascript:void(0)"></a></dd>
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
<script type="text/javascript">
function snsTabShow(tabName) {
	$("#goods_sns_tab > li").removeClass("current");
	$("#goods_sns_tab").find("."+tabName).parent("li").addClass("current");
	$("#goods_show").hide();
	$("#goods_exp").hide();
	$("#goods_guide").hide();
	$("#goods_"+tabName).fadeIn();
}
function refreshSnsPost(type,page) {
	var posttype = "";
	if(type==0) posttype="show";
	if(type==1) posttype="exp";
	if(type==2) posttype="guide";
	$("#goods_"+posttype+"_list").load(
		"/action/mall/get_sns_post",
		{"id":${goods.goods_id},
		 "brandid":${goods.brand_id},
		 "type":type,
		 "page":page});
}
</script>                
                <div class="mall_list_box rows">
                    <ul id="goods_sns_tab" class="tab">
                        <li class="current"><a class="show" href="javascript:snsTabShow('show');"></a></li>
                        <li><a class="exp" href="javascript:snsTabShow('exp');"></a></li>
                        <li><a class="guide" href="javascript:snsTabShow('guide');"></a></li>
                    </ul>
                    
                    <div id="goods_show" class="listbox">
                    
                        <div class="header">
                        
                            <a id="goods_show_prev" href="#" style="display:none;">上一组</a>
                            <a id="goods_show_next" href="javascript:refreshSnsPost(0,2);" <c:if test="${!showNext}">style="display:none;"</c:if>>下一组</a>
                        
                        </div>
                        
                        <ul id="goods_show_list" class="show_list">
                        
                        
<c:forEach var="p" items="${showPostList}">
	<li>
	    <dl>
	        <dt><a target="_blank" href="/post/${p.postid}"><img width="160px" height="160px" src="/pic/${p.coverpic}" alt="" /></a></dt>
	        <dd>
	            <div class="avatar"><a href="#"><img width="34px" height="34px" src="/pic/${p.avatarpic}" alt="" /></a></div>
	            <p><a target="_blank" href="/post/${p.postid}">${p.title}</a></p>
	        </dd>
	    </dl>
	</li>
</c:forEach>
                        </ul>
                    
                    </div>
                    
                    <div id="goods_exp" class="listbox" style="display:none;">
                    
                        <div class="header">
                        
                            <a id="goods_exp_prev" href="#" style="display:none;">上一组</a>
                            <a id="goods_exp_next" href="javascript:refreshSnsPost(1,2);" <c:if test="${!expNext}">style="display:none;"</c:if>>下一组</a>
                        
                        </div>
                        
                        <ul id="goods_exp_list" class="post_list">
                        
<c:forEach var="exp" items="${expPostList}">
<li class="current">
	<div class="post_item">
		<div class="post">
			<dl class="post_left">
				<dt>
					<a target="_blank" href="/post/${exp.postid}"><img src="/pic/${exp.userpic}" alt="" />
					</a>
				</dt>
				<dd>
					<p>
						秀场：<span>${exp.showcount }</span>
					</p>
					<p>
						体验：<span>${exp.shopexpcount }</span>
					</p>
					<p>
						指南：<span>${exp.guidecount }</span>
					</p>
				</dd>
			</dl>

			<div class="post_main">
				<div class="post_header">
					<div class="post_displayName">
						<a href="#">${exp.username}</a>
					</div>
				</div>
				<div class="post_content01">
					${exp.content}<a target="_blank" href="/post/${exp.postid}">查看全部</a>
				</div>
				<div class="imglist">
					<c:forEach var="p" items="${exp.picList }">
						<a href="#none"><img src="/pic/${p.picname }" alt=""/></a>
					</c:forEach>
				</div>
				<div class="post_actions">
					<a href="#">转发(${exp.forwardcount})</a> | <a href="#">品论(${exp.commentcount})</a>
				</div>
			</div>
		</div>

<c:if test="${exp.commentid!=null}">
	<div class="post_comment">
		<h5>最新评论</h5>
		<dl class="commentbox">
			<dt>
				<a href="#"><img src="/images/mall/photo/photo17.png" alt="" />
				</a>
			</dt>
			<dd>
				<div class="comment_item_row1">
					<span class="comment_username">${exp.cusername}：</span> <span
						class="comment_content">${exp.commentContent}</span>
				</div>
				<div class="comment_item_row2">
					<div class="comment_time">2011-10-31 20:40</div>
				</div>
			</dd>
		</dl>
	</div>
</c:if>
	</div>
</li>
</c:forEach>                        
                        </ul>
                    
                    </div>
                    
                    <div id="goods_guide" class="listbox" style="display:none;">
                    
                        <div class="header">
                        
                            <a id="goods_guide_prev" href="#" style="display:none;">上一组</a>
                            <a id="goods_guide_next" href="javascript:refreshSnsPost(2,2);" <c:if test="${!guideNext}">style="display:none;"</c:if>>下一组</a>
                        
                        </div>
                        
                        <ul id="goods_guide_list" class="post_list">

<c:forEach var="g" items="${guidePostList}">                   
<li class="current">
   	<div class="post_item">
       	<div class="post">
           	<dl class="post_left">
               	<dt><a href="#"><img src="/pic/${g.userpic}" alt="" /></a></dt>
                   <dd>
                      <p>秀场：<span>${g.showCount}</span></p>
                      <p>体验：<span>${g.expCount}</span></p>
                      <p>指南：<span>${g.guideCount}</span></p>
                  	</dd>
               </dl>
               
               <div class="post_main">
               	<div class="post_header">
                       <div class="post_displayName">
                           <a href="#">${g.username }</a>
                       </div>
                       <div class="post_title">
                       	<a target="_blank" href="/post/${g.postid }">${g.title }</a>
                       </div>
                       <div class="post_type"><a target="_blank" href="#">${g.cat_name }</a></div>
                   </div>
                   <div class="post_content01">
                   		${g.content}<a target="_blank" href="/post/${g.postid }">查看全部</a>
                   </div>
                   <div class="imglist">
                   	  <c:forEach var="p" items="${g.picList}">
                   		<a href="#none"><img height="40" src="/pic/${p.picname}" alt="" /></a>
                   	  </c:forEach>
                   </div>
                   <div class="post_actions">
                   	<a href="#">转发(${g.forwardcount})</a> | 
                   	<a href="#">品论(${g.commentcount})</a>
                   </div>
               </div>
           </div>
           
           <c:if test="${g.commentid!=null}">
	           <div class="post_comment">
	           	<h5>最新评论</h5>
	               <dl class="commentbox">
	                   <dt><a href="#"><img src="/images/mall/photo/photo17.png" alt="" /></a></dt>
	                   <dd>
	                   	<div class="comment_item_row1">
	                           <span class="comment_username">${g.cusername}：</span>
	                           <span class="comment_content">${g.commentcontent}</span>
	                       </div>
	                       <div class="comment_item_row2">
	                           <div class="comment_time">2011-10-31 20:40</div>
	                       </div>
	                   </dd>
	               </dl>
	           </div>
           </c:if>
       </div>
</li>
</c:forEach>                        
                        </ul>
                    
                    </div>
                
                </div>
<script type="text/javascript">
function goodsDetailsShowTab(tabName) {
	$("#goods_details > ul > li").removeClass("current");
	$("#goods_details_tabli_"+tabName).addClass("current");
	$("#goods_detail,#goods_question,#goods_buy,#goods_pay,#goods_aftersale").hide();
	$("#goods_"+tabName).fadeIn("fast");
}
</script>                
                <div id="goods_details" class="detailbox rows">
                
                	<ul class="tab">
                    	<li id="goods_details_tabli_detail" class="current"><a href="javascript:goodsDetailsShowTab('detail');">商品详情</a></li>
                        <li id="goods_details_tabli_question"><a href="javascript:goodsDetailsShowTab('question');">商品咨询</a></li>
                        <li id="goods_details_tabli_buy"><a href="javascript:goodsDetailsShowTab('buy');">购买记录</a></li>
                        <li id="goods_details_tabli_pay"><a href="javascript:goodsDetailsShowTab('pay');">支付方式</a></li>
                        <li id="goods_details_tabli_aftersale"><a href="javascript:goodsDetailsShowTab('aftersale');">售后服务</a></li>
                    </ul>
                    
                    <div id="goods_detail" class="shop_detail_content">
                    	${goods.goods_desc}
                    </div>
                    
                    <div id="goods_question" class="shop_answer_content" style="display:none;">
                    
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
<script type="text/javascript">
function submitGoodsQuestion() {
	$.post("/action/mall/submit_question",
		$("#goods_question_form").serialize(),
		function(data){
			if(data.success==1) {
				$.psfInfoDialog("发送成功");
				$("#goods_question_form > textarea").val('');
				loadGoodsQuestion(1);
			} else {
				alert("提交失败："+data.info);
			}
		},
	"json");
}

function loadOneGoodsQuestion(qid) {
	$("#answer_item_"+qid).load(
		"/action/mall/get_one_question",
		{"qid":qid}
	);
}

function loadGoodsQuestion(page) {
	$("#goods_question_list").load(
		"/action/mall/get_question",
		{
			"pid":${goods.goods_id},
			"page":page
		}
	);
}

$(document).ready(function(){
	loadGoodsQuestion(1);
});

function toggleAnswerForm(questionid) {
	var container = $("#answer_container_"+questionid);
	var display = container.css("display");
	if(display=='none') {
		container.show();
	} else {
		container.hide();
	}
}

function toggleCommentForm(answerid) {
	var container = $("#answer_comment_"+answerid);
	var display = container.css("display");
	if(display=='none') {
		container.show();
	} else {
		container.hide();
	}
}

function submitGoodsAnswer(questionid) {
	var answerForm = $("#answer_form_"+questionid);
	$.post("/action/mall/submit_question",
		answerForm.serialize(),
		function(data){
			if(data.success==1) {
				$.psfInfoDialog("发布成功");
				loadOneGoodsQuestion(data.qid);
			} else {
				alert("提交失败："+data.info);
			}
		},
	"json");
}

function submitGoodsAnswerComment(aid) {
	var commentForm = $("#answer_comment_form_"+aid);
	$.post("/action/mall/submit_comment",
		commentForm.serialize(),
		function(data){
			if(data.success==1) {
				$.psfInfoDialog("发布成功");
				loadOneGoodsQuestion(data.qid);
			} else {
				alert("提交失败："+data.info);
			}
		},
	"json");
}

function showMoreAnswer(qid,page) {
	$.post("/action/mall/get_question_more_answer",{"qid":qid,"page":page},function(data){
		if(data.length>0) {
			if(data.endsWith("<!--more-->")) {
				$("#goods_answer_more_"+qid+" > a").attr("href","javascript:showMoreAnswer("+qid+","+(page+1)+");");
			} else {
				$("#goods_answer_more_"+qid).hide();
			}
			$("#goods_answer_more_"+qid).before(data);
		}
	},"text");
}

function showMoreComment(aid,page) {
	$.post("/action/mall/get_question_more_comment",{"aid":aid,"page":page},function(data){
		if(data.length>0) {
			if(data.endsWith("<!--more-->")) {
				$("#goods_comment_more_"+aid+" > a").attr("href","javascript:showMoreComment("+aid+","+(page+1)+");");
			} else {
				$("#goods_comment_more_"+aid).hide();
			}
			$("#goods_comment_more_"+aid).before(data);
		}
	},"text");
}

</script>                        
	                        <div class="answer_list">
		                            <div class="answer_form">
		                                <form id="goods_question_form" action="">
		                                	<input type="hidden" name="pid" value="${goods.goods_id}"/>
		                                	<h3>我来提问</h3>
		                                    <textarea name="content"></textarea>
		                                    <div class="txtarea_bottom">
		                                        <div class="face faceimg">
		                                            <a href="#"><em></em>表情</a>
		                                        </div>
		                                        <a class="button" href="javascript:submitGoodsQuestion();">提问</a>
		                                    </div>
		                                </form>
		                            </div>
		                            
		                            <div id="goods_question_list">
		                                
		                            </div>
		                            
	                         </div>
                        </div>
                        
                        <div id="goods_buy" class="buy_record_content" style="display:none;">
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
                            
    <psf:page pageCount="5" href="#" action="" page="1"></psf:page>
                        
                        </div>
                        
                        <div id="goods_pay" class="pay_mode_content" style="display:none;">
                    
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
                        
                        <div id="goods_aftersale" class="service_content" style="display:none;">
                    
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