<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<script type="text/javascript">
	$(document).ready(function() {
		if($("#floatProduct").length==0) {
			$("body").append("<div id='floatProduct' style='display:none;width:250px;height:410px;'></div>");
		}
		$.each($("*[psftype='product']"),function(i,n){
			$(n).psfDirectoryDialog({"contentid":"floatProduct","arrow":true,"arrowauto":false,"arrowdirection":"right","arrowpos":0},function(target){
				var pid = $(target).attr("pid");
				$("#floatProduct").html("<div style='text-align:center;'><img src='/images/loading.gif'></div>");
				$("#floatProduct").load("/action/sns/get_float_product",{"pid":pid});
			});
		})
	});
</script>

<div class="product_right_list">
	
	<c:if test="${empty products.list}">
		<div class="right_nodata">${message}</div>
	</c:if>
	
	<c:forEach items="${products.list}" var="product">
		<div class="product_right_item">
			<div class="product_right_pic">
				<a href="#" psftype="product" pid="${product.pid}"><img src="/ecimage/${product.goods_thumb}" title="${product.pname}"/></a>
			</div>
			<div class="product_right_name"><a>${product.pname}</a></div>
			<div class="product_right_price">
				<b>品上价</b>
				<span>￥${product.price}</span>
			</div>
		</div>
	</c:forEach>
	
	<div class="product_right_right_prev_and_next">
	<c:if test="${typeid < 8}">
		<psf:simplepage pageCount="${products.pageCount}" href="#index_tab" action="javascript:loadRecommend('${divid}',6,#page#,${typeid})" page="${page}"></psf:simplepage>	
	</c:if>
	<c:if test="${typeid eq 8}">
		<psf:simplepage pageCount="${products.pageCount}" href="#index_tab" action="javascript:loadRecommend('${divid}',6,#page#,${typeid},{'postid':${postid}})" page="${page}"></psf:simplepage>	
	</c:if>
	<c:if test="${typeid eq 9}">
		<psf:simplepage pageCount="${products.pageCount}" href="#index_tab" action="javascript:loadRecommend('${divid}',6,#page#,${typeid},{'uid':${uid}})" page="${page}"></psf:simplepage>	
	</c:if>
	</div>
	
</div>
