<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<script type="text/javascript">
	var params = {
		"groupid" : options["groupid"],
		"type" : null,
		"keyword" : null,
		"orderby" : 1,
		"page" : 1
	};
	
	$(function(){
		initInput("search_user","请输入用户名");
		loadMemberList(-1,null,-1,-1);
	});
	
	function loadMemberList(type, keyword, orderby, page){
		if(type != -1){
			params["type"] = type;
			if(type == null){
				$(".group_member_tabmenu > a:eq(0)").addClass("current").siblings("a").removeClass("current");
			}else{
				$(".group_member_tabmenu > a:eq("+(type-1)+")").addClass("current").siblings("a").removeClass("current");		
			}
		}if(keyword != null){
			params["keyword"] = keyword;
		}if(orderby != -1){
			params["orderby"] = orderby;
		}if(page != -1){
			params["page"] = page;
		}
		$(".member_managebox").html("<div class='post_list_loading'><img src='/images/loading.gif'/></div>");
		$(".member_managebox").load(
			"/sns/group/manage/member_list",
			params
		);
	}
</script>

<div class="group_member_tabmenu">
	<div class="searchbox01">
    	<input id="search_user" name="keyword"/>
        <a class="searchtext" href="javascript:void(0)" onclick="loadMemberList(-1,$('#search_user').val(),-1,1)">搜索</a>
    </div>
	<a class="current" href="javascript:void(0)" onclick="loadMemberList(null,null,-1,1)">全部成员</a> |
    <a href="javascript:void(0)" onclick="loadMemberList(2,null,-1,1)">好友</a> |
    <a href="javascript:void(0)" onclick="loadMemberList(3,null,-1,1)">我的关注</a> |
    <a href="javascript:void(0)" onclick="loadMemberList(4,null,-1,1)">粉丝</a>
    <!-- <a href="#">黑名单</a> --> 
</div>

<div class="member_managebox"></div>

