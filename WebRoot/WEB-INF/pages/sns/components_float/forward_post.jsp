<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<script>//我也来说两句吧
$(document).ready(function(){
	$(".forward .layerTop .dialogTab ul li").psfTab($(".forward .broadcastCon,.forward .send_msg"));
	$("#forwardbox_button").click(function(){
	$(".forwardbox_list").show().css("top",$(this).getElCoordinate().top+this.offsetHeight).css("left",$(this).getElCoordinate().left);
	});
	$(".forwardbox_list .button .cancel").click(function(){$(".forwardbox_list").hide()});
})
</script>
<div class="forward" style="width:353px;background:#fff;border:1px #ff0000 solid">
	<div class="layerTop">
		 <a	href="javascript:void(0)" class="close"></a>
		 <div class="dialogTab">
			<ul>
				<li class="current"><a href="javascript:void(0)">转发广播</a></li>
				<li><a href="javascript:void(0)">转发私信</a></li>
				<li><a href="javascript:void(0)">转发圈子</a></li>
			</ul>
		</div>
	</div>
	<div class="broadcastCon">
		<div class="broadHeader">
			<label for="br1" class="right">我也来说两句吧~</label>
		</div>
		<div><textarea id="br1" class="textarea"></textarea></div>
		<div class="txtarea_bottom s_clear">
			<div class="face faceimg">
				<a href="#"><em></em></a> 
			</div>
			<div class="ckgroup">
				<p><input id="p1" type="checkbox" /><label for="p1">同时评论给</label> <a href="#">阿朗</a></p>
				<p><input id="p2" type="checkbox" /><label for="p2">同时评论给原文作者</label> <a href="#">星座物语</a></p>
			</div>
			<div class="right"><a class="button11" href="#">转发</a></div>
		</div>
		<div class="extMsgbox">
			<div>
				<a class="right" href="javascript:void(0)" onclick="showextmsg(this)"></a><a href="#">@京东刘强东：</a>我对中国的vie结构依然充满信心，还是的的的的的的的的的的的的的的...
			</div>
		</div>
	</div>
	<div class="send_msg" style="display:none">
		<form id="sendMsgForm">
		<input type="hidden" value="5" style="display:none;" name="touid">
		<div class="send_msg_title">
		<h6>收信人：</h6>
		<p>
		<input type="text" readonly="" name="touname">
		</p>
		</div>
		<div class="send_msg_content s_clear">
		<h6>内容：</h6>
		<p>
		<textarea name="content"></textarea>
		</p>
		</div>
		<div class="txtarea_bottom s_clear">
			<div class="face faceimg">
			<a href="#">
			<em></em>
			</a>
			</div>
			<div class="right">
			<a class="button11" href="#">转发</a>
			</div>
		</div>
		</form>
	</div>
	<div class="send_msg" style="display:none">
		<form id="sendMsgForm">
		<input type="hidden" value="5" style="display:none;" name="touid">
		<div class="send_msg_title">
			<h6>&nbsp;</h6>
			<p style="margin-top:5px;">
				<a id="forwardbox_button" class="button11" href="javascript:void(0)">选择圈子</a>
			</p>
		</div>
		<div class="send_msg_title">
			<span style="color:#0D3F92;margin-left:10px;">你所选择的圈子:</span>
		</div>
		<div class="send_msg_title">
			<p style="margin-left:10px;">分享就是价值、分享就是价值</p>
		</div>
		<div class="send_msg_content s_clear">
		<h6>内容：</h6>
		<p>
		<textarea name="content"></textarea>
		</p>
		</div>
		<div class="txtarea_bottom s_clear">
			<div class="face faceimg">
			<a href="#">
			<em></em>
			</a>
			</div>
			<div class="right">
			<a class="button11" href="#">转发</a>
			</div>
		</div>
		</form>
	</div>
</div>

<div class="forwardbox_list" style="display:none">
	<ul class="s_clear">
		<li><input type="checkbox" />分享就是价值</li>
		<li><input type="checkbox" />分享就是价值</li>
	</ul>
	<div class="button"><a href="javascript:void(0)">确定</a><a href="javascript:void(0)" class="cancel">取消</a><a href="javascript:void(0)">上一组</a><a href="javascript:void(0)">下一组</a></div>
</div>
