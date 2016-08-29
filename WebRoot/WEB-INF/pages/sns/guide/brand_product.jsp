<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<script type="text/javascript">
	$(function(){
		var options = {"postid":"${postItem.postid}"};
		loadRecommend("brand_product",6,1,8,options);
	});
</script>
<!--  推荐品牌的相关商品 -->
<div class="sns-statustitle">
	<h3>推荐品牌的相关商品</h3>
</div>
<div id="brand_product"></div>