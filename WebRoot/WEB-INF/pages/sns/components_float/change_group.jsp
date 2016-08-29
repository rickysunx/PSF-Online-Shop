<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<!-- 设置分组 对话框 -->

<div class="change_group" style="background:#fff;width:371px">
	<div class="change_group_title">为阿郎设置分组</div>
	<ul class="change_group_list">
		<li><input type="checkbox"/><label>我的家人</label></li>
		<li><input type="checkbox"/><label>我的同学</label></li>
		<li><input type="checkbox"/><label>我的朋友</label></li>
	</ul>
	<div class="change_group_bottom">
		<a class="change_group_create" href="#"><em></em><span>创建新分组</span></a>
		<div class="change_group_buttons">
			<a href="#" class="psf_dialog_button">保存</a>
			<a href="#" class="psf_dialog_button">取消</a>
		</div>
	</div>
</div>