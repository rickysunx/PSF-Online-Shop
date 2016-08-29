<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!-- 我的秀场二级页签 -->
<script type="text/javascript">
	$(document).ready(function(){
		initData();
	});
	function initData(){
		$("#rankwealth"+${type}).attr("class","current");
	}
</script>
<div class="tab_menu">
	<div class="linkbox">
		<dl>
			<dt><a class="" href="/sns/wealth/rankingwealth" id="rankwealth1"><span><span>享金排行</span></span></a></dt>
		</dl>
		<dl><dt>|</dt></dl>
		<dl>
			<dt><a href="/sns/wealth/rankingwealth?type=2" id="rankwealth2"><span><span>积分排行</span></span></a></dt>
		</dl>

	</div>
</div>