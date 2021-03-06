<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>品上商城</title>
    <psf:header/>
	<link href="/css/mall.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript">
	function showHotGoods(link,cat_id) {
		$("#hotgoods_nav > dd").removeClass("current");
		$(link).parent("dd").addClass("current");
		$("ol[psftype='hotgoods']").hide();
		$("#hotgoods_"+cat_id).fadeIn("fast");
	}
	function showHotPost(link,type) {
		$("#hot_post_tab > li").removeClass("current");
		$(link).parent("li").addClass("current");
		$("div[psftype='hot_post']").hide();
		$("#hot_post_"+type).fadeIn("fast");
	}
	</script>
</head>

<body>
<psf:shortcut/>

<div id="html_wrap">
	<div id="mall_header">
	<psf:include page="/mall/header.jsp"/>
	
    	<div class="search_nav">
        
            <!--测试菜单,可作参考-->
            <script type="text/javascript">
                $(document).ready(function(){
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
        
            <div class="allsort">
                <h3>全部分类和品牌</h3>
                <div class="menu_list">
<ol>
<c:forEach var="cate1" items="${cateTree}">
	<li>
		<h6><span><em></em><i></i>${cate1.cat_name}</span></h6>
		<div class="subitem"><div class="subitem_body">
	        <div class="left">
	            <h5>选择分类</h5>
	            <c:forEach var="cate2" items="${cate1.children}">
	            	<dl>
	            		<dt>${cate2.cat_name}</dt>
	            		<dd>
	            		<c:forEach varStatus="cate3Status" var="cate3" items="${cate2.children}">
	            			<a href="/list?cateid=${cate3.cat_id}">${cate3.cat_name}</a> <c:if test="${!cate3Status.last}">|</c:if>
	            		</c:forEach>
	            		</dd>
	            	</dl>
	            </c:forEach>
	        </div>
	        <div class="right">
	            <h5>热销品牌</h5>
	            <p>
	            	<c:forEach var="brand" items="${cate1.brandList}">
	            		<a href="#">${brand.brand_name }</a>
	            	</c:forEach>
	            </p>
	        </div>
		</div></div>
	</li>
</c:forEach>	
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
    
    	<div class="r_content rows">
        
        	<div class="slide_banner">
            
                <a href="#"><img src="/images/mall/slide/1.jpg" alt="" /></a>
                <a href="#"><img src="/images/mall/slide/2.jpg" alt="" /></a>
                <a href="#"><img src="/images/mall/slide/3.jpg" alt="" /></a>
                <a href="#"><img src="/images/mall/slide/4.jpg" alt="" /></a>
                <a href="#"><img src="/images/mall/slide/5.jpg" alt="" /></a>
                <ul>
                
                	<li class="current">郭型针织连衣裙￥59</li>
                    <li>3折抢205款Euroud春衣</li>
                    <li>120款春夏小衫</li>
                    <li>106款休闲春夏装39元起</li>
                    <li>pingk止in春夏品49元</li>
                
                </ul>
            
            </div>
            
            <div class="brand_list">
            
            	<h3><a href="#">查看所有品牌&gt;&gt;</a>热卖品牌</h3>
                <ul>
                	<li><a href="#"><img src="/images/mall/photo/brand01.png" alt="" /></a></li>
                    <li><a href="#"><img src="/images/mall/photo/brand02.png" alt="" /></a></li>
                    <li><a href="#"><img src="/images/mall/photo/brand03.png" alt="" /></a></li>
                    <li><a href="#"><img src="/images/mall/photo/brand04.png" alt="" /></a></li>
                    <li><a href="#"><img src="/images/mall/photo/brand05.png" alt="" /></a></li>
                    <li><a href="#"><img src="/images/mall/photo/brand06.png" alt="" /></a></li>
                    <li><a href="#"><img src="/images/mall/photo/brand07.png" alt="" /></a></li>
                </ul>
            
            </div>
        
        </div>
        
        <div class="top_banner_box">
        
            <div class="shop_list_box">
            
                <div class="rheader">
                
                    <em></em>
                    <a href="#">更多 &gt;&gt;</a>
                
                </div>
                
                <ul class="shop_list">
<c:forEach var="goods" items="${promoteGoodsList}">
    <li>
        <div class="img">
            <div class="time">
                <b></b><i class="n0"></i><i class="n0"></i><em></em><i class="n0"></i><i class="n0"></i><em></em><i class="n0"></i><i class="n0"></i><u></u><i class="n0"></i>
            </div>
            <a href="/product?pid=${goods.goods_id}" target="_blank"><img src="/ecimage/${goods.goods_thumb}" alt="" /></a>
        </div>
        
        <div class="flag">
            <div class="l_green">限时</div>
            <div class="c_green">买就送</div>
            <div class="r_green">折上折</div>
        </div>
        <p class="name"><a href="/product?pid=${goods.goods_id}" target="_blank">${goods_name}</a></p>
        <p class="price">￥${goods.promote_price}<span>￥${goods.market_price}</span></p>
        <p class="share">分享品友,享金￥<b>10.00</b></p>
    </li>
</c:forEach>
                
                </ul>
            
            </div>
            
            <div class="active_banner_box">
            
                <div class="header">
                
                    <h3>精彩活动</h3>
                    <a href="#">查看更多活动 &gt;&gt;</a>
                
                </div>
                
                <div class="banner">
                
                    <p><a href="#"><img src="/images/mall/photo/banner01.png" alt="" /></a></p>
                    <p><a href="#"><img src="/images/mall/photo/banner02.png" alt="" /></a></p>
                    <p><a href="#"><img src="/images/mall/photo/banner03.png" alt="" /></a></p>
                
                </div>
            
            </div>
        
        </div>
        
        <div class="shop_list_box">
            
            <div class="header">
            
                <em></em>
            
            </div>
            
            <dl class="nav_tab" id="hotgoods_nav">
            	<dd class="current"><a href="javascript:void(0);" onclick="showHotGoods(this,0);">全部</a></dd>
<c:forEach var="cate" items="${cateTree}">
	<dt>|</dt>
	<dd><a href="javascript:void(0);" onclick="showHotGoods(this,${cate.cat_id});">${cate.cat_name}</a></dd>
</c:forEach>
            </dl>

<ol class="shop_list" id="hotgoods_0" psftype="hotgoods">
	<c:forEach var="goods" items="${hotGoodsList}">
		<c:if test="${goods.cat_id==0}">
		<li>
			<div class="img">
				<span class="discount"></span>
			    <a href="/product?pid=${goods.goods_id}" target="_blank"><img src="/ecimage/${goods.goods_thumb}" alt="" /></a>
			</div>
			<div class="flag">
			    <em class="r">就爱拼</em>
			</div>
			<p class="name"><a href="/product?pid=${goods.goods_id}" target="_blank">${goods.goods_name}</a></p>
			<p class="price">￥${goods.shop_price}<span>￥${goods.market_price}</span></p>
			<p class="share">分享品友,享金￥<b>10.00</b></p>
	 	</li>
		</c:if>
	</c:forEach>
</ol>
<c:forEach var="cate" items="${cateTree}">  
<ol class="shop_list" style="display:none;" id="hotgoods_${cate.cat_id}" psftype="hotgoods">
	<c:forEach var="goods" items="${hotGoodsList}">
		<c:forEach var="child_cat_id" items="${cate.top_children_id}">
			<c:if test="${goods.cat_id==child_cat_id}">
			<li>
				<div class="img">
					<span class="discount"></span>
				    <a href="#"><img src="/ecimage/${goods.goods_thumb}" alt="" /></a>
				</div>
				<div class="flag">
				    <em class="r">就爱拼</em>
				</div>
				<p class="name"><a href="#">${goods.goods_name}</a></p>
				<p class="price">￥${goods.shop_price}<span>￥${goods.market_price}</span></p>
				<p class="share">分享品友,享金￥<b>10.00</b></p>
		 	</li>
			</c:if>
		</c:forEach>
	  
	</c:forEach>      
</ol>
</c:forEach>  


            <div class="more"><a href="#">更多的 &gt;&gt;</a></div>
            
        </div>
        
        <div class="mall_list_box">
        	<ul class="tab" id="hot_post_tab">
            	<li class="current"><a class="show" onclick="showHotPost(this,'show');" href="javascript:void(0);"></a></li>
                <li><a class="exp" onclick="showHotPost(this,'exp');" href="javascript:void(0);"></a></li>
                <li><a class="guide" onclick="showHotPost(this,'guide');" href="javascript:void(0);"></a></li>
            </ul>
            
            <div class="listbox" id="hot_post_show" psftype="hot_post">
            
            	<div class="header">
                
                	<h3><a class="current" href="#">最热</a> <a href="#">最新</a></h3>
                    <a href="#">更多的 &gt;&gt;</a>
                
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


			<div class="listbox" id="hot_post_exp" style="display:none;" psftype="hot_post">
            
            	<div class="header">
                
                	<h3><a class="current" href="#">最热</a> <a href="#">最新</a></h3>
                    <a href="#">更多的 &gt;&gt;</a>
                
                </div>
                
                <ul class="exp_list">
                
                	<li>
                    
                    	<dl>
                        
                        	<dt><a href="#"><img src="/images/mall/photo/photo02.png" alt="" /></a></dt>
                            <dd>
                            
                            	<h3><a href="#">我的包包</a></h3>
                                <p class="price">
                                	<b>￥25.00</b>
                                    享金<strong>￥25.00</strong>
                                </p>
                                <div class="info">
                                
                                	<a class="avatar" href="#"><img src="/images/mall/photo/photo03.png" alt="" /></a>
                                    此次发放的礼品卡为达人店铺专用卡,需要在达人店铺中购买产品才能使用,但不限只在我的小店中购买哦!此次发放的礼品卡为达人店铺......
                                
                                </div>
                                <p><a href="#">品论(12345)</a></p>
                                <p class="bottom"><a href="#">见详情&gt;&gt;</a></p>
                            
                            </dd>
                        
                        </dl>
                    
                    </li>
                    
                    <li>
                    
                    	<dl>
                        
                        	<dt><a href="#"><img src="/images/mall/photo/photo02.png" alt="" /></a></dt>
                            <dd>
                            
                            	<h3><a href="#">我的包包</a></h3>
                                <p class="price">
                                	<b>￥25.00</b>
                                    享金<strong>￥25.00</strong>
                                </p>
                                <div class="info">
                                
                                	<a class="avatar" href="#"><img src="/images/mall/photo/photo03.png" alt="" /></a>
                                    此次发放的礼品卡为达人店铺专用卡,需要在达人店铺中购买产品才能使用,但不限只在我的小店中购买哦!此次发放的礼品卡为达人店铺......
                                
                                </div>
                                <p><a href="#">品论(12345)</a></p>
                                <p class="bottom"><a href="#">见详情&gt;&gt;</a></p>
                            
                            </dd>
                        
                        </dl>
                    
                    </li>
                    
                    <li>
                    
                    	<dl>
                        
                        	<dt><a href="#"><img src="/images/mall/photo/photo02.png" alt="" /></a></dt>
                            <dd>
                            
                            	<h3><a href="#">我的包包</a></h3>
                                <p class="price">
                                	<b>￥25.00</b>
                                    享金<strong>￥25.00</strong>
                                </p>
                                <div class="info">
                                
                                	<a class="avatar" href="#"><img src="/images/mall/photo/photo03.png" alt="" /></a>
                                    此次发放的礼品卡为达人店铺专用卡,需要在达人店铺中购买产品才能使用,但不限只在我的小店中购买哦!此次发放的礼品卡为达人店铺......
                                
                                </div>
                                <p><a href="#">品论(12345)</a></p>
                                <p class="bottom"><a href="#">见详情&gt;&gt;</a></p>
                            
                            </dd>
                        
                        </dl>
                    
                    </li>
                    
                    <li>
                    
                    	<dl>
                        
                        	<dt><a href="#"><img src="/images/mall/photo/photo02.png" alt="" /></a></dt>
                            <dd>
                            
                            	<h3><a href="#">我的包包</a></h3>
                                <p class="price">
                                	<b>￥25.00</b>
                                    享金<strong>￥25.00</strong>
                                </p>
                                <div class="info">
                                
                                	<a class="avatar" href="#"><img src="/images/mall/photo/photo03.png" alt="" /></a>
                                    此次发放的礼品卡为达人店铺专用卡,需要在达人店铺中购买产品才能使用,但不限只在我的小店中购买哦!此次发放的礼品卡为达人店铺......
                                
                                </div>
                                <p><a href="#">品论(12345)</a></p>
                                <p class="bottom"><a href="#">见详情&gt;&gt;</a></p>
                            
                            </dd>
                        
                        </dl>
                    
                    </li>
                    
                    <li>
                    
                    	<dl>
                        
                        	<dt><a href="#"><img src="/images/mall/photo/photo02.png" alt="" /></a></dt>
                            <dd>
                            
                            	<h3><a href="#">我的包包</a></h3>
                                <p class="price">
                                	<b>￥25.00</b>
                                    享金<strong>￥25.00</strong>
                                </p>
                                <div class="info">
                                
                                	<a class="avatar" href="#"><img src="/images/mall/photo/photo03.png" alt="" /></a>
                                    此次发放的礼品卡为达人店铺专用卡,需要在达人店铺中购买产品才能使用,但不限只在我的小店中购买哦!此次发放的礼品卡为达人店铺......
                                
                                </div>
                                <p><a href="#">品论(12345)</a></p>
                                <p class="bottom"><a href="#">见详情&gt;&gt;</a></p>
                            
                            </dd>
                        
                        </dl>
                    
                    </li>
                    
                    <li>
                    
                    	<dl>
                        
                        	<dt><a href="#"><img src="/images/mall/photo/photo02.png" alt="" /></a></dt>
                            <dd>
                            
                            	<h3><a href="#">我的包包</a></h3>
                                <p class="price">
                                	<b>￥25.00</b>
                                    享金<strong>￥25.00</strong>
                                </p>
                                <div class="info">
                                
                                	<a class="avatar" href="#"><img src="/images/mall/photo/photo03.png" alt="" /></a>
                                    此次发放的礼品卡为达人店铺专用卡,需要在达人店铺中购买产品才能使用,但不限只在我的小店中购买哦!此次发放的礼品卡为达人店铺......
                                
                                </div>
                                <p><a href="#">品论(12345)</a></p>
                                <p class="bottom"><a href="#">见详情&gt;&gt;</a></p>
                            
                            </dd>
                        
                        </dl>
                    
                    </li>
                    
                    <li>

                    
                    	<dl>
                        
                        	<dt><a href="#"><img src="/images/mall/photo/photo02.png" alt="" /></a></dt>
                            <dd>
                            
                            	<h3><a href="#">我的包包</a></h3>
                                <p class="price">
                                	<b>￥25.00</b>
                                    享金<strong>￥25.00</strong>
                                </p>
                                <div class="info">
                                
                                	<a class="avatar" href="#"><img src="/images/mall/photo/photo03.png" alt="" /></a>
                                    此次发放的礼品卡为达人店铺专用卡,需要在达人店铺中购买产品才能使用,但不限只在我的小店中购买哦!此次发放的礼品卡为达人店铺......
                                
                                </div>
                                <p><a href="#">品论(12345)</a></p>
                                <p class="bottom"><a href="#">见详情&gt;&gt;</a></p>
                            
                            </dd>
                        
                        </dl>
                    
                    </li>
                
                </ul>
            
            </div>

			<div class="listbox" id="hot_post_guide" style="display:none;" psftype="hot_post">
            
            	<div class="header">
                
                	<h3><a class="current" href="#">最热</a> <a href="#">最新</a></h3>
                    <a href="#">更多的 &gt;&gt;</a>
                
                </div>
                
                <ul class="guide_list">
                
                	<li>
                    
                    	<dl>
                        
                        	<dd class="flag">
                            
                            	<a class="activeflag activeflag-green" href="#">相关品牌</a>
                                <p><a href="#"><img src="/images/mall/photo/logo01.png" alt="" /></a></p>
                                <p><a href="#"><img src="/images/mall/photo/logo01.png" alt="" /></a></p>
                                <p><a href="#"><img src="/images/mall/photo/logo01.png" alt="" /></a></p>
                            
                            </dd>
                            
                            <dd>
                            
                            	<h6><a href="#">真丝围巾的八种用法(球鞋/女装)</a></h6>
                                <div class="info">
                                
                                	<a class="avatar" href="#"><img src="/images/mall/photo/photo03.png" alt="" /></a>
                                    此次发放的礼品卡为达人店铺专用卡,需要在达人店铺中购买产品才能使用,但不限只在我的小店中购买哦!此次发放的礼品卡为达人店铺...
                                
                                </div>
                                <p><a href="#">品论(12345)</a></p>
                                <p class="bottom"><a href="#">见详情&gt;&gt;</a></p>	
                            
                            </dd>
                        
                        </dl>
                    
                    </li>
                    
                    <li>
                    
                    	<dl>
                        
                        	<dd class="flag">
                            
                            	<a class="activeflag activeflag-green" href="#">相关品牌</a>
                                <p><a href="#"><img src="/images/mall/photo/logo01.png" alt="" /></a></p>
                                <p><a href="#"><img src="/images/mall/photo/logo01.png" alt="" /></a></p>
                                <p><a href="#"><img src="/images/mall/photo/logo01.png" alt="" /></a></p>
                            
                            </dd>
                            
                            <dd>
                            
                            	<h6><a href="#">真丝围巾的八种用法(球鞋/女装)</a></h6>
                                <div class="info">
                                
                                	<a class="avatar" href="#"><img src="/images/mall/photo/photo03.png" alt="" /></a>
                                    此次发放的礼品卡为达人店铺专用卡,需要在达人店铺中购买产品才能使用,但不限只在我的小店中购买哦!此次发放的礼品卡为达人店铺...
                                
                                </div>
                                <p><a href="#">品论(12345)</a></p>
                                <p class="bottom"><a href="#">见详情&gt;&gt;</a></p>	
                            
                            </dd>
                        
                        </dl>
                    
                    </li>
                    
                    <li>
                    
                    	<dl>
                        
                        	<dd class="flag">
                            
                            	<a class="activeflag activeflag-green" href="#">相关品牌</a>
                                <p><a href="#"><img src="/images/mall/photo/logo01.png" alt="" /></a></p>
                                <p><a href="#"><img src="/images/mall/photo/logo01.png" alt="" /></a></p>
                                <p><a href="#"><img src="/images/mall/photo/logo01.png" alt="" /></a></p>
                            
                            </dd>
                            
                            <dd>
                            
                            	<h6><a href="#">真丝围巾的八种用法(球鞋/女装)</a></h6>
                                <div class="info">
                                
                                	<a class="avatar" href="#"><img src="/images/mall/photo/photo03.png" alt="" /></a>
                                    此次发放的礼品卡为达人店铺专用卡,需要在达人店铺中购买产品才能使用,但不限只在我的小店中购买哦!此次发放的礼品卡为达人店铺...
                                
                                </div>
                                <p><a href="#">品论(12345)</a></p>
                                <p class="bottom"><a href="#">见详情&gt;&gt;</a></p>	
                            
                            </dd>
                        
                        </dl>
                    
                    </li>
                    <li>
                    
                    	<dl>
                        
                        	<dd class="flag">
                            
                            	<a class="activeflag activeflag-green" href="#">相关品牌</a>
                                <p><a href="#"><img src="/images/mall/photo/logo01.png" alt="" /></a></p>
                                <p><a href="#"><img src="/images/mall/photo/logo01.png" alt="" /></a></p>
                                <p><a href="#"><img src="/images/mall/photo/logo01.png" alt="" /></a></p>
                            
                            </dd>
                            
                            <dd>
                            
                            	<h6><a href="#">真丝围巾的八种用法(球鞋/女装)</a></h6>
                                <div class="info">
                                
                                	<a class="avatar" href="#"><img src="/images/mall/photo/photo03.png" alt="" /></a>
                                    此次发放的礼品卡为达人店铺专用卡,需要在达人店铺中购买产品才能使用,但不限只在我的小店中购买哦!此次发放的礼品卡为达人店铺...
                                
                                </div>
                                <p><a href="#">品论(12345)</a></p>
                                <p class="bottom"><a href="#">见详情&gt;&gt;</a></p>	
                            
                            </dd>
                        
                        </dl>
                    
                    </li>
                    
                    <li>
                    
                    	<dl>
                        
                        	<dd class="flag">
                            
                            	<a class="activeflag activeflag-green" href="#">相关品牌</a>
                                <p><a href="#"><img src="/images/mall/photo/logo01.png" alt="" /></a></p>
                                <p><a href="#"><img src="/images/mall/photo/logo01.png" alt="" /></a></p>
                                <p><a href="#"><img src="/images/mall/photo/logo01.png" alt="" /></a></p>
                            
                            </dd>
                            
                            <dd>
                            
                            	<h6><a href="#">真丝围巾的八种用法(球鞋/女装)</a></h6>
                                <div class="info">
                                
                                	<a class="avatar" href="#"><img src="/images/mall/photo/photo03.png" alt="" /></a>
                                    此次发放的礼品卡为达人店铺专用卡,需要在达人店铺中购买产品才能使用,但不限只在我的小店中购买哦!此次发放的礼品卡为达人店铺...
                                
                                </div>
                                <p><a href="#">品论(12345)</a></p>
                                <p class="bottom"><a href="#">见详情&gt;&gt;</a></p>	
                            
                            </dd>
                        
                        </dl>
                    
                    </li>
                    
                    <li>
                    
                    	<dl>
                        
                        	<dd class="flag">
                            
                            	<a class="activeflag activeflag-green" href="#">相关品牌</a>
                                <p><a href="#"><img src="/images/mall/photo/logo01.png" alt="" /></a></p>
                                <p><a href="#"><img src="/images/mall/photo/logo01.png" alt="" /></a></p>
                                <p><a href="#"><img src="/images/mall/photo/logo01.png" alt="" /></a></p>
                            
                            </dd>
                            
                            <dd>
                            
                            	<h6><a href="#">真丝围巾的八种用法(球鞋/女装)</a></h6>
                                <div class="info">
                                
                                	<a class="avatar" href="#"><img src="/images/mall/photo/photo03.png" alt="" /></a>
                                    此次发放的礼品卡为达人店铺专用卡,需要在达人店铺中购买产品才能使用,但不限只在我的小店中购买哦!此次发放的礼品卡为达人店铺...
                                
                                </div>
                                <p><a href="#">品论(12345)</a></p>
                                <p class="bottom"><a href="#">见详情&gt;&gt;</a></p>	
                            
                            </dd>
                        
                        </dl>
                    
                    </li>
                    <li>
                    
                    	<dl>
                        
                        	<dd class="flag">
                            
                            	<a class="activeflag activeflag-green" href="#">相关品牌</a>
                                <p><a href="#"><img src="/images/mall/photo/logo01.png" alt="" /></a></p>
                                <p><a href="#"><img src="/images/mall/photo/logo01.png" alt="" /></a></p>
                                <p><a href="#"><img src="/images/mall/photo/logo01.png" alt="" /></a></p>
                            
                            </dd>
                            
                            <dd>
                            
                            	<h6><a href="#">真丝围巾的八种用法(球鞋/女装)</a></h6>
                                <div class="info">
                                
                                	<a class="avatar" href="#"><img src="/images/mall/photo/photo03.png" alt="" /></a>
                                    此次发放的礼品卡为达人店铺专用卡,需要在达人店铺中购买产品才能使用,但不限只在我的小店中购买哦!此次发放的礼品卡为达人店铺...
                                
                                </div>
                                <p><a href="#">品论(12345)</a></p>
                                <p class="bottom"><a href="#">见详情&gt;&gt;</a></p>	
                            
                            </dd>
                        
                        </dl>
                    
                    </li>
                    
                    <li>
                    
                    	<dl>
                        
                        	<dd class="flag">
                            
                            	<a class="activeflag activeflag-green" href="#">相关品牌</a>
                                <p><a href="#"><img src="/images/mall/photo/logo01.png" alt="" /></a></p>
                                <p><a href="#"><img src="/images/mall/photo/logo01.png" alt="" /></a></p>
                                <p><a href="#"><img src="/images/mall/photo/logo01.png" alt="" /></a></p>
                            
                            </dd>
                            
                            <dd>
                            
                            	<h6><a href="#">真丝围巾的八种用法(球鞋/女装)</a></h6>
                                <div class="info">
                                
                                	<a class="avatar" href="#"><img src="/images/mall/photo/photo03.png" alt="" /></a>
                                    此次发放的礼品卡为达人店铺专用卡,需要在达人店铺中购买产品才能使用,但不限只在我的小店中购买哦!此次发放的礼品卡为达人店铺...
                                
                                </div>
                                <p><a href="#">品论(12345)</a></p>
                                <p class="bottom"><a href="#">见详情&gt;&gt;</a></p>	
                            
                            </dd>
                        
                        </dl>
                    
                    </li>
                    
                    <li>
                    
                    	<dl>
                        
                        	<dd class="flag">
                            
                            	<a class="activeflag activeflag-green" href="#">相关品牌</a>
                                <p><a href="#"><img src="/images/mall/photo/logo01.png" alt="" /></a></p>
                                <p><a href="#"><img src="/images/mall/photo/logo01.png" alt="" /></a></p>
                                <p><a href="#"><img src="/images/mall/photo/logo01.png" alt="" /></a></p>
                            
                            </dd>
                            
                            <dd>
                            
                            	<h6><a href="#">真丝围巾的八种用法(球鞋/女装)</a></h6>
                                <div class="info">
                                
                                	<a class="avatar" href="#"><img src="/images/mall/photo/photo03.png" alt="" /></a>
                                    此次发放的礼品卡为达人店铺专用卡,需要在达人店铺中购买产品才能使用,但不限只在我的小店中购买哦!此次发放的礼品卡为达人店铺...
                                
                                </div>
                                <p><a href="#">品论(12345)</a></p>
                                <p class="bottom"><a href="#">见详情&gt;&gt;</a></p>	
                            
                            </dd>
                        
                        </dl>
                    
                    </li>	
                
                </ul>
            
            </div>
        
        </div>
        
        
        
        <div class="shop_list_box rows">
        
        	<div class="header"><em class="fresh"></em></div>
            
            <div class="free_shopbox">
            
                <div class="free_shopnav">
                
                    <em></em>
                    <div class="link">
                        <a href="#">热销</a> | <a href="#">最新商品</a> | <a href="#">T血</a> | <a href="#">衬衫</a> | <a href="#">针织衫</a> | <a href="#">牛仔裤</a> | <a href="#">西装</a> | <a href="#">时装裤</a> | <a href="#">裙裤</a> | <a href="#">毛衣</a> | <a href="#">大衣</a>
                    </div>
                    <p><a href="#">更多的 &gt;&gt;</a></p>
                
                </div>

                <div class="free_shopnav">
                
                    <em class="man"></em>
                    <div class="link">
                        <a href="#">热销</a> | <a href="#">最新商品</a> | <a href="#">T血</a> | <a href="#">衬衫</a> | <a href="#">针织衫</a> | <a href="#">牛仔裤</a> | <a href="#">西装</a> | <a href="#">时装裤</a> | <a href="#">裙裤</a> | <a href="#">毛衣</a> | <a href="#">大衣</a>
                    </div>
                    <p><a href="#">更多的 &gt;&gt;</a></p>
                
                </div>
                
                <div class="free_main">
                
                	<div class="box">
                    
                    	<div class="bigimg">
                        	<a href="#"><img src="/images/mall/photo/photo04.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo05.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo06.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo07.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo08.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo09.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo10.png" alt="" /></a>
                        </div>
                    
                    </div>
                    
                    <div class="box">
                    
                    	<div class="bigimg">
                        	<a href="#"><img src="/images/mall/photo/photo04.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo05.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo06.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo07.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo08.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo09.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo10.png" alt="" /></a>
                        </div>
                    
                    </div>
                
                </div>
            
            </div>
            
            <div class="sperator"></div>
            
            <div class="free_shopbox">
            
                <div class="free_shopnav">
                
                    <em class="huazhuang"></em>
                    <div class="link">
                        <a href="#">热销</a> | <a href="#">最新商品</a> | <a href="#">T血</a> | <a href="#">衬衫</a> | <a href="#">针织衫</a> | <a href="#">牛仔裤</a> | <a href="#">西装</a> | <a href="#">时装裤</a> | <a href="#">裙裤</a> | <a href="#">毛衣</a> | <a href="#">大衣</a>
                    </div>
                    <p><a href="#">更多的 &gt;&gt;</a></p>
                
                </div>

                <div class="free_shopnav">
                
                    <em class="sport"></em>
                    <div class="link">
                        <a href="#">热销</a> | <a href="#">最新商品</a> | <a href="#">T血</a> | <a href="#">衬衫</a> | <a href="#">针织衫</a> | <a href="#">牛仔裤</a> | <a href="#">西装</a> | <a href="#">时装裤</a> | <a href="#">裙裤</a> | <a href="#">毛衣</a> | <a href="#">大衣</a>
                    </div>
                    <p><a href="#">更多的 &gt;&gt;</a></p>
                
                </div>
                
                <div class="free_main">
                
                	<div class="box">
                    
                    	<div class="bigimg">
                        	<a href="#"><img src="/images/mall/photo/photo04.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo05.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo06.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo07.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo08.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo09.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo10.png" alt="" /></a>
                        </div>
                    
                    </div>
                    
                    <div class="box">
                    
                    	<div class="bigimg">
                        	<a href="#"><img src="/images/mall/photo/photo04.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo05.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo06.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo07.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo08.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo09.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo10.png" alt="" /></a>
                        </div>
                    
                    </div>
                
                </div>
            
            </div>
            
            <div class="sperator"></div>
            
            <div class="free_shopbox">
            
                <div class="free_shopnav">
                
                    <em class="package"></em>
                    <div class="link">
                        <a href="#">热销</a> | <a href="#">最新商品</a> | <a href="#">T血</a> | <a href="#">衬衫</a> | <a href="#">针织衫</a> | <a href="#">牛仔裤</a> | <a href="#">西装</a> | <a href="#">时装裤</a> | <a href="#">裙裤</a> | <a href="#">毛衣</a> | <a href="#">大衣</a>
                    </div>
                    <p><a href="#">更多的 &gt;&gt;</a></p>
                
                </div>

                <div class="free_shopnav">
                
                    <em class="tele"></em>
                    <div class="link">
                        <a href="#">热销</a> | <a href="#">最新商品</a> | <a href="#">T血</a> | <a href="#">衬衫</a> | <a href="#">针织衫</a> | <a href="#">牛仔裤</a> | <a href="#">西装</a> | <a href="#">时装裤</a> | <a href="#">裙裤</a> | <a href="#">毛衣</a> | <a href="#">大衣</a>
                    </div>
                    <p><a href="#">更多的 &gt;&gt;</a></p>
                
                </div>
                
                <div class="free_main">
                
                	<div class="box">
                    
                    	<div class="bigimg">
                        	<a href="#"><img src="/images/mall/photo/photo04.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo05.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo06.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo07.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo08.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo09.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo10.png" alt="" /></a>
                        </div>
                    
                    </div>
                    
                    <div class="box">
                    
                    	<div class="bigimg">
                        	<a href="#"><img src="/images/mall/photo/photo04.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo05.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo06.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo07.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo08.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo09.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo10.png" alt="" /></a>
                        </div>
                    
                    </div>
                
                </div>
            
            </div>
            
            <div class="sperator"></div>
            
            <div class="free_shopbox">
            
                <div class="free_shopnav">
                
                    <em class="baby"></em>
                    <div class="link">
                        <a href="#">热销</a> | <a href="#">最新商品</a> | <a href="#">T血</a> | <a href="#">衬衫</a> | <a href="#">针织衫</a> | <a href="#">牛仔裤</a> | <a href="#">西装</a> | <a href="#">时装裤</a> | <a href="#">裙裤</a> | <a href="#">毛衣</a> | <a href="#">大衣</a>
                    </div>
                    <p><a href="#">更多的 &gt;&gt;</a></p>
                
                </div>

                <div class="free_shopnav">
                
                    <em class="food"></em>
                    <div class="link">
                        <a href="#">热销</a> | <a href="#">最新商品</a> | <a href="#">T血</a> | <a href="#">衬衫</a> | <a href="#">针织衫</a> | <a href="#">牛仔裤</a> | <a href="#">西装</a> | <a href="#">时装裤</a> | <a href="#">裙裤</a> | <a href="#">毛衣</a> | <a href="#">大衣</a>
                    </div>
                    <p><a href="#">更多的 &gt;&gt;</a></p>
                
                </div>
                
                <div class="free_main">
                
                	<div class="box">
                    
                    	<div class="bigimg">
                        	<a href="#"><img src="/images/mall/photo/photo04.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo05.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo06.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo07.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo08.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo09.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo10.png" alt="" /></a>
                        </div>
                    
                    </div>
                    
                    <div class="box">
                    
                    	<div class="bigimg">
                        	<a href="#"><img src="/images/mall/photo/photo04.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo05.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo06.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo07.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo08.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo09.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo10.png" alt="" /></a>
                        </div>
                    
                    </div>
                
                </div>
            
            </div>
            
            <div class="sperator"></div>
            
            <div class="free_shopbox">
            
                <div class="free_shopnav">
                
                    <em class="gift"></em>
                    <div class="link">
                        <a href="#">热销</a> | <a href="#">最新商品</a> | <a href="#">T血</a> | <a href="#">衬衫</a> | <a href="#">针织衫</a> | <a href="#">牛仔裤</a> | <a href="#">西装</a> | <a href="#">时装裤</a> | <a href="#">裙裤</a> | <a href="#">毛衣</a> | <a href="#">大衣</a>
                    </div>
                    <p><a href="#">更多的 &gt;&gt;</a></p>
                
                </div>

                <div class="free_shopnav">
                
                    <em class="furniture"></em>
                    <div class="link">
                        <a href="#">热销</a> | <a href="#">最新商品</a> | <a href="#">T血</a> | <a href="#">衬衫</a> | <a href="#">针织衫</a> | <a href="#">牛仔裤</a> | <a href="#">西装</a> | <a href="#">时装裤</a> | <a href="#">裙裤</a> | <a href="#">毛衣</a> | <a href="#">大衣</a>
                    </div>
                    <p><a href="#">更多的 &gt;&gt;</a></p>
                
                </div>
                
                <div class="free_main">
                
                	<div class="box">
                    
                    	<div class="bigimg">
                        	<a href="#"><img src="/images/mall/photo/photo04.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo05.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo06.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo07.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo08.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo09.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo10.png" alt="" /></a>
                        </div>
                    
                    </div>
                    
                    <div class="box">
                    
                    	<div class="bigimg">
                        	<a href="#"><img src="/images/mall/photo/photo04.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo05.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo06.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo07.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo08.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo09.png" alt="" /></a>
                        </div>
                        
                        <div class="img">
                        	<a href="#"><img src="/images/mall/photo/photo10.png" alt="" /></a>
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