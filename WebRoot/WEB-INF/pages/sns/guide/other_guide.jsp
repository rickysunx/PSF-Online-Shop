<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<script type="text/javascript">
	$(function(){
		var options = {"uid":"${postItem.uid}","postid":"${postItem.postid}"};
		loadRecommend('other_guide_list',5,1,2,options);
	});
</script>
<!-- TA的其他指南-->
<div class="sns-statustitle">
	<h3>TA的其他指南</h3>
</div>
<div id="other_guide_list"></div>