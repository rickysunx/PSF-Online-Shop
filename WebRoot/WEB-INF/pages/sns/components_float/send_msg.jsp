<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!-- 首页 发信息 对话框 -->
<div class="send_msg" style="background:#fff;width:403px">
	<div class="send_msg_title"><h6>发信息给：</h6><p><input type="text"/></p></div>
	<div class="send_msg_content">
		<h6>信息内容：</h6>
		<p><textarea></textarea></p>
	</div>
	<div class="send_msg_info">
    	<p>您还可以输入300个字</p>
		<a href="#"><em></em>表情</a>
	</div>
	<div class="send_msg_buttons">
		<a class="psf_dialog_button" href="#">发送</a>
	</div>
</div>
