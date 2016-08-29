<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<script type="text/javascript">
	$(function(){
		$("body").append('<div id="group_recom_item_box" class="group_recom_list" style="position:absolute;border:1px solid #02600F;width:192px;height:313px;display:none;background-color:white"></div>');
		$("#group_recom_item_box").mouseleave(function(){
			$(this).empty();
			$(this).hide();
		});
		$("#recommend_group li .group_recom_item").mouseenter(function(){
			$("#group_recom_item_box").html($(this).parent().html());
			$("#group_recom_item_box").css("top",$(this).position().top-6+"px").css("left",$(this).position().left-1+"px").show();
		
			$("#group_recom_item_box").find(".group_recom_item").css("height","307px");
			$("#group_recom_item_box").find(".group_recom_item .bottom").show();
		})
	});
</script>

<ul id="recommend_group">
<c:forEach items="${recommend_groups.list}" var="group">
<li>
   	<div class="group_recom_item">
       	<div class="img"><a href="/sns/group/detail?groupid=${group.groupid}" target="_blank"><img src="/pic/${group.logo}" alt="" /></a></div>
        <h4><a href="/sns/group/detail?groupid=${group.groupid}" target="_blank">${group.groupname}</a></h4>
        <dl>
        	<dt><a href="#"><em></em>${group.membercount}</a></dt>
            <dd><a href="#"><em></em>${group.postCount}</a></dd>
        </dl>
        <div class="bottom">
        	<a href="/sns/group/detail?groupid=${group.groupid}" target="_blank"><b>简介：</b>${group.intro}</a>
        </div>
    </div>
</li> 
</c:forEach>
</ul>