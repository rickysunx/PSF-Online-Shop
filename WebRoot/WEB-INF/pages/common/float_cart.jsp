<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<table cellpadding="0">
	<tr>
    	<th class="img"></th>
        <th class="name">商品名称</th>
        <!--th class="scope">积分</th-->
        <th class="price">单位（元）</th>
        <th class="num">数量</th>
        <!--th class="favor">优惠</th-->
        <th class="oper">操作</th>
    </tr>
    
    <c:forEach var="cg" items="${cartList}">
	    <tr>
	    	<td class="img">
	        	<a href="#"><img alt="" src="/ecimage/${cg.goods_thumb}" /></a>
	        </td>
	        <td class="name"><a href="/product?pid=${cg.pid}" target="_blank">${cg.goods_name}</a><!--span>颜色分类：</span>白色 <span>尺码：</span>35--></td>
	        <!--td class="scope">84</td-->
	        <td class="price">${cg.shop_price}</td>
	        <td class="num numInput">
	        	<a href="javascript:changeCartGoodsAmount(${cg.goods_id},'floatGoodsAmt_${cg.goods_id}',false,-1);" class="minus">-</a>
	        	<input id="floatGoodsAmt_${cg.goods_id}" name="goods_amount" value="${cg.pcount}" onchange="changeCartGoodsAmount(${cg.goods_id},'floatGoodsAmt_${cg.goods_id}',false);" />
	        	<a href="javascript:changeCartGoodsAmount(${cg.goods_id},'floatGoodsAmt_${cg.goods_id}',false,1);" class="add">+</a>
	        </td>
	        <!--td class="favor">168.00</td-->
	        <td class="oper">
	        	<p><a href="javascript:moveToLike(${cg.pid});">移入收藏</a></p>
	            <p><a href="javascript:removeFromCart(${cg.pid});">删除</a></p>
	        </td>
	    </tr>
   	</c:forEach>

</table>

<script type="text/javascript">
$("#shopCartCount").text(${goods_count});
</script>