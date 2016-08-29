<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<div class="friendGroupDialog">
<form id="friendGroupChangeForm">
	<ul class="list">
		<c:if test="${empty friendGroupList}">
			<li>无好友分组</li>
		</c:if>
		
		<c:forEach var="fg" items="${friendGroupList}">
			<li><input psftype="friendGroupCheck" name="friendgroupid" value="${fg.friendgroupid}" <c:if test="${fg.checked}">checked</c:if> type="checkbox" id="friendGroup_${fg.friendgroupid}" onclick="changeGroup(${friendid},${fg.friendgroupid},'${fg.friendgroupname}');"><label>${fg.friendgroupname}</label></li>
		</c:forEach>
	</ul>
<input type="hidden" style="display:none;" name="friendid" value="${friendid}">
</form>
	<div class="bottom">
    	<div class="right">
        	<a href="#">上一组</a>
            <a href="#">下一组</a>
        </div>
		<div class="createGroup"><a href="javascript:openAddFriendGroupDialog();"><em></em>创建新分组</a></div>
	</div>
</div>

<script type="text/javascript">
function initFriendGroupCheck() {
	$("input[psftype='friendGroupCheck']").unbind();
	$("input[psftype='friendGroupCheck']").bind('click',function(event){
		$("#friendGroupChangeForm").attr("dataChanged","1");
	});
}
initFriendGroupCheck();
</script>
