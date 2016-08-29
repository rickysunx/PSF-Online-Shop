<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<script type="text/javascript">
	$(function(){
		getPostBrand("show_brand_list", ${postItem.postid},1);
	});
</script>
<!-- 秀品相关品牌 -->
<div class="sns-statustitle">
	<h3>秀品相关品牌</h3>
</div>
<div id="show_brand_list"></div>


