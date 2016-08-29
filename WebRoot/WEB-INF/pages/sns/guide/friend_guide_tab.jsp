<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<!-- 好友指南二级页签 -->
<script type="text/javascript">
	var myGroupTab = null;

	$(document).ready(function(){
		myGroupTab = new GroupTab('myFriendGroupTab',[
		    <c:forEach items="${friendgroups}" var="friendGroup">
			{id:'${friendGroup.friendgroupid}',name:'${friendGroup.friendgroupname}'},
			</c:forEach>
		]);
	});
	
	function onGroupTabChanged(id) {
		if(id=='all'){
			loadFriendGuide(null,-1,null,1,-1);
		}else if(id=='none'){
			loadFriendGuide(0,-1,null,1,-1);
		}else{
			loadFriendGuide(id,-1,null,1,-1);
		}
	}
</script>

<div class="tab_menu">
	<div class="searchbox01">
		<input id="search_show" name="keyword"/>
		<script type="text/javascript">
			initInput("search_show","搜索指南");	//初始化搜索框
		</script>
		<a class="searchbtn" href="javascript:void(0)" onclick="javascript:loadFriendGuide(-1,-1,$('#search_show').val(),1,-1);"></a>
	</div>
	
	<form id="groupTabForm">
		<div class="tab_menu">
		    <div id="myFriendGroupTab" class="linkbox"></div>
		</div>
	</form>	
</div>

<!-- 
	<div class="linkbox">
		<dl>
			<dt><a class="current" href="#"><span><span>全部</span></span></a></dt>
		</dl>
		<dl><dt>|</dt></dl>
		<dl>
			<dt><a href="#"><span><span>未分组</span></span></a></dt>
		</dl>
		<dl><dt>|</dt></dl>
		<dl>
			<dt><a href="#"><span><span>同事</span></span></a></dt>
		</dl>
		<dl><dt>|</dt></dl>
		<dl>
			<dt><a href="#"><span><span>同学</span></span></a></dt>
		</dl>
		<dl><dt>|</dt></dl>
		<dl>
			<dt><a href="#"><span><span>同乡</span></span></a></dt>
		</dl>
		 <dl><dt>|</dt></dl>
		<dl class="dropmenu">
			<dt><a class="morebtn" href="#"><i>更多</i><span></span></a></dt>
			<dd>
				<ul>
					<li><a href="#">家人</a></li>
					<li><a href="#">朋友的朋友</a></li>
				</ul>
				<ul>
					<li><a class="icon icon-add" href="#"><em></em>创建分组</a></li>
					<li><a class="icon icon-adj" href="#"><em></em>调整分组顺序</a></li>
				</ul>
			</dd>
		</dl>
	</div>
 -->