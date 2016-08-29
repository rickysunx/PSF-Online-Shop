<%@ page language="java" session="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/psf/tags" prefix="psf"%>

<script type="text/javascript">
	var options = {
		"groupid": ${group.groupid},
		"type" : 0,
		"keyword" : null,
		"orderby" : 1,
		"page" : 1
	};
	$(function(){
		initInput("search_friend","搜索圈友");
		loadGroupFriend(-1,null,-1,-1);
		$("#blogSubmitButton1").click(function(){
			submitBlog(loadGroupFriend);
		});
	});
	function reloadGroupFriend(){
		loadGroupFriend(0,null,1,1);
	}
	
	function loadGroupFriend(type, keyword, orderby, page){
		if(type != -1){
			options["type"] = type;
			$("div.post_tab_menu ul li:eq("+type+")").find("a").addClass("current").end().siblings().find("a").removeClass("current");
		}if(keyword !=null){
			options["keyword"] = keyword;
		}if(orderby != -1){
			options["orderby"] = orderby;
			$(".group_post_tab dt a:eq("+(orderby-1)+")").addClass("current").siblings().removeClass("current");
		}if(page != -1){
			options["page"] = page;
		}
		$("#friend_list").html("<div class='post_list_loading'><img src='/images/loading.gif'/></div>");
		$("#friend_list").load(
			"/sns/group/get_groupfriend_list",
			options
		);
	}
</script>

<psf:include page="/sns/group/detail/detail_groupinfo.jsp"></psf:include>

<div class="sns_conwrap">

	<psf:include page="/sns/group/detail/detail_blogForm.jsp"></psf:include>
    
    <dl class="group_post_tab">
    
    	<dt>
           	<a class="current" href="javascript:void(0)" onclick="loadGroupFriend(-1,null,1,-1)">加入时间</a>
            <a href="javascript:void(0)" onclick="loadGroupFriend(-1,null,2,-1)">最后发言时间</a>
            <a href="javascript:void(0)" onclick="loadGroupFriend(-1,null,3,-1)">群身份</a>
            <a href="javascript:void(0)" onclick="loadGroupFriend(-1,null,4,-1)">群内发言数</a>
        </dt>
        <dd>
        	<ul>
                <li><a href="/sns/group/detail?groupid=${group.groupid}">发言</a></li>
                <li><a href="/sns/group/detail/topiclist?groupid=${group.groupid}">话题</a></li>
                <li class="current"><a href="/sns/group/detail/groupfriend?groupid=${group.groupid}">圈友</a></li>
            </ul>
        </dd>
    
    </dl>
    
    <div class="post_tab_menu">
    	<div class="searchbox01">
            <input id="search_friend" name="keyword"/>
            <a href="javascript:void(0)" onclick="loadGroupFriend(-1,$('#search_friend').val(),-1,1)" class="searchbtn"></a>
        </div>
        <ul>
        	<li>
            	<a class="current" href="javascript:void(0)" onclick="loadGroupFriend(0,null,-1,1)"><span><span>全部</span></span></a>
            </li>
            <li>
            	<a href="javascript:void(0)" onclick="loadGroupFriend(1,null,-1,1)"><span><span>品友</span></span></a>
            </li>
        </ul>
    </div>
    
    <c:choose>
		<c:when test="${(group.grouptype > 2) && (!group.isJoin)}">
			<div style="text-align: center;margin: 20px 0px;">您尚未加入该圈子，无法查看该圈的内容！</div>
		</c:when>
		<c:otherwise>
			<div id="friend_list" class="post_list"></div>
		</c:otherwise>
	</c:choose>
</div>