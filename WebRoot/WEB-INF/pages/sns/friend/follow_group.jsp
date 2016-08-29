<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<div class="friendGroupDialog">
<form id="followGroupChangeForm">
	<ul class="list">
		<c:if test="${empty followGroupList}">
			<li>无关注分组</li>
		</c:if>
		
		<c:forEach var="fg" items="${followGroupList}">
			<li><input psftype="followGroupCheck" name="followgroupid" value="${fg.followgroupid}" <c:if test="${fg.checked}">checked</c:if> type="checkbox" id="followGroup_${fg.followgroupid}" onclick="changeFollowGroup(${followuid},${fg.followgroupid},'${fg.followgroupname}');"><label>${fg.followgroupname}</label></li>
		</c:forEach>
	</ul>
<input type="hidden" style="display:none;" name="followuid" value="${followuid}">
</form>
	<div class="bottom">
    	<div class="right">
        	<a href="#">上一组</a>
            <a href="#">下一组</a>
        </div>
		<div class="createGroup"><a href="javascript:openAddFollowGroupDialog();"><em></em>创建新分组</a></div>
	</div>
</div>

<script type="text/javascript">
function initFollowGroupCheck() {
	$("input[psftype='followGroupCheck']").unbind();
	$("input[psftype='followGroupCheck']").bind('click',function(event){
		$("#followGroupChangeForm").attr("dataChanged","1");
	});
}
initFollowGroupCheck();
</script>
