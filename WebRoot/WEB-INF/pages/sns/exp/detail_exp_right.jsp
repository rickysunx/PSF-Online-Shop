<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<script type="text/javascript">
	$(function(){
		getPostBrand("shopexp_brand_list", ${postItem.postid},1);
	});
</script>
<psf:include page="/sns/detail_post_userinfo.jsp"/>
<psf:include page="/sns/show/coins_show_help.jsp"/>

<psf:include page="/sns/exp/other_shopexp.jsp"/>

<psf:include page="/sns/exp/shopexp_psffriend.jsp"/>
<psf:include page="/sns/exp/product_hotshopexp.jsp"/>

<!-- 体验相关品牌 -->
<div class="sns-statustitle">
	<h3>体验相关品牌</h3>
</div>
<div id="shopexp_brand_list"></div>