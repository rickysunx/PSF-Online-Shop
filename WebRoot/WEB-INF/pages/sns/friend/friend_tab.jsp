<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<script type="text/javascript">

$(document).ready(function(){
	var type = $(".sns_imgtab .tab03 dd ul .current").attr("id");
	if(type == 1){
		$("#selectTab").append("<a class='current' href='javascript:loadFriendByTypeList(1,1,1);'>最新</a><span>   </span><a href='javascript:loadFriendByTypeList(2,1,1);'>最近联系</a>");
	} else if(type == 2){
		$("#selectTab").append("<a class='current' href='javascript:loadFriendByTypeList(1,1,2);'>最新</a><span>   </span><a href='javascript:loadFriendByTypeList(2,1,2);'>最近联系</a>");
	} else if(type == 3){
		$("#selectTab").append("<a class='current' href='javascript:loadFriendByTypeList(1,1,3);'>最新</a><span>   </span><a href='javascript:loadFriendByTypeList(2,1,3);'>最近联系</a>");
	}
});
</script>

<div id="changeOrderDialog" style="display:none;">
	<div class="layerTop">
		<a class="close" href="javascript:void(0)" onclick="$('#changeOrderDialog').psfDialogClose();"></a>
		<h5>调整分组顺序</h5>
	</div>
	<form id="groupOrderForm">
		<div>
			<div class="groupOrderTitle">分组名</div>
			<ul id="groupOrderList" class="groupOrderList">
			</ul>
			<div class="groupOrderBottom">
				<a class="psf_dialog_button" href="javascript:void(0)" onclick="onChangeOrderOkClicked();">确定</a>
				<span id="groupOrderInfo" class="groupOrderInfo">信息</span>
			</div>
		</div>
	</form>
</div>
 
<div class="sns_imgtab">
	<img src="/images/sns/default/friendbg.png" alt="" usemap="#friendmap" /><div class="tab">
	   <dl class="tab03">
		   <dd>
			   <ul>
				   <li id="1" class="<psf:current key="friendTab" value="myfriend"/>"><a href="/sns/friend">我的好友</a></li>
				   <li id="2" class="<psf:current key="friendTab" value="myfollow"/>"><a href="/sns/friend/myfollow">我的关注</a></li>
				   <li id="3" class="<psf:current key="friendTab" value="myfans"/>"><a href="/sns/friend/myfans">我的粉丝</a></li>
				   <li id="4" class="<psf:current key="friendTab" value="psffriend"/>"><a href="/sns/friend/psffriend">品友的好友</a></li>
				   <li id="5" class="<psf:current key="friendTab" value="invite"/>"><a href="/sns/friend/invite">社交拓展</a></li>
			   </ul>
		   </dd>

		   <dt id="selectTab">
				<!-- 
			   <a class="current" href="javascript:loadFriendByTypeList(1,1);">最新</a>
			   <a href="javascript:loadFriendByTypeList(2,1);">最近联系</a>
 				-->
		   </dt>
	   </dl>
	</div>
    <a class="worker_btn" href="javascript:openSearchFriendDialog(1);"></a>
    <a class="student_btn" href="javascript:openSearchFriendDialog(2);"></a>
    <a class="colleague_btn" href="javascript:openSearchFriendDialog(3);"></a>
    <a class="free_btn" href="javascript:openSearchFriendDialog(4);"></a>
</div>