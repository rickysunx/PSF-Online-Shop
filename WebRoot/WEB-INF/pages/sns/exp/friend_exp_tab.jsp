<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
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
			loadFriendShopexp(null,-1,null,1,-1);
		}else if(id=='none'){
			loadFriendShopexp(0,-1,null,1,-1);
		}else{
			loadFriendShopexp(id,-1,null,1,-1);
		}
	}
</script>
<div class="tab_menu">

	<div class="searchbox01">
		<input id="search_shopexp" name="keyword"/>
		<script type="text/javascript">
			initInput("search_shopexp","搜索体验");	//初始化搜索框
		</script>
		<a class="searchbtn" href="javascript:void(0)" onclick="javascript:loadFriendShopexp(-1,-1,$('#search_shopexp').val(),1,-1);"></a>
	</div>
	
	<form id="groupTabForm">
		<div class="tab_menu">
		    <div id="myFriendGroupTab" class="linkbox"></div>
		</div>
	</form>	
</div>