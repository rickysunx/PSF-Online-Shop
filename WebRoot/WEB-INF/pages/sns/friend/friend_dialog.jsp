<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<div id="createGroupDialog" class="friendCommonDialog">
	<div class="header">
		<div class="title">新建分组</div>
		<div class="iconClose"></div>
	</div>
	<div class="content">
		分组名：<input type="text" name="groupName"/>
	</div>
	<div class="bottom">
		<a href="#">确定</a>
	</div>
</div>


<div id="editGroupNameDialog" class="friendCommonDialog">
	<div class="header">
		<div class="title">修改分组名称</div>
		<div class="iconClose"></div>
	</div>
	<div class="content">
		分组名：<input type="text" name="groupName"/>
	</div>
	<div class="bottom">
		<a href="#">确定</a>
	</div>
</div>

<div id="changeGroupOrderDialog" class="friendCommonDialog">
	<div class="header">
		<div class="title">调整分组顺序</div>
		<div class="iconClose"></div>
	</div>
	<div class="content">
		<div class="content_title"></div>
		<div id="friendGroupOrderList" class="friendGroupOrderList">
			<div class="friendGroupItem"></div>
		</div>
	</div>
	<div class="bottom">
		<a href="#">确定</a>
	</div>
</div>

<div id="delGroupDialog" class="friendCommonDialog">
	<div class="header">
		<div class="title">删除该分组</div>
		<div class="iconClose"></div>
	</div>
	<div class="content">
	
	</div>
	<div class="bottom">
		<a href="#">确定</a>
	</div>
</div>

