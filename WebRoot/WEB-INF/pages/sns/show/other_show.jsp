<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<script type="text/javascript">
	$(function(){
		var options = {"postid":"${postItem.postid}","uid":"${postItem.uid}"}; 
		loadRecommend("other_show_list",3,1,2,options);
	});
</script>

<!-- 他的其他秀 -->
<div class="sns-statustitle">
	<h3>TA的其他秀</h3>
</div>
<div id="other_show_list"></div>