<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<ul class="current">
	<li class="first">
		<div class="img">
	    	<img src="/ecimage/${goods.goods_thumb}" alt=""/>
	    </div>
	    <p>${goods.goods_name}</p>
	    <p class="price"><b>${goods.shop_price }</b></p>
	</li>
	<c:forEach var="g" items="${combineGoodsList}">
		<li psftype="combineBuyItem">
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

<script type="text/javascript">
	$("#combine_buy_prev").hide();
	$("#combine_buy_next").hide();
	<c:if test="${combineGoodsListPrev}">
		$("#combine_buy_prev").show();
		$("#combine_buy_prev").attr("href","javascript:refreshCombineBuyList("+${page-1}+");");
	</c:if>
	<c:if test="${combineGoodsListNext}">
		$("#combine_buy_next").show();
		$("#combine_buy_next").attr("href","javascript:refreshCombineBuyList("+${page+1}+");");
	</c:if>
	<c:forEach var="g" items="${combineGoodsList}">
		$.each($("#combine_buy_form > input"),function(i,o){
			if($(o).val()=="${g.goods_id}") {
				$("#combine_check_${g.goods_id}").attr("checked",true);
			}
		});
	</c:forEach>
	
</script>
