<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>${pageTitle}</title>
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
    	<psf:include page="/mall/header.jsp"/>
    	<psf:include page="/mall/search.jsp"/>
    </div>

    <div id="main">
        <!--品上商城促销商品页-->
        <div class="rows_content rows">
        	<div class="sidebar">
            	<div class="sortlist rows">
                    <h3 class="header">商品分类</h3>
<dl>
	<dt><a href="/list?cateid=${currCate.cat_id}"><b>${currCate.cat_name }</b></a></dt>
    <dd>
    <c:forEach var="c0" items="${currCate.children }">
    	<p><a href="/list?cateid=${c0.cat_id}">${c0.cat_name}</a></p>
    </c:forEach>
    </dd>
    
    <c:forEach var="c1" items="${brotherCateList}">
    	<dt><a href="/list?cateid=${c1.cat_id}"><b>${c1.cat_name}</b></a></dt>
    </c:forEach>
</dl>
                </div>
                
                <div class="shop_side_box rows">
                	<div class="header">
                        <h3>热卖商品</h3>
                    </div>
                
                	<ul>
                		<li>
                        	<div class="img"><a href="#"><img src="/images/mall/photo/photo08.png" alt="" /></a></div>
                            <p class="name"><a href="#">日立2.5寸500G移动硬盘坚固耐久便于扔带</a></p>
                            <p class="price">￥199 <span>￥499</span></p>   
                        </li>
                        
                        <li>
                        	<div class="img"><a href="#"><img src="/images/mall/photo/photo08.png" alt="" /></a></div>
                            <p class="name"><a href="#">日立2.5寸500G移动硬盘坚固耐久便于扔带</a></p>
                            <p class="price">￥199 <span>￥499</span></p>   
                        </li>
                        
                        <li>
                        	<div class="img"><a href="#"><img src="/images/mall/photo/photo08.png" alt="" /></a></div>
                            <p class="name"><a href="#">日立2.5寸500G移动硬盘坚固耐久便于扔带</a></p>
                            <p class="price">￥199 <span>￥499</span></p>   
                        </li>
                        
                    </ul>
                    <p class="more"><a href="#">更多的 &gt;&gt;</a></p>
                </div>
                
                <div class="active_banner_box rows">
                	<div class="header">
                        <h3>商家活动</h3>
                    </div>
                    <div class="banner">
                    	<p><a href="#"><img src="/images/mall/photo/banner10.png" alt="" /></a></p>
                        <p><a href="#"><img src="/images/mall/photo/banner11.png" alt="" /></a></p>
                        <p><a href="#"><img src="/images/mall/photo/banner12.png" alt="" /></a></p>
                        <p><a href="#"><img src="/images/mall/photo/banner13.png" alt="" /></a></p>
                        <p><a href="#"><img src="/images/mall/photo/banner14.png" alt="" /></a></p>
                    </div>
                </div>
                
                <div class="shop_side_box">
                	<div class="header">
                        <h3>浏览历史</h3>
                    </div>
                
                	<ul>
                		<li>
                        	<div class="img"><a href="#"><img src="/images/mall/photo/photo08.png" alt="" /></a></div>
                            <p class="name"><a href="#">日立2.5寸500G移动硬盘坚固耐久便于扔带</a></p>
                            <p class="price">￥199 <span>￥499</span></p>   
                        </li>
                        
                        <li>
                        	<div class="img"><a href="#"><img src="/images/mall/photo/photo08.png" alt="" /></a></div>
                            <p class="name"><a href="#">日立2.5寸500G移动硬盘坚固耐久便于扔带</a></p>
                            <p class="price">￥199 <span>￥499</span></p>   
                        </li>
                    </ul>
                </div>
            </div>
            
            <div class="r_content">
            	<div class="pathbox">
                	${cateNav}
                </div>
                
                <div class="shop_filter rows">
                	<h3>商品筛选</h3>
                	<c:if test="${brandFilter!=null}">
                    <dl>
                    	<dt>品牌：</dt>
                        <dd>
                        	<ul>${brandFilter}</ul>
                        </dd>
                    </dl>
                    </c:if>
                    <c:if test="${priceFilter!=null}">
                    <dl>
                    	<dt>价格：</dt>
                        <dd>
                        	<ul>${priceFilter}</ul>
                        </dd>
                    </dl>
                    </c:if>
                    
                    <c:forEach var="attr" items="${attrHtmlFilterList}">
                    <dl>
                    	<dt>${attr.attr_name}：</dt>
                        <dd>
                        	<ul>${attr.html}</ul>
                        </dd>
                    </dl>
                    </c:forEach>
                    
                </div>
                
                
                
                <!--div class="mall_kw_prompt rows">
                	您是不是想找：
                    <span><a href="#">男士风衣</a> | <a href="#">女装风衣</a> | <a href="#">男装风衣</a> | <a href="#">大码风衣</a> | <a href="#">外套风衣</a> | <a href="#">外套风衣</a> | <a href="#">男款风衣</a> | <a href="#">红色风衣</a> | <a href="#">韩版风衣</a></span>
                </div-->

                <div class="shop_filter_list_box rows">
                	<div class="filter">
                    	<dl class="toolbar">
                        	<dt>
                            	<a href="#" class="list">列表</a>
                                <a href="#" class="browse">浏览</a>
                            </dt>
                        
                        	<dd>
                                <b>排序：</b>
<c:if test="${listOrder==0}">
	<a href="${salesOrderLink}" class="current">销量<em class="down"></em></a>
	<a href="${priceOrderLink}">价格</a>
</c:if>
<c:if test="${listOrder==1}">
	<a href="${salesOrderLink}" class="current">销量<em></em></a>
	<a href="${priceOrderLink}">价格</a>
</c:if>
<c:if test="${listOrder==2}">
	<a href="${salesOrderLink}">销量</a>
	<a href="${priceOrderLink}" class="current">价格<em class="down"></em></a>
</c:if>
<c:if test="${listOrder==3}">
	<a href="${salesOrderLink}">销量</a>
	<a href="${priceOrderLink}" class="current">价格<em></em></a>
</c:if>
                                <!--a href="#">最新开始<em class="down"></em></a>
                                <a href="#">即将结束<em class="down"></em></a-->
                            </dd>
                        </dl>
                    </div>
                    
<ul class="shop_list">
<c:forEach var="g" items="${goodsList}">
    <li>
        <div class="img">
            <!--div class="time">
                <b></b><i class="n0"></i><i class="n0"></i><em></em><i class="n0"></i><i class="n0"></i><em></em><i class="n0"></i><i class="n0"></i><u></u><i class="n0"></i>
            </div-->
            <a href="/product?pid=${g.goods_id}" target="_blank"><img src="/ecimage/${g.goods_thumb}" alt="" /></a>
        </div>
        
        <div class="flag">
            <!--div class="l_green">限时</div>
            <div class="c_green">买就送</div>
            <div class="r_green">折上折</div-->
        </div>
        <p class="name"><a href="/product?pid=${g.goods_id}" target="_blank">${g.goods_name}</a></p>
        <p class="price">￥${g.shop_price}<span>￥${g.market_price}</span></p>
        <!--p class="share">分享品友,享金￥<b>10.00</b></p-->
        <p class="share">分享品友,享金￥<b>10.00</b></p>
        <div class="btns">
            <a href="#"><em></em>喜欢</a>
            <a class="buy" href="#"><em></em>购买</a>
        </div>
    </li>
</c:forEach>
</ul>
<c:if test="${pageCount>1}">
	<psf:page pageCount="${pageCount}" href="${pageHref}&page=#page#" action="void(0)" page="${page}"></psf:page>
</c:if>
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