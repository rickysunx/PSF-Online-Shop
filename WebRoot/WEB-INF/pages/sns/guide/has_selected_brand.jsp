<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!-- 已选择品牌列表-->
<script type="text/javascript">	
	cateid = $(".selected_brand_list input[name='selected_cate']:hidden").val();	//获取已选择的品牌分类 
	
	//删除已选择的品牌,重新加载新的已选择的商品
	$("*[psftype='del_brand']").click(function(){
		var brandid = $(this).attr("brandid");
		var reg = new RegExp(brandid+",","g");
		selected_brandids = selected_brandids.replace(reg,'');
		var options = {"selected_brandids":selected_brandids,"cateid":cateid};
		loadSelectedBrand(options);
	});
</script>
<ul class="s_clear selected_brand_list">
	
	<c:forEach items="${brandlist}" var="brand">		
	<li>
		<div class="logo_card">
			<a class="brclose" psftype="del_brand" brandid="${brand.brandid}"></a>
			<div class="logo_card_info">
				<h6>${brand.brandname}</h6>
				<div class="logo">
					<img width="124px;" height="84px" src="/pic/${brand.logoName}"/>
				</div>
			</div>
			<input type="hidden" name="selected_brandid" value="${brand.brandid}"/>
		</div>
	</li>
	</c:forEach>		
	
	<c:if test="${fn:length(brandlist)<3}">
	<c:forEach begin="0" end="${2-fn:length(brandlist)}">
		<li>
			<div class="logo_card">
				<div class="addborbox"><a class="addbor" href="javascript:selectBrandDialog(684,null,${loginPsfUid})"><em></em></a></div>
			</div>
		</li>
	</c:forEach>
	</c:if>
	<li style="display: none;"><input type="hidden" name="selected_cate" value="${cateid}"/></li>
</ul>