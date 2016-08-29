<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<div class="shop_popup" style="width:251px;border:0px;">

	<div class="shop_card_info">
                            
        <div class="img"><a href="#"><img src="/ecimage/${product.goods_img}" alt="" /></a></div>
        <h3><a>${product.pname}</a></h3>
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
            
            <div class="right">
            	<p><a href="#"><em></em><span>秀场</span>(<i>${product.showCount}</i>)</a></p>
                <p><a class="exp" href="#"><em></em><span>体验</span>(<i>${product.shopexpCount}</i>)</a></p>
            </div>
        
        </div>
        
        <div class="combox">
            <span>用户点评：</span>
            <span class="icons"><em></em><em></em><em></em><em class="no"></em><em class="no"></em></span>
        </div>
    
    </div>

</div>