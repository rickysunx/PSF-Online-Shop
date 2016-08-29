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
		initInput("search_post","搜索发言");
		loadGroupPost(-1,null,-1,-1);
		$("#blogSubmitButton1").click(function(){
			submitBlog(reloadGroupPost);
		});
	});
	function reloadGroupPost(){
		loadGroupPost(0,null,1,1);
	}
	
	function loadGroupPost(type, keyword, orderby, page){
		if(type != -1){
			options["type"] = type;
			$("div.post_tab_menu ul li:eq("+type+")").find("a").addClass("current").end().siblings().find("a").removeClass("current");
		}if(keyword !=null || keyword!='搜索发言'){
			options["keyword"] = keyword;
		}if(orderby != -1){
			options["orderby"] = orderby;
			$(".group_post_tab dt a:eq("+(orderby-1)+")").addClass("current").siblings().removeClass("current");
		}if(page != -1){
			options["page"] = page;
		}
		$("#post_list").html("<div class='post_list_loading'><img src='/images/loading.gif'/></div>");
		$("#post_list").load(
			"/sns/group/get_grouppost_list",
			options
		);
	}
</script>

<psf:include page="/sns/group/detail/detail_groupinfo.jsp"></psf:include>

<div class="sns_conwrap">

	<psf:include page="/sns/group/detail/detail_blogForm.jsp"></psf:include>
    
    <div id="group_detail_content">
    	<dl class="group_post_tab">
			<dt>
		    	<a class="current" href="javascript:void(0)" onclick="loadGroupPost(-1,null,1,-1)">最热</a>
		        <a href="javascript:void(0)" onclick="loadGroupPost(-1,null,2,-1)">最新</a>
		       	<!-- <a href="#">最新回复</a> -->
		    </dt>
		    <dd>
				<ul>
			       <li class="current"><a href="/sns/group/detail?groupid=${group.groupid}">发言</a></li>
			       <li><a href="/sns/group/detail/topiclist?groupid=${group.groupid}">话题</a></li>
			       <li><a href="/sns/group/detail/groupfriend?groupid=${group.groupid}">圈友</a></li>
			    </ul>
			</dd>
		</dl>

		<div class="post_tab_menu">
			<div class="searchbox01">
		        <input id="search_post" name="keyword">
		        <a href="javascript:void(0)" onclick="loadGroupPost(-1,$('#search_post').val(),-1,1)" class="searchbtn"></a>
		    </div>
		    <ul>
		    	<li>
		        	<a class="current" href="javascript:void(0)" onclick="loadGroupPost(0,null,-1,1)"><span><span>全部</span></span></a>
		        </li>
		        <li>
		        	<a href="javascript:void(0)" onclick="loadGroupPost(1,null,-1,1)"><span><span>广播</span></span></a>
		        </li>
		        <li>
		        	<a href="javascript:void(0)" onclick="loadGroupPost(2,null,-1,1)"><span><span>秀场</span></span></a>
		        </li>
		        <li>
		        	<a href="javascript:void(0)" onclick="loadGroupPost(3,null,-1,1)"><span><span>体验</span></span></a>
		        </li>
		        <li>
		        	<a href="javascript:void(0)" onclick="loadGroupPost(4,null,-1,1)"><span><span>指南</span></span></a>
		        </li>
		    </ul>
		</div>
		
		<c:choose>
			<c:when test="${(group.grouptype > 2) && (!group.isJoin)}">
				<div style="text-align: center;margin: 20px 0px;">您尚未加入该圈子，无法查看该圈的内容！</div>
			</c:when>
			<c:otherwise>
				<div id="post_list" class="post_list"></div>
			</c:otherwise>
		</c:choose>
	</div>
</div>