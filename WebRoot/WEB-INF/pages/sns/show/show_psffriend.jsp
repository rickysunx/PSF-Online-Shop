<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<script type="text/javascript">
	$(function(){
		var options = {"postid":"${postItem.postid}"};
		loadRecommend("show_psffriend",1,1,4,options);
	});
</script>
<!-- 他们也喜欢你的秀品 -->
<div class="sns-statustitle">
	<h3>他们也喜欢你的秀品</h3>
</div>
<div id="show_psffriend"></div>