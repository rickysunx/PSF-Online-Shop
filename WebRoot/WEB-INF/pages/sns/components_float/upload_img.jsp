<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<script>

$(document).ready(function(){
	$("#uploadimg .tab03 li").psfTab($("#psfsmiley .smiley_items,#psfsmiley .normal_smiley_items"));
});
</script>
<div id="uploadimg" class="uploadimg" style="">
	<dl class="tab03">
		<dd>
			<ul>
				<li class="current"><a href="javascript:void(0)">本地上传</a></li>
				<li class=""><a href="javascript:void(0)">链接</a></li>
			</ul>
		</dd>
		<dt class="layerClose">
			<a class="close" href="javascript:void(0)"></a>
		</dt>
	</dl>
	<div class="uploadimg_item">
		<p>按住Ctrl 键一次选中上传多张图片（最多5张）</p>
		<div class="uploadimg_item_border">
		<a class="addbor addbor_small" href="javascript:void(0)">
			<em></em>
		</a>
		<span>点击添加第1张图片</span>
		</div>
	</div>
	<div class="bottom">
		<a class="button11" href="javascript:void(0)">确定</a>
		<a class="button11" href="javascript:void(0)">取消</a>
	</div>
</div>