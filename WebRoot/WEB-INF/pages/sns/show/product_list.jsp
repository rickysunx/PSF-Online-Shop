<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<div class="item s_clear" id="product_list">
	<c:forEach items="${products.list}" var="product">
	<dl id="product_${product.pid}">
		<dt class="imgborder01"><input name="pid" type="checkbox" pid="${product.pid}"><a><img src="/pic/${product.goods_thumb}"/></a></dt>
		<dd>
			<h6>${product.pname}</h6>
			<p>商品号:<br /><span>${product.pcode}</span></p>
		</dd>
	</dl>
	</c:forEach>
	<script type="text/javascript">
		
		$("#product_list dl").hover(function() {
			$(this).addClass("current");
		},function(){$(this).removeClass("current");});
		
		$("#product_list dl").click(function(){
		 	var pid = $(this).find("dt input[name='pid']").attr("pid");
			if($(this).find("dt input[name='pid']").is(":checked")){
				$(this).find("dt input[name='pid']").attr("checked",false);
				var reg = new RegExp(pid+",","g");
				pids = pids.replace(reg, "");
			}else{
				$(this).find("dt input[name='pid']").attr("checked",true);
				pids += pid+',';
			}
		});
		
		$("[name='pid']:checkbox").each(function(){
			//已选择商品需要打勾
			var pid = $.trim($(this).attr("pid"))+",";
			if(pids.indexOf(pid)>=0){
				$(this).attr("checked", true);
			}
			
			$(this).click(function(){
				if(this.checked){
					pids += pid+',';
				}else{
					var reg = new RegExp(pid+",","g");
					pids = pids.replace(reg, "");
				}
			});
		});
	</script>
</div>
<div class="bottom">
		
		<div class="right">
			<c:if test="${products.pageCount > 1}">
				<c:if test="${page eq 1}">
					<a style="color:gray">上一组</a> 
					<a href="javascript:load_product(${cateid},${page+1},${(empty keyword)? 'null':keyword})">下一组</a>
				</c:if>
				<c:if test="${(page > 1) && (page < products.pageCount)}">
					<a href="javascript:load_product(${cateid},${page-1},${(empty keyword)? 'null':keyword})">上一组</a>
					<a href="javascript:load_product(${cateid},${page+1},${(empty keyword)? 'null':keyword})">下一组</a>
				</c:if>
				<c:if test="${page eq products.pageCount}">
					<a href="javascript:load_product(${cateid},${page-1},${(empty keyword)? 'null':keyword})">上一组</a>
					<a style="color:gray">下一组</a>
				</c:if>
			</c:if>
		</div>
		
		<a class="button11" href="javascript:submit_product()">确定</a>
		<a class="button11" href="javascript:closeSelectPorductDialog('select_product_dialog')">取消</a>
		
</div>