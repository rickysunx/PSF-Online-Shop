<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!-- 秀场商品内容 -->

<div class="shop_list_box">
	<ul>
		<c:if test="${empty productlist}">
			<div class="post_no_data">没有相关数据哦，赶快去发布吧。</div>
		</c:if>
    	<c:forEach items="${productlist}" var="product" begin="0" step="3">
    	<li>
        	<div class="card_border">
            	<div class="b_m"><div class="b_l"><div class="b_r">
                	<div class="m_r"><div class="t_r"><div class="b_r">
                    	<div class="cardbox">
                    	
                        	<div class="shop_card_info">
                            	<div class="img"><a href="#"><img src="/pic/${product.picname}" alt="" /></a></div>
                                <h3><a href="#">${product.pname}</a></h3>
                                <div class="price">
                                	<p><b>品上价∶</b><strong>￥${product.price}</strong></p>
                                    <p>市场价∶<i>￥${product.price_market}</i></p>
                                </div>
                                
                                <div class="like_row">
                                	<div class="like">
                                    	<a href="#"></a>
                                        <div class="info">
                                        	<p class="num">${product.likecount}</p>
                                            <p>喜欢</p>
                                        </div>
                                    </div>
                                    <div class="right"><a href="#"><span>秀场</span>(<i>${product.showCount}</i>)</a></div>
                                </div>
                                
                                <div class="combox">
                                    <span>用户点评：</span>
                                    <span class="icons"><em></em><em></em><em></em><em class="no"></em><em class="no"></em></span>
                                </div>
                            
                            </div>
                        
                        </div>
                    
                    </div></div></div>
                </div></div></div>
            </div>
        </li>
        </c:forEach>
        <!-- 
        <li>
        	<div class="card_border">
            	<div class="b_m"><div class="b_l"><div class="b_r">
                	<div class="m_r"><div class="t_r"><div class="b_r">
                    
                    	<div class="cardbox">
                        
                        	<div class="shop_card_info">
                            	<div class="img"><a href="#"><img src="/images/sns/photo/photo62.png" alt="" /></a></div>
                                <h3><a href="#">时尚男士秋冬款式短裤万</a></h3>
                                <div class="price">
                                	<p><b>品上价∶</b><strong>￥135.00</strong></p>
                                    <p>市场价∶<i>￥475.00</i></p>
                                </div>
                                
                                <div class="like_row">
                                	<div class="like">
                                    	<a href="#"></a>
                                        <div class="info">
                                        	<p class="num">34578</p>
                                            <p>喜欢</p>
                                        </div>
                                    </div>
                                    <div class="right"><a href="#"><span>秀场</span>(<i>200</i>)</a></div>
                                </div>
                                
                                <div class="combox">
                                    <span>用户点评：</span>
                                    <span class="icons"><em></em><em></em><em></em><em class="no"></em><em class="no"></em></span>
                                </div>
                            
                            </div>
                        </div>
                    </div></div></div>
                </div></div></div>
            </div>
        </li>
         -->
    </ul>
    
    <ul>
    	<c:forEach items="${productlist}" var="product" begin="1" step="3">
    	<li>
        	<div class="card_border">
            	<div class="b_m"><div class="b_l"><div class="b_r">
                	<div class="m_r"><div class="t_r"><div class="b_r">
                    	<div class="cardbox">
                        	<div class="shop_card_info">
                            	<div class="img"><a href="#"><img src="/pic/${product.picname}" alt="" /></a></div>
                                <h3><a href="#">${product.pname}</a></h3>
                                <div class="price">
                                	<p><b>品上价∶</b><strong>￥${product.price}</strong></p>
                                    <p>市场价∶<i>￥${product.price_market}</i></p>
                                </div>
                                <div class="like_row">
                                	<div class="like">
                                    	<a href="#"></a>
                                        <div class="info">
                                        	<p class="num">${product.likecount}</p>
                                            <p>喜欢</p>
                                        </div>
                                    </div>
                                    <div class="right"><a href="#"><span>秀场</span>(<i>${product.showCount}</i>)</a></div>
                                </div>
                                
                                <div class="combox">
                                    <span>用户点评：</span>
                                    <span class="icons"><em></em><em></em><em></em><em class="no"></em><em class="no"></em></span>
                                </div>
                            
                            </div>
                        </div>
                    </div></div></div>
                </div></div></div>
            </div>
        </li>
        </c:forEach>
        <!--
        <li>
        	<div class="card_border">
            	<div class="b_m"><div class="b_l"><div class="b_r">
                	<div class="m_r"><div class="t_r"><div class="b_r">
                    	<div class="cardbox">
                        	<div class="shop_card_info">
                            
                            	<div class="img"><a href="#"><img src="/images/sns/photo/photo01.png" alt="" /></a></div>
                                <h3><a href="#">时尚男士秋冬款式短裤万</a></h3>
                                <div class="price">
                                	<p><b>品上价∶</b><strong>￥135.00</strong></p>
                                    <p>市场价∶<i>￥475.00</i></p>
                                </div>
                                
                                <div class="like_row">
                                	<div class="like">
                                    	<a href="#"></a>
                                        <div class="info">
                                        	<p class="num">34578</p>
                                            <p>喜欢</p>
                                        </div>
                                    </div>
                                    <div class="right"><a href="#"><span>秀场</span>(<i>200</i>)</a></div>
                                </div>
                                
                                <div class="combox">
                                    <span>用户点评：</span>
                                    <span class="icons"><em></em><em></em><em></em><em class="no"></em><em class="no"></em></span>
                                </div>
                            
                            </div>
                        </div>
                    </div></div></div>
                </div></div></div>
            </div>
        </li>
        -->
    </ul>
    
    <ul>
    	<c:forEach items="${productlist}" var="product" begin="2" step="3">
    	<li>
        	<div class="card_border">
            	<div class="b_m"><div class="b_l"><div class="b_r">
                	<div class="m_r"><div class="t_r"><div class="b_r">
                    	<div class="cardbox">
                        	<div class="shop_card_info">
                            	<div class="img"><a href="#"><img src="/pic/${product.picname}" alt="" /></a></div>
                                <h3><a href="#">${product.pname}</a></h3>
                                <div class="price">
                                	<p><b>品上价∶</b><strong>￥${product.price}</strong></p>
                                    <p>市场价∶<i>￥${product.price_market}</i></p>
                                </div>
                                <div class="like_row">
                                	<div class="like">
                                    	<a href="#"></a>
                                        <div class="info">
                                        	<p class="num">${product.likecount}</p>
                                            <p>喜欢</p>
                                        </div>
                                    </div>
                                    <div class="right"><a href="#"><span>秀场</span>(<i>${product.showCount}</i>)</a></div>
                                </div>
                                <div class="combox">
                                    <span>用户点评：</span>
                                    <span class="icons"><em></em><em></em><em></em><em class="no"></em><em class="no"></em></span>
                                </div>
                            </div>
                        </div>
                    </div></div></div>
                </div></div></div>
            </div>
        </li>
        </c:forEach>
        <!-- 
        <li>
        	<div class="card_border">
            	<div class="b_m"><div class="b_l"><div class="b_r">
                	<div class="m_r"><div class="t_r"><div class="b_r">
                    	<div class="cardbox">
                        	<div class="shop_card_info">
                            	<div class="img"><a href="#"><img src="/images/sns/photo/photo62.png" alt="" /></a></div>
                                <h3><a href="#">时尚男士秋冬款式短裤万</a></h3>
                                <div class="price">
                                	<p><b>品上价∶</b><strong>￥135.00</strong></p>
                                    <p>市场价∶<i>￥475.00</i></p>
                                </div>
                                
                                <div class="like_row">
                                	<div class="like">
                                    	<a href="#"></a>
                                        <div class="info">
                                        	<p class="num">34578</p>
                                            <p>喜欢</p>
                                        </div>
                                    </div>
                                    <div class="right"><a href="#"><span>秀场</span>(<i>200</i>)</a></div>
                                </div>
                                
                                <div class="combox">
                                    <span>用户点评：</span>
                                    <span class="icons"><em></em><em></em><em></em><em class="no"></em><em class="no"></em></span>
                                </div>
                            </div>
                        </div>
                    </div></div></div>
                </div></div></div>
            </div>
        </li>
        -->
    </ul>
</div>
<c:if test="${!empty productlist}">
	<psf:page pageCount="${pageCount}" page="${page}" href="#index_tab" action="javascript:loadPostProduct(-1,-1,null,#page#);"></psf:page>
</c:if>