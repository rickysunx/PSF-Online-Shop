<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<script type="text/javascript">
	$(function(){
		var options = {"postid":"${postItem.postid}"}
		loadRecommend("hotproduct_show_list",3,1,3,options);
	});
</script>
<!-- 秀品的热门秀场 -->
<div class="sns-statustitle">
	<h3>秀品的热门秀场</h3>
</div>
<div id="hotproduct_show_list"></div>