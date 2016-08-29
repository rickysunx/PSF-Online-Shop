<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>
<script type="text/javascript">
function saveFriendGroup(formid){
	$.post(
		"/action/sns/friend/group_add",
		$("#" + formid + "Form").serialize(),
		function(data) {
			if(data.success) {
				$.psfInfoDialog("创建成功");
				window.location.reload();
			} else {
				$.psfInfoDialog("创建失败："+data.info,2000);
			}
		},"json"
	);
}

var myGroupTab = null;

$(document).ready(function(){
	var tabItems = new Array();
	<c:forEach items="${friendGroupList}" var="friendGroup">
		tabItems.push({id:'${friendGroup.friendgroupid}',name:'${friendGroup.friendgroupname}'});
	</c:forEach>
	myGroupTab = new GroupTab('myFriendGroupTab',tabItems,true);
});

function onChangeOrderOkClicked() {
	$("#groupOrderInfo").text("正在发送请求……");
	$.post("/action/sns/friend/group_order",$("#groupOrderForm").serialize(),function(data){
		if(data.success==1) {
			$.psfInfoDialog("调整顺序成功");
			$("#groupOrderInfo").text("请求成功，正在刷新页面……");
			window.location.reload();
		} else {
			$("#groupOrderInfo").text("出错"+data.info);
			alert(data.info);
		}
	},"json");
}

function onChangeOrder() {
	var groups = myGroupTab._groups;
	var s = "";
	var i;
	for(i=0;i<groups.length;i++) {
		var fg = groups[i];
		s+="<li><input name='fgid' type='hidden' value='"+fg.id+"'>"+fg.name+"</li>"
	}
	
	$("#groupOrderList").html(s);
	$("#groupOrderList").sortable();
	$("#changeOrderDialog").psfDialog({"center":true,"modal":true});
}

function onGroupTabChanged(id) {
	//此处处理点击后加载列表
	var keyword =  $("#friend_keyword").val();
	if("输入昵称或备注" == keyword || "" == keyword) {
		loadFriendList(id,'',1);
	} else {
		loadFriendList(id,keyword,1);
	}	
}

function onDelGroup(id) {
	delFriendGroup(id);
}

function onUpdateGroupName(id) {
	openUpdateFriendGroupNameDialog(id);
}

function onAddGroup() {
	openAddFriendGroupDialog();
}
</script>

<form id="groupTabForm">
<input type="hidden" id="groupIdInput" name="groupid" value="">
	<div class="tab_menu">
	    <div class="searchbox01">
			<c:choose>
				<c:when test="${empty keyword}"><input value="输入昵称或备注" id="friend_keyword" onclick="this.value=''"/></c:when>
				<c:otherwise><input value="${keyword }" id="friend_keyword"/></c:otherwise>
			</c:choose>
	        <a class="searchbtn" href="javascript:findByKeyword(1);"></a>
	    </div>
	    <div id="myFriendGroupTab" class="linkbox">
	    </div>
	</div>
</form>

