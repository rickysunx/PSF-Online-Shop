<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

	<dd>
		<ul class="s_clear">
			<c:forEach items="${selectedProduct.list}" var="product">
			<li>
				<div class="img imgborder01">
					<a class="brclose brclose_10" psftype="del_selected_product" pid="${product.pid}"></a>
					<a href="#"><img src="/pic/${product.goods_thumb}" alt="${product.pname}" /></a>
					<input type="hidden" name="pid" value="${product.pid}"/>
				</div>
				<p><a href="#">${product.pname}</a></p>
			</li>
			</c:forEach>
			
			<c:if test="${5 - fn:length(selectedProduct.list) >= 0}">
				<c:forEach begin="0" end="${5 - fn:length(selectedProduct.list)}">
				<li>
					<div class="addborbox addborbg_gray">
						<a class="addbor addbor_small" href="javascript:selectProductDialog(700,null,11)"><em></em></a>
					</div>
				</li>
				</c:forEach>
			</c:if>
			
		</ul>
		
		<div class="more">
			<c:if test="${selectedProduct.pageCount > 1}">
				<c:if test="${page eq 1}">
					<a style="color:gray">上一组</a> 
					<a href="javascript:loadSelectedProduct('has_selected','${pids}',${page+1});">下一组</a>
				</c:if>
				<c:if test="${(page > 1) && (page < selectedProduct.pageCount)}">
					<a href="javascript:loadSelectedProduct('has_selected','${pids}',${page-1})">上一组</a>
					<a href="javascript:loadSelectedProduct('has_selected','${pids}',${page+1})">下一组</a>
				</c:if>
				<c:if test="${page eq selectedProduct.pageCount}">
					<a href="javascript:loadSelectedProduct('has_selected','${pids}',${page-1})">上一组</a>
					<a style="color:gray">下一组</a>
				</c:if>
			</c:if>
		</div>
	</dd>
	
	<script type="text/javascript">
		$("*[psftype='del_selected_product']").click(function(){
			var pid = $(this).attr("pid");
			var reg = new RegExp(pid+",","g");
			pids = pids.replace(reg, "");
			loadSelectedProduct("has_selected", pids, 1);
		});
	</script>