<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>


<script type="text/javascript">
	$(document).ready(function(){
		initData();
	});
	function initData(){
		$("#psfwealth"+${type}).attr("class","current");
	}
</script>

<!-- 我的秀场二级页签 -->
<div class="tab_menu">
	<div class="linkbox">
		<dl>
			<dt><a href="/sns/wealth/psffriendwealth?type=1" id="psfwealth1"><span><span>全部</span></span></a></dt>
		</dl>
		<dl><dt>|</dt></dl>
		<dl>
			<dt><a href="/sns/wealth/psffriendwealth?type=2" id="psfwealth2"><span><span>我的品友</span></span></a></dt>
		</dl>
		<dl><dt>|</dt></dl>
		<dl>
			<dt><a href="/sns/wealth/psffriendwealth?type=3" id="psfwealth3"><span><span>我的关注</span></span></a></dt>
		</dl>
		<dl><dt>|</dt></dl>
		<dl>
			<dt><a href="/sns/wealth/psffriendwealth?type=4" id="psfwealth4"><span><span>我的粉丝</span></span></a></dt>
		</dl>
	</div>
</div>