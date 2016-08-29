<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<script type="text/javascript">
$(function(){
	var options = {"postid":"${postItem.postid}"};
	loadRecommend('brand_otherguide',5,1,3,options);
})
</script>
<!-- 推荐品牌的其他指南 -->
<div class="sns-statustitle">
	<h3>推荐品牌的其他指南</h3>
</div>
<div id="brand_otherguide"></div>