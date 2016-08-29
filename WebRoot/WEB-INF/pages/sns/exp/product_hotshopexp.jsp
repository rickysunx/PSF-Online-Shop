<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<script type="text/javascript">
	$(function(){
		var options = {"postid":"${postItem.postid}"};
		loadRecommend('hotproduct_shopexp_list',4,1,3,options);
	});
</script>
<!-- 商品的热门体验-->
<div class="sns-statustitle">
	<h3>该商品的热门体验</h3>
</div>
<div id="hotproduct_shopexp_list"></div>